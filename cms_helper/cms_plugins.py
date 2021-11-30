from django.utils.translation import ugettext_lazy as _
from django.core.mail import EmailMessage
from django.template.loader import render_to_string

from cms.plugin_pool import plugin_pool

from cmsplugin_contact.cms_plugins import ContactPlugin
from models import CustomContact
from forms import CustomContactForm
from cmsplugin_filer_folder.cms_plugins import FilerFolderPlugin
from cmsplugin_zinnia.cms_plugins import CMSQueryEntriesPlugin
from zinnia.models.entry import Entry
from rusconwww.local_settings import DEFAULT_FROM_EMAIL
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from cms.plugin_base import CMSPluginBase
from cms.plugins.text.models import Text
from templatetags.page_tags import hide_email
import re
from django.core.validators import validate_email
from cms.exceptions import PluginAlreadyRegistered

class CustomContactPlugin(ContactPlugin):
    name = _("Custom Contact Form")
    
    model = CustomContact
    contact_form = CustomContactForm
    
    # We're using the original cmsplugin_contact templates here which
    # works fine but requires that the original plugin is in INSTALLED_APPS.
    render_template = "cmsplugin_contact/contact.html"
    email_template = "cmsplugin_contact/email.txt"
    
    def send(self, form, site_email):
        subject = form.cleaned_data['subject']
        if not subject:
            subject = _('No subject')
        email_message = EmailMessage(
            render_to_string(self.subject_template, {
                'subject': subject,
            }).splitlines()[0],
            render_to_string(self.email_template, {
                'data': form.cleaned_data,
            }),
            DEFAULT_FROM_EMAIL,
            [site_email],
            headers = {
                'Reply-To': form.cleaned_data['email']
            },)
        email_message.send(fail_silently=False)
    fieldsets = (
        (None, {
                'fields': ('site_email', 'name_label', 'email_label',  'phone_label', 'town_label', 
                           'subject_label', 'content_label', 'thanks',
                           'submit'),
        }),
        (_('Spam Protection'), {
                'fields': ('spam_protection_method', 'akismet_api_key',
                           'recaptcha_public_key', 'recaptcha_private_key',
                           'recaptcha_theme')
        })
    )
    

class FilerGalleryPlugin(FilerFolderPlugin):
    name = _("Gallery")
    render_template = "cmsplugin_filer_folder/gallery.html"


class CMSCategoryEntriesPlugin(CMSQueryEntriesPlugin):
    name = _('Category entries')
    def render(self, context, instance, placeholder):
        """Update the context with plugin's data"""
        entries = Entry.published.filter(categories__id__in=[instance.query]) #@UndefinedVariable
        if instance.number_of_entries:
            entries = entries[:instance.number_of_entries]
        
        paginator = Paginator(entries, 10)  
        self.request = context['request']          
        page = self.request.GET.get('page')
        try:
            objects = paginator.page(page)
        except PageNotAnInteger:        
            objects = paginator.page(1)
        except EmptyPage:        
            objects = paginator.page(paginator.num_pages)        
        context.update({
                'paginator': paginator,
                'page_obj': objects,
                'is_paginated': objects.has_other_pages(),
                'entries': objects.object_list
            })  
        return context  
        context.update({
                        'object': instance,
                        'placeholder': placeholder})
        return context


class PlainTextPlugin(CMSPluginBase):
        model = Text
        name = _("PlainText")
        form = None
        render_template = "cms/plugins/text.html"
        def render(self, context, instance, placeholder):            
            words = instance.body.split()
            body = []
            for word in words:
                try:
                    validate_email(word)        
                    word = hide_email(word)
                except:
                    pass                              
                body.append(word)
            context.update({
                    'body': " ".join(body),
                    'placeholder': placeholder,
                    'object': instance
            })
            return context
        
        def save_model(self, request, obj, form, change):
                obj.clean_plugins()
                super(PlainTextPlugin, self).save_model(request, obj,
        form, change)

try:
    plugin_pool.register_plugin(CustomContactPlugin)    
    plugin_pool.register_plugin(FilerGalleryPlugin)
    plugin_pool.register_plugin(CMSCategoryEntriesPlugin)
    plugin_pool.register_plugin(PlainTextPlugin)
except PluginAlreadyRegistered:
    pass

from sitetree.sitetreeapp import register_dynamic_trees, compose_dynamic_tree
from sitetree.utils import tree, item
 
  
items_cat = {}
entries = Entry.published.all() #@UndefinedVariable
for entry in entries:
    try:
        node = item(entry.title, entry.get_absolute_url(), url_as_pattern=False)
        node.title_ru = entry.title_ru
        cats = entry.categories.all()[:1]
        if not cats:
            continue      
        cat = entry.categories.all()[:1][0].slug
        if not cat in items_cat:
            items_cat[cat] = []
        items_cat[cat].append(node)
    except:
        pass  
 
for key, value in items_cat.iteritems():    
    register_dynamic_trees((   
        compose_dynamic_tree((
            tree('dynamic', title='dynamic', items=value),
        ), target_tree_alias='mainmenu',  parent_tree_item_alias=key),
    ))  


    