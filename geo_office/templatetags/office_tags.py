# -*- coding: utf-8 -*-
from django import template

register = template.Library()
@register.filter
def to_comma_sep(iterval):
    result = []
    for contact in iterval.all():
        result.append('<strong>%s</strong>: %s' % (contact.contact_type, contact.contact))
    if result:
        return ' <br /> '.join(result)
    return u''