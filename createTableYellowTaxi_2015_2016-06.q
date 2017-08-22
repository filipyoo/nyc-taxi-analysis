CREATE EXTERNAL TABLE yellow_taxi_2015_2016_06 (
	vendorID					VARCHAR(3),
	pickup_datetime	    		TIMESTAMP,
	dropoff_datetime			TIMESTAMP,
	passenger_count	    		SMALLINT,
	trip_distance	    		DECIMAL(6,3),
	pickup_longitude			DECIMAL(9,6),
	pickup_latitude				DECIMAL(9,6),
	ratecodeID	        		SMALLINT,
	store_and_fwd_flag			VARCHAR(1),
	dropoff_longitude			DECIMAL(9,6),
	dropoff_latitude			DECIMAL(9,6),
	payment_type	    		VARCHAR(3),
	fare_amount	        		DECIMAL(6,2),
	extra	            		DECIMAL(6,2),
	mta_tax	            		DECIMAL(6,2),
	tip_amount	        		DECIMAL(6,2),
	tolls_amount	  		    DECIMAL(6,2),
	improvement_surcharge		DECIMAL(6,2),
	total_amount	    		DECIMAL(6,2)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
LOCATION 's3a://nyctaxidataset/yellow_taxi/yellow_taxi_2015_2016-06/'
tblproperties("skip.header.line.count"="1");