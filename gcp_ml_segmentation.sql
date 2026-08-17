-- STEP 1: Calculate RFM Features using Advanced SQL CTEs
CREATE OR REPLACE TABLE `customer_segmentation_ml.rfm_features` AS
WITH user_orders AS (
  SELECT 
    user_id,
    MAX(created_at) AS last_order_date,
    COUNT(DISTINCT order_id) AS total_orders
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  GROUP BY user_id
),
user_spending AS (
  SELECT 
    user_id,
    SUM(sale_price) AS total_spent
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  WHERE status NOT IN ('Cancelled', 'Returned')
  GROUP BY user_id
)
SELECT 
  u.user_id,
  TIMESTAMP_DIFF(TIMESTAMP('2024-01-01 00:00:00'), u.last_order_date, DAY) AS recency,
  u.total_orders AS frequency,
  ROUND(s.total_spent, 2) AS monetary
FROM user_orders u
JOIN user_spending s ON u.user_id = s.user_id
WHERE s.total_spent IS NOT NULL;

-- STEP 2: Train the K-Means Clustering Machine Learning Model
-- (FIXED: Explicit uppercase strings for option constraints)
CREATE OR REPLACE MODEL `customer_segmentation_ml.customer_clusters`
OPTIONS(
  model_type='KMEANS',
  num_clusters=4,
  standardize_features=TRUE
) AS
SELECT 
  recency, 
  frequency, 
  monetary
FROM `customer_segmentation_ml.rfm_features`;

-- STEP 3: Generate Final Predicted Segments Table
CREATE OR REPLACE TABLE `customer_segmentation_ml.final_customer_segments` AS
SELECT 
  user_id,
  recency,
  frequency,
  monetary,
  centroid_id AS cluster_id,
  CASE 
    WHEN centroid_id = 1 THEN 'Segment Alpha'
    WHEN centroid_id = 2 THEN 'Segment Beta'
    WHEN centroid_id = 3 THEN 'Segment Gamma'
    ELSE 'Segment Delta'
  END AS segment_name
FROM ML.PREDICT(
  MODEL `customer_segmentation_ml.customer_clusters`, 
  TABLE `customer_segmentation_ml.rfm_features`
);
