# Generated by Django 4.2.16 on 2025-06-15 18:03

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("Appli", "0013_ville"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="reservation",
            name="assurance",
        ),
        migrations.RemoveField(
            model_name="reservation",
            name="kilometrage_depart",
        ),
        migrations.RemoveField(
            model_name="reservation",
            name="kilometrage_retour",
        ),
        migrations.RemoveField(
            model_name="reservation",
            name="notes",
        ),
        migrations.RemoveField(
            model_name="reservation",
            name="options",
        ),
    ]
