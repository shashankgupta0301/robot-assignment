from django.conf.urls import url, include
from rest_framework import routers


from . import views
router = routers.DefaultRouter()

urlpatterns = [

    url(r'', include(router.urls)),
    url(r'^emp_list/$', views.EmployeeAPIView.as_view(), name='employee_list'),
    url(r'^create/$', views.EmployeeCreateAPIView.as_view(), name='employee_create'),
    url(r'^emp_list/(?P<pk>\d+)/$', views.EmployeeDetailsAPIView.as_view(), name='employee_details'),
    url(r'^emp_list/(?P<pk>\d+)/edit/$', views.EmployeeUpdateAPIView.as_view(), name='employee_update'),
    url(r'^emp_list/(?P<pk>\d+)/delete/$', views.EmployeeDeleteAPIView.as_view(), name='employee_delete'),

]

