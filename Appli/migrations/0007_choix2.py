# Generated by Django 4.2.16 on 2025-06-13 17:11

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("Appli", "0006_alter_vehicule_disponible"),
    ]

    operations = [
        migrations.CreateModel(
            name="Choix2",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("titre", models.CharField(max_length=100)),
                ("description", models.TextField()),
            ],
        ),
    ]
