# -*- coding: utf-8 -*-
import json
from django.http import HttpResponse
from cms_helper.forms import WriteToUs
from django.core.mail.message import EmailMessage

def write_to_us(request):
    result = 0  
    if request.method == 'POST':
        form = WriteToUs(request.POST)
        if form.is_valid():
            headers = {'Reply-To': form.cleaned_data['email']}
            subject = u'Обращение через контактную форму сайта'
            from_email = 'fax@ruscon.gcs-group.ru'           
            to_email = 'it-support2@ruscon.gcs-group.ru'
            lines = []
            lines.append(u"<strong>Через контактную форму сайта Рускон получено обращение</strong>")
            lines.append(u"Имя: <strong>%(name)s</strong>")            
            lines.append(u"Email: %(email)s")
            lines.append(u"Сообщение:")
            lines.append(u"<blockquote>%(message)s</blockquote>")
            body = u"<br>".join(lines)             
            body = body % form.cleaned_data
            msg = EmailMessage(subject, body, from_email, [to_email], headers=headers)
            msg.content_subtype = "html"
            msg.send()
            result = 1                
    return HttpResponse(json.dumps({'result': result}), content_type="application/json")