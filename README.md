# 🚀 Modern Data Stack Analytics Engineering Portfolio: Jaffle Shop

[![dbt Core](https://img.shields.io/badge/dbt-Core%201.12-orange.svg)](https://www.getdbt.com/)
[![BigQuery](https://img.shields.io/badge/BigQuery-GCP-blue.svg)](https://cloud.google.com/bigquery)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📌 Project Overview
This repository showcases an enterprise-grade analytics engineering pipeline built from scratch using **dbt Core** and **Google BigQuery**. It transforms raw transactional data from a mock e-commerce database ("Jaffle Shop") into clean, tested, and business-ready dimensional models following **Kimball dimensional modeling** principles.

---

## 🏗️ Architecture & Data Modeling (The Modular Approach)
The project follows a strict multi-layer DAG (Directed Acyclic Graph) architecture to separate concerns, ensure maintainability, and optimize query performance:

1. **Staging Layer (`models/staging/`)**
   * Connects directly to raw source tables.
   * Performs light, 1:1 transformations: renaming columns, casting data types, and standardizing naming conventions.
   * Materialized as **Views**.

2. **Intermediate Layer (`models/intermediate/`)**
   * Acts as the business logic workshop.
   * Aggregates line items and payment statuses to an order grain (`int_orders.sql`) to prepare for downstream joining.
   * Materialized as **Views**.

3. **Marts Layer (`models/marts/core/`)**
   * Houses business-ready Kimball star schema models optimized for BI dashboards (Power BI / Lightdash):
     * **`dim_customers`**: Customer profiles enriched with lifetime value (LTV), order counts, and first/last order dates.
     * **`fct_orders`**: Order-level grain capturing transactional facts and monetary totals.
   * Materialized as **Tables** for high-performance querying and low latency.

---

## 🛡️ Data Quality & Testing
Data integrity is enforced through automated schema tests defined in YAML configuration files:
* **Primary Key Constraints**: Validated for `unique` and `not_null` across all entities (`customer_id`, `order_id`, `payment_id`).
* **Foreign Key Referential Integrity**: Validated using `relationships` tests to ensure zero orphaned records between facts and dimensions.
* *Result: 11/11 automated tests passing successfully.*

---

## 🧰 Tech Stack
* **Data Warehouse**: Google BigQuery (Sandbox)
* **Transformation Tool**: dbt Core
* **Version Control**: Git & GitHub
* **Language**: SQL (BigQuery Dialect), YAML, Python (Virtual Environment)

---

## ⚙️ Quickstart / Local Setup
1. Clone the repository:
   ```bash
   git clone [https://github.com/CodePerfectionist-V/analytics-engineering-portfolio.git](https://github.com/CodePerfectionist-V/analytics-engineering-portfolio.git)