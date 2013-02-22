from django.db import models
from django.utils.translation import ugettext_lazy as _
import orderedmodel

class ClockTown(orderedmodel.OrderedModel):
    town = models.CharField(_('Town'), unique=True, db_index=True, max_length=255)
    hour_shift = models.IntegerField(_('Hour shift'))         
    def __unicode__(self):
        return u'%s' % self.town
    def natural_key(self):
        return self.__unicode__()            