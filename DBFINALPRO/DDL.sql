/*********invoice table*********/
CREATE TABLE YCL_INVOICE(
service_id INT NOT NULL,
invoice_date DATETIME,
invoice_amount BIGINT
);
ALTER TABLE YCL_INVOICE ADD CONSTRAINT YCL_INVOICE_pkv1 PRIMARY KEY ( service_id );

CREATE TABLE ycl_corporate (
customer_id BIGINT NOT NULL COMMENT 'customer_id is primary for customer entity. it should be unique',
reg_num DECIMAL(20) NOT NULL COMMENT 'corporate registration number. Because it is unique for this entity, we take this attribute as primary key.',
detail_of_name VARCHAR(15) NOT NULL COMMENT 'corporate''s name'
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_corporate.customer_id IS
'customer_id is primary for customer entity. it should be unique'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_corporate.reg_num IS
'corporate registration number. Because it is unique for this entity, we take this attribute as primary key.'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_corporate.detail_of_name IS
'corporate''s name'; */
ALTER TABLE ycl_corporate ADD CONSTRAINT ycl_corporate_pk PRIMARY KEY ( customer_id );
ALTER TABLE ycl_corporate ADD CONSTRAINT ycl_corporate_pkv1 UNIQUE ( reg_num );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_coupon (
start_date DATETIME COMMENT 'coupon valid start date, if it is corporate customer it will be NULL',
end_date DATETIME COMMENT 'coupon valid end date, if it is corporate customer it will be NULL',
coupon_id BIGINT NOT NULL COMMENT 'the id of coupon as the primary in coupon entity',
percentage SMALLINT NOT NULL COMMENT 'discount percentage in % scale',
driver_license_num BIGINT,
neighborhood_id INT,
reg_num DECIMAL(20)
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_coupon.start_date IS
'coupon valid start date, if it is corporate customer it will be NULL'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_coupon.end_date IS
'coupon valid end date, if it is corporate customer it will be NULL'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_coupon.coupon_id IS
'the id of coupon as the primary in coupon entity'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_coupon.percentage IS
'discount percentage in % scale'; */
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE UNIQUE INDEX ycl_coupon__idx ON
ycl_coupon (
reg_num
ASC );
ALTER TABLE ycl_coupon ADD CONSTRAINT ycl_coupon_pk PRIMARY KEY ( coupon_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_creditcard (
payment_type VARCHAR(1) NOT NULL COMMENT 'the type customer pay',
service_id INT NOT NULL,
creditcard_no BIGINT NOT NULL COMMENT 'the number of credit card'
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_creditcard.payment_type IS
'the type customer pay'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_creditcard.creditcard_no IS
'the number of credit card'; */
ALTER TABLE ycl_creditcard ADD CONSTRAINT ycl_creditcard_pk PRIMARY KEY ( payment_type,
service_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_customer (
customer_id BIGINT NOT NULL COMMENT 'customer_id is primary for customer entity. it should be unique',
type VARCHAR(1) NOT NULL COMMENT 'I for idividual C for corporate as the discriminator',
email VARCHAR(30) NOT NULL COMMENT 'email of customer',
phone_number VARCHAR(15) NOT NULL COMMENT 'phone_number of customer',
ad_city VARCHAR(10) NOT NULL COMMENT 'the city of customer''s address',
ad_street VARCHAR(20) NOT NULL COMMENT 'the street of customer''s address',
ad_country VARCHAR(15) NOT NULL COMMENT 'the country of customer''s address',
ad_zipcode BIGINT NOT NULL COMMENT 'zipcode of the customer address'
);
ALTER TABLE ycl_customer
ADD CONSTRAINT ch_inh_ycl_customer CHECK ( type IN ( 'C', 'I' ) );
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_customer.customer_id IS
'customer_id is primary for customer entity. it should be unique'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_customer.type IS
'I for idividual C for corporate as the discriminator'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_customer.email IS
'email of customer'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_customer.phone_number IS
'phone_number of customer'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_customer.ad_city IS
'the city of customer''s address'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_customer.ad_street IS
'the street of customer''s address'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_customer.ad_country IS
'the country of customer''s address'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_customer.ad_zipcode IS
'zipcode of the customer address'; */
ALTER TABLE ycl_customer ADD CONSTRAINT ycl_customer_pk PRIMARY KEY ( customer_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_debitcard (
payment_type VARCHAR(1) NOT NULL COMMENT 'the type customer pay',
service_id INT NOT NULL,
debitcard_no BIGINT NOT NULL COMMENT 'the number of debitcard'
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_debitcard.payment_type IS
'the type customer pay'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_debitcard.debitcard_no IS
'the number of debitcard'; */
ALTER TABLE ycl_debitcard ADD CONSTRAINT ycl_debitcard_pk PRIMARY KEY ( payment_type,
service_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_employee (
employee_id INT NOT NULL COMMENT 'corporate employee id as primary key in emplyee entity',
employee_firstname VARCHAR(10) NOT NULL COMMENT 'corporate employee first name',
reg_num DECIMAL(20) NOT NULL COMMENT 'corporate registration number(FK)',
employee_lastname VARCHAR(10) NOT NULL COMMENT 'corporate employee last name'
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_employee.employee_id IS
'corporate employee id as primary key in emplyee entity'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_employee.employee_firstname IS
'corporate employee first name'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_employee.reg_num IS
'corporate registration number(FK)'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_employee.employee_lastname IS
'corporate employee last name'; */
ALTER TABLE ycl_employee ADD CONSTRAINT ycl_employee_pk PRIMARY KEY ( employee_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_giftcard (
payment_type VARCHAR(1) NOT NULL COMMENT 'the type customer pay',
service_id INT NOT NULL,
giftcard_no BIGINT NOT NULL COMMENT 'the number of giftcard'
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_giftcard.payment_type IS
'the type customer pay'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_giftcard.giftcard_no IS
'the number of giftcard'; */
ALTER TABLE ycl_giftcard ADD CONSTRAINT ycl_giftcard_pk PRIMARY KEY ( payment_type,
service_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_ind_ins (
driver_license_num BIGINT NOT NULL,
insurance_policy_no BIGINT NOT NULL
);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_individual (
customer_id BIGINT NOT NULL COMMENT 'customer_id is primary for customer entity. it should be unique',
fname VARCHAR(10) NOT NULL COMMENT 'first_name of the indivual cusitomer',
lname VARCHAR(10) NOT NULL COMMENT 'last_name of the individual customer',
driver_license_num BIGINT NOT NULL COMMENT 'driver_lisence_num is unique as the primary key in individual entity'
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_individual.customer_id IS
'customer_id is primary for customer entity. it should be unique'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_individual.fname IS
'first_name of the indivual cusitomer'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_individual.lname IS
'last_name of the individual customer'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_individual.driver_license_num IS
'driver_lisence_num is unique as the primary key in individual entity'; */
ALTER TABLE ycl_individual ADD CONSTRAINT ycl_individual_pk PRIMARY KEY ( customer_id );
ALTER TABLE ycl_individual ADD CONSTRAINT ycl_individual_pkv1 UNIQUE ( driver_license_num );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_insurance (
insurance_policy_no BIGINT NOT NULL COMMENT 'the policy number of insurance is the unique as primary key in insurance entity',
insurance_company VARCHAR(10) NOT NULL COMMENT 'the name of the company giving insurance to individual customer'
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_insurance.insurance_policy_no IS
'the policy number of insurance is the unique as primary key in insurance entity'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_insurance.insurance_company IS
'the name of the company giving insurance to individual customer'; */
ALTER TABLE ycl_insurance ADD CONSTRAINT ycl_insurance_pk PRIMARY KEY ( insurance_policy_no );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_location (
city VARCHAR(10) NOT NULL COMMENT 'the city of the location',
street VARCHAR(20) NOT NULL COMMENT 'the street of the loction',
zipcode BIGINT NOT NULL COMMENT 'zipcode of the loction',
country VARCHAR(15) NOT NULL COMMENT 'country of location',
phone_number VARCHAR(15) NOT NULL COMMENT 'phone number of that location',
location_id SMALLINT NOT NULL COMMENT 'the id of the location'
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_location.city IS
'the city of the location'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_location.street IS
'the street of the loction'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_location.zipcode IS
'zipcode of the loction'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_location.country IS
'country of location'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_location.phone_number IS
'phone number of that location'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_location.location_id IS
'the id of the location'; */
ALTER TABLE ycl_location ADD CONSTRAINT ycl_location_pk PRIMARY KEY ( location_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_neighborhood (
neighborhood_id INT NOT NULL COMMENT 'neighborhood_id as the primary key in neighborhood entity. it''s unique',
neighborhood_firstname VARCHAR(10) NOT NULL COMMENT 'neighborhood_firstname',
neighborhood_lastname VARCHAR(10) NOT NULL COMMENT 'neighborhood_lastname',
driver_license_num BIGINT
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_neighborhood.neighborhood_id IS
'neighborhood_id as the primary key in neighborhood entity. it''s unique'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_neighborhood.neighborhood_firstname IS
'neighborhood_firstname'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_neighborhood.neighborhood_lastname IS
'neighborhood_lastname'; */
ALTER TABLE ycl_neighborhood ADD CONSTRAINT ycl_neighborhood_pk PRIMARY KEY ( neighborhood_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_payment (
payment_type VARCHAR(1) NOT NULL COMMENT 'the type customer pay',
service_id INT NOT NULL
);
ALTER TABLE ycl_payment
ADD CONSTRAINT ch_inh_ycl_payment CHECK ( payment_type IN ( 'C', 'D', 'G' ) );
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_payment.payment_type IS
'the type customer pay'; */
ALTER TABLE ycl_payment ADD CONSTRAINT ycl_payment_pk PRIMARY KEY ( payment_type,
service_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_rentalrate (
class VARCHAR(20) NOT NULL COMMENT 'class of vehicle, as the primary key in rentalrate entity. It can indentitfy the fee by the class.',
fee_for_over INT NOT NULL COMMENT 'over fee each mile for different class. in USD',
rentalrate INT NOT NULL COMMENT 'the service rate of a day. in USD'
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_rentalrate.class IS
'class of vehicle, as the primary key in rentalrate entity. It can indentitfy the fee by the class.'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_rentalrate.fee_for_over IS
'over fee each mile for different class. in USD'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_rentalrate.rentalrate IS
'the service rate of a day. in USD'; */
ALTER TABLE ycl_rentalrate ADD CONSTRAINT ycl_rentalrate_pk PRIMARY KEY ( class );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_service (
pickup_date DATETIME NOT NULL COMMENT 'vehicle pickup date',
dropoff_date DATETIME NOT NULL COMMENT 'vehicle dropoff date',
start_odometer DECIMAL(10, 3) NOT NULL COMMENT 'vehicle odometer start',
end_odometer DECIMAL(10, 3) NOT NULL COMMENT 'vehicle odometer end',
odometer_limit DECIMAL(10, 3) COMMENT 'extra charge if exceed this limit. optional because no limit situation',
customer_id BIGINT COMMENT 'customer_id(FK)',
vin BIGINT COMMENT 'Vehicle Identification Number(FK)',
class VARCHAR(20) NOT NULL COMMENT 'vehicle class(FK)',
service_id INT NOT NULL COMMENT 'Service_id as the primary key in service entity. should be unique',
invoice_date DATETIME NOT NULL COMMENT 'the date of generating invoice',
pickloc_id SMALLINT COMMENT 'pickup location id is the foreign key from location entity',
droploc_id SMALLINT COMMENT 'dropoff location id is the foreign key from location entity',
coupon_id BIGINT
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.pickup_date IS
'vehicle pickup date'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.dropoff_date IS
'vehicle dropoff date'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.start_odometer IS
'vehicle odometer start'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.end_odometer IS
'vehicle odometer end'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.odometer_limit IS
'extra charge if exceed this limit. optional because no limit situation'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.customer_id IS
'customer_id(FK)'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.vin IS
'Vehicle Identification Number(FK)'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.class IS
'vehicle class(FK)'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.service_id IS
'Service_id as the primary key in service entity. should be unique'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.invoice_date IS
'the date of generating invoice'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.pickloc_id IS
'pickup location id is the foreign key from location entity'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_service.droploc_id IS
'dropoff location id is the foreign key from location entity'; */
ALTER TABLE ycl_service ADD CONSTRAINT ycl_service_pk PRIMARY KEY ( service_id );
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ycl_vehicle (
vin BIGINT NOT NULL COMMENT 'vehicle identification number, primary key of vehicle entity',
lpn BIGINT NOT NULL COMMENT 'license plate nmber, should be unique',
make VARCHAR(10) NOT NULL COMMENT 'it''s brand of the vehicle. ',
model VARCHAR(10) NOT NULL COMMENT 'the model of vehicle',
year SMALLINT NOT NULL COMMENT 'the make year of the vehicle',
class VARCHAR(20) NOT NULL
);
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_vehicle.vin IS
'vehicle identification number, primary key of vehicle entity'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_vehicle.lpn IS
'license plate nmber, should be unique'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_vehicle.make IS
'it''s brand of the vehicle. '; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_vehicle.model IS
'the model of vehicle'; */
/* Moved to CREATE TABLE
COMMENT ON COLUMN ycl_vehicle.year IS
'the make year of the vehicle'; */
ALTER TABLE ycl_vehicle ADD CONSTRAINT ycl_vehicle_pk PRIMARY KEY ( vin );
ALTER TABLE ycl_neighborhood
ADD CONSTRAINT neighborhood_individual_fk FOREIGN KEY ( driver_license_num )
REFERENCES ycl_individual ( driver_license_num );
ALTER TABLE ycl_vehicle
ADD CONSTRAINT vehicle_rentalrate_fk FOREIGN KEY ( class )
REFERENCES ycl_rentalrate ( class );
ALTER TABLE ycl_corporate
ADD CONSTRAINT ycl_corporate_ycl_customer_fk FOREIGN KEY ( customer_id )
REFERENCES ycl_customer ( customer_id );
ALTER TABLE ycl_coupon
ADD CONSTRAINT ycl_coupon_ycl_corporate_fk FOREIGN KEY ( reg_num )
REFERENCES ycl_corporate ( reg_num );
ALTER TABLE ycl_coupon
ADD CONSTRAINT ycl_coupon_ycl_individual_fk FOREIGN KEY ( driver_license_num )
REFERENCES ycl_individual ( driver_license_num );
ALTER TABLE ycl_coupon
ADD CONSTRAINT ycl_coupon_ycl_neighborhood_fk FOREIGN KEY ( neighborhood_id )
REFERENCES ycl_neighborhood ( neighborhood_id );
ALTER TABLE ycl_creditcard
ADD CONSTRAINT ycl_creditcard_ycl_payment_fk FOREIGN KEY ( payment_type,
service_id )
REFERENCES ycl_payment ( payment_type,
service_id );
ALTER TABLE ycl_debitcard
ADD CONSTRAINT ycl_debitcard_ycl_payment_fk FOREIGN KEY ( payment_type,
service_id )
REFERENCES ycl_payment ( payment_type,
service_id );
ALTER TABLE ycl_employee
ADD CONSTRAINT ycl_employee_ycl_corporate_fk FOREIGN KEY ( reg_num )
REFERENCES ycl_corporate ( reg_num );
ALTER TABLE ycl_giftcard
ADD CONSTRAINT ycl_giftcard_ycl_payment_fk FOREIGN KEY ( payment_type,
service_id )
REFERENCES ycl_payment ( payment_type,
service_id );
ALTER TABLE ycl_ind_ins
ADD CONSTRAINT ycl_ind_ins_ycl_individual_fk FOREIGN KEY ( driver_license_num )
REFERENCES ycl_individual ( driver_license_num );
ALTER TABLE ycl_ind_ins
ADD CONSTRAINT ycl_ind_ins_ycl_insurance_fk FOREIGN KEY ( insurance_policy_no )
REFERENCES ycl_insurance ( insurance_policy_no );
ALTER TABLE ycl_individual
ADD CONSTRAINT ycl_individual_ycl_customer_fk FOREIGN KEY ( customer_id )
REFERENCES ycl_customer ( customer_id );
ALTER TABLE ycl_payment
ADD CONSTRAINT ycl_payment_ycl_service_fk FOREIGN KEY ( service_id )
REFERENCES ycl_service ( service_id );
ALTER TABLE ycl_service
ADD CONSTRAINT ycl_service_ycl_coupon_fk FOREIGN KEY ( coupon_id )
REFERENCES ycl_coupon ( coupon_id );
ALTER TABLE ycl_service
ADD CONSTRAINT ycl_service_ycl_customer_fk FOREIGN KEY ( customer_id )
REFERENCES ycl_customer ( customer_id );
ALTER TABLE ycl_service
ADD CONSTRAINT ycl_service_ycl_location_fk FOREIGN KEY ( pickloc_id )
REFERENCES ycl_location ( location_id );
ALTER TABLE ycl_service
ADD CONSTRAINT ycl_service_ycl_location_fkv2 FOREIGN KEY ( droploc_id )
REFERENCES ycl_location ( location_id );
ALTER TABLE ycl_service
ADD CONSTRAINT ycl_service_ycl_rentalrate_fk FOREIGN KEY ( class )
REFERENCES ycl_rentalrate ( class );
ALTER TABLE ycl_service
ADD CONSTRAINT ycl_service_ycl_vehicle_fk FOREIGN KEY ( vin )
REFERENCES ycl_vehicle ( vin );

DELIMITER $$

CREATE /*OR REPLACE*/ TRIGGER arc_fkarc_3_ycl_corporate BEFORE
INSERT /*OR UPDATE OF customer_id*/ ON ycl_corporate
FOR EACH ROW
/*DECLARE d VARCHAR(1);*/
BEGIN
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DECLARE d VARCHAR(1) ;
SET d = (SELECT a.type FROM ycl_customer a WHERE a.customer_id = new.customer_id) ;
/*SELECT
a.type
INTO d
FROM
ycl_customer a
WHERE
a.customer_id = :new.customer_id;*/

IF ( d IS NULL OR d <> 'C' ) THEN
SIGNAL SQLSTATE /*'-20223'*/ '72000' SET MESSAGE_TEXT = 'FK YCL_CORPORATE_YCL_CUSTOMER_FK in Table YCL_CORPORATE violates Arc constraint on Table YCL_CUSTOMER - discriminator column type doesn''t have value ''C''';
/*raise_application_error(
-20223,
'FK YCL_CORPORATE_YCL_CUSTOMER_FK in Table YCL_CORPORATE violates Arc constraint on Table YCL_CUSTOMER - discriminator column type doesn''t have value ''C'''
);*/
END IF;
/*DECLARE EXIT HANDLER FOR not found 
BEGIN
NULL;
END;*/
/*DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN
RESIGNAL;
END;*/
END
$$

DELIMITER $$

CREATE /*OR REPLACE*/ TRIGGER arc_fkarc_3_ycl_individual BEFORE
INSERT /*OR UPDATE OF customer_id*/ ON ycl_individual
FOR EACH ROW

BEGIN
DECLARE d VARCHAR(1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT
a.type
INTO d
FROM
ycl_customer a
WHERE
a.customer_id = new.customer_id;
IF ( d IS NULL OR d <> 'I' ) THEN
SIGNAL SQLSTATE /*'-20223'*/ '72000' SET MESSAGE_TEXT = 'FK YCL_INDIVIDUAL_YCL_CUSTOMER_FK in Table YCL_INDIVIDUAL violates Arc constraint on Table YCL_CUSTOMER - discriminator column type doesn''t have value ''I''';

/*raise_application_error(
-20223,
'FK YCL_INDIVIDUAL_YCL_CUSTOMER_FK in Table YCL_INDIVIDUAL violates Arc constraint on Table YCL_CUSTOMER - discriminator column type doesn''t have value ''I'''
);*/
END IF;
/*DECLARE EXIT HANDLER FOR not found 
BEGIN
NULL;
END;
DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
RESIGNAL;
END;*/
END
$$

DELIMITER $$
CREATE /*OR REPLACE*/ TRIGGER arc_fkarc_4_ycl_creditcard BEFORE
INSERT /*OR UPDATE OF payment_type, service_id*/ ON ycl_creditcard
FOR EACH ROW

BEGIN
DECLARE d VARCHAR(1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT
a.payment_type
INTO d
FROM
ycl_payment a
WHERE
a.payment_type = new.payment_type
AND a.service_id = new.service_id;
IF ( d IS NULL OR d <> 'C' ) THEN
SIGNAL SQLSTATE /*'-20223'*/ '72000' SET MESSAGE_TEXT = 'FK YCL_CREDITCARD_YCL_PAYMENT_FK in Table YCL_CREDITCARD violates Arc constraint on Table YCL_PAYMENT - discriminator column payment_type doesn''t have value ''C''';

/*raise_application_error(
-20223,
'FK YCL_CREDITCARD_YCL_PAYMENT_FK in Table YCL_CREDITCARD violates Arc constraint on Table YCL_PAYMENT - discriminator column payment_type doesn''t have value ''C'''
);*/
END IF;
/*DECLARE EXIT HANDLER FOR not found BEGIN
NULL;
END;
DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
RESIGNAL;
END;*/
END
$$

DELIMITER $$
CREATE /*OR REPLACE*/ TRIGGER arc_fkarc_4_ycl_giftcard BEFORE
INSERT /*OR UPDATE OF payment_type, service_id*/ ON ycl_giftcard
FOR EACH ROW

BEGIN
DECLARE d VARCHAR(1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT
a.payment_type
INTO d
FROM
ycl_payment a
WHERE
a.payment_type = new.payment_type
AND a.service_id = new.service_id;
IF ( d IS NULL OR d <> 'G' ) THEN
SIGNAL SQLSTATE /*'-20223'*/ '72000' SET MESSAGE_TEXT = 'FK YCL_GIFTCARD_YCL_PAYMENT_FK in Table YCL_GIFTCARD violates Arc constraint on Table YCL_PAYMENT - discriminator column payment_type doesn''t have value ''G''';

/*raise_application_error(
-20223,
'FK YCL_GIFTCARD_YCL_PAYMENT_FK in Table YCL_GIFTCARD violates Arc constraint on Table YCL_PAYMENT - discriminator column payment_type doesn''t have value ''G'''
);*/
END IF;
/*DECLARE EXIT HANDLER FOR not found BEGIN
NULL;
END;
DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
RESIGNAL;
END;*/
END
$$

DELIMITER $$
CREATE /*OR REPLACE*/ TRIGGER arc_fkarc_4_ycl_debitcard BEFORE
INSERT /*OR UPDATE OF payment_type, service_id*/ ON ycl_debitcard
FOR EACH ROW

BEGIN
DECLARE d VARCHAR(1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT
a.payment_type
INTO d
FROM
ycl_payment a
WHERE
a.payment_type = new.payment_type
AND a.service_id = new.service_id;
IF ( d IS NULL OR d <> 'D' ) THEN
SIGNAL SQLSTATE /*'-20223'*/ '72000' SET MESSAGE_TEXT = 'FK YCL_DEBITCARD_YCL_PAYMENT_FK in Table YCL_DEBITCARD violates Arc constraint on Table YCL_PAYMENT - discriminator column payment_type doesn''t have value ''D''';

/*raise_application_error(
-20223,
'FK YCL_DEBITCARD_YCL_PAYMENT_FK in Table YCL_DEBITCARD violates Arc constraint on Table YCL_PAYMENT - discriminator column payment_type doesn''t have value ''D'''
);*/
END IF;
/*DECLARE EXIT HANDLER FOR not found BEGIN
NULL;
END;
DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
RESIGNAL;
END;*/
END
$$

/**********SELF DESIGN TRIGGER**************/
-- SQLINES LICENSE FOR EVALUATION USE ONLY
/*CREATE TABLE YCL_INVOICE(
invoice_date DATETIME,
invoice_amount BIGINT
);*/

DELIMITER $$
create /*or replace*/ trigger YCL_INVOICE_TRIGGER
after insert /*or update*/
on YCL_SERVICE
for each row
begin
if (new.coupon_id is null) then
if ((new.end_odometer - new.start_odometer) > new.odometer_limit) then
insert into YCL_INVOICE
values (new.service_id, new.invoice_date,
(select rentalrate from YCL_RENTALRATE
where class = (select class from YCL_VEHICLE where VIN = new.VIN)) *
(new.dropoff_date - new.pickup_date + 1) +
(select fee_for_over from YCL_RENTALRATE where class = (select class from YCL_VEHICLE where VIN = new.VIN)) *
(new.end_odometer - new.start_odometer - new.odometer_limit)
);
else
insert into YCL_INVOICE
values (new.service_id, new.invoice_date,
(select rentalrate from YCL_RENTALRATE where class = (select class from YCL_VEHICLE where VIN = new.VIN)) *
(new.dropoff_date - new.pickup_date + 1)
);
end if;
else
if ((new.end_odometer - new.start_odometer) > new.odometer_limit) then
insert into YCL_INVOICE
values (new.service_id, new.invoice_date,
(select rentalrate from YCL_RENTALRATE
where class = (select class from YCL_VEHICLE where VIN = new.VIN)) *
(new.dropoff_date - new.pickup_date + 1) +
(select fee_for_over from YCL_RENTALRATE where class = (select class from YCL_VEHICLE where VIN = new.VIN)) *
(new.end_odometer - new.start_odometer - new.odometer_limit) *
(select percentage from YCL_COUPON where coupon_id = (select coupon_id from YCL_COUPON where coupon_id = new.coupon_id)) /
100
);
else
insert into YCL_INVOICE
values (new.service_id, new.invoice_date,
(select rentalrate from YCL_RENTALRATE where class = (select class from YCL_VEHICLE where VIN = new.VIN)) *
(new.dropoff_date - new.pickup_date + 1) *
(select percentage from YCL_COUPON where coupon_id = (select coupon_id from YCL_COUPON where coupon_id = new.coupon_id)) /
100
);
end if;
end if;
end;
