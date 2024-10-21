from rest_framework import serializers
from .models import MyUser, Event

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