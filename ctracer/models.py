from django.db import models
from cms.models.pluginmodel import CMSPlugin

class CTracerCMSPlugin(CMSPlugin):
    no_result_msg = models.CharField(max_length=255, null=True, blank=True)    
