# -*- coding: utf-8 -*-
import json
from django.http import HttpResponse
from geo_office.models import Office

def get_offices(request):
    offices = Office.objects.all().order_by('order')    
    items = []
    for office in offices:
        office_dict = {}
        
        office_dict['city'] = office.town.name
        office_dict['country'] = office.town.country.name
        office_dict['leader'] = office.head
        office_dict['leader_title'] = office.office_type.head_title_template
        
        office_dict['phone'] = "%s" % office.prime_phone
        office_dict['fax'] = "%s" % office.prime_fax
        
        
        office_dict['request'] = "request@ruscon.gcs-group.ru"
        office_dict['offers'] = "info@ruscon.gcs-group.ru"
        
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
                
    return HttpResponse(json.dumps({'items': items},indent=4), content_type="application/json")
    