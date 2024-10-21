from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.db import models
from djongo import models


# Manager for custom user model
class MyUserManager(BaseUserManager):
    def create_user(self, email, password=None, role='Learner'):
        if not email:
            raise ValueError('Users must have an email address')
        if not password:
            raise ValueError('Users must have a password')

        user = self.model(
            email=self.normalize_email(email),
            role=role,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None):
        user = self.create_user(
            email=email,
            password=password,
            role='Admin',  # Explicitly set the role to Admin for superusers
        )
        user.is_admin = True
        user.is_superuser = True  # Add is_superuser flag
        user.save(using=self._db)
        return user

# Custom user model
class MyUser(AbstractBaseUser):
    ROLES = (
        ('Learner', 'Learner'),
        ('Admin', 'Admin'),
    )

    email = models.EmailField(unique=True)
    role = models.CharField(max_length=10, choices=ROLES, default='Learner')
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)  # Add is_superuser field

    objects = MyUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []  # Superusers only require email and password

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin

    @property
    def is_superuser(self):
        return self.is_superuser

    class Meta:
        verbose_name = 'User'
        verbose_name_plural = 'Users'

class Event(models.Model):
    ename = models.CharField(max_length=100)  # Change title to ename
    description = models.TextField()  # You may want to add a field for description
    coord1 = models.CharField(max_length=100, null=True)  # Coordinates field
    coord2 = models.CharField(max_length=100, null=True)  # Coordinates field
    location = models.CharField(max_length=200, null=True)  # Change location to loc

    class Meta:
        verbose_name = 'Event'
        verbose_name_plural = 'Events'