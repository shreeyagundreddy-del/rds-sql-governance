-- Author: Sabino
-- Purpose: Raw data table
-- Layer: Raw
-- Version: v1.0

CREATE TABLE IF NOT EXISTS raw.trips (
    trip_id BIGINT PRIMARY KEY,
    pickup_ts TIMESTAMP,
    dropoff_ts TIMESTAMP,
    passenger_count INT,
    total_amount NUMERIC
);
