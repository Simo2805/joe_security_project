# lab_environment/views.py


from urllib.parse import unquote
from django.contrib.auth.models import User
from rest_framework import viewsets, permissions
from .models import LabTopic, Challenge, Product, LoginPassword, FakeUser, Account5, AuthenticationCode
from .serializers import LabTopicSerializer, ChallengeSerializer, UserSerializer
from rest_framework.authtoken.models import Token
from django.http import JsonResponse
from django.db import connection
from django.shortcuts import render, get_object_or_404, redirect
from django.db.models import Q
from django.http import Http404
from django.contrib import messages
from django.http import HttpResponse
from django.utils.html import escape
from django.contrib.auth.decorators import login_required






class LabTopicViewSet(viewsets.ModelViewSet):
    queryset = LabTopic.objects.all()
    serializer_class = LabTopicSerializer

class ChallengeViewSet(viewsets.ModelViewSet):
    queryset = Challenge.objects.all()
    serializer_class = ChallengeSerializer
    
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]


#lab1

def filter_products(request):
    category = request.GET.get('category')
    product_name = request.GET.get('product_name', '')

    if category and category != 'all':
        # Filter products by both category and name
        products = Product.objects.filter(category=category, name__icontains=product_name, is_special=False)
    else:
        # Only filter by name, if provided
        products = Product.objects.filter(name__icontains=product_name, is_special=False)

    context = {
        'products': products,
        'selected_category': category,
    }
    return render(request, 'product_list.html', context)


def search_products(request):
    product_name = unquote(request.GET.get('product_name', ''))

    with connection.cursor() as cursor:
        # WARNING: The following query is VULNERABLE to SQL injection
        query = "SELECT * FROM lab_environment_product WHERE name LIKE '%" + product_name + "%' AND is_special = False;"
        cursor.execute(query)
        products = dictfetchall(cursor)  # Use the provided 'dictfetchall' function to fetch results
        
        # Get the product IDs from the vulnerable query
    product_pks = [product['id'] for product in products]

    # Then, use the Django ORM to fetch visible products (is_special=False)
    orm_products = Product.objects.filter(pk__in=product_pks, is_special=False)

    # Combine the ORM-based products with the results from the vulnerable query
    for product in products:
        
        product_orm = orm_products.filter(pk=product['id']).first()
        if product_orm:
            product['image'] = product_orm.image


    context = {
        'products': products,
        'selected_category': '',  # Set an empty selected_category for the filter form
    }
    return render(request, 'product_list.html', context)



def product_list(request):
    category = request.GET.get('category')
    product_name = request.GET.get('product_name', '')

    if category and category != 'all':
        # Filter products by both category and name
        products = Product.objects.filter(category=category, name__icontains=product_name, is_special=False)
    else:
        # Only filter by name, if provided
        products = Product.objects.filter(name__icontains=product_name, is_special=False)

    context = {
        'products': products,
        'selected_category': category,
    }
    return render(request, 'product_list.html', context)


def product_detail(request, pk):
    product = get_object_or_404(Product, pk=pk)
    return render(request, 'product_detail.html', {'product': product})
#lab 2


def lab_2(request):
    # Check if the login_success flag is set in the session
    login_success = request.session.get('login_success', False)

    if login_success:
        # If the user is logged in, retrieve all products including hidden ones (is_special=True)
        products = Product.objects.all()
    else:
        # If the user is not logged in, retrieve only non-hidden products (is_special=False)
        products = Product.objects.filter(is_special=False)

    context = {
        'products': products,
        'login_success': login_success,
    }
    return render(request, 'lab_2.html', context)




def lab_2_login(request):
    if request.method == 'POST':
        # Handle the login form submission here
        username = request.POST.get('username')
        password = request.POST.get('password')

        with connection.cursor() as cursor:
            # WARNING: This query is vulnerable to SQL injection and should NOT be used in a production environment.
            query = f"SELECT * FROM lab_environment_loginpassword WHERE username = '{username}' AND password = '{password}';"
            cursor.execute(query)
            user = cursor.fetchone()

        if user:
            # If login is successful, set login_success flag to True in the session
            request.session['login_success'] = True
            messages.success(request, 'Login successful as admin.')
            return redirect('lab_environment:lab_2')
        else:
            # If login fails, set login_error flag to True in the session
            request.session['login_error'] = True
            messages.error(request, 'Invalid username or password. Please try again.')

        return redirect('lab_environment:lab_2_login')

    # If it's a GET request, display the login form
    # Before displaying the login form, reset the login_success and login_error flags in the session
    request.session['login_success'] = False
    request.session['login_error'] = False

    return render(request, 'lab_2_login.html')



def dictfetchall(cursor):
    columns = [col[0] for col in cursor.description]
    return [dict(zip(columns, row)) for row in cursor.fetchall()]

#lab 3

def lab_3(request):
    products = Product.objects.filter(is_special=False)

    # Simply render the lab_3.html template and pass the 'products' variable to the template context
    return render(request, 'lab_3.html', {'products': products}, )
# ...

def admin_panel(request):
    # Fetch all fake users from the database
    fake_users = FakeUser.objects.all()

    # Fetch products with is_special=True from the database
    products = Product.objects.filter(is_special=True)

    if request.method == 'POST':
        # If a user is deleted, remove it from the database
        username_to_delete = request.POST.get('username_to_delete')
        try:
            user_to_delete = FakeUser.objects.filter(username=username_to_delete).first()
            if user_to_delete:
                user_to_delete.delete()
                messages.success(request, f'User "{username_to_delete}" has been deleted.')
                # Set a flag in the session to indicate that the lab is resolved
                request.session['lab_resolved'] = True
            else:
                messages.error(request, f'User "{username_to_delete}" does not exist.')
        except FakeUser.DoesNotExist:
            messages.error(request, f'User "{username_to_delete}" does not exist.')

    # Check if the lab_resolved flag is set in the session
    lab_resolved = request.session.get('lab_resolved', False)
    # Clear the lab_resolved flag from the session
    request.session.pop('lab_resolved', False)

    return render(request, 'admin_panel.html', {'fake_users': fake_users, 'lab_resolved': lab_resolved, 'products': products})


def robots_txt(request):
    # Load the robots.txt content from the template file
    content = ''
    try:
        with open('lab_environment/templates/robots.txt', 'r') as file:
            content = file.read()
    except FileNotFoundError:
        # If the robots.txt file is not found, return an empty response
        pass

    # Set the content type to 'text/plain'
    response = HttpResponse(content, content_type='text/plain')
    return response

# lab 4 



def lab_4(request):
    products = Product.objects.filter(is_special=False)
    success_message = None

    # Handle the search form submission
    search_query = request.GET.get('q', '')
    if search_query:
        # Check for XSS attack in the search query
        if '<script>' in search_query and '</script>' in search_query:
            success_message = "Congratulations! You solved the lab."

    return render(request, 'lab_4.html', {'products': products, 'success_message': success_message, 'search_query': escape(search_query)})

def lab4_search_view(request):
    if 'q' in request.GET:
        search_query = request.GET['q']
        # TODO: Perform the search and retrieve the search results 
        # For simplicity, we are not implementing actual search functionality in this example.
        # You can customize this view to perform the search and display relevant results.
        # Here, we will only check for the XSS attack in the search query.

        if '<script>' in search_query and '</script>' in search_query:
            return render(request, 'lab4_search_results.html')

    return render(request, 'lab_4.html', {'search_query': search_query})


#lab 5

def lab_5(request):
    products = Product.objects.filter(is_special=False)
    return render(request, 'lab_5.html', {'products': products})

def my_account(request):
    products = Product.objects.all()
    return render(request, 'my_account.html', {'products': products})

def login_with_2fa(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        try:
            Account5.objects.get(username=username, password=password)
        except Account5.DoesNotExist:
            return render(request, 'login_with_2fa.html', {'error_message': 'Invalid username or password'})

        request.session['username'] = username
        return redirect('lab_environment:two_factor_verification')

    return render(request, 'login_with_2fa.html')




def two_factor_verification(request):
    if request.method == 'POST':
        # Get the entered authentication code from the form
        authentication_code = request.POST.get('authentication_code')

        # Check if the entered authentication code is valid
        try:
            AuthenticationCode.objects.get(code=authentication_code)
        except AuthenticationCode.DoesNotExist:
            # Invalid code, display an error message
            return render(request, 'two_factor_verification.html', {'error_message': 'Invalid authentication code'})

        # If valid, set a flag in the session to indicate successful 2FA verification
        request.session['is_verified'] = True

        # Redirect to the "My Account" page using the namespace
        return redirect('lab_environment:my_account')

    # Check if the user has bypassed the 2FA code by navigating to "/my-account"
    if request.session.get('is_verified'):
        bypassed = True
    else:
        bypassed = False

    return render(request, 'two_factor_verification.html', {'bypassed': bypassed})

#static pages

def lab_1_page(request):
    return render(request, 'static_pages/lab1_page.html')

def lab_2_page(request):
    return render(request, 'static_pages/lab2_page.html')

def lab_3_page(request):
    return render(request, 'static_pages/lab3_page.html')

def lab_4_page(request):
    return render(request, 'static_pages/lab4_page.html')

def lab_5_page(request):
    return render(request, 'static_pages/lab5_page.html')


def all_labs(request):
    return render(request, 'all_labs.html')



def home(request):
    return render(request, 'home.html')



@login_required
def my_account(request):
    return render(request, 'my_account.html')



def sql_injection(request):
    return render(request, 'static_pages/sql_injection.html')

def access_control(request):
    return render(request, 'static_pages/access_control.html')

def xss(request):
    return render(request, 'static_pages/xss.html')

def click_jacking(request):
    return render(request, 'static_pages/jacking.html')

def auth_i(request):
    return render(request, 'static_pages/auth.html')
