-- Author: Shreeya
-- Purpose: SQL-based test
-- Layer: Testing
-- Version: v1.0

SELECT
    rule_name,
    CASE
        WHEN failed_records = 0 THEN 'PASS'
        ELSE 'FAIL'
    END AS test_status,
    checked_at
FROM dq.results;
