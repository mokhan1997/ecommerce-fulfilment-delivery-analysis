-- ============================================================
-- Project: E-commerce Fulfilment & Delivery Performance Analysis
-- File: 03_views_for_powerbi.sql
-- Purpose: Create SQL views for Power BI dashboard reporting
-- ============================================================


-- 1. Main order-level dashboard view
DROP VIEW IF EXISTS v_order_level_dashboard;

CREATE VIEW v_order_level_dashboard AS
SELECT
    order_id,
    customer_id,
    customer_state,
    customer_city,
    order_status,
    order_purchase_timestamp,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    delivery_days,
    estimated_delivery_days,
    delay_days,
    is_late_delivery,
    order_item_count,
    product_count,
    seller_count,
    total_item_value,
    total_freight_value,
    total_payment_value,
    avg_review_score,
    review_count,
    main_product_category,
    main_seller_state,
    avg_product_weight_g,
    avg_product_length_cm,
    avg_product_height_cm,
    avg_product_width_cm
FROM analysis_ready_orders;


-- 2. State-level delivery performance view
DROP VIEW IF EXISTS v_state_delivery_performance;

CREATE VIEW v_state_delivery_performance AS
SELECT
    customer_state,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS late_delivery_rate_percent,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days,
    ROUND(AVG(delay_days), 2) AS avg_delay_days,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score,
    ROUND(AVG(total_freight_value), 2) AS avg_freight_value
FROM analysis_ready_orders
WHERE customer_state IS NOT NULL
GROUP BY customer_state;


-- 3. Product category performance view
DROP VIEW IF EXISTS v_category_performance;

CREATE VIEW v_category_performance AS
SELECT
    main_product_category,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS late_delivery_rate_percent,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score,
    ROUND(AVG(total_freight_value), 2) AS avg_freight_value,
    ROUND(AVG(total_item_value), 2) AS avg_item_value,
    ROUND(AVG(avg_product_weight_g), 2) AS avg_product_weight_g
FROM analysis_ready_orders
WHERE main_product_category IS NOT NULL
GROUP BY main_product_category;


-- 4. Delay band and review score view
DROP VIEW IF EXISTS v_delay_band_review_score;

CREATE VIEW v_delay_band_review_score AS
SELECT
    CASE
        WHEN delay_days <= -7 THEN '7+ days early'
        WHEN delay_days BETWEEN -6 AND -1 THEN '1-6 days early'
        WHEN delay_days = 0 THEN 'Delivered on estimated date'
        WHEN delay_days BETWEEN 1 AND 3 THEN '1-3 days late'
        WHEN delay_days BETWEEN 4 AND 7 THEN '4-7 days late'
        WHEN delay_days > 7 THEN 'More than 7 days late'
        ELSE 'Unknown'
    END AS delay_band,
    COUNT(*) AS total_orders,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score,
    ROUND(AVG(delay_days), 2) AS avg_delay_days,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM analysis_ready_orders
GROUP BY delay_band;


-- 5. Seller state performance view
DROP VIEW IF EXISTS v_seller_state_performance;

CREATE VIEW v_seller_state_performance AS
SELECT
    main_seller_state,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS late_delivery_rate_percent,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days,
    ROUND(AVG(total_freight_value), 2) AS avg_freight_value
FROM analysis_ready_orders
WHERE main_seller_state IS NOT NULL
GROUP BY main_seller_state;