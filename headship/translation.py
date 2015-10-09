from modeltranslation.translator import translator, TranslationOptions
from headship.models import Headship

class HeadshipTranslationOptions(TranslationOptions):
    fields = ('first_name','last_name','patronymic','post')
    
translator.register(Headship, HeadshipTranslationOptions)    