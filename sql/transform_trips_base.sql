-- Author: Shreeya
-- Purpose: Curated transformation
-- Layer: Curated
-- Version: v1.0

CREATE OR REPLACE VIEW curated.vw_trips_base AS
SELECT
    trip_id,
    pickup_ts,
    dropoff_ts,
    passenger_count,
    total_amount,
    (EXTRACT(EPOCH FROM dropoff_ts - pickup_ts)/60)::INT AS trip_duration_min
FROM raw.trips;
