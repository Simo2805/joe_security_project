# Generated by Django 4.2.3 on 2023-08-07 21:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lab_environment', '0013_customuser'),
    ]

    operations = [
        migrations.DeleteModel(
            name='CustomUser',
        ),
    ]