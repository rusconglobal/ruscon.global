# -*- coding: utf-8 -*-
from suds.client import Client
from django.core.cache import cache
import cPickle as pickle

class WsdlTracer(object):
    URL = 'http://srvr8.first/UAT_82/ws/gpstrack?wsdl'
    CACHE_TIME = 300
    _cache_key = None    
    def __init__(self, container_num):
        self.container_num = container_num       

    @property
    def cache_key(self):
        if not self._cache_key:
            self._cache_key = ''.join(self.container_num.split())
        return self._cache_key        
            
    def get_wsdl_data(self):               
        cache_conts = cache.get(self.cache_key)           
        clear_data = {}                       
        if cache_conts:
            clear_data = pickle.loads(cache_conts)
        else:  
#             print 'GET DATA...'             
            client = Client(self.URL, username='web', password='TomasSan79',  cache=None)            
            r = client.service.GetGPS(self.container_num).RowGPS                        
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
            cache.set(self.cache_key, pickle.dumps(clear_data), self.CACHE_TIME)
        return clear_data or None        
                
    def populate_data(self, clear_data):       
        if clear_data:    
            print clear_data['car']
            print clear_data['container']
            print clear_data['status']
            for item in clear_data['data']:
                print item['date'], item['lat'], item['lon']
    