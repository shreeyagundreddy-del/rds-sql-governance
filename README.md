# SQL Layer – Data Modeling & Data Quality

## 📌 Overview

This module implements the core SQL logic for data modeling, transformation, and data quality validation within the data platform. It follows a layered approach to ensure clean separation of raw, processed, and validated data.

---

## 🏗️ Architecture

The SQL layer is structured into the following schemas:

* **raw** → Stores ingested source data
* **curated** → Contains transformed and enriched datasets
* **dq** → Captures data quality validation results
* **audit** → Reserved for monitoring and tracking

---

## 🔄 Data Processing

* Raw trip data is stored in `raw.trips`
* Transformations are applied using views (e.g., `curated.vw_trips_base`)
* Derived metrics such as **trip duration** are calculated for analytics readiness

---

## ✅ Data Quality

A lightweight data quality framework is implemented to validate processed data.

* Results stored in: `dq.results`
* Example rule: Ensures **trip duration is positive**
* Tracks failed records, total records, and validation timestamps

---

## 📂 SQL Components

* `01_create_schemas.sql` → Schema setup
* `02_create_raw_tables.sql` → Raw table definition
* `03_transform_trips_base.sql` → Transformation logic
* `04_dq_trip_validations.sql` → Data quality checks
* `05_dq_tests.sql` → DQ result storage

---

## 🧠 Key Highlights

* Layered data architecture (raw → curated → dq)
* Modular and maintainable SQL design
* Built-in data validation framework
* Ready for downstream analytics and reporting

---

## 🛠️ Tech Stack

* SQL (PostgreSQL / Amazon Redshift compatible)
* Data modeling and transformation patterns

---

## 👤 Author

Part of a larger end-to-end data platform demonstrating scalable data engineering practices.
