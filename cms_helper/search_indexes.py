from haystack.indexes import *
from haystack import site
from zinnia.models.entry import Entry
from django.utils.translation import get_language, activate 
 
class EntryRU(Entry):
    @property
    def get_index_title(self):
        return self.title_ru
    @property
    def get_index_content(self):
        return self.content_ru
    class Meta:
        proxy = True
 
class EntryEN(Entry):
    @property
    def get_index_title(self):
        return self.title_en
    @property
    def get_index_content(self):
        return self.content_en
    class Meta:
        proxy = True
 
class EntryIndex(SearchIndex): 
    categories = [2,]   
    text = CharField(document=True, use_template=True, template_name="search/indexes/zinnia/entry_text.txt")
    title = CharField(stored=True, indexed=False, model_attr='get_index_title')
    url = CharField(stored=True, indexed=False, model_attr='get_absolute_url')
    def index_queryset(self):
        base_qs = super(EntryIndex, self).index_queryset()          
        return base_qs.filter(categories__id__in=self.categories) 
 
site.register(EntryRU, EntryIndex)
site.register(EntryEN, EntryIndex)