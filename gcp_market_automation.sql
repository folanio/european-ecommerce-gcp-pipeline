-- STEP 1: Establish Your Competitor Baseline Table
CREATE OR REPLACE TABLE `market_intelligence_norwich.daily_car_prices` (
  scrape_date DATE,
  dealership_name STRING,
  car_make STRING,
  car_model STRING,
  year INT64,
  mileage INT64,
  listed_price NUMERIC
);

-- STEP 2: Market Baseline Analysis & Automated Alert Logic
-- (FIXED: Uses a subquery to pull the latest available date so it never runs blank)
WITH latest_scraped_data AS (
  SELECT * 
  FROM `market_intelligence_norwich.daily_car_prices`
  WHERE scrape_date = (SELECT MAX(scrape_date) FROM `market_intelligence_norwich.daily_car_prices`)
),
market_baselines AS (
  SELECT 
    scrape_date,
    dealership_name,
    car_make,
    car_model,
    listed_price,
    ROUND(AVG(listed_price) OVER(PARTITION BY car_make, car_model), 2) AS local_market_average
  FROM latest_scraped_data
)
SELECT 
  scrape_date,
  dealership_name,
  car_make,
  car_model,
  listed_price,
  local_market_average,
  ROUND((local_market_average - listed_price), 2) AS amount_under_market,
  ROUND(((local_market_average - listed_price) / local_market_average) * 100, 1) AS percent_discount
FROM market_baselines
WHERE listed_price < local_market_average
ORDER BY percent_discount DESC;
