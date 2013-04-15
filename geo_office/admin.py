from django.contrib import admin
from geo_office.models import OfficeContact, Office, Country, Town, OfficeType,\
    ContactType
from modeltranslation.admin import TranslationAdmin

class ContactInline(admin.TabularInline):
    model = OfficeContact

class OfficeAdmin(TranslationAdmin):    
    list_display = ('town',) 
    inlines = [ContactInline,]
    class Media:
        js = (
            'modeltranslation/js/force_jquery.js',
            'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'screen': ('modeltranslation/css/tabbed_translation_fields.css',),
        }

admin.site.register(Office,OfficeAdmin)
admin.site.register(Country)
admin.site.register(Town)
admin.site.register(OfficeType)
admin.site.register(ContactType)