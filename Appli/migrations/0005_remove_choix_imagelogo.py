# Generated by Django 4.2.16 on 2025-06-11 02:02

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("Appli", "0004_choix_defile"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="choix",
            name="imagelogo",
        ),
    ]
