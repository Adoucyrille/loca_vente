from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from django.urls import reverse
from django.utils.html import format_html
from django.core.mail import send_mail


from .models import (
    Utilisateur, Vehicule, Reservation, Base, Accueilparti1,
    Fond, Choix, Defile, Choix2, Impression, Actu, Question,
    CaracteristiqueTechnique, Ville, Publicite, Direction
)
from django.utils.html import format_html


# Personnalisation de l'affichage des utilisateurs
class UtilisateurAdmin(UserAdmin):
    model = Utilisateur

    list_display = ('username', 'email', 'telephone', 'adresse', 'photo_profil', 'is_staff', 'is_active')
    list_filter = ('is_staff', 'is_active', 'groups')

    fieldsets = UserAdmin.fieldsets + (
        ('Informations personnelles', {
            'fields': ('telephone', 'adresse', 'photo_profil'),
        }),
    )

    add_fieldsets = UserAdmin.add_fieldsets + (
        ('Informations personnelles', {
            'classes': ('wide',),
            'fields': ('telephone', 'adresse', 'photo_profil'),
        }),
    )

    search_fields = ('username', 'email', 'telephone')
    ordering = ('username',)

    def afficher_photo(self, obj):
        if obj.photo:
            return f'<img src="{obj.photo.url}" style="height:40px;border-radius:50%;">'
        return "Aucune"
    afficher_photo.allow_tags = True
    afficher_photo.short_description = "photo_profil"

# Inline pour les caractéristiques techniques (OneToOne)
class CaracteristiqueTechniqueInline(admin.StackedInline):
    model = CaracteristiqueTechnique
    can_delete = False
    min_num = 1
    max_num = 1
    extra = 0
    readonly_fields = ['climatisation_str']
    fieldsets = (
        (None, {
            'fields': (('nombre_sieges', 'nombre_portes'),
                       ('vitesse_max', 'carburant'),
                       ('transmission', 'climatisation_str'),
                       'consommation')
        }),
    )

    def climatisation_str(self, obj):
        return "Oui" if obj.climatisation else "Non"
    climatisation_str.short_description = "climatisation"


# Affichage des véhicules
@admin.register(Vehicule)
class VehiculeAdmin(admin.ModelAdmin):
    list_display = ('marque', 'modele', 'type_vehicule', 'immatriculation', 'disponible_str', 'prix_par_jour')
    list_filter = ('type_vehicule', 'disponible')
    search_fields = ('marque', 'modele', 'immatriculation')
    inlines = [CaracteristiqueTechniqueInline]

    def disponible_str(self, obj):
        return "Oui" if obj.disponible else "Non"
    disponible_str.short_description = "Disponible"


# Affichage des réservations
class ReservationAdmin(admin.ModelAdmin):
    list_display = ('utilisateur', 'vehicule', 'date_debut', 'date_fin', 'prix_total', 'lieu_prise','destination')
    list_filter = ('date_debut', 'date_fin')
    search_fields = ('vehicule__marque', 'vehicule__modele', 'utilisateur__username')


class BaseAdmin(admin.ModelAdmin):
    list_display = ('email', 'localisation', 'numero', 'jour_ouverture', 'jour_fermeture', 'heure_ouverture', 'heure_fermeture')
    search_fields = ('email', 'localisation', 'numero')
    list_filter = ('jour_ouverture', 'jour_fermeture')

    def logo_preview(self, obj):
        if obj.imagelogo:
            return format_html('<img src="{}" width="50" height="50" style="object-fit:contain;" />', obj.imagelogo.url)
        return "Pas de logo"
    logo_preview.short_description = "Logo"


class FondAdmin(admin.ModelAdmin):
    list_display = ('titre', 'imagefond')
    search_fields = ('titre',)

    def image_preview(self, obj):
        if obj.imagefond:
            return format_html('<img src="{}" width="100" />', obj.imagefond.url)
        return "Pas d'image"
    image_preview.short_description = 'Aperçu'


class Accueilparti1Admin(admin.ModelAdmin):
    list_display = ('titre', 'description')
    search_fields = ('titre', 'description')


class ChoixAdmin(admin.ModelAdmin):
    list_display = ('titre', 'description')
    search_fields = ('titre',)


class DefileAdmin(admin.ModelAdmin):
    list_display = ('titre',)
    search_fields = ('titre',)


class Choix2Admin(admin.ModelAdmin):
    list_display = ('titre', 'description')
    search_fields = ('titre',)


class ActuAdmin(admin.ModelAdmin):
    list_display = ('titre', 'description', 'imageactu', 'jour', 'mois', 'modal')
    search_fields = ('titre',)

    def image_preview(self, obj):
        if obj.imageactu:
            return format_html('<img src="{}" width="100" />', obj.imageactu.url)
        return "Pas d'image"
    image_preview.short_description = 'Aperçu'


class QuestionAdmin(admin.ModelAdmin):
    list_display = ('titre', 'reponse')
    search_fields = ('titre',)


class ImpressionAdmin(admin.ModelAdmin):
    list_display = ('utilisateur', 'description', 'photo')
    search_fields = ('titre',)

    def image_preview(self, obj):
        if obj.photo:
            return format_html('<img src="{}" width="100" />', obj.photo.url)
        return "Pas d'image"
    image_preview.short_description = 'Aperçu'


@admin.register(CaracteristiqueTechnique)
class CaracteristiqueTechniqueAdmin(admin.ModelAdmin):
    list_display = ('vehicule', 'nombre_sieges', 'nombre_portes', 'vitesse_max',
                    'carburant', 'transmission', 'climatisation_str', 'consommation')

    def climatisation_str(self, obj):
        return "Oui" if obj.climatisation else "Non"
    climatisation_str.short_description = "Climatisation"

class VilleAdmin(admin.ModelAdmin):
    list_display = ('titre', )
    search_fields = ('titre',)

class DirectionAdmin(admin.ModelAdmin):
    list_display = ('nom', 'prenom','fonction', 'photo')
    search_fields = ('nom',)

    def image_preview(self, obj):
        if obj.photo:
            return format_html('<img src="{}" width="100" />', obj.photo.url)
        return "Pas d'image"
    image_preview.short_description = 'Aperçu'

class PubliciteAdmin(admin.ModelAdmin):
    list_display = ('titre', 'description', 'photo')
    search_fields = ('titre',)

    def image_preview(self, obj):
        if obj.photo:
            return format_html('<img src="{}" width="100" />', obj.photo.url)
        return "Pas d'image"
    image_preview.short_description = 'Aperçu'


class ReservationAdmin(admin.ModelAdmin):
    list_display = ('id', 'utilisateur', 'vehicule', 'date_debut', 'date_fin', 'statut', 'prix_total')
    list_filter = ('statut', 'date_debut', 'date_fin')
    search_fields = ('utilisateur__username', 'vehicule__marque', 'vehicule__modele')
    list_per_page = 20
    date_hierarchy = 'date_debut'
    ordering = ('-date_creation',)

    
    fieldsets = (
        ('Informations Client', {
            'fields': ('utilisateur', 'statut')
        }),
        ('Détails Réservation', {
            'fields': ('vehicule', 'date_debut', 'date_fin', 'prix_total')
        }),
        ('Logistique', {
            'fields': ('lieu_prise', 'destination')
        }),
    )
   







# Enregistrement dans l'admin
admin.site.register(Utilisateur, UtilisateurAdmin)
admin.site.register(Reservation, ReservationAdmin)
admin.site.register(Base, BaseAdmin)
admin.site.register(Fond, FondAdmin)
admin.site.register(Accueilparti1, Accueilparti1Admin)
admin.site.register(Choix, ChoixAdmin)
admin.site.register(Defile, DefileAdmin)
admin.site.register(Choix2, Choix2Admin)
admin.site.register(Actu, ActuAdmin)
admin.site.register(Impression, ImpressionAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Ville, VilleAdmin)
admin.site.register(Publicite, PubliciteAdmin)
admin.site.register(Direction, DirectionAdmin)




 