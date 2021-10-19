# -*- coding: utf-8 -*-
import os
import sys

gettext = lambda s: s

PROJECT_DIR = os.path.abspath(os.path.dirname(__file__))

# THUMBNAIL_DEBUG = True

# DEBUG = True

DEBUG = (len(sys.argv) > 1 and sys.argv[1] == 'runserver')

TEMPLATE_DEBUG = DEBUG

ADMINS = (
    ('picasso', 'it-support2@ruscon.global'),
)

MODELTRANSLATION_TRANSLATION_REGISTRY = 'cms_helper.translation'

CMS_SEO_FIELDS = True

MANAGERS = ADMINS

DEFAULT_LANGUAGE = 'ru'

LANGUAGES = [('ru', u'Русский'), ('en', u'English'), ('zh-cn', u'CN')]
CMS_LANGUAGES = (('ru', u'Русский'), ('en', u'English'), ('zh-cn', u'CN'))

CMS_HIDE_UNTRANSLATED = False



from local_settings import * #@UnusedWildImport

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# On Unix systems, a value of None will cause Django to use the same
# timezone as the operating system.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'Europe/Moscow'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'ru'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale
USE_L10N = True

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/"
MEDIA_ROOT = os.path.join(PROJECT_DIR, 'media')

STATIC_ROOT = os.path.join(PROJECT_DIR, 'static')

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"
MEDIA_URL = '/media/'

STATIC_URL = '/static/'

# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: "http://foo.com/media/", "/media/".
ADMIN_MEDIA_PREFIX = '/static/admin/'

# Make this unique, and don't share it with anybody.
SECRET_KEY = '0r6%7gip5tmez*vygfv+u14h@4lbt^8e2^26o#5_f_#b7%cm)u'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'cms.middleware.multilingual.MultilingualURLMiddleware',
    #'django.middleware.locale.LocaleMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    'cms.middleware.toolbar.ToolbarMiddleware',
    #'django.contrib.redirects.middleware.RedirectFallbackMiddleware',
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.i18n',
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'django.core.context_processors.static',
    'cms.context_processors.media',
    'sekizai.context_processors.sekizai',
)

CMS_TEMPLATES = (
    ('page.html', 'Page Template'),
    ('base.html', 'Base Template'),
    ('home.html', 'Home Template'),   
    ('gallery.html', 'Gallery Template'),
    ('global_placeholder.html', 'Global Placeholder'),
    ('contact.html', 'Contact'),
    ('vacancy.html', 'Vacancy'),
)

ROOT_URLCONF = 'rusconwww.urls'

TEMPLATE_DIRS = (
    os.path.join(PROJECT_DIR, 'templates'),
)

CACHES = {
    'default': dict(
        BACKEND = 'django.core.cache.backends.memcached.MemcachedCache',
        LOCATION = ['127.0.0.1:11211'],
	CACHE_MIDDLEWARE_KEY_PREFIX = CMS_CACHE_PREFIX,
	KEY_PREFIX = CMS_CACHE_PREFIX,
    )
}

ZINNIA_PAGINATION = 10
CMSPLUGIN_ZINNIA_TEMPLATES = [('includes/news_style.html', 'News style'), ('includes/press.html', 'Press')]
#ZINNIA_ENTRY_BASE_MODEL = 'cmsplugin_zinnia.placeholder.EntryPlaceholder'

CMS_REDIRECTS = True

THUMBNAIL_PROCESSORS = (
    'easy_thumbnails.processors.colorspace',
    'easy_thumbnails.processors.autocrop',
    #'easy_thumbnails.processors.scale_and_crop',
    'filer.thumbnail_processors.scale_and_crop_with_subject_location',
    'easy_thumbnails.processors.filters',
)

HAYSTACK_SITECONF = 'rusconwww.search_sites'
HAYSTACK_SEARCH_ENGINE = 'whoosh'
# HAYSTACK_SEARCH_ENGINE = 'xapian'
HAYSTACK_WHOOSH_PATH =  os.path.join(os.path.dirname(__file__), 'whoosh_index')
# HAYSTACK_XAPIAN_PATH = os.path.join(os.path.dirname(__file__), 'xapain_index')
HAYSTACK_INCLUDE_SPELLING = True

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.admin',
    'django.contrib.staticfiles',
    'haystack',       
    'cms',
    'menus',
    'mptt',
    'south',    
    'cms.plugins.text',
    'cms.plugins.picture',
    'cms.plugins.link',
    'cms.plugins.file',
    'cms.plugins.snippet',
    'cms.plugins.googlemap',    
    'cms_search',
    'sekizai',
    'cms_helper',
    'django.contrib.comments',
    'tagging',
    'mptt',
    'zinnia',
    'modeltranslation',
    'orderedmodel',
    'cmsplugin_zinnia',
    'cmsplugin_contact',
    'easy_thumbnails',
    'filer',
    'cmsplugin_filer_folder',
    'cmsplugin_filer_image',
    'cms.plugins.teaser',
    'cms.plugins.video',
    #'django.contrib.redirects',    
    'sitetree',        
    'cms_helper.cms_plugins',    
    'geo_office',
    'headship',
    'ctracer',
    'ctracer.cms_plugins',
    'social_share',    
)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'standard': {
            'format' : "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt' : "%d/%b/%Y %H:%M:%S"
        },
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',            
            'class': 'django.utils.log.AdminEmailHandler'
        },                 
        'logfile': {
            'level':'DEBUG',
            'class':'django.utils.log.AdminEmailHandler',          
        },
                 
    },
    'loggers': {
        'django.request': {
            'handlers': ['logfile'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}
