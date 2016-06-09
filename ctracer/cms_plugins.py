from django.utils.translation import ugettext_lazy as _
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from ctracer.forms import ContainerForm, ContPicsForm
from ctracer.models import CTracerCMSPlugin, ContPicsModel
from ctracer.service import WsdlTracer, ContPicsService
import datetime
from rusconwww.local_settings import WEB_SERVISES

class TracerPlugin(CMSPluginBase):
        model = CTracerCMSPlugin
        name = _("Tracer")        
        render_template = 'ctracer/google.html'        
        def render(self, context, instance, placeholder):
            request = context['request']                
            if request.method == "POST":
                form = ContainerForm(request.POST)
                if form.is_valid():
                    search_query = form.cleaned_data['container_num']
                    context.update({
                            'search_query':search_query , 
                        })                    
                    wtracer = WsdlTracer(WEB_SERVISES['gpstrack'])
                    wsdl_data = wtracer.get_wsdl_data(search_query)
                    if wsdl_data:
                        context.update({
                            'clear_data': wsdl_data, 
                            'crds' : self.prepare_json(wsdl_data['data'])              
                        })
            else:
                form = ContainerForm()            
            context.update({
                'ctracer': instance,                
                'form': form,
            })        
            return context
        
        def prepare_json(self, crds):
            import json
            dthandler = lambda obj: obj.isoformat() if isinstance(obj, datetime.datetime) else None
            return json.dumps(crds, default=dthandler)


class ContPicsPlugin(CMSPluginBase):
        model = ContPicsModel
        name = _("ContPics")
        form = None
        render_template = "ctracer/conpics.html"
        def render(self, context, instance, placeholder):
            request = context['request']                
            if request.method == "POST":
                form = ContPicsForm(request.POST)
                if form.is_valid():
                    search_query = form.cleaned_data['container_num']
                    voyage_date = form.cleaned_data['voyage_date']
                    clear_cache = form.cleaned_data['clear_cache']
                    context.update({
                            'search_query':search_query , 
                        })                    
                    
                    cont_pics_service = ContPicsService(WEB_SERVISES['contpics'])
                    data = cont_pics_service.get_data(search_query, voyage_date, clear_cache)
                    if data:                        
                        context.update({
                            'data': data,                                          
                        })
            else:
                form = ContPicsForm()            
            context.update({
                'contpics': instance,                
                'form': form,
            })        
            return context
            
                
plugin_pool.register_plugin(TracerPlugin)
plugin_pool.register_plugin(ContPicsPlugin)

