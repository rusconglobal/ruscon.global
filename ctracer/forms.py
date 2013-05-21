# -*- coding: utf-8 -*-
from django import forms
import re

class ContainerForm(forms.Form):
    container_num = forms.CharField(max_length=12)    
    def clean_container_num(self):
        data = self.cleaned_data['container_num']
        alphas = re.sub("[\d]|\s", "", data)
        digits = re.sub("[^\d]|\s", "", data)
        if len(digits) != 7 or len(alphas) != 4:
            raise forms.ValidationError(u'Номер контейнера должен состоять из четырех букв и семи цифр')               
        return '%s %s' % (alphas.upper(), digits)
