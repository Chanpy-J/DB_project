# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.

from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import AbstractUser, AbstractBaseUser, BaseUserManager, UserManager
from django.core.validators import MaxValueValidator, MinValueValidator
from phonenumber_field.modelfields import PhoneNumberField


class City(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=35)  # Field name made lowercase.
    countrycode = models.ForeignKey('Country', models.DO_NOTHING, db_column='CountryCode')  # Field name made lowercase.
    district = models.CharField(db_column='District', max_length=20)  # Field name made lowercase.
    population = models.IntegerField(db_column='Population')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'city'


class Country(models.Model):
    code = models.CharField(db_column='Code', primary_key=True, max_length=3)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=52)  # Field name made lowercase.
    continent = models.CharField(db_column='Continent', max_length=13)  # Field name made lowercase.
    region = models.CharField(db_column='Region', max_length=26)  # Field name made lowercase.
    surfacearea = models.FloatField(db_column='SurfaceArea')  # Field name made lowercase.
    indepyear = models.SmallIntegerField(db_column='IndepYear', blank=True, null=True)  # Field name made lowercase.
    population = models.IntegerField(db_column='Population')  # Field name made lowercase.
    lifeexpectancy = models.FloatField(db_column='LifeExpectancy', blank=True, null=True)  # Field name made lowercase.
    gnp = models.FloatField(db_column='GNP', blank=True, null=True)  # Field name made lowercase.
    gnpold = models.FloatField(db_column='GNPOld', blank=True, null=True)  # Field name made lowercase.
    localname = models.CharField(db_column='LocalName', max_length=45)  # Field name made lowercase.
    governmentform = models.CharField(db_column='GovernmentForm', max_length=45)  # Field name made lowercase.
    headofstate = models.CharField(db_column='HeadOfState', max_length=60, blank=True, null=True)  # Field name made lowercase.
    capital = models.IntegerField(db_column='Capital', blank=True, null=True)  # Field name made lowercase.
    code2 = models.CharField(db_column='Code2', max_length=2)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'country'


class Countrylanguage(models.Model):
    countrycode = models.ForeignKey(Country, models.DO_NOTHING, db_column='CountryCode', primary_key=True)  # Field name made lowercase.
    language = models.CharField(db_column='Language', max_length=30)  # Field name made lowercase.
    isofficial = models.CharField(db_column='IsOfficial', max_length=1)  # Field name made lowercase.
    percentage = models.FloatField(db_column='Percentage')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'countrylanguage'
        unique_together = (('countrycode', 'language'),)

    def __unicode__(self):
        return ("country-code: %s language: %s") %(self.countrycode.name, self.language)

class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'

class MyCustomUserManager(BaseUserManager):
    def create_user(self, username, email_id, first_name, last_name, password=None):
        """
        Creates and saves a User with the given email and password.
        """
        if not email_id:
            raise ValueError('Users must have an email address')

        user = self.model(
            username = username,
            email=MyCustomUserManager.normalize_email(email_id),
            first_name=first_name,
            last_name=last_name
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, first_name, last_name=None):
        u = self.create_user(email_id=email, password=password, first_name=first_name, last_name=last_name)
        u.is_superuser = True
        u.is_staff = True
        u.save(using=self._db)
        return u

class User(AbstractUser):
    username = models.CharField(max_length=100, unique=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100, blank=True, null=True)
    # username = models.CharField(max_length=100, blank=True, null=True)
    # sex = models.CharField(max_length=100, default="female")
    # gender = models.CharField(max_length=100, default="female")
    email = models.CharField(max_length=100, primary_key=True)
    password = models.CharField(max_length=100)
    # phone_number = models.CharField(max_length=100, default="0000")

    objects = MyCustomUserManager()


    # USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["first_name"]




        
class YCL_Vehicle(models.Model):
    VIN=models.CharField(db_column='VIN', primary_key=True, max_length=10)
    LPN = models.IntegerField(db_column='LPN',validators=[MaxValueValidator(9999999999)])    
    make = models.CharField(db_column='make', max_length=10)  
    model = models.CharField(db_column='model', max_length=10) 
    year = models.IntegerField(db_column='year', validators=[MaxValueValidator(9999)])   
    classs = models.ForeignKey('YCL_RENTALRATE', models.DO_NOTHING, db_column='class') 
    class Meta:
        managed = False
        db_table = 'YCL_VEHICLE'

class YCL_RENTALRATE(models.Model):
    classs=models.CharField(db_column='class', primary_key=True, max_length=20)
    fee_for_over = models.IntegerField(db_column='fee_for_over', validators=[MaxValueValidator(99999)])     
    rentalrate = models.IntegerField(db_column='rentalrate', validators=[MaxValueValidator(99999)])
    class Meta:
        managed = False
        db_table = 'YCL_RENTALRATE'

class YCL_CUSTOMER(models.Model):
    customer_id=models.IntegerField(db_column='customer_id', primary_key=True,validators=[MaxValueValidator(9999999999)])   
    type = models.CharField(db_column='type', max_length=1)  
    email = models.CharField(db_column='email', max_length=30) 
    phone_number = models.CharField(db_column='phone_number', max_length=15) 
    ad_city = models.CharField(db_column='ad_city', max_length=10) 
    ad_street = models.CharField(db_column='ad_street', max_length=20) 
    ad_country = models.CharField(db_column='ad_country', max_length=15) 
    ad_zipcode = models.IntegerField(db_column='ad_zipcode', validators=[MaxValueValidator(9999999999)])  
    class Meta:
        managed = False
        db_table = 'YCL_CUSTOMER' 

class YCL_NEIGHBORHOOD(models.Model):
    neighborhood_id=models.IntegerField(db_column='neighborhood_id', primary_key=True, validators=[MaxValueValidator(99999)])
    neighborhood_firstname = models.CharField(db_column='neighborhood_firstname', max_length=10)
    neighborhood_lasttname = models.CharField(db_column='neighborhood_lasttname', max_length=10)  
    driver_lisence_num = models.ForeignKey('YCL_IND_INS', models.DO_NOTHING, db_column='driver_license_num') 
    class Meta:
        managed = False
        db_table = 'YCL_RENTALRATE'

class YCL_INDIVIDUAL(models.Model):
    customer_id = models.ForeignKey('YCL_CUSTOMER', models.DO_NOTHING, db_column='customer_id',primary_key=True)
    FNAME=models.CharField(db_column='FNAME', primary_key=True, max_length=10)
    LNAME=models.CharField(db_column='LNAME', primary_key=True, max_length=10)
    driver_license_num = models.IntegerField(db_column='diver_license_num', unique=True,validators=[MaxValueValidator(9999999999)])
    class Meta:
        managed = False
        db_table = 'YCL_INDIVIDUAL'

class YCL_IND_INS(models.Model):
    driver_license_num = models.ForeignKey('YCL_INDIVIDUAL', models.DO_NOTHING, db_column='driver_license_num',primary_key=True)
    insurance_policy_no = models.ForeignKey('YCL_INSURANCE', models.DO_NOTHING, db_column='insurance_policy_no',primary_key=True)
    class Meta:
        managed = False
        db_table = 'YCL_IND_INS'

class YCL_COUPON(models.Model):
    start_date=models.DateField(db_column='start_date',null=True)
    end_date=models.DateField(db_column='end_date', null=True)
    coupon_id = models.IntegerField(db_column='coupon_id', primary_key=True, validators=[MaxValueValidator(9999999999)])   
    percentage = models.IntegerField(db_column='percentage', validators=[MaxValueValidator(999)])      
    driver_license_num = models.ForeignKey('YCL_INDIVIDUAL', models.DO_NOTHING, db_column='driver_license_num',null=True)
    neighborhood_id = models.ForeignKey('YCL_NEIGHBORHOOD', models.DO_NOTHING, db_column='neighborhood_id',null=True)
    reg_num = models.ForeignKey('YCL_CORPORATE', models.DO_NOTHING, db_column='reg_num',null=True)
    class Meta:
        managed = False
        db_table = 'YCL_COUPON'

class YCL_CORPORATE(models.Model):
    customer_id = models.ForeignKey('YCL_CUSTOMER', models.DO_NOTHING, db_column='custome_id',primary_key=True)
    reg_num = models.IntegerField(db_column='reg_num',unique=True, validators=[MaxValueValidator(99999999999999999999)])    
    detail_of_name = models.CharField(db_column='detail_of_name', max_length=15)
    class Meta:
        managed = False
        db_table = 'YCL_CORPORATE'

class YCL_LOCATION(models.Model):
    city=models.CharField(db_column='city',  max_length=10)
    street=models.CharField(db_column='street',  max_length=20)
    zipcode = models.IntegerField(db_column='zipcode',validators=[MaxValueValidator(9999999999)]) 
    country=models.CharField(db_column='country',  max_length=15)
    phone_number=models.CharField(db_column='phone_number',  max_length=15)           
    location_id = models.IntegerField(db_column='location_id',primary_key=True, validators=[MaxValueValidator(9999)])   
    class Meta:
        managed = False
        db_table = 'YCL_LOCATION'

class YCL_SERVICE(models.Model):
    pickup_date=models.DateField(db_column='piclup_date')
    dropoff_date=models.DateField(db_column='dropoff_date')
    start_odometer=models.DecimalField(max_digits = 10,decimal_places = 3)
    end_odometer=models.DecimalField(max_digits = 10,decimal_places = 3)
    odometer_limit=models.DecimalField(max_digits = 5,decimal_places = 2,null=True)
    customer_id= models.ForeignKey('YCL_CUSTOMER', models.DO_NOTHING, db_column='custome_id',null=True)
    VIN= models.ForeignKey('YCL_VEHICLE', models.DO_NOTHING, db_column='VIN',null=True)
    classs= models.ForeignKey('YCL_RENTALRATE', models.DO_NOTHING, db_column='class')
    service_id = models.IntegerField(db_column='service_id',primary_key=True, validators=[MaxValueValidator(99999)])
    invoice_date = models.DateField(db_column='invoice_date')
    #pickloc_id = models.ForeignKey('YCL_LOCATION', models.DO_NOTHING, db_column='pickloc_id') 
    #droploc_id = models.ForeignKey('YCL_LOCATION', models.DO_NOTHING, db_column='droploc_id')
    pickloc_id = models.IntegerField(db_column='pickloc_id', validators=[MaxValueValidator(9999)])
    droploc_id = models.IntegerField(db_column='droploc_id', validators=[MaxValueValidator(9999)])
    coupon_id = models.ForeignKey('YCL_COUPON', models.DO_NOTHING, db_column='coupon_id')  

    class Meta:
        managed = False
        db_table = 'YCL_SERVICE'

class YCL_PAYMENT(models.Model):
    payment_type=models.CharField(db_column='payment_type', primary_key=True, max_length=1)          
    service_id = models.ForeignKey('YCL_SERVICE', models.DO_NOTHING, db_column='service',primary_key=True) 
    class Meta:
        managed = False
        db_table = 'YCL_PAYMENT'

class YCL_CREDITCARD(models.Model):
    payment_type=models.ForeignKey('YCL_PAYMENT', models.DO_NOTHING, db_column='payment_type',primary_key=True) 
    service_id = models.ForeignKey('YCL_SERVICE', models.DO_NOTHING, db_column='service_id',primary_key=True)
    creditcard_no = models.IntegerField(db_column='creditcard_no', validators=[MaxValueValidator(999999999999999)]) 
    class Meta:
        managed = False
        db_table = 'YCL_CREDITCARD'

class YCL_GIFTCARD(models.Model):
    payment_type=models.ForeignKey('YCL_PAYMENT', models.DO_NOTHING, db_column='payment_type',primary_key=True)
    service_id = models.ForeignKey('YCL_SERVICE', models.DO_NOTHING, db_column='service_id',primary_key=True) 
    giftcard_no=models.IntegerField(db_column='giftcard_no', validators=[MaxValueValidator(9999999999)])
    class Meta:
        managed = False
        db_table = 'YCL_GIFTCARD'

class YCL_DEBITCARD(models.Model):
    payment_type=models.ForeignKey('YCL_PAYMENT', models.DO_NOTHING, db_column='payment_type',primary_key=True)
    service_id = models.ForeignKey('YCL_SERVICE', models.DO_NOTHING, db_column='service_id',primary_key=True) 
    debitcard_no=models.IntegerField(db_column='debitcard_no', validators=[MaxValueValidator(9999999999999999)])
    class Meta:
        managed = False
        db_table = 'YCL_DEBITCARD'

class YCL_EMPLOYEE(models.Model):
    employee_id=models.IntegerField(db_column='employee_id',primary_key=True,validators=[MaxValueValidator(99999)])    
    employee_firstname = models.CharField(db_column='employee_firstname', max_length=10)
    employee_lasttname = models.CharField(db_column='employee_lastname', max_length=10)   
    reg_num = models.ForeignKey('YCL_CORPORATE', models.DO_NOTHING, db_column='reg_num') 
    class Meta:
        managed = False
        db_table = 'YCL_EMPLOYEE'

class YCL_INSURANCE(models.Model):
    insurance_policy_no=models.IntegerField(db_column='insurance_policy_no',primary_key=True,validators=[MaxValueValidator(9999999999)])    
    insurance_company = models.CharField(db_column='insurance_company', max_length=10)
    class Meta:
        managed = False
        db_table = 'YCL_INSURANCE'

