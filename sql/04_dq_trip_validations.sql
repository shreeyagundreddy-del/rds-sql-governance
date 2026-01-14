-- Author: shreeya
-- Purpose: Data quality validation
-- Layer: Data Quality
-- Version: v1.0

INSERT INTO dq.results (
    rule_name,
    failed_records,
    total_records,
    checked_at
)
SELECT
    'trip_duration_positive',
    COUNT(*) FILTER (WHERE trip_duration_min <= 0),
    COUNT(*),
    CURRENT_TIMESTAMP
FROM curated.vw_trips_base;

