from django.utils.translation import ugettext_lazy as _
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from ctracer.forms import ContainerForm
from ctracer.models import CTracerCMSPlugin
from ctracer.service import WsdlTracer
import datetime

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
                    wtracer = WsdlTracer(search_query)
                    wsdl_data = wtracer.get_wsdl_data()
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
                
plugin_pool.register_plugin(TracerPlugin)

