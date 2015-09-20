from django.conf.urls.defaults import patterns, url
from geo_office.views import get_offices

urlpatterns = patterns('',   
    url(r'^offices/$', get_offices , name='get-offices'),    
)