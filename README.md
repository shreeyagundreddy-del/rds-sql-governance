# Data Pipeline with Schema Design, Transformations, and Data Quality (SQL)

## 📌 Overview

This project demonstrates a structured data engineering workflow using SQL, focusing on schema design, transformation logic, and data quality validation. It simulates a production-style pipeline for processing trip data, ensuring data reliability and analytics readiness.

---

## 🏗️ Architecture

The pipeline follows a layered architecture:

* **Raw Layer (`raw`)** → Stores ingested source data
* **Curated Layer (`curated`)** → Contains transformed and enriched data
* **Data Quality Layer (`dq`)** → Stores validation results
* **Audit Layer (`audit`)** → Reserved for tracking and observability

---

## 🗂️ Schema Design

Schemas are created to logically separate concerns:

```sql
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS curated;
CREATE SCHEMA IF NOT EXISTS dq;
CREATE SCHEMA IF NOT EXISTS audit;
```

This design improves:

* Maintainability
* Data governance
* Query performance and clarity

---

## 📥 Raw Data Ingestion

The raw layer stores immutable trip data:

```sql
CREATE TABLE IF NOT EXISTS raw.trips (
    trip_id BIGINT PRIMARY KEY,
    pickup_ts TIMESTAMP,
    dropoff_ts TIMESTAMP,
    passenger_count INT,
    total_amount NUMERIC
);
```

✔️ Ensures:

* Source-of-truth storage
* Minimal transformation at ingestion

---

## 🔄 Data Transformation

A curated view is created to enrich raw data with derived metrics:

```sql
CREATE OR REPLACE VIEW curated.vw_trips_base AS
SELECT
    trip_id,
    pickup_ts,
    dropoff_ts,
    passenger_count,
    total_amount,
    (EXTRACT(EPOCH FROM dropoff_ts - pickup_ts)/60)::INT AS trip_duration_min
FROM raw.trips;
```

### Key Transformation

* Calculates **trip duration in minutes**
* Prepares data for downstream analytics

---

## ✅ Data Quality Framework

A simple but effective data quality framework is implemented.

### DQ Results Table

```sql
CREATE TABLE IF NOT EXISTS dq.results (
    rule_name TEXT,
    failed_records INT,
    total_records INT,
    checked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Validation Rule

```sql
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
```

### What it checks:

* Ensures **trip duration is always positive**
* Captures:

  * Failed records
  * Total records
  * Timestamp of validation

---

## 🔍 Key Features

* Layered schema design (raw → curated → dq)
* Derived metrics for analytics readiness
* Built-in data quality validation framework
* Scalable and modular SQL structure
* Production-style separation of concerns

---

## 📊 Use Cases

* Data validation pipelines
* Analytical dataset preparation
* Data quality monitoring
* Foundation for BI or ML pipelines

---

## 🧠 Concepts Demonstrated

* Data modeling and schema design
* ETL transformation logic in SQL
* Data quality validation patterns
* Layered data architecture

---

## 🛠️ Tech Stack

* SQL (PostgreSQL / Redshift compatible)
* Data modeling principles
* Data quality frameworks

---

## 🚀 Future Improvements

* Add multiple DQ rules (null checks, range checks, anomaly detection)
* Integrate with orchestration tools (Airflow)
* Add audit logging and lineage tracking
* Build dashboards for DQ monitoring

---

## 👤 Author

Designed as a structured data engineering project to demonstrate best practices in schema design, transformation logic, and data quality enforcement.
