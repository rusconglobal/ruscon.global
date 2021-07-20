# -*- coding: utf-8 -*-
from django import template
from cms_helper.models import ClockTown, MenuImage, Params
import datetime
from cms.models.pagemodel import Page
from sitetree.models import TreeItem
from django.template import loader
from django.template.context import Context
import random
from django.utils.safestring import mark_safe

register = template.Library()

@register.inclusion_tag('tags/clock.html')
def clocks(limit):        
    clocks = ClockTown.objects.all()[:limit]
    if clocks:
        return {'clocks': clocks}
    
@register.filter()
def get_page_reverce_id(value):        
    mapper = {2:'company',3:'company', 4:'logistic', 5: 'logistic', 6:'logistic', 7:'logistic', 8:'logistic', 9:'company'}    
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

@register.filter()
def get_root_page_reverse_id(value):
    page = Page.objects.get(reverse_id=value)
    return page.get_root().reverse_id

@register.simple_tag()
def get_menuitem(alias, template_name):
    t = loader.get_template(template_name)
    try:
        item = TreeItem.objects.get(alias=alias)  
        return t.render(Context({
            'menu_item': item,        
            'parent_item': item.parent
        }))
    except TreeItem.DoesNotExist:
        return ""
        
    
@register.simple_tag
def get_image_by_menu(item_id):    
    menu_image = MenuImage.objects.get(menu_item_id=item_id)    
    return menu_image.image.url    


@register.simple_tag
def get_param(key):
    try:    
        p = Params.objects.get(key=key)
        return p.value
    except Params.DoesNotExist:
        return "" 


@register.simple_tag
def get_param_part(key, part):
    param = get_param(key)
    if param is None:
        return     
    if part == 1:
        return param[:-3]
    if part == 2:
        return param[-3:]
    return param
             


@register.filter()
def human_lang(lang):
    mapper = {'en': u'Eng', 'ru': u'Рус', 'zh-cn': u'Zh'}
    return mapper[lang]


def encode_string(value):
    """
    Encode a string into it's equivalent html entity.
    
    The tag will randomly choose to represent the character as a hex digit or
    decimal digit.
    """    
    e_string = "" 
    for a in value:
        t = random.randint(0,1)
        if t:
            en = "&#x%x;" % ord(a)
        else:
            en = "&#%d;" % ord(a)
        e_string += en 
    return e_string


@register.filter()
def hide_email(email):    
    name = email
    mailto_link = u'<a href="mai\'+\'lto:%s">%s</a>' % (encode_string(email), encode_string(name))

    value = '<script type="text/javascript">// <![CDATA['+"\n \
           \tdocument.write('%s')\n \
           \t// ]]></script>\n" % (mailto_link)
    return mark_safe(value)