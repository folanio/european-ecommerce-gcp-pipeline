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

🔗 **[View Live Interactive E-Commerce Dashboard](PASTE_YOUR_FIRST_LOOKER_STUDIO_LINK_HERE)**

---

## 🧠 Project 2: Predictive Customer Segmentation Pipeline (Intermediate Level)

### Project Overview
An intermediate unsupervised machine learning pipeline using BigQuery ML to automatically segment active customers into distinct behavioural profiles based on their purchasing habits.

### Architecture & Tools
* **Feature Engineering:** Advanced SQL CTEs (Common Table Expressions)
* **Machine Learning Model:** BigQuery ML (K-Means Clustering Algorithm)
* ** Visualisation:** Looker Studio Algorithmic Scatter Plot

### Key Technical Steps
* Engineered an RFM framework (Recency, Frequency, Monetary) to quantify individual user behaviour.
* Trained a 4-cluster K-Means model directly inside BigQuery using cloud compute credits.
* Successfully processed and isolated a massive segment of **27,757 low-value/occasional shoppers**, providing data-driven targeting insights to optimise corporate marketing budgets.

🔗 **[https://datastudio.google.com/reporting/fd850b73-d873-40bc-a3a8-7650001f3e7b](https://datastudio.google.com/reporting/39f7476f-43f4-4b68-b98e-863a69a95879
)**

---

## 🛠️ Repository Structure
* `gcp_ecommerce_query.sql` - Core SQL script for data transformation (Project 1)
* `gcp_ml_segmentation.sql` - Advanced SQL script for RFM calculation and Machine Learning training (Project 2)
