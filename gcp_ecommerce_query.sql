CREATE OR REPLACE TABLE `europe_analysis_us_host.european_orders_clean` AS
SELECT 
  u.id AS user_id,
  u.country,
  u.age,
  u.gender,
  o.order_id,
  o.status,
  o.num_of_item,
  o.created_at
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
JOIN `bigquery-public-data.thelook_ecommerce.orders` AS o
  ON u.id = o.user_id
WHERE u.country IN ('United Kingdom', 'Germany', 'France', 'Spain', 'Belgium', 'Austria');
