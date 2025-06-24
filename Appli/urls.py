from django.contrib import admin
from django.urls import path
from . import views

app_name = 'Appli'

urlpatterns = [
    path ("accueil/", views.accueil,name='accueil'),
    path ("", views.home,name='home'),
    path ("cars/", views.cars, name='cars'),
    path ("propos/", views.propos, name='propos'),
    path ("connexion", views.connexion, name='connexion'),
    path ("inscrire/", views.inscrire, name='inscrire'),
    path ("reser/", views.reser, name='reser'),
    path ("deconnexion/", views.deconnexion, name='deconnexion'),
    path ("contact/", views.contact,name='contact'),
    path('reservation-success/', views.reservation_success, name='reservation_success'),
    path('commandes/', views.commandes, name='commandes'),
    path('reservation/pdf/<int:pk>/', views.reservation_pdf, name='reservation_pdf'),
    path('reservation/modifier/<int:pk>/', views.modifier_reservation, name='modifier_reservation'),
    path('reservation/supprimer/<int:pk>/', views.supprimer_reservation, name='supprimer_reservation'),
    path('ajax/vehicules-disponibles/', views.get_available_vehicles, name='vehicules_disponibles'),


]