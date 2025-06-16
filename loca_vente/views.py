from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from django.contrib.auth import logout
from django.conf import settings
from django.contrib.auth import get_user_model



Utilisateur = get_user_model()

def accueil(request):
    return render(request, './Appli/accueil.html')


def cars(request):
    return render(request, './Appli/cars-list.html')

def propos(request):
    return render(request, './Appli/about.html')

def connexion(request):
    error = ''

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        if not username or not password:
            error = "Veuillez remplir tous les champs."
        else:
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('accueil')  # Redirige vers la page d’accueil après connexion
            else:
                error = "Nom d'utilisateur ou mot de passe incorrect."

    return render(request, './Appli/index.html', {'error': error})


def inscrire(request):
    error = ''

    if request.method == 'POST':
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        domicile = request.POST.get('domicile')
        password = request.POST.get('password')
        repassword = request.POST.get('password2')

        if not all([first_name, last_name, username, email, phone, domicile, password, repassword]):
            error = "Tous les champs sont obligatoires."
        elif password != repassword:
            error = "Les mots de passe ne correspondent pas."
        elif Utilisateur.objects.filter(username=username).exists():
            error = "Ce nom d'utilisateur est déjà pris."
        else:
            user = Utilisateur.objects.create_user(
                username=username,
                password=password,
                email=email,
                first_name=first_name,
                last_name=last_name,
                telephone=phone,
                adresse=domicile
            )

            login(request, user)
            return redirect('inscrire')

    return render(request, './Appli/register.html', {'error': error})


def deconnexion(request):
    logout(request)  
    return redirect('connexion')

def reser(request):
    return render(request, './Appli/quick-booking.html')
