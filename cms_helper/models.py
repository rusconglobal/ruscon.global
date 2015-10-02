from django.db import models
from django.utils.translation import ugettext_lazy as _
import orderedmodel
from cmsplugin_contact.models import BaseContact
from sitetree.models import TreeItem
from filer.fields.image import FilerImageField

from cms_search.cms_app import HaystackSearchApphook  # @UnresolvedImport
from cms.apphook_pool import apphook_pool
apphook_pool.register(HaystackSearchApphook)

class ClockTown(orderedmodel.OrderedModel):
    town = models.CharField(_('Town'), unique=True, db_index=True, max_length=255)
    hour_shift = models.IntegerField(_('Hour shift'))         
    def __unicode__(self):
        return u'%s' % self.town
    def natural_key(self):
        return self.__unicode__()
    
class CustomContact(BaseContact):
    name_label = models.CharField(_('Name'), default=_('Your name'), max_length=100)
    phone_label = models.CharField(_('Phone'), default=_('Phone'), max_length=30)            
    town_label = models.CharField(_('Town'), default=_('Town'), max_length=30)

class MenuImage(models.Model):
    menu_item = models.ForeignKey(TreeItem)
    title = models.CharField(max_length=100)
    alt = models.CharField(max_length=100)
    image = FilerImageField()    

class Params(models.Model):
    key = models.CharField(max_length=50, db_index=True)    
    value = models.TextField()
    hint = models.CharField(max_length=255)
    
    
    
    

    