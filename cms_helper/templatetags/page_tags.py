# -*- coding: utf-8 -*-
from django import template
from cms_helper.models import ClockTown
import datetime

register = template.Library()

@register.inclusion_tag('tags/clock.html')
def clocks(limit):        
    clocks = ClockTown.objects.all()[:limit]
    if clocks:
        return {'clocks': clocks}
    
@register.filter()
def get_page_reverce_id(value):        
    mapper = {2:'company'}
    try:    
        return mapper[value]
    except KeyError:
        return None
    
@register.filter()
def get_page_reverce_id_form_entry(value):
    categories = value.categories.all()[:1]
    if categories:
        return get_page_reverce_id(categories[0].id)
    
@register.simple_tag
def get_copyright():
    return u'© 1997—%s' % datetime.datetime.now().year