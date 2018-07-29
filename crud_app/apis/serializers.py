from rest_framework import serializers
from models import Employee


class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = ['id',
                  'first_name',
                  ]

class EmployeeDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = ['id',
                  'first_name',
                  'last_name',
                  'email',
                  'department',
                  ]

class EmployeeCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = ['id',
                  'first_name',
                  'last_name',
                  'email',
                  'department',
                  ]