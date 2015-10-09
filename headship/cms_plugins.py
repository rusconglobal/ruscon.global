from django.utils.translation import ugettext_lazy as _
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cms.models.pluginmodel import CMSPlugin
from headship.models import Headship


class HeadshipPlugin(CMSPluginBase):
        model = CMSPlugin
        name = _("Headship")        
        render_template = "headship/headship.html"
        def render(self, context, instance, placeholder):
            heads = Headship.objects.filter(active=True)            
            context.update({
                    'heads': heads,
            })
            return context
                
plugin_pool.register_plugin(HeadshipPlugin)
