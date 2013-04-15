from django.db import models
from filer.fields.image import FilerImageField
from orderedmodel.models import OrderedModel

class Country(models.Model):
    name = models.CharField(max_length=255)
    image = FilerImageField()
    def __unicode__(self):
        return self.name

class Town(models.Model):
    name = models.CharField(max_length=255)
    country = models.ForeignKey(Country)
    def __unicode__(self):
        return self.name        

class OfficeType(models.Model):
    name = models.CharField(max_length=255)
    def __unicode__(self):
        return self.name
                        
class Office(models.Model):
    office_type = models.ForeignKey(OfficeType)
    town = models.ForeignKey(Town)
    head = models.CharField(max_length=255)
    address = models.TextField()
    post_index = models.CharField(max_length=10)
    latitude = models.DecimalField(max_digits=8, decimal_places=6, null=True, blank=True)
    longitude = models.DecimalField(max_digits=8, decimal_places=6, null=True, blank=True)

class ContactType(models.Model):
    contact_type =  models.CharField(max_length=50)
    contact_short_type =  models.CharField(max_length=10)
    def __unicode__(self):
        return self.contact_type    

class OfficeContact(OrderedModel):
    office = models.ForeignKey(Office)
    contact_type = models.ForeignKey(ContactType)
    contact = models.CharField(max_length=100)
    def __unicode__(self):
        return '%s: %s' % (self.contact_type.contact_short_type, self.contact)
