# Generated by Django 4.2.16 on 2025-06-10 23:22

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("Appli", "0002_base"),
    ]

    operations = [
        migrations.CreateModel(
            name="Accueilparti1",
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
        migrations.CreateModel(
            name="Fond",
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
                ("imagefond", models.ImageField(upload_to="images/")),
            ],
        ),
    ]
