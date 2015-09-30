from django.conf.urls.defaults import patterns, url
from cms_helper.views import write_to_us, search

urlpatterns = patterns('',   
    url(r'^writetous/$', write_to_us , name='write-to-us'),    
)

urlpatterns = patterns('',   
    url(r'^search/$', search , name='search'),    
)

from django.views.i18n import javascript_catalog

js_info_dict = {
    'packages': ('cms_helper',),
}

urlpatterns = [
    url(r'^jsi18n/$', javascript_catalog, js_info_dict),
]    