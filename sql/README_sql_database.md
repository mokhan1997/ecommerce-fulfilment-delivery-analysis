# SQL Database Notes

## Database Name

ecommerce_fulfilment.db

## Database Type

SQLite

## Purpose

This database was created from the cleaned and processed Olist e-commerce datasets.

The purpose of the database is to support SQL-based analysis of:

- Delivery performance
- Late delivery rate
- Customer review scores
- Freight cost
- Customer state performance
- Product category performance

## Tables Created

| Table                     | Purpose                                                                                          |
| ------------------------- | ------------------------------------------------------------------------------------------------ |
| analysis_ready_orders     | Main analysis table combining order, customer, seller, product, payment, freight and review data |
| kpi_summary               | High-level KPI summary table                                                                     |
| review_by_delivery_status | Review score comparison for late vs on-time deliveries                                           |
| state_summary             | Customer state-level order and delivery summary                                                  |
| category_summary          | Product category-level order, freight and review summary                                         |

## How the Database Was Created

The database was created using:

```text
src/create_sqlite_database.py
```
