from django.contrib import admin
from zinnia import models as zinnia_models
from zinnia import admin as zinnia_admin
from modeltranslation.admin import TranslationAdmin
from cms_helper.models import ClockTown
from orderedmodel.admin import OrderedModelAdmin
 

class ModelTranslationMedia(object):    
    class Media:
        js = (
            'modeltranslation/js/force_jquery.js',
            'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'screen': ('modeltranslation/css/tabbed_translation_fields.css',),
        } 

class ZinniaEntryTranslatedAdmin(zinnia_admin.EntryAdmin, TranslationAdmin, ModelTranslationMedia):
    list_display = ('title',)
    def formfield_for_dbfield(self, db_field, **kwargs):
        field = super(ZinniaEntryTranslatedAdmin, self).formfield_for_dbfield(db_field, **kwargs)
        self.patch_translation_field(db_field, field, **kwargs)
        return field
 
class ZinniaCategoryTranslatedAdmin(zinnia_admin.CategoryAdmin, TranslationAdmin, ModelTranslationMedia):
    list_display = ('title',)
    def formfield_for_dbfield(self, db_field, **kwargs):
        field = super(ZinniaCategoryTranslatedAdmin, self).formfield_for_dbfield(db_field, **kwargs)
        self.patch_translation_field(db_field, field, **kwargs)
        return field

class ClockTownTranslatedAdmin(TranslationAdmin, ModelTranslationMedia, OrderedModelAdmin):
    list_display = ('town', 'reorder')
 
admin.site.unregister(zinnia_models.Entry)
admin.site.unregister(zinnia_models.Category)
admin.site.register(zinnia_models.Entry, ZinniaEntryTranslatedAdmin)
admin.site.register(zinnia_models.Category, ZinniaCategoryTranslatedAdmin)
admin.site.register(ClockTown, ClockTownTranslatedAdmin)