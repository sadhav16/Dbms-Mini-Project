# users/urls.py
from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import RegisterView, LoginView, UserProfileView, EventViewSet , EventListView

router = DefaultRouter()
router.register(r'events', EventViewSet)

urlpatterns = [
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('profile/', UserProfileView.as_view(), name='profile'),
    path('', include(router.urls)),
    path('admin/', admin.site.urls),
    path('api/', include('myapp.urls')),
    path('api/events/', EventListView.as_view(), name='event-list'),
]


