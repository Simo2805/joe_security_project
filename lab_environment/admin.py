from rest_framework import viewsets
from .models import LabTopic, Challenge, Product, CATEGORY_CHOICES, LoginPassword, FakeUser, Account5, AuthenticationCode
from .serializers import LabTopicSerializer, ChallengeSerializer
from django.contrib import admin
from django import forms



class LabTopicViewSet(viewsets.ModelViewSet):
    queryset = LabTopic.objects.all()
    serializer_class = LabTopicSerializer

class ChallengeViewSet(viewsets.ModelViewSet):
    queryset = Challenge.objects.all()
    serializer_class = ChallengeSerializer

class ProductAdminForm(forms.ModelForm):
    category = forms.ChoiceField(choices=CATEGORY_CHOICES[1:], required=False)

    class Meta:
        model = Product
        fields = '__all__'

class ProductAdmin(admin.ModelAdmin):
    form = ProductAdminForm

admin.site.register(Product, ProductAdmin)  # Register the Product model with the ProductAdmin class


#lab2
class LoginPasswordAdmin(admin.ModelAdmin):
    list_display = ('username', 'password')
    # Add any other fields you want to display or configure in the admin interface

# Register the LoginPassword model with the admin site
admin.site.register(LoginPassword, LoginPasswordAdmin)


#lab4
class FakeUserAdmin(admin.ModelAdmin):
    list_display = ('username','job_title')
    
admin.site.register(FakeUser, FakeUserAdmin)  # Register the FakeUser model with the FakeUserAdmin class
    

#lab 5
class Account5Admin(admin.ModelAdmin):
    list_display = ('username', 'password')
    
admin.site.register(Account5, Account5Admin)



class AuthenticationCodeAdmin(admin.ModelAdmin):
    list_display = ('serial', 'code')

admin.site.register(AuthenticationCode, AuthenticationCodeAdmin)
