from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework import routers
from django.conf import settings  # Import the settings module
from django.conf.urls.static import static  # Import the static function
from .views import LabTopicViewSet, ChallengeViewSet, UserViewSet, product_list, product_detail, search_products, filter_products, lab_2, lab_2_login 
from . import views
from django.conf.urls.static import static

router = DefaultRouter()
router.register(r'lab_topics', LabTopicViewSet)
router.register(r'challenges', ChallengeViewSet)
router.register(r'users', UserViewSet)

app_name = 'lab_environment'  # Define the app namespace



urlpatterns = [
    # Other URL patterns from the router
    path('products/', product_list, name='product-list'),
    path('products/<int:pk>/', product_detail, name='product_detail'),
    path('search-products/', search_products, name='search-products'),
    path('filter-products/', filter_products, name='filter-products'),  
    path('lab_2/', lab_2, name='lab_2'),
    path('lab_2/login/', lab_2_login, name='lab_2_login'),
    path('lab_3/', views.lab_3, name='lab_3'),
    path('lab_3/administrator-panel/', views.admin_panel, name='admin_panel'),
    path('lab_3/robots.txt', views.robots_txt, name='robots_txt'),
    path('lab_4/', views.lab_4, name='lab_4'),
    path('lab_4/search/', views.lab4_search_view, name='lab4_search_view'),
    path('lab_5/', views.lab_5, name='lab_5'),
    path('lab_5/login/', views.login_with_2fa, name='lab_login_2fa'),
    path('lab_5/login/verification/', views.two_factor_verification, name='two_factor_verification'),
    path('lab_5/login/my-account/', views.my_account, name='my_account'), 
    path('lab_1_page/', views.lab_1_page, name='lab_1_page'),  # Static page for Lab 1
    path('lab_2_page/', views.lab_2_page, name='lab_2_page'),  # Static page for Lab 2
    path('lab_3_page/', views.lab_3_page, name='lab_3_page'),  # Static page for Lab 3
    path('lab_4_page/', views.lab_4_page, name='lab_4_page'),  # Static page for Lab 4
    path('lab_5_page/', views.lab_5_page, name='lab_5_page'),  # Static page for Lab 5 
    path('all-labs/', views.all_labs, name='all_labs'),
    path('', views.home, name='home'),
    path('my-account/', views.my_account, name='my-account'),  # Add this line
    path('sql_injection/', views.sql_injection, name='sql_injection'),
    path('xss/', views.xss, name='xss'),
    path('access_control/', views.access_control, name='access_control'),
    path('jacking/', views.click_jacking, name='jacking'),
    path('auth/', views.auth_i, name='auth'),

    


]




# Add this at the end of the file to serve media files during development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
