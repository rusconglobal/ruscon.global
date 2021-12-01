# -*- coding: utf-8 -*-
import json

from django.http import HttpResponse
from cms_helper.forms import WriteToUs, WriteToUsPolitics
from django.core.mail.message import EmailMessage
from zinnia.models.entry import Entry
from modeltranslation.utils import get_language
from modeltranslation.settings import DEFAULT_LANGUAGE
from cms_helper.models import Params
from rusconwww.local_settings import DEFAULT_FROM_EMAIL
from django.core.mail import send_mail
import os
import datetime

def write_logs(formData):
    if not os.path.isdir("logs/mail"):
        os.makedirs("logs/mail")
    now = datetime.datetime.now()
    now.strftime("%d-%m-%Y %H:%M")
    print(formData['name'])
    str_data = "%s%s%s%s%s%s%s%s" % ('Phone:', formData['phone'], ' Name: ', formData['name'], ' Email: ', formData['email'], ' Message: ', formData['message'])
    print(str_data)
    my_file = open("./logs/mail/form_policy_logs.txt", "a+")
    my_file.write("\n%s%s%s\n" % (now.strftime("%d-%m-%Y %H:%M"),' ', str_data.encode('utf-8')))
    my_file.close()

def write_to_us_politics(request):
    result = 0
    if request.method == 'POST':
        if request.POST.get('agree') and request.POST['agree'] != 'on':
            return HttpResponse(json.dumps({'result': result}), content_type="application/json")
        form = WriteToUs(request.POST)
        if form.is_valid():
            headers = {'Reply-To': form.cleaned_data['email']}
            subject = u'Анонимная обратная связь с сайта ruscon.global'
            from_email = DEFAULT_FROM_EMAIL
            email_param = Params.objects.get(key='write_to_us_politics_email')
            to_email = [x.strip() for x in email_param.value.split(',')]
            lines = []
            lines.append(u"<strong>Через контактную форму сайта Рускон получено обращение</strong>")
            lines.append(u"Имя: <strong>%(name)s</strong>")
            lines.append(u"Email: %(email)s")
            lines.append(u"Сообщение:")
            lines.append(u"<blockquote>%(message)s</blockquote>")
            body = u"<br>".join(lines)
            message = body % form.cleaned_data            
            msg = EmailMessage(subject, message, from_email, to_email, headers=headers)
            msg.content_subtype = "html"
            msg.send()
            if request.POST.get('formPolicy'):
                write_logs(form.cleaned_data)
            result = 1
    return HttpResponse(json.dumps({'result': result}), content_type="application/json")


def write_to_us(request):
    result = 0
    if request.method == 'POST':
        if request.POST.get('agree') and request.POST['agree'] != 'on':
            return HttpResponse(json.dumps({'result': result}), content_type="application/json")
        form = WriteToUs(request.POST)
        if form.is_valid():
            headers = {'Reply-To': form.cleaned_data['email']}
            subject = u'Обращение через контактную форму сайта'
            from_email = DEFAULT_FROM_EMAIL
            email_param = Params.objects.get(key='write_to_us_email')
            to_email = [x.strip() for x in email_param.value.split(',')]
            lines = []
            lines.append(u"<strong>Через контактную форму сайта Рускон получено обращение</strong>")
            lines.append(u"Имя: <strong>%(name)s</strong>")
            lines.append(u"Email: %(email)s")
            lines.append(u"Сообщение:")
            lines.append(u"<blockquote>%(message)s</blockquote>")
            body = u"<br>".join(lines)
            body = body % form.cleaned_data
            msg = EmailMessage(subject, body, from_email, to_email, headers=headers)
            msg.content_subtype = "html"
            msg.send()
            if request.POST.get('formPolicy'):
                write_logs(form.cleaned_data)
            result = 1

    return HttpResponse(json.dumps({'result': result}), content_type="application/json")



def search(request):     
    pages = []
    pattern = request.GET.get('q')
    if not pattern:
        return HttpResponse(json.dumps({}, indent=4), content_type="application/json")     
    from haystack.query import SearchQuerySet    
    cms_pages = SearchQuerySet().filter_or(title=pattern).filter_or(content=pattern)
    if not len(cms_pages):
        cms_pages = SearchQuerySet().filter_or(title=pattern).filter_or(content="%s*" % pattern)
    
    urls = set()    
    for p in cms_pages:
        if p.url in urls:
            continue 
        urls.add(p.url)                
        pages.append({'url': p.url, 'title': p.title})     
    return HttpResponse(json.dumps({'pages': pages}, indent=4), content_type="application/json")

