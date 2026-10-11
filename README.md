# 🚀 Modern Data Stack Analytics Engineering Portfolio: Jaffle Shop

[![dbt CI](https://github.com/CodePerfectionist-V/analytics-engineering-portfolio/actions/workflows/dbt_ci.yml/badge.svg)](https://github.com/CodePerfectionist-V/analytics-engineering-portfolio/actions/workflows/dbt_ci.yml)
[![dbt Core](https://img.shields.io/badge/dbt--Core-1.12.5-orange.svg)](https://www.getdbt.com/)
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

## 🛡️ Data Quality & CI/CD Pipeline
- **Automated Schema Testing**: Enforces `unique` and `not_null` primary key constraints along with referential integrity (`relationships`) tests (11/11 tests passing).
- **GitHub Actions CI/CD**: Every pull request and push to `main` triggers an isolated automated run (`dbt_ci.yml`) running `dbt run` and `dbt test` against an isolated BigQuery CI environment.
- **Branch Protection**: Enforced branch protection rules on `main` require passing CI status checks before code can be merged.

---

## 🌐 Governance & Exposures
Downstream analytics consumption is documented directly in dbt via `models/exposures.yml`:
* **`executive_sales_dashboard`**: Maps downstream Power BI executive reporting to `dim_customers` and `fct_orders` for full data lineage tracking.

---

## 🧰 Tech Stack
- **Data Warehouse**: Google BigQuery (Sandbox)
- **Transformation Tool**: dbt Core
- **CI/CD & DevOps**: GitHub Actions, GCP IAM Service Accounts
- **Version Control**: Git & GitHub
- **Language**: SQL (BigQuery Dialect), YAML, Python

---

## ⚙️ Quickstart / Local Setup
1. **Clone the repository**:
   ```bash
   git clone [https://github.com/CodePerfectionist-V/analytics-engineering-portfolio.git](https://github.com/CodePerfectionist-V/analytics-engineering-portfolio.git)
   cd analytics-engineering-portfolio/ae_jaffle_shop