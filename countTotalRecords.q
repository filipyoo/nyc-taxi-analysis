SELECT SUM(cnt) as total_records
	FROM (
		SELECT COUNT(*) as cnt FROM green_taxi 
		UNION ALL
		SELECT COUNT(*) as cnt FROM yellow_taxi_2009_2014
		UNION ALL
		SELECT COUNT(*) as cnt FROM yellow_taxi_2015_2016_06
		UNION ALL
		SELECT COUNT(*) as cnt FROM yellow_taxi_2016_07_2016_12
			) as subquery