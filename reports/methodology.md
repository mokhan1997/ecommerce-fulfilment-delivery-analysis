# Methodology

## Project Approach

This project followed a structured data analysis lifecycle:

1. Business problem definition
2. Dataset sourcing
3. Data understanding
4. Data quality checks
5. Data cleaning and preparation
6. Exploratory data analysis
7. SQL database creation
8. SQL quality and analysis queries
9. Power BI dashboard development
10. Business findings and recommendations

---

## 1. Business Problem Definition

The project focused on the following business question:

What factors are linked to late delivery, freight cost variation and customer review scores in an e-commerce fulfilment operation?

The analysis was designed from the perspective of an operations, fulfilment or supply chain leadership team.

---

## 2. Dataset Used

The project used the Olist Brazilian E-Commerce Public Dataset.

The dataset contains multiple CSV files covering:

- Orders
- Customers
- Order items
- Payments
- Reviews
- Products
- Sellers
- Geolocation
- Product category translations

---

## 3. Data Understanding

The first notebook loaded all raw CSV files and reviewed:

- Row counts
- Column counts
- Column names
- Data types
- Missing values
- Duplicate rows
- Primary key checks
- Table relationships

This helped build an understanding of how the dataset could support delivery, fulfilment and customer satisfaction analysis.

---

## 4. Data Cleaning and Preparation

The second notebook focused on preparing the data for analysis.

Main cleaning steps included:

- Converting date columns into datetime format
- Filtering to delivered orders
- Creating delivery performance fields
- Creating late delivery flags
- Aggregating order item data to order level
- Aggregating payment data to order level
- Aggregating review data to order level
- Joining customer, seller, product, freight and review information into one master dataset

---

## 5. Calculated Fields

The following calculated fields were created:

| Field                   | Purpose                                                             |
| ----------------------- | ------------------------------------------------------------------- |
| delivery_days           | Days between purchase date and customer delivery date               |
| estimated_delivery_days | Days between purchase date and estimated delivery date              |
| delay_days              | Difference between actual delivery date and estimated delivery date |
| is_late_delivery        | Flags whether the order was delivered late                          |
| Delivery Status         | Business-friendly label for late vs on-time orders                  |

---

## 6. Exploratory Data Analysis

The third notebook created:

- KPI summary table
- Review score by delivery status
- Customer state summary
- Product category summary
- Initial visual exploration

These outputs supported the Power BI dashboard and business recommendations.

---

## 7. SQL Database

A SQLite database was created from the processed CSV files.

The database includes:

- analysis_ready_orders
- kpi_summary
- review_by_delivery_status
- state_summary
- category_summary

SQLite was used because it is lightweight, beginner-friendly and suitable for a portfolio project.

---

## 8. SQL Analysis

SQL files were created to show:

- Row count checks
- Unique order checks
- Missing value checks
- Delivery KPI calculations
- Review score comparisons
- Customer state analysis
- Product category analysis
- Freight cost analysis

---

## 9. Power BI Dashboard

The Power BI dashboard contains three pages:

1. Executive Summary
2. Delivery Performance
3. Product, Freight & Seller Performance

The dashboard was designed to communicate the findings clearly to non-technical stakeholders.

---

## 10. Tools Used

| Tool             | Purpose                             |
| ---------------- | ----------------------------------- |
| Python           | Data loading, cleaning and analysis |
| pandas           | Tabular data processing             |
| numpy            | Numerical support                   |
| matplotlib       | Initial visual exploration          |
| SQLite           | SQL database                        |
| SQL              | Data checks and analysis queries    |
| Power BI         | Dashboard development               |
| Git              | Version control                     |
| GitHub           | Portfolio publishing                |
| VS Code          | Development environment             |
| Jupyter Notebook | Step-by-step analysis               |
