from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate, logout
from django.contrib import messages
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from .models import Utilisateur

from .models import Base, Fond, Accueilparti1, Defile, Choix, Vehicule, Choix2, Actu, Impression, Question, Ville, Reservation, Publicite, Direction
import re
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ValidationError
from datetime import datetime, date
from decimal import Decimal
from django.template.loader import get_template
from django.shortcuts import get_object_or_404
from xhtml2pdf import pisa
from django.http import HttpResponse
from django.core.mail import send_mail
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import traceback
from django.utils import timezone










def accueil(request):
    parti1accueil = Accueilparti1.objects.all()
    fonds = Fond.objects.all()
    choi = Choix.objects.all()
    choi2 = Choix2.objects.all()
    bases = Base.objects.all() 
    defiles = Defile.objects.all()
    vehicules = Vehicule.objects.all()
    actua = Actu.objects.all()
    impress = Impression.objects.all()
    quit = Question.objects.all()
    publicite = Publicite.objects.all()
    


    return render(request, './Appli/accueil.html', {
    'bases': bases,
    'fonds': fonds,
    'parti1accueil': parti1accueil,
    'defiles': defiles,
    'choi': choi,
    'vehicules': vehicules,
    'choi2': choi2,
    'actua': actua,
    'impress' : impress,
    'quit' : quit,
    'publicite' : publicite
    

})
def home(request):
    parti1accueil = Accueilparti1.objects.all()
    fonds= Fond.objects.all()
    choi = Choix.objects.all
    choi2 = Choix2.objects.all()
    bases = Base.objects.all() 
    defiles= Defile.objects.all()
    vehicules= Vehicule.objects.all()
    actua = Actu.objects.all()
    impress = Impression.objects.all()
    quit = Question.objects.all()

    return render(request, './Appli/index.html', {
    'bases': bases,
    'fonds': fonds,
    'parti1accueil': parti1accueil,
    'defiles': defiles,
    'choi': choi,
    'vehicules': vehicules,
    'choi2': choi2,
    'actua': actua,
    'impress' : impress,
    'quit' : quit
})

def cars(request):
    bases = Base.objects.all()
    bases = Base.objects.all() 
    parti1accueil = Accueilparti1.objects.all()
    fonds = Fond.objects.all()
    choi = Choix.objects.all()
    choi2 = Choix2.objects.all()
    defiles = Defile.objects.all()
    vehicules = Vehicule.objects.all()
    actua = Actu.objects.all()
    impress = Impression.objects.all()
    quit = Question.objects.all()
    direct = Direction.objects.all()
    publicite = Publicite.objects.all()
    selected_types = request.GET.getlist('types')
    vehicules = Vehicule.objects.select_related('caracteristiques').all()

    if selected_types:
        vehicules = vehicules.filter(type_vehicule__in=selected_types)

    types_uniques = Vehicule.objects.values_list('type_vehicule', flat=True).distinct()

    return render(request, './Appli/cars-list.html', {
        'bases': bases,
        'vehicules': vehicules,
        'types_vehicules': types_uniques,
        'selected_types': selected_types,
        'fonds': fonds,
        'parti1accueil': parti1accueil,
        'defiles': defiles,
        'choi': choi,
        'vehicules': vehicules,
        'choi2': choi2,
        'actua': actua,
        'impress' : impress,
        'quit' : quit,
        'direct': direct,
        'publicite' : publicite
  
    })

def propos(request):
    bases = Base.objects.all() 
    parti1accueil = Accueilparti1.objects.all()
    fonds = Fond.objects.all()
    choi = Choix.objects.all()
    choi2 = Choix2.objects.all()
    defiles = Defile.objects.all()
    vehicules = Vehicule.objects.all()
    actua = Actu.objects.all()
    impress = Impression.objects.all()
    quit = Question.objects.all()
    direct = Direction.objects.all()
    publicite = Publicite.objects.all()

    return render(request, './Appli/about.html', {
        'bases': bases,
        'fonds': fonds,
        'parti1accueil': parti1accueil,
        'defiles': defiles,
        'choi': choi,
        'vehicules': vehicules,
        'choi2': choi2,
        'actua': actua,
        'impress' : impress,
        'quit' : quit,
        'direct': direct,
        'publicite' : publicite

        
        })
def connexion(request):
        
    bases = Base.objects.all() 

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        # Vérification des champs
        if not username or not password:
            messages.error(request, "Veuillez remplir tous les champs.")
            return redirect('Appli:connexion')

        # Authentification
        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('Appli:accueil')  # Redirige vers la page d'accueil après connexion
        else:
            messages.error(request, "Nom d'utilisateur ou mot de passe incorrect.")
            return redirect('Appli:connexion')

    return render(request, './Appli/connexion.html',{
                  
                    'bases': bases,

                  })  # Formulaire de connexion

def inscrire(request):
 
    bases = Base.objects.all() 
    
    error = None
    field_errors = {}
    
    if request.method == 'POST':
        # Récupération des données
        data = {
            'username': request.POST.get('username', '').strip(),
            'email': request.POST.get('email', '').strip(),
            'password': request.POST.get('password', ''),
            'password2': request.POST.get('password2', ''),
            'telephone': request.POST.get('phone', '').strip(),
            'adresse': request.POST.get('domicile', '').strip(),
            'first_name': request.POST.get('first_name', '').strip(),
            'last_name': request.POST.get('last_name', '').strip(),
        }

        # Validation des champs obligatoires
        required_fields = ['username', 'email', 'password', 'password2']
        for field in required_fields:
            if not data[field]:
                field_errors[field] = "Ce champ est obligatoire"

        # Validation email
        if 'email' not in field_errors:
            try:
                validate_email(data['email'])
            except ValidationError:
                field_errors['email'] = "Email invalide"

        

        # Confirmation mot de passe
        if 'password' not in field_errors and 'password2' not in field_errors:
            if data['password'] != data['password2']:
                field_errors['password2'] = "Les mots de passe ne correspondent pas"

        # Validation téléphone
        if data['telephone']:
            if not re.match(r'^\+?[0-9]{8,15}$', data['telephone']):
                field_errors['phone'] = "Numéro de téléphone invalide"

        # Vérification unicité
        if 'username' not in field_errors:
            if Utilisateur.objects.filter(username=data['username']).exists():
                field_errors['username'] = "Ce nom d'utilisateur est déjà pris"

        if 'email' not in field_errors:
            if Utilisateur.objects.filter(email=data['email']).exists():
                field_errors['email'] = "Cet email est déjà utilisé"

        # Si aucune erreur, création utilisateur
        if not field_errors:
            user = Utilisateur.objects.create_user(
                username=data['username'],
                email=data['email'],
                password=data['password'],
                telephone=data['telephone'],
                adresse=data['adresse'],
                first_name=data['first_name'],
                last_name=data['last_name']
            )
            login(request, user)
            messages.success(request, "Inscription réussie ! Bienvenue !")
            return redirect('Appli:accueil')

    return render(request, './Appli/register.html', {
        'bases': bases,
        'error': error,
        'field_errors': field_errors,
        'values': request.POST if request.method == 'POST' else {}
    })

def deconnexion(request):
    logout(request)  
    return redirect('Appli:connexion')

@login_required
def reser(request):
    # Données pour le template
    vehicules = Vehicule.objects.filter(disponible=True)
    fonds = Fond.objects.all()
    bases = Base.objects.all()
    city = Ville.objects.all()
    parti1accueil = Accueilparti1.objects.all()
    defiles = Defile.objects.all()

    if request.method == 'POST':
        try:
            # Récupération des champs du formulaire
            vehicule_id = request.POST.get('vehicule')
            date_debut_str = request.POST.get('date_debut')
            date_fin_str = request.POST.get('date_fin')
            lieu_prise = request.POST.get('lieu_prise')
            destination = request.POST.get('destination')
            id_recto_file = request.FILES.get('piece_identite_recto')
            id_verso_file = request.FILES.get('piece_identite_verso')

            # Vérification des champs obligatoires
            if not all([vehicule_id, date_debut_str, date_fin_str, lieu_prise, destination]):
                raise ValidationError("Tous les champs sont obligatoires.")

            # Véhicule existant ?
            try:
                vehicule = Vehicule.objects.get(pk=vehicule_id)
            except Vehicule.DoesNotExist:
                raise ValidationError("Véhicule non trouvé.")

            # Format de date correct ?
            try:
                date_debut = datetime.strptime(date_debut_str, '%Y-%m-%d').date()
                date_fin = datetime.strptime(date_fin_str, '%Y-%m-%d').date()
            except ValueError:
                raise ValidationError("Format de date invalide.")

            if date_fin < date_debut:
                raise ValidationError("La date de fin doit être postérieure ou égale à la date de début.")
            if date_debut < date.today():
                raise ValidationError("La date de début ne peut pas être dans le passé.")
            if not vehicule.disponible:
                raise ValidationError("Ce véhicule n'est pas disponible.")

            # Vérifier si le véhicule est déjà réservé
            chevauchement = Reservation.objects.filter(
                vehicule=vehicule,
                date_debut__lte=date_fin,
                date_fin__gte=date_debut,
            ).exclude(statut__in=['ANNULE', 'TERMINE']).exists()
            if chevauchement:
                raise ValidationError("Le véhicule est déjà réservé à ces dates.")

            if not id_recto_file or not id_verso_file:
                raise ValidationError("Veuillez uploader les deux côtés de la pièce d'identité.")

            # Calcul du prix
            jours = (date_fin - date_debut).days + 1
            prix_par_jour = Decimal(str(vehicule.prix_par_jour))
            prix_total = prix_par_jour * Decimal(jours)

            if jours > 30:
                prix_total *= Decimal('0.8')
            elif jours > 7:
                prix_total *= Decimal('0.9')
            prix_total = prix_total.quantize(Decimal('0.01'))

            # Création de la réservation
            reservation = Reservation.objects.create(
                utilisateur=request.user,
                vehicule=vehicule,
                date_debut=date_debut,
                date_fin=date_fin,
                lieu_prise=lieu_prise,
                destination=destination,
                prix_total=prix_total,
                piece_identite_recto=id_recto_file,
                piece_identite_verso=id_verso_file,
                statut='EN_ATTENTE'
            )

            # Envoi d'email au superutilisateur
            superusers = Utilisateur.objects.filter(is_superuser=True, is_active=True)
            for admin in superusers:
                if admin.email:
                    send_mail(
                        subject="Nouvelle réservation reçue",
                        message=f"Une nouvelle réservation a été effectuée par {request.user.username} pour le véhicule {vehicule.modele} du {date_debut} au {date_fin}.",
                        from_email=None,  # DEFAULT_FROM_EMAIL utilisé
                        recipient_list=[admin.email],
                        fail_silently=False,
                    )

            # Envoi d'email à l'utilisateur
            if request.user.email:
                send_mail(
                    subject="Confirmation de votre réservation",
                    message=f"""
            Bonjour {request.user.get_full_name()},

            Nous avons bien reçu votre demande de réservation pour le véhicule {vehicule.marque} {vehicule.modele}
            du {date_debut} au {date_fin}.

            Votre demande est actuellement en attente de validation. Veuillez vous rendre dans notre lieu de prise en charge {lieu_prise} avec votre permis et votre carte CNI pour la confirmation.

            Merci pour votre confiance !

            L’équipe de réservation
                    """,
                    from_email=None,  # ou settings.DEFAULT_FROM_EMAIL
                    recipient_list=[request.user.email],
                    fail_silently=False,
                )
                    

            messages.success(request, "Votre réservation est enregistrée et en attente de validation.")
            print("✅ Message de succès envoyé.")
            return redirect('Appli:reser')

        except ValidationError as e:
            messages.error(request, str(e))
       
            traceback.print_exc()

    context = {
        'bases': bases,
        'fonds': fonds,
        'vehicules': vehicules,
        'city': city,
        'parti1accueil': parti1accueil,
        'defiles': defiles,
        'today': date.today().strftime('%Y-%m-%d'),
    }

    return render(request, 'Appli/quick-booking.html', context)
@login_required
def contact(request):
    fonds = Fond.objects.all()
    bases = Base.objects.all()

    if request.method == 'POST':
        description = request.POST.get('description') or request.POST.get('message')  # selon ton HTML
        photo = request.FILES.get('photo')

        if not description or not photo:
            messages.error(request, "Tous les champs sont requis.")
            return render(request, './Appli/contact.html', {
                'bases': bases,
                'fonds': fonds,
                'old_description': description,
            })

        # Enregistrement de l'impression
        impressin= Impression.objects.create(
            utilisateur=request.user,
            description=description,
            photo=photo
        )

        messages.success(request, "Merci, vos avis et suggestions ont été pris en compte !")
        return redirect('Appli:contact')

    return render(request, './Appli/contact.html', {
        'bases': bases,
        'fonds': fonds,
    })



def reservation_success(request):
    return render(request, 'Appli/reservation_success.html')


 

@login_required
def reservation_pdf(request, pk):
    reservation = get_object_or_404(Reservation, pk=pk, utilisateur=request.user)
    base = Base.objects.first()  # Pour les infos de pied de page dans le PDF
    
    template_path = 'Appli/reservation_pdf.html'
    context = {
        'reservation': reservation,
        'base': base
    }
    
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'filename=reservation_{reservation.id}.pdf'
    
    template = get_template(template_path)
    html = template.render(context)

    # Créez le PDF
    pisa_status = pisa.CreatePDF(
        html,
        dest=response,
        encoding='UTF-8',
    )
    
    if pisa_status.err:
        return HttpResponse('Erreur lors de la génération du PDF')
    return response

@login_required
def commandes(request):
    today = timezone.now().date()
    
    # Exclure les réservations terminées
    reservations = Reservation.objects.filter(
        utilisateur=request.user,
        annulee=False
    ).exclude(statut="TERMINE")

    # Déterminer si une réservation est annulable
    for reservation in reservations:
        reservation.est_annulable = (
            not reservation.annulee and
            reservation.date_debut >= today and
            reservation.statut == "EN_ATTENTE"
        )

    bases = Base.objects.all()
    fonds = Fond.objects.all()

    return render(request, './Appli/commandes.html', {
        'reservations': reservations,
        'bases': bases,
        'fonds': fonds,
    })

@login_required
def modifier_reservation(request, pk):
    reservation = get_object_or_404(Reservation, pk=pk, utilisateur=request.user)
    bases = Base.objects.all()
    fonds = Fond.objects.all()

    if request.method == 'POST':
        try:
            date_debut = request.POST.get('date_debut')
            date_fin = request.POST.get('date_fin')
            destination = request.POST.get('destination')
            lieu_prise = request.POST.get('lieu_prise')

            # Conversion en objets date
            date_debut_obj = datetime.strptime(date_debut, '%Y-%m-%d').date()
            date_fin_obj = datetime.strptime(date_fin, '%Y-%m-%d').date()

            # ✅ Vérification logique des dates
            if date_fin_obj < date_debut_obj:
                messages.error(request, "❌ La date de fin doit être superieure ou égale à la date de début.")
                raise ValueError("Dates invalides")

            # Mise à jour des champs
            reservation.date_debut = date_debut_obj
            reservation.date_fin = date_fin_obj
            reservation.destination = destination
            reservation.lieu_prise = lieu_prise

            # ✅ Validation des contraintes du modèle
            reservation.full_clean()  # soulève ValidationError si contrainte violée
            reservation.save()

            # ✅ Notification admin
            superusers = Utilisateur.objects.filter(is_superuser=True, is_active=True, email__isnull=False)
            for admin in superusers:
                send_mail(
                    subject="Modification de réservation",
                    message=f"""
L'utilisateur {request.user.get_full_name()} ({request.user.email}) a modifié sa réservation :

- Date de début : {reservation.date_debut}
- Date de fin : {reservation.date_fin}
- Lieu de prise : {reservation.lieu_prise}
- Destination : {reservation.destination}
                    """,
                    from_email=None,
                    recipient_list=[admin.email]
                )

            messages.success(request, "✅ Réservation modifiée avec succès.")
            return redirect('Appli:commandes')

        except ValueError:
            pass  # Le message d'erreur a déjà été ajouté
        except ValidationError as e:
            messages.error(request, "❌ Modification impossible : " + ", ".join(e.messages))

        except Exception as e:
            messages.error(request, f"❌ Une erreur est survenue : {str(e)}")

    return render(request, 'Appli/modifier_reservation.html', {
        'reservation': reservation,
        'bases': bases,
        'fonds': fonds,
    })
@login_required
def annuler_reservation(request, pk):
    reservation = get_object_or_404(Reservation, pk=pk, utilisateur=request.user)

    if request.method == 'POST':
        # Vérifie si la date de début est passée
        if reservation.date_debut < timezone.now().date():
            messages.error(request, "Vous ne pouvez pas annuler une réservation déjà commencée ou passée.")
            return redirect('Appli:commandes')

        # Annule la réservation si valide
        reservation.annulee = True
        reservation.save(update_fields=['annulee'])

        # ✅ Email aux administrateurs
        superusers = Utilisateur.objects.filter(is_superuser=True, is_active=True, email__isnull=False)
        subject = "Annulation de réservation"
        message = f"""
L'utilisateur {request.user.get_full_name()} ({request.user.email}) a annulé sa réservation :

- Véhicule : {reservation.vehicule.marque} {reservation.vehicule.modele}
- Date de début : {reservation.date_debut}
- Date de fin : {reservation.date_fin}
- Lieu de prise : {reservation.lieu_prise}
- Destination : {reservation.destination}
        """
        for admin in superusers:
            send_mail(subject, message, None, [admin.email])

        # ✅ Email à l'utilisateur
        if request.user.email:
            send_mail(
                subject="Confirmation d'annulation de votre réservation",
                message=f"""
Bonjour {request.user.first_name},

Votre réservation pour le véhicule {reservation.vehicule.marque} {reservation.vehicule.modele}
du {reservation.date_debut} au {reservation.date_fin} a bien été annulée.

Merci de votre compréhension.

L’équipe de réservation.
                """,
                from_email=None,
                recipient_list=[request.user.email],
                fail_silently=False,
            )

        # ✅ Message flash
        messages.success(request, "Réservation annulée avec succès.")
        return redirect('Appli:commandes')

    return redirect('Appli:commandes')

@csrf_exempt
def get_available_vehicles(request):
    if request.method == 'POST':
        try:
            date_debut = request.POST.get('date_debut')
            date_fin = request.POST.get('date_fin')

            if not date_debut or not date_fin:
                return JsonResponse({'error': 'Dates manquantes'}, status=400)

            try:
                date_debut = datetime.strptime(date_debut, '%Y-%m-%d').date()
                date_fin = datetime.strptime(date_fin, '%Y-%m-%d').date()
            except Exception as e:
                import traceback
                traceback.print_exc()
                return JsonResponse({'error': 'Format de date invalide'}, status=400)

            if date_debut > date_fin:
                return JsonResponse({'error': 'La date de fin doit être après la date de début'}, status=400)

            # Récupère les véhicules déjà réservés
            reserved_vehicle_ids = Reservation.objects.filter(
                date_debut__lte=date_fin,
                date_fin__gte=date_debut,
                statut__in=['EN_ATTENTE', 'CONFIRME']
            ).values_list('vehicule_id', flat=True)

            # Véhicules disponibles
            available_vehicles = Vehicule.objects.filter(
                disponible=True
            ).exclude(
                id__in=reserved_vehicle_ids
            )

            # Construction de la réponse JSON
            vehicules_data = []
            for v in available_vehicles:
                vehicules_data.append({
                    'id': v.id,
                    'marque': v.marque,
                    'modele': v.modele,
                    'prix_par_jour': str(v.prix_par_jour),
                    'image_url': v.image.url if v.image else ''
                })

            return JsonResponse({
                'vehicules': vehicules_data,
                'count': len(vehicules_data)
            })

        except Exception as e:
            import traceback
            traceback.print_exc()
            return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Méthode non autorisée'}, status=405)

@login_required
def historique_reservations(request):
    reservations = Reservation.objects.filter(
        utilisateur=request.user
    ).filter(
        statut="TERMINE"
    ) | Reservation.objects.filter(
        utilisateur=request.user,
        annulee=True
    )

    # On évite les doublons si une réservation est à la fois terminée et annulée
    reservations = reservations.distinct().order_by('-date_debut')

    bases = Base.objects.all()
    fonds = Fond.objects.all()

    return render(request, 'Appli/historique.html', {
        'reservations': reservations,
        'bases': bases,
        'fonds': fonds,
    })

@login_required
def mon_profil(request):
    user = request.user
    if request.method == 'POST' and request.FILES.get('photo_profil'):
        user.photo_profil = request.FILES['photo_profil']
        user.save()
        return redirect('Appli:profil')  # mets le nom réel de ton URL
    bases = Base.objects.all()
    fonds = Fond.objects.all()
    return render(request, 'Appli/profile.html', {
        'fonds': fonds,
        'bases': bases,
        'user': user
    })


@login_required
def modifier_profil(request):
    if request.method == 'POST':
        user = request.user
        user.username = request.POST.get('username')
        user.first_name = request.POST.get('first_name')
        user.last_name = request.POST.get('last_name')
        user.email = request.POST.get('email')
        user.telephone = request.POST.get('telephone')
        user.adresse = request.POST.get('adresse')

        # Modification mot de passe (facultatif)
        password = request.POST.get('password')
        password_confirm = request.POST.get('password_confirm')
        if password:
            if password == password_confirm:
                user.set_password(password)
            else:
                messages.error(request, "Les mots de passe ne correspondent pas.")
                return redirect('Appli:profil')

        user.save()
        messages.success(request, "Profil mis à jour avec succès.")
        return redirect('Appli:profil')


