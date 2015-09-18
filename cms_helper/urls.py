from django.conf.urls.defaults import patterns, url
from cms_helper.views import write_to_us

urlpatterns = patterns('',   
    url(r'^writetous/$', write_to_us , name='write-to-us'),    
)