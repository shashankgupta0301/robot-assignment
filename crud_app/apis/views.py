# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from models import Employee

from rest_framework.generics import (ListAPIView, RetrieveAPIView, UpdateAPIView, DestroyAPIView, CreateAPIView)

from serializers import (EmployeeSerializer, EmployeeDetailsSerializer, EmployeeCreateSerializer)

# Create your views here.

class EmployeeAPIView(ListAPIView):

    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer

class EmployeeDetailsAPIView(RetrieveAPIView):

    queryset = Employee.objects.all()
    serializer_class = EmployeeDetailsSerializer

class EmployeeUpdateAPIView(UpdateAPIView):

    queryset = Employee.objects.all()
    serializer_class = EmployeeDetailsSerializer


class EmployeeDeleteAPIView(DestroyAPIView):

    queryset = Employee.objects.all()
    serializer_class = EmployeeDetailsSerializer

class EmployeeCreateAPIView(CreateAPIView):

    queryset = Employee.objects.all()
    serializer_class = EmployeeCreateSerializer
