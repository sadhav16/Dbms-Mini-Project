from rest_framework import serializers
from .models import MyUser, Event
# views.py
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Event
from .serializers import EventSerializer

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = MyUser
        fields = ['email', 'role', 'is_active']  # Include any other fields you want to expose

class RegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, min_length=8)

    class Meta:
        model = MyUser
        fields = ['email', 'password', 'role']

    def create(self, validated_data):
        user = MyUser.objects.create_user(
            email=validated_data['email'],
            password=validated_data['password'],
            role=validated_data.get('role', 'Learner')  # Default to 'Learner' if role is not provided
        )
        return user
    
class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'


class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ['ename', 'description', 'coord1', 'coord2', 'location'] 