from django.db import models
from cms.models.pluginmodel import CMSPlugin
import os

class CTracerCMSPlugin(CMSPlugin):
    no_result_msg = models.CharField(max_length=255, null=True, blank=True)    


class ContPicsModel(CMSPlugin):
    pass 


class MovingChain(models.Model):
    datein = models.DateField()
    container_num = models.CharField(max_length=12)
    
    
class FileStore(models.Model):    
    file = models.ImageField(upload_to='contpics/%Y/%m/%d/')
    moving_chain = models.ForeignKey(MovingChain, related_name='files', on_delete=models.CASCADE)
    
    def filename(self):
        return os.path.basename(self.file.name)