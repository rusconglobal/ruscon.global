from django.utils.translation import ugettext_lazy as _
from django.core.mail import EmailMessage
from django.template.loader import render_to_string

from cms.plugin_pool import plugin_pool

from cmsplugin_contact.cms_plugins import ContactPlugin
from models import CustomContact
from forms import CustomContactForm
from cmsplugin_filer_folder.cms_plugins import FilerFolderPlugin

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
            site_email,
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
    
plugin_pool.register_plugin(CustomContactPlugin)

class FilerGalleryPlugin(FilerFolderPlugin):
    name = _("Gallery")
    render_template = "cmsplugin_filer_folder/gallery.html"
    
plugin_pool.register_plugin(FilerGalleryPlugin)

    