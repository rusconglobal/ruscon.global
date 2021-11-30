from django.conf.urls.defaults import patterns, url
from cms_helper.views import write_to_us, search, write_to_us_politics

urlpatterns = patterns('',   
    url(r'^writetous/$', write_to_us , name='write-to-us'),    
)
urlpatterns += patterns('',
    url(r'^writetouspolitics/$', write_to_us_politics , name='write-to-us-politics'),
)
urlpatterns += patterns('',   
    url(r'^search/$', search , name='search'),    
)