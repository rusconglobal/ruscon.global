from django import forms
from cmsplugin_contact.forms import ContactForm
from django.forms.forms import Form

class CustomContactForm(ContactForm):
    name = forms.CharField()    
    town = forms.CharField(required=False)
    phone = forms.CharField(required=False)
    

class WriteToUs(Form):    
    name = forms.CharField()
    email = forms.CharField()
    phone = forms.CharField()
    message = forms.CharField()

class WriteToUsPolitics(Form):
    name = forms.CharField()
    email = forms.CharField()
    phone = forms.CharField()
    message = forms.CharField()