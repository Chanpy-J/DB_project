/******avaible car********/


/*******invoice**********Table joins with at least 3 tables in join/*/
/*SELECT a.service_id, a.invoice_date, invoice_amount, rent_days, extra_odometer, customer_id, vehicle_identification_number, a.class, pickup_address, dropoff_address, discount, lpn as Lincese_Plate_Number, concat(make,' ', model,' ', year) as car_model
FROM
	(
	SELECT a.service_id, a.invoice_date, invoice_amount, (datediff(dropoff_date, pickup_date) +1) as rent_days, extra_odometer, customer_id, vehicle_identification_number, class, pickup_address, concat(B.street,' ',B.city,' ', B.zipcode ) as dropoff_address, discount
	FROM
		(
		SELECT a.service_id, a.invoice_date, invoice_amount, pickup_date, dropoff_date, extra_odometer, customer_id, vehicle_identification_number, class, concat(B.street,' ',B.city,' ', B.zipcode ) pickup_address, droploc_id, discount
		FROM
			(
			SELECT a.service_id, a.invoice_date, invoice_amount, pickup_date, dropoff_date, extra_odometer, customer_id, vin as vehicle_identification_number, class, pickloc_id, droploc_id, percentage as discount
			FROM
				(
				SELECT a.service_id, a.invoice_date, invoice_amount, pickup_date, dropoff_date, (end_odometer - start_odometer - odometer_limit) as extra_odometer, customer_id, vin, class, pickloc_id, droploc_id, coupon_id
				FROM 
				YCL_INVOICE A
				JOIN
				YCL_SERVICE B
				ON
				A.service_id = B.service_id
				) A
			LEFT OUTER JOIN
				YCL_COUPON B
			ON
			A.coupon_id = B.coupon_id
			) A
		JOIN
		YCL_LOCATION B
		ON
		A.pickloc_id = B.location_id
		) A
	JOIN
	YCL_LOCATION B
	ON
	A.droploc_id = B.location_id
    ) A
JOIN
YCL_VEHICLE B
ON 
A.vehicle_identification_number = B.VIN*/
/*select * from ycl_invoice*/


/********service counting*********TOP-N query//*
SELECT count(invoice_amount) as total_service, droploc_id
FROM 
YCL_SERVICE A
JOIN
YCL_INVOICE B
ON
A.service_id = B.service_id
group by droploc_id
order by 1 desc
limit 3*/

/****PICK INDIVUAL OR COPORATE CUSTOMER*****Multi-row subquery//*
SELECT *
FROM 
YCL_CUSTOMER
WHERE customer_id IN
	(
	SELECT customer_id
    from YCL_INDIVIDUAL
    )*/
  /*  
SELECT *
FROM 
YCL_CUSTOMER
WHERE customer_id IN
	(
	SELECT customer_id
    from YCL_CORPORATE
    )*/


/************CORRECT THE DATA REDUNTANT******** SET OPERATOR QUERY AND CORRELATED SUBQUERY/
UPDATE YCL_SERVICE A
SET CLASS = 	(SELECT	CLASS 
				FROM YCL_VEHICLE B
				WHERE A.VIN = B.VIN)*/

/*******find the service out of the coupon limit******* WITH CLAUSE//*
WITH coupondate(id, start, end) AS
(SELECT coupon_id, start_date, end_date FROM YCL_COUPON)
SELECT service_id, invoice_date, start, end
FROM YCL_SERVICE A
JOIN
coupondate B
ON A.coupon_id = B.id
WHERE invoice_date NOT BETWEEN start AND end

