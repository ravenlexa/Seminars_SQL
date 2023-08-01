ALTER TABLE train ADD COLUMN time_to_next_station interval:
UPDATE train SET time_to_next_station = LEAD(station_time) 
OVER (PARTITION BY train_id ORDER BY station_time) - station_time WHERE 
LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time) IS NOT NULL;