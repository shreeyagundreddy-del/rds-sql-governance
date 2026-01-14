-- Author: shreeya
-- Purpose: DQ results table
-- Layer: Data Quality
-- Version: v1.0

CREATE SCHEMA IF NOT EXISTS dq;

CREATE TABLE IF NOT EXISTS dq.results (
    rule_name TEXT,
    failed_records INT,
    total_records INT,
    checked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
