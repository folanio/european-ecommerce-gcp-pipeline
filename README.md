# Cloud Data Analytics Portfolio (GCP & BigQuery)

Welcome to my data analytics portfolio. This repository showcases my progression from core data engineering pipelines to advanced, AI-driven customer segmentation using Google Cloud Platform (GCP).

---

## 🚀 Project 1: European E-Commerce Data Pipeline (Beginner Level)

### Project Overview
An end-to-end data pipeline built within GCP to extract, transform, and visualise live e-commerce transaction data specifically for the European market.

### Architecture & Tools
* **Data Warehouse:** GCP BigQuery (SQL)
* **Business Intelligence:** Looker Studio

### Key Technical Steps
* Combined user demographics and order tracking tables using SQL `JOIN` constraints.
* Filtered a massive global dataset down to 23,223 specific European orders (UK, France, Germany, Spain, Belgium, Austria).
* Identified **France** as the leading market segment with **6,005 total orders**.

🔗 **[View Live Interactive E-Commerce Dashboard](https://datastudio.google.com/reporting/39f7476f-43f4-4b68-b98e-863a69a95879)**

---

## 🧠 Project 2: Predictive Customer Segmentation Pipeline (Intermediate Level)

### Project Overview
An intermediate unsupervised machine learning pipeline using BigQuery ML to automatically segment active customers into distinct behavioural profiles based on their purchasing habits.

### Architecture & Tools
* **Feature Engineering:** Advanced SQL CTEs (Common Table Expressions)
* **Machine Learning Model:** BigQuery ML (K-Means Clustering Algorithm)
* **Visualization:** Looker Studio Algorithmic Scatter Plot

### Key Technical Steps
* Engineered an RFM framework (Recency, Frequency, Monetary) to quantify individual user behaviour.
* Trained a 4-cluster K-Means model directly inside BigQuery using cloud compute credits.
* Successfully processed and isolated a massive segment of **27,757 low-value/occasional shoppers**, providing data-driven targeting insights to optimise corporate marketing budgets.

🔗 **[View Live AI-Driven Segmentation Dashboard](https://datastudio.google.com/reporting/fd850b73-d873-40bc-a3a8-7650001f3e7b)**

---
# 💼 Project 3: Automated Competitor Price Tracker & Market Intelligence Pipeline

## 📊 Business Case & Value Proposition
In the highly competitive automotive retail industry, dealership profitability depends directly on dynamic pricing strategies. This enterprise-grade Data-as-a-Service (DaaS) pipeline completely automates competitor price tracking for the localised **Norwich Used Car Market**. 

By processing daily inventory shifts, the analytics engine automatically calculates localised market baselines and triggers instant, actionable alerts to stakeholders when a competitor drops their price below market average—giving businesses an immediate **Information Advantage**.

### 🛠️ Architecture & Technology Stack
* **Data Warehousing Layer:** Google Cloud Platform (GCP) BigQuery Production Engines
* **Orchestration Layer:** GCP Scheduled Queries (Automated CRON triggers)
* **Transformation & Analytics Engine:** Advanced SQL (Window Functions, Common Table Expressions)
* **Business Intelligence Delivery Layer:** Looker Studio Enterprise Email Automation

---

## ⚙️ Core Technical Pipeline Architecture

### 1. The Production Schema (`market_intelligence_norwich.daily_car_prices`)
The database is structured to accept structured daily data payloads containing critical parameters: vehicle age, mileage, dealer metadata, and current listed price.

### 2. The Dynamic Analytics Engine (SQL Window Functions)
To avoid running empty data queries on rolling days, the pipeline uses a robust production fix. It dynamically calculates the maximum available date in the dataset (`MAX(scrape_date)`) and applies an algorithmic window function `AVG() OVER (PARTITION BY ...)` to establish pricing baselines across rival dealerships in real-time.

```sql
WITH latest_scraped_data AS (
  SELECT * FROM `market_intelligence_norwich.daily_car_prices`
  WHERE scrape_date = (SELECT MAX(scrape_date) FROM `market_intelligence_norwich.daily_car_prices`)
),
market_baselines AS (
  SELECT *,
    ROUND(AVG(listed_price) OVER(PARTITION BY car_make, car_model), 2) AS local_market_average
  FROM latest_scraped_data
)
```

### 3. Serverless Automation (Zero-Maintenance Operational SLA)
The analysis script is anchored to a **GCP Scheduled Query** that automatically fires at **07:00 AM daily**. The clean alerts table overwrites itself (`WRITE_TRUNCATE`), meaning zero bloat and absolute cost optimisation inside the GCP "Always Free" tier.

### 4. Direct BI Inbox Delivery
The filtered alerts are wired into a Looker Studio layout, paired with an automated delivery engine that compiles a custom PDF report and drops it into stakeholders' inboxes every morning at **08:00 AM**.

---

## 📈 Real-World Data Insights Captured
During initial testing cycles, the pipeline successfully identified hidden localised market deviations:
* **The Insight:** Isolated **Broadland Cars** undercutting the baseline valuation for a 2018 Ford Fiesta by exactly **3.3%** (£8,900 vs a local market average of £9,200).
* **The Business Impact:** Stakeholder dealerships can instantly adjust their web marketing campaigns or deploy rapid procurement tactics before the inventory sells out.

---

## 🔗 Live Business Asset Links
👉 **[Interact with the Live Automotive Intelligence Dashboard](https://datastudio.google.com/reporting/40f069a5-feb7-45ee-8916-3cf18ff33e9f
)**

## 🛠️ Repository Structure
* `gcp_ecommerce_query.sql` - Core SQL script for data transformation (Project 1)
* `gcp_ml_segmentation.sql` - Advanced SQL script for RFM calculation and Machine Learning training (Project 2)
* `gcp_market_automation.sql` - Automated Competitor Price Tracker & Market Intelligence Pipeline (Project 3)

