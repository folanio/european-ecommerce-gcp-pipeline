# End-to-End European E-Commerce Data Pipeline (GCP & Looker Studio)

## Project Overview
This project simulates an enterprise-level data analyst workflow. I built an end-to-end data pipeline within Google Cloud Platform (GCP) to extract, transform, and visualize e-commerce transaction data specifically for the European market.

## Architecture
* **Data Source:** Google BigQuery Public Datasets (`thelook_ecommerce`)
* **Data Warehouse & Transformation:** GCP BigQuery (SQL)
* **Business Intelligence:** Looker Studio (Interactive Dashboard)

## Key Technical Steps
1. **Data Joining & Filtering:** Combined user demographics and order tracking tables using SQL `JOIN` constraints.
2. **Geographical Targeting:** Filtered a massive global dataset down to 23,223 specific European orders (UK, France, Germany, Spain, Belgium, Austria).
3. **Data Warehousing:** Optimized query execution layers by creating a dedicated analytics table within a local dataset workspace.
4. **Dashboard Engineering:** Built an interactive dashboard showcasing KPIs, demographic splits, and market rankings.

## Key Insights Discovered
* **Total Volume:** 23,223 unique completed orders across Europe.
* **Top Performing Market:** France leads the region with **6,005 total orders**.
* **Target Demographics:** Discovered a highly balanced gender split across European shoppers.

## Live Dashboard Link
👉 [[(https://datastudio.google.com/reporting/39f7476f-43f4-4b68-b98e-863a69a95879]])
