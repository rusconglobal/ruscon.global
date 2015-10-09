from modeltranslation.admin import TranslationAdmin
from cms_helper.admin import ModelTranslationMedia
from headship.models import Headship
from django.contrib import admin


class HeadshipAdmin(TranslationAdmin, ModelTranslationMedia):
    list_display = ('first_name','last_name','patronymic','post')
    
admin.site.register(Headship,HeadshipAdmin)    