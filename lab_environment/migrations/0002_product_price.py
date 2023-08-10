# Generated by Django 4.2.3 on 2023-07-26 11:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lab_environment', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='price',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=8),
            preserve_default=False,
        ),
    ]
