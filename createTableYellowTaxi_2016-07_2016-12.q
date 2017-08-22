CREATE EXTERNAL TABLE yellow_taxi_2016_07_2016_12 (
    vendorID                    VARCHAR(3),
    pickup_datetime             TIMESTAMP,
    dropoff_datetime            TIMESTAMP,
    passenger_count             SMALLINT,
    trip_distance               DECIMAL(6,3),
    ratecodeID                  SMALLINT,
    store_and_fwd_flag          VARCHAR(1),
    PULocationID                SMALLINT,
    DOLocationID                SMALLINT,
    payment_type                VARCHAR(3),
    fare_amount                 DECIMAL(6,2),
    extra                       DECIMAL(6,2),
    mta_tax                     DECIMAL(6,2),
    tip_amount                  DECIMAL(6,2),
    tolls_amount                DECIMAL(6,2),
    improvement_surcharge       DECIMAL(6,2),
    total_amount                DECIMAL(6,2)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
LOCATION 's3a://nyctaxidataset/yellow_taxi/yellow_taxi_2016-07_2016-12/'
tblproperties("skip.header.line.count"="1");