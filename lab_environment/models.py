from django.db import models
from django.contrib.auth.models import AbstractUser


class LabTopic(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Challenge(models.Model):
    lab_topic = models.ForeignKey(LabTopic, on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    description = models.TextField()
    solution = models.TextField()

    def __str__(self):
        return self.title

class EducationalContent(models.Model):
    lab_topic = models.ForeignKey('LabTopic', on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    content = models.TextField()

    def __str__(self):
        return self.title


CATEGORY_CHOICES = [
    ('', 'All'),  # Add the "All" option back to the choices
    ('network', 'Network'),
    ('hacking', 'Hacking'),
    ('cyber_security', 'Cyber Security'),
    ('threat_modeling', 'Threat Modeling'),
]

class Product(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    image = models.ImageField(upload_to='product_images/', null=True, blank=True)
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES, default='all')
    price = models.DecimalField(max_digits=10, decimal_places=2)  
    is_special = models.BooleanField(default=False)  



class LoginPassword(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)

    def __str__(self):
        return self.username


class FakeUser(models.Model):
    username = models.CharField(max_length=100)
    job_title = models.CharField(max_length=75, default='Unknown')  # Add the default value

    
    def __str__(self):
        return self.username
    


class Account5(models.Model):
    username = models.CharField(max_length=100, unique=True)
    password = models.CharField(max_length=100)

    def __str__(self):
        return self.username

class AuthenticationCode(models.Model):
    code = models.CharField(max_length=6, unique=True)
    serial=models.CharField(max_length=3, unique=True)

    def __str__(self):
        return self.code









 
