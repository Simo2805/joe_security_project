# Generated by Django 4.2.3 on 2023-08-06 06:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lab_environment', '0011_account5_authenticationcode'),
    ]

    operations = [
        migrations.AddField(
            model_name='authenticationcode',
            name='serial',
            field=models.CharField(default=1, max_length=3, unique=True),
            preserve_default=False,
        ),
    ]