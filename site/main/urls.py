from django.conf.urls import patterns, include, url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', 'django.views.generic.simple.direct_to_template', {'template':'base.html'},name='index'),
    url(r'^about/$', 'about',name='about'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'', include('django.contrib.auth.urls')),
)

urlpatterns += staticfiles_urlpatterns()