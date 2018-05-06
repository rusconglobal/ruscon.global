# -*- coding: utf-8 -*-
from suds.client import Client
from suds.cache import NoCache
from django.core.cache import cache
import cPickle as pickle
import datetime
from django.core.files.base import ContentFile
import base64
from ctracer.models import MovingChain, FileStore
from __builtin__ import hasattr, setattr
from suds.transport.https import HttpAuthenticated


class BaseService(object):
    username = None
    password = None
    url = None
    def __init__(self, settings):
        self.set_client(settings)
            
    def set_client(self, settings):
        for key in settings.iterkeys():             
            setattr(self, key, settings.get(key))   
        base64string = base64.encodestring(
            '%s:%s' % (self.username, self.password)).replace('\n', '')
        authenticationHeader = {
            "SOAPAction" : "ActionName",
            "Authorization" : "Basic %s" % base64string
        } 
        t = HttpAuthenticated(username=self.username, password=self.password)
        self._client = Client(self.url, headers=authenticationHeader, transport=t, cache=NoCache(), timeout=500)
        
        
class WsdlTracer(BaseService):    
    CACHE_TIME = 300
    _cache_key = None
    def get_cache_key(self, container_num):
        if not self._cache_key:
            self._cache_key = ''.join(container_num.split())
        return self._cache_key        
            
    def get_wsdl_data(self, container_num):               
        cache_conts = cache.get(self.get_cache_key(container_num))
        print cache_conts           
        clear_data = {}                       
        if cache_conts:
            clear_data = pickle.loads(cache_conts)
        else:  
            r = self._client.service.GetGPS(container_num).RowGPS                        
            if r:                                     
                clear_data.update({
                                   'car' : r.Car,
                                   'container' : r.Container,
                                   'status' : r.TrackStatus,
                                   })
                crds = [] 
                for d in r.Data:
                    crds.append({
                                 'date' : d.Coordinate,
                                 'lat' : d.Latitude,
                                 'lon' : d.Longtitude,                                 
                                 })
                clear_data['data'] = crds          
            cache.set(self.get_cache_key(container_num), pickle.dumps(clear_data), self.CACHE_TIME)
        return clear_data or None        
                
    def populate_data(self, clear_data):       
        if clear_data:    
            print clear_data['car']
            print clear_data['container']
            print clear_data['status']
            for item in clear_data['data']:
                print item['date'], item['lat'], item['lon']
    
    
class ContPicsService(BaseService):
    def get_data(self, container_num, voyage_date=None, clear_cache=False):
        moving_chain = None
        
        if not voyage_date:
            voyage_date = datetime.date.today()
                    
        q = MovingChain.objects.filter(datein__lte=voyage_date, container_num=container_num).order_by('-datein')         
        if q:
            if clear_cache:
                for chain in q:
                    chain.delete()           
            else:
                moving_chain = q[0]
                                
        if moving_chain:
            return moving_chain
        
        result = self._client.service.getPictures(container_num, voyage_date)
        if hasattr(result, 'pictures') and result.pictures:           
            moving_chain = MovingChain.objects.create(datein=result.pictures[0].datein, container_num=container_num)            
            for p in result.pictures:           
                filename = '%s.jpg' %  p.name       
                file_store = FileStore()
                file_store.moving_chain = moving_chain
                file_store.file.save(filename, ContentFile(base64.b64decode(p.data)))                
                file_store.save()
            return moving_chain
        
            
            
        
        
        
        