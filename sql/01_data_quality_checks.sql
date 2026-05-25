-- ============================================================
-- Project: E-commerce Fulfilment & Delivery Performance Analysis
-- File: 01_data_quality_checks.sql
-- Purpose: Basic SQL checks to validate the SQLite database
-- ============================================================


-- 1. Check row count in the main analysis table
SELECT 
    COUNT(*) AS total_rows
FROM analysis_ready_orders;


-- 2. Check number of unique orders
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders
FROM analysis_ready_orders;


-- 3. Check whether any order_id values are duplicated
SELECT
    order_id,
    COUNT(*) AS row_count
FROM analysis_ready_orders
GROUP BY order_id
HAVING COUNT(*) > 1;


-- 4. Check missing values in key columns
SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS missing_customer_state,
    SUM(CASE WHEN delivery_days IS NULL THEN 1 ELSE 0 END) AS missing_delivery_days,
    SUM(CASE WHEN delay_days IS NULL THEN 1 ELSE 0 END) AS missing_delay_days,
    SUM(CASE WHEN is_late_delivery IS NULL THEN 1 ELSE 0 END) AS missing_late_flag,
    SUM(CASE WHEN avg_review_score IS NULL THEN 1 ELSE 0 END) AS missing_review_score
FROM analysis_ready_orders;


-- 5. Check late delivery flag values
SELECT
    is_late_delivery,
    COUNT(*) AS order_count
FROM analysis_ready_orders
GROUP BY is_late_delivery;


-- 6. Check delivery day ranges
SELECT
    MIN(delivery_days) AS min_delivery_days,
    MAX(delivery_days) AS max_delivery_days,
    AVG(delivery_days) AS avg_delivery_days,
    MIN(delay_days) AS min_delay_days,
    MAX(delay_days) AS max_delay_days,
    AVG(delay_days) AS avg_delay_days
FROM analysis_ready_orders;


-- 7. Check review score range
SELECT
    MIN(avg_review_score) AS min_review_score,
    MAX(avg_review_score) AS max_review_score,
    AVG(avg_review_score) AS avg_review_score
FROM analysis_ready_orders;