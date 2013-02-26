# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class CmsContent(models.Model):
    id = models.IntegerField(primary_key=True)
    menu_id = models.IntegerField(null=True, blank=True)
    title = models.CharField(max_length=750, blank=True)
    keywords = models.CharField(max_length=750, blank=True)
    description = models.CharField(max_length=750, blank=True)
    h1 = models.CharField(max_length=750, blank=True)
    body = models.TextField(blank=True)
    published = models.DateTimeField(null=True, blank=True)
    updated = models.DateTimeField(null=True, blank=True)
    tags = models.TextField(blank=True)
    class Meta:
        db_table = u'cms_content'

class CmsEnContent(models.Model):
    id = models.IntegerField(primary_key=True)
    menu_id = models.IntegerField(null=True, blank=True)
    title = models.CharField(max_length=750, blank=True)
    keywords = models.CharField(max_length=750, blank=True)
    description = models.CharField(max_length=750, blank=True)
    h1 = models.CharField(max_length=750, blank=True)
    body = models.TextField(blank=True)
    published = models.DateTimeField(null=True, blank=True)
    updated = models.DateTimeField(null=True, blank=True)
    tags = models.TextField(blank=True)
    class Meta:
        db_table = u'cms_en_content'

class CmsEnFormServiceorder(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750, blank=True)
    type = models.CharField(max_length=150, blank=True)
    params = models.CharField(max_length=150, blank=True)
    order_by = models.IntegerField(null=True, blank=True)
    required = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'cms_en_form_serviceorder'

class CmsEnMenu(models.Model):
    id = models.IntegerField(primary_key=True)
    menu_id = models.IntegerField(null=True, blank=True)
    menu_title = models.CharField(max_length=750, blank=True)
    menu_uri = models.CharField(max_length=750, blank=True)
    menu_parent_id = models.IntegerField(null=True, blank=True)
    visible = models.IntegerField(null=True, blank=True)
    order_by = models.IntegerField(null=True, blank=True)
    module = models.CharField(max_length=750, blank=True)
    class Meta:
        db_table = u'cms_en_menu'

class CmsEnModulePublications(models.Model):
    id = models.IntegerField(primary_key=True)
    menu_id = models.IntegerField()
    title = models.CharField(max_length=750, blank=True)
    announce = models.TextField(blank=True)
    body = models.TextField(blank=True)
    published = models.DateTimeField(null=True, blank=True)
    updated = models.DateTimeField(null=True, blank=True)
    vip = models.IntegerField()
    class Meta:
        db_table = u'cms_en_module_publications'

class CmsEnTexts(models.Model):
    id = models.IntegerField(primary_key=True)
    text_id = models.IntegerField(null=True, blank=True)
    text_body = models.TextField(blank=True)
    class Meta:
        db_table = u'cms_en_texts'

class CmsFormServiceorder(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750, blank=True)
    type = models.CharField(max_length=150, blank=True)
    params = models.CharField(max_length=150, blank=True)
    order_by = models.IntegerField(null=True, blank=True)
    required = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'cms_form_serviceorder'

class CmsFormServiceorder2(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750, blank=True)
    type = models.CharField(max_length=150, blank=True)
    params = models.CharField(max_length=150, blank=True)
    order_by = models.IntegerField(null=True, blank=True)
    required = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'cms_form_serviceorder2'

class CmsMenu(models.Model):
    id = models.IntegerField(primary_key=True)
    menu_id = models.IntegerField(null=True, blank=True)
    menu_title = models.CharField(max_length=750, blank=True)
    menu_uri = models.CharField(max_length=750, blank=True)
    menu_parent_id = models.IntegerField(null=True, blank=True)
    visible = models.IntegerField(null=True, blank=True)
    order_by = models.IntegerField(null=True, blank=True)
    module = models.CharField(max_length=750, blank=True)
    class Meta:
        db_table = u'cms_menu'

class CmsModuleClients(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750, blank=True)
    announce = models.TextField(blank=True)
    body = models.TextField(blank=True)
    order_by = models.IntegerField(null=True, blank=True)
    published = models.DateTimeField(null=True, blank=True)
    logo = models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'cms_module_clients'

class CmsModuleFaq(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750, blank=True)
    question = models.TextField(blank=True)
    published = models.DateTimeField(null=True, blank=True)
    answer = models.TextField(blank=True)
    updated = models.DateTimeField(null=True, blank=True)
    status = models.IntegerField(null=True, blank=True)
    order_by = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'cms_module_faq'

class CmsModuleGallery(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750, blank=True)
    description = models.TextField(blank=True)
    published = models.DateTimeField(null=True, blank=True)
    updated = models.DateTimeField(null=True, blank=True)
    order_by = models.IntegerField()
    group_id = models.IntegerField()
    class Meta:
        db_table = u'cms_module_gallery'

class CmsModuleGallerygroups(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750)
    order_by = models.IntegerField()
    published = models.DateTimeField()
    updated = models.DateTimeField()
    description = models.TextField()
    class Meta:
        db_table = u'cms_module_gallerygroups'

class CmsModuleNews(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750, blank=True)
    announce = models.TextField(blank=True)
    body = models.TextField(blank=True)
    published = models.DateTimeField(null=True, blank=True)
    updated = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'cms_module_news'

class CmsModulePublications(models.Model):
    id = models.IntegerField(primary_key=True)
    menu_id = models.IntegerField()
    title = models.CharField(max_length=750, blank=True)
    announce = models.TextField(blank=True)
    body = models.TextField(blank=True)
    published = models.DateTimeField(null=True, blank=True)
    updated = models.DateTimeField(null=True, blank=True)
    vip = models.IntegerField()
    class Meta:
        db_table = u'cms_module_publications'

class CmsModuleSpo(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750, blank=True)
    body = models.TextField(blank=True)
    order_by = models.IntegerField(null=True, blank=True)
    published = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'cms_module_spo'

class CmsQlinks(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=750, blank=True)
    menu_uri = models.CharField(max_length=750, blank=True)
    order_by = models.IntegerField(null=True, blank=True)
    size = models.IntegerField(null=True, blank=True)
    color = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = u'cms_qlinks'

class CmsTexts(models.Model):
    id = models.IntegerField(primary_key=True)
    text_id = models.IntegerField(null=True, blank=True)
    text_body = models.TextField(blank=True)
    class Meta:
        db_table = u'cms_texts'

