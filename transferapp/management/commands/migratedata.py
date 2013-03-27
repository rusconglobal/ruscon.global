# -*- coding: utf-8 -*-
from django.core.management.base import BaseCommand
from transferapp.models import CmsModulePublications, CmsEnModulePublications
from zinnia.models.entry import Entry
from pytils.translit import slugify
from rusconwww import settings
from django.template.defaultfilters import truncatewords
from django.utils.text import Truncator
from django.utils.translation import trans_real


class Command(BaseCommand):
    def handle(self, *args, **options):
#        self.change_entry_cat(2, 3)
        self.create_press(9,36)
    #    self.add_en_to_press()
    
    def change_entry_cat(self,old_id, new_id):
        posts = Entry.objects.filter(categories__id=old_id).order_by('last_update')
        for post in posts:
            post.categories.remove(old_id)
            post.categories.add(new_id)
    
    
    def create_press(self, cat_id, filter_id):
        items = CmsModulePublications.objects.using('old_db').filter(menu_id=filter_id)       
        #Entry.objects.filter(categories__id=cat_id).delete()        
        for item in items:
            trans_real.activate('ru')
            d = str(item.updated)
            slug = Truncator(item.title.decode('utf-8')).words(4, truncate='')
            slug = '%s-%s' % (slug, slugify(d))
            entry = Entry(title=item.title, content=item.body, excerpt=item.announce, 
                          last_update=item.updated, creation_date=item.published, slug=slugify(slug))
            entry.save()            
            entry.categories.add(cat_id)
            entry.sites.add(1)
        self.add_en_to_press(cat_id)    

    def add_en_to_press(self, cat_id):
        trans_real.activate('en')
        #mapper = [15,21,22,23,25,24,28,29,30,31,32,33,34,35,36,37,38,39,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,74,75,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,0,102,103,104,105,106,107,108,109,110,111,113,114,115]
        #mapper = [18, 40, 41, 76, 112, 116]        
        #mapper = [1,2,3,4]
        #mapper = [5,6,7]
        #mapper = [10,11,12,13,14]
        mapper = [26,27]
        posts = Entry.objects.filter(categories__id=cat_id).order_by('last_update')
        i = 0
        for post in posts:
            if mapper[i] > 0:
                item = CmsEnModulePublications.objects.using('old_db').get(id=mapper[i])
                post.title = item.title
                post.content=item.body
                post.excerpt=item.announce
                post.save()           
            i += 1 
            