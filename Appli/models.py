from django.db import models
from django.contrib.auth.models import AbstractUser

# ----------------------------
# Utilisateur personnalisé
# ----------------------------
class Utilisateur(AbstractUser):
    telephone = models.CharField(max_length=15, blank=True, null=True)
    adresse = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.username

# ----------------------------
# Types de véhicules personnalisés
# ----------------------------
class TypeVehicule(models.TextChoices):
    SIMPLE = 'simple', 'Simple'
    LUXE = 'luxe', 'Luxe'
    VVIP = 'vvip', 'HORS CLASS'

# ----------------------------
# Véhicule
# ----------------------------
class Vehicule(models.Model):
    type_vehicule = models.CharField(max_length=10, choices=TypeVehicule.choices)
    marque = models.CharField(max_length=100)
    modele = models.CharField(max_length=100)
    immatriculation = models.CharField(max_length=20, unique=True)
    disponible = models.BooleanField()
    prix_par_jour = models.DecimalField(max_digits=8, decimal_places=2)
    image = models.ImageField(upload_to='vehicules/', null=True, blank=True)

    def disponible_str(self, obj):
         return "Oui" if obj.disponible else "Non"

    def __str__(self):
        return f"{self.marque} {self.modele} - {self.immatriculation}"

# ----------------------------
# Réservation
# ----------------------------
from django.core.validators import MinValueValidator, MaxValueValidator
from datetime import date, timedelta

class Reservation(models.Model):
    STATUT_CHOICES = [
        ('EN_ATTENTE', 'En attente'),
        ('CONFIRME', 'Confirmé'),
        ('EN_COURS', 'En cours'),
        ('TERMINE', 'Terminé'),
        ('ANNULE', 'Annulé'),
    ]
    
    utilisateur = models.ForeignKey(Utilisateur, on_delete=models.CASCADE, related_name='reservations')
    vehicule = models.ForeignKey(Vehicule, on_delete=models.CASCADE, related_name='reservations')
    date_debut = models.DateField(validators=[MinValueValidator(date.today())])
    date_fin = models.DateField()
    prix_total = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    statut = models.CharField(max_length=20, choices=STATUT_CHOICES, default='EN_ATTENTE')
    date_creation = models.DateTimeField(auto_now_add=True)
    date_modification = models.DateTimeField(auto_now=True)
    lieu_prise = models.CharField(max_length=100)
    destination = models.CharField(max_length=100)
    piece_identite_recto = models.FileField(upload_to='pieces_identite/recto/', blank=True, null=True)
    piece_identite_verso = models.FileField(upload_to='pieces_identite/verso/', blank=True, null=True)
    
    class Meta:
        ordering = ['-date_creation']
        verbose_name = 'Réservation'
        verbose_name_plural = 'Réservations'
        constraints = [
            models.CheckConstraint(
                check=models.Q(date_fin__gte=models.F('date_debut')),
                name='check_date_fin_apres_debut'
            ),
            models.UniqueConstraint(
                fields=['vehicule', 'date_debut', 'date_fin'],
                name='unique_reservation_vehicule_periode',
                condition=models.Q(statut__in=['CONFIRME', 'EN_COURS'])
            )
        ]

    def clean(self):
        # Validation supplémentaire
        if self.date_fin < self.date_debut:
            raise ValidationError("La date de fin doit être postérieure à la date de début.")
        
        if self.date_debut < date.today():
            raise ValidationError("La date de début ne peut pas être dans le passé.")
        
        # Vérification de la disponibilité du véhicule
        if self.statut in ['CONFIRME', 'EN_COURS'] and self.pk is None:
            overlapping = Reservation.objects.filter(
                vehicule=self.vehicule,
                date_debut__lte=self.date_fin,
                date_fin__gte=self.date_debut,
                statut__in=['CONFIRME', 'EN_COURS']
            ).exists()
            
            if overlapping:
                raise ValidationError("Le véhicule n'est pas disponible pour cette période.")

    def save(self, *args, **kwargs):
        # Calcul automatique du prix total
        if not self.prix_total or 'vehicule' in kwargs.get('update_fields', []) or \
           'date_debut' in kwargs.get('update_fields', []) or 'date_fin' in kwargs.get('update_fields', []):
            self.calculer_prix_total()
        
        # Validation avant sauvegarde
        self.full_clean()
        super().save(*args, **kwargs)

    def calculer_prix_total(self):
        if self.date_debut and self.date_fin and self.vehicule:
            nombre_jours = (self.date_fin - self.date_debut).days + 1  # +1 pour inclure le dernier jour
            self.prix_total = self.vehicule.prix_par_jour * nombre_jours
            
            # Application d'une remise pour les réservations longues
            if nombre_jours > 30:
                self.prix_total *= 0.8  # 20% de réduction
            elif nombre_jours > 7:
                self.prix_total *= 0.9  # 10% de réduction
    @property
    def duree(self):
        return (self.date_fin - self.date_debut).days + 1

    @property
    def est_en_cours(self):
        today = date.today()
        return self.date_debut <= today <= self.date_fin and self.statut == 'CONFIRME'

    def annuler(self):
        if self.statut not in ['TERMINE', 'ANNULE']:
            self.statut = 'ANNULE'
            self.save(update_fields=['statut'])

    def confirmer(self):
        if self.statut == 'EN_ATTENTE':
            self.statut = 'CONFIRME'
            self.save(update_fields=['statut'])

    def __str__(self):
        return f"Réservation #{self.id} - {self.utilisateur} ({self.date_debut} au {self.date_fin})"
    
class Base(models.Model):
    numero = models.CharField(max_length=20)
    email = models.EmailField()
    localisation = models.CharField(max_length=255)
    imagelogo = models.ImageField(upload_to='logos/')
    about = models.TextField()
    jour_ouverture = models.CharField(max_length=20)
    jour_fermeture = models.CharField(max_length=20)
    heure_ouverture = models.TimeField()
    heure_fermeture = models.TimeField()

    def __str__(self):
        return f"{self.email} - {self.localisation}"
    

class Fond(models.Model):
    titre = models.CharField(max_length=100)
    imagefond = models.ImageField(upload_to='images/')

    def __str__(self):
        return self.titre
    
class Accueilparti1(models.Model) :
    titre = models.CharField(max_length=100)
    description = models.TextField()
    def __str__(self):
        return self.titre
    
class Defile(models.Model):
    titre = models.CharField(max_length=100)
    
    def __str__(self):
        return self.titre
    
class Choix(models.Model):
    titre = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.titre   
    
class Choix2(models.Model):
    titre = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.titre      

class Actu(models.Model):
    titre = models.CharField(max_length=100)
    description = models.TextField()   
    imageactu = models.ImageField(upload_to='images/')
    jour = models.CharField(max_length=100)
    mois = models.CharField(max_length=100)
    modal = models.TextField( default='standard')

    def __str__(self):
        return self.titre      
class Impression(models.Model):
    utilisateur = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)
    description = models.TextField()   
    photo = models.ImageField(upload_to='images/')

    def __str__(self):
        return self.utilisateur.username  
    
class Question(models.Model):
    titre = models.CharField(max_length=100)
    reponse = models.TextField()
 
    def __str__(self):
        return self.titre  

class CaracteristiqueTechnique(models.Model):
    vehicule = models.OneToOneField(
        Vehicule, 
        on_delete=models.CASCADE,
        related_name='caracteristiques'
    )
    nombre_sieges = models.PositiveSmallIntegerField(default=5)
    nombre_portes = models.PositiveSmallIntegerField(default=5)
    vitesse_max = models.PositiveSmallIntegerField(help_text="en km/h")
    climatisation = models.BooleanField(null=True, blank=True)
    transmission = models.CharField(
        max_length=10,
        choices=[
            ('AUTO', 'Automatique'),
            ('MANUEL', 'Manuelle'),
        ],
        default='AUTO'
    )
    carburant = models.CharField(
        max_length=10,
        choices=[
            ('ESSENCE', 'Essence'),
            ('DIESEL', 'Diesel'),
            ('ELECTRIQUE', 'Électrique'),
            ('HYBRIDE', 'Hybride'),
        ]
    )
    consommation = models.FloatField(help_text="en L/100km", blank=True, null=True)

    def climatisation_str(self, obj):
         return "Oui" if obj.climatisation else "Non"
    
    def __str__(self):
        return f"Caract. techniques de {self.vehicule}"
    
class Ville(models.Model):
    titre = models.CharField(max_length=100)
 
    def __str__(self):
        return self.titre 

class Direction(models.Model):
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    fonction = models.CharField(max_length=100)
    photo = models.ImageField(upload_to='images/')

    def __str__(self):
        return self.nom
    
class Publicite(models.Model):
    titre = models.CharField(max_length=150)
    description = models.TextField()
    photo = models.ImageField(upload_to='images/', default='standard')


    def __str__(self):
        return self.titre



    

