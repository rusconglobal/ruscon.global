# -*- coding: utf-8 -*-
from django.utils.translation import ugettext_lazy as _
import json
from django.http import HttpResponse
from geo_office.models import Office
from django.core.cache import cache

def get_offices(request): 
    language_code = request.LANGUAGE_CODE 
    cache_key = "offices_json_%s" % language_code  
    offices_json = cache.get(cache_key)
    if not offices_json:  
        offices = Office.objects.filter(is_active=True).order_by('order')    
        items = []
        for office in offices:
            office_dict = {}
            
            office_dict['city'] = office.town.name
            office_dict['country'] = office.town.country.name
            office_dict['leader'] = office.head
            office_dict['leader_title'] = office.office_type.head_title_template
            
            office_dict['phone'] = "%s" % office.prime_phone
            office_dict['fax'] = "%s" % office.prime_fax
            
            
            office_dict['request'] = "request@ruscon.global"
            office_dict['offers'] = "info@ruscon.global"
            
            office_dict['phone_title'] = u"%s" % _('Phone')
            office_dict['fax_title'] = u"%s" % _('Fax')
            office_dict['request_title'] = u"%s" % _('Request')
            office_dict['offers_title'] = u"%s" % _('Offers')
            
            office_dict['image'] = ""
            
            office_dict['address'] = "%s<br>%s" % (office.office_title, office.address)
            
            office_dict['class'] = office.css_class or ""
                    
            office_dict['position'] = {
                    "top":"%s%%" % office.top,
                    "left":"%s%%" % office.left
                } 
            
            office_dict['map'] = {
                    "lat": "%s" % office.latitude, 
                    "lng": "%s" % office.longitude
                }
            
            items.append(office_dict)
            offices_json = json.dumps({'items': items},indent=4)
            cache.set(cache_key, offices_json, 600)         
            
    return HttpResponse(offices_json, content_type="application/json")
    