-- ============================================================
-- Project: E-commerce Fulfilment & Delivery Performance Analysis
-- File: 02_analysis_queries.sql
-- Purpose: SQL analysis queries for fulfilment and delivery KPIs
-- ============================================================


-- 1. Overall delivery KPI summary
SELECT
    COUNT(*) AS total_delivered_orders,
    SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS late_delivery_rate_percent,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days,
    ROUND(AVG(delay_days), 2) AS avg_delay_days,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score,
    ROUND(AVG(total_freight_value), 2) AS avg_freight_value
FROM analysis_ready_orders;


-- 2. Review score comparison: late vs on-time deliveries
SELECT
    CASE 
        WHEN is_late_delivery = 1 THEN 'Late'
        ELSE 'On time or early'
    END AS delivery_status,
    COUNT(*) AS order_count,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days,
    ROUND(AVG(delay_days), 2) AS avg_delay_days
FROM analysis_ready_orders
GROUP BY is_late_delivery
ORDER BY is_late_delivery;


-- 3. Top 10 customer states by order volume
SELECT
    customer_state,
    COUNT(*) AS order_count,
    SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS late_delivery_rate_percent,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days,
    ROUND(AVG(total_freight_value), 2) AS avg_freight_value
FROM analysis_ready_orders
GROUP BY customer_state
ORDER BY order_count DESC
LIMIT 10;


-- 4. Top 10 product categories by order volume
SELECT
    main_product_category,
    COUNT(*) AS order_count,
    SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS late_delivery_rate_percent,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score,
    ROUND(AVG(total_freight_value), 2) AS avg_freight_value,
    ROUND(AVG(total_item_value), 2) AS avg_item_value
FROM analysis_ready_orders
WHERE main_product_category IS NOT NULL
GROUP BY main_product_category
ORDER BY order_count DESC
LIMIT 10;


-- 5. Product categories with highest average freight cost
SELECT
    main_product_category,
    COUNT(*) AS order_count,
    ROUND(AVG(total_freight_value), 2) AS avg_freight_value,
    ROUND(AVG(total_item_value), 2) AS avg_item_value,
    ROUND(AVG(avg_product_weight_g), 2) AS avg_product_weight_g
FROM analysis_ready_orders
WHERE main_product_category IS NOT NULL
GROUP BY main_product_category
HAVING COUNT(*) >= 100
ORDER BY avg_freight_value DESC
LIMIT 10;


-- 6. Customer states with highest late delivery rate
SELECT
    customer_state,
    COUNT(*) AS order_count,
    SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN is_late_delivery = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS late_delivery_rate_percent,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score
FROM analysis_ready_orders
WHERE customer_state IS NOT NULL
GROUP BY customer_state
HAVING COUNT(*) >= 100
ORDER BY late_delivery_rate_percent DESC
LIMIT 10;


-- 7. Average review score by delay band
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
    COUNT(*) AS order_count,
    ROUND(AVG(avg_review_score), 2) AS avg_review_score,
    ROUND(AVG(delay_days), 2) AS avg_delay_days
FROM analysis_ready_orders
GROUP BY delay_band
ORDER BY avg_delay_days;