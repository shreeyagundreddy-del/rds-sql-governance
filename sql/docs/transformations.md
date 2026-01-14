# SQL Transformations Documentation

## Transformation: vw_trips_base

**Source Table:** raw.trips  
**Target View:** curated.vw_trips_base  
**Owner:** Data Engineering  
**Purpose:** Create clean, analytics-ready trip data  

### Transformation Logic
- Calculate trip duration in minutes
- Standardize trip metrics
- Prepare data for reporting and analytics

### Data Quality Rules
- Trip duration must be greater than 0
- Invalid records are logged

### Testing
- SQL-based PASS/FAIL tests implemented
- Results stored in dq.results table

### Governance
- SQL scripts are version-controlled
- Audit-ready structure
