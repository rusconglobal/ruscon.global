from modeltranslation.translator import TranslationOptions, translator
from geo_office.models import Country, Town, OfficeType, Office, ContactType

class NameTranslationOptions(TranslationOptions):
    fields = ('name',) 
 
class OfficeTranslationOptions(TranslationOptions):
    fields = ('head', 'address', )
 
class ContactTypeTranslationOptions(TranslationOptions):
    fields = ('contact_type', 'contact_short_type', )
 
translator.register(Country, NameTranslationOptions)
translator.register(Town, NameTranslationOptions)
translator.register(OfficeType, NameTranslationOptions)
translator.register(Office, OfficeTranslationOptions)
translator.register(ContactType, ContactTypeTranslationOptions)

