# -*- coding: utf-8 -*-
from django import forms
from django.utils.translation import ugettext_lazy as _
import re
from django.forms.widgets import DateInput

class ContainerForm(forms.Form):
    container_num = forms.CharField(max_length=12, widget=forms.TextInput(attrs={'class' : 'validate', 'required': True, 'pattern':'[a-zA-Z]{4}\s{0,1}\d{7}'}))    
    def clean_container_num(self):
        data = self.cleaned_data['container_num']
        alphas = re.sub("[\d]|\s", "", data)
        digits = re.sub("[^\d]|\s", "", data)
        if len(digits) != 7 or len(alphas) != 4:
            raise forms.ValidationError(_("Container number, consists of four letters and seven digits, for example ABCD 1234567"))                      
        return '%s %s' % (alphas.upper(), digits)
        

class ContPicsForm(ContainerForm):
    voyage_date = forms.DateField(required=False, widget=DateInput(
                                    attrs={'class' : 'validate', 'pattern':'(0[1-9]|[12][0-9]|3[01])[\.](0[1-9]|1[012])[.](19|20)\d{2}'})
                                  )
    clear_cache = forms.BooleanField(required=False)
    
    