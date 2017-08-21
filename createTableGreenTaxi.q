CREATE EXTERNAL TABLE green_taxi (
	vendorID			VARCHAR(3),
	pickup_datetime	    TIMESTAMP,
	dropoff_datetime	TIMESTAMP,
	store_and_fwd_flag	VARCHAR(1),
	ratecodeID	        SMALLINT,
	pickup_longitude	DECIMAL(6,6),
	pickup_latitude		DECIMAL(6,6),
	dropoff_longitude	DECIMAL(6,6),
	dropoff_latitude	DECIMAL(6,6),
	passenger_count	    SMALLINT,
	trip_distance	    DECIMAL(6,3),
	fare_amount	        DECIMAL(6,2),
	extra	            DECIMAL(6,2),
	mta_tax	            DECIMAL(6,2),
	tip_amount	        DECIMAL(6,2),
	tolls_amount	    DECIMAL(6,2),
	ehail_fee	 		DECIMAL(6,2),
	total_amount	    DECIMAL(6,2),
	payment_type	    VARCHAR(3),
	trip_type			SMALLINT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
LOCATION 's3a://nyctaxidataset/green_taxi/'
tblproperties("skip.header.line.count"="1");