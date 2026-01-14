-- Author: shreeya
-- Purpose: Data quality validation
-- Layer: Data Quality
-- Version: v1.0

INSERT INTO dq.results
SELECT
    'trip_duration_positive',
    COUNT(*),
    CURRENT_TIMESTAMP
FROM curated.vw_trips_base
WHERE trip_duration_min <= 0;
