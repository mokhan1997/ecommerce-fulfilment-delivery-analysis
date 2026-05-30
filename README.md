# E-commerce Fulfilment & Delivery Performance Analysis

## Project Overview

This is an end-to-end data analysis portfolio project focused on e-commerce fulfilment, delivery performance, freight cost, customer satisfaction and late delivery risk.

The project uses the Olist Brazilian E-Commerce Public Dataset and follows a full data analysis lifecycle: data sourcing, data understanding, data quality checks, data cleaning, feature engineering, exploratory analysis, SQL database creation, Power BI dashboard development and business recommendations.

The project was designed to reflect a real business scenario where an e-commerce fulfilment or supply chain team needs to understand how delivery performance affects customer experience and operational efficiency.

---

## Business Problem

In an e-commerce fulfilment operation, late deliveries, high freight costs and poor customer review scores can directly affect customer satisfaction, service performance and business reputation.

The main business question for this project is:

> What factors are linked to late delivery, freight cost variation and customer review scores in an e-commerce fulfilment operation?

This project explores that question by analysing delivered orders, customer geography, product categories, seller locations, freight value, delivery timing and review scores.

---

## What I Built

This project includes:

- A structured GitHub repository
- Raw data documentation
- Python notebooks for data understanding, cleaning and exploratory analysis
- Processed analysis-ready datasets
- A SQLite database
- SQL data quality checks
- SQL analysis queries
- SQL views for reporting
- Power BI dashboard pages
- Dashboard screenshots
- Executive summary, methodology and business recommendations reports

---

## Skills Demonstrated

| Skill Area          | Evidence in This Project                                                           |
| ------------------- | ---------------------------------------------------------------------------------- |
| Data understanding  | Loaded and inspected multiple raw CSV files                                        |
| Data quality        | Checked missing values, duplicates, key columns and data types                     |
| Data cleaning       | Converted date fields, filtered delivered orders and created delivery fields       |
| Feature engineering | Created delivery days, delay days and late delivery flags                          |
| Python              | Used pandas, numpy and Jupyter notebooks for analysis                              |
| SQL                 | Created SQLite database, data quality checks, analysis queries and reporting views |
| Power BI            | Built executive, delivery performance and product/freight dashboard pages          |
| Business analysis   | Converted data patterns into operational findings and recommendations              |
| Data storytelling   | Documented the project clearly for business and technical audiences                |
| GitHub              | Published a structured portfolio project with documentation and screenshots        |

---

## Key Business Questions

This project explores:

1. What percentage of delivered orders arrived late?
2. Do late deliveries receive lower customer review scores?
3. Which customer states have higher late delivery rates?
4. Which product categories have higher freight costs?
5. Which product categories show higher late delivery risk?
6. Where is seller activity concentrated?
7. What operational actions could reduce fulfilment risk and improve customer satisfaction?

---

## Dashboard Pages

| Page                                  | Purpose                                                                                         |
| ------------------------------------- | ----------------------------------------------------------------------------------------------- |
| Executive Summary                     | High-level KPI overview of orders, late delivery, delivery days, review score and freight value |
| Delivery Performance                  | Regional delivery performance, delay bands and review score impact                              |
| Product, Freight & Seller Performance | Product category, freight cost, seller state and fulfilment risk analysis                       |

## Dashboard Preview

The Power BI dashboard contains three report pages:

1. Executive Summary
2. Delivery Performance
3. Product, Freight & Seller Performance

### Executive Summary

This page provides a high-level overview of delivered orders, late delivery rate, average delivery days, review score, freight value and customer state order volume.

![Executive Summary Dashboard](powerbi/dashboard_screenshots/executive_summary.png)

---

### Delivery Performance

This page focuses on regional delivery performance, late delivery rate, average delivery days, delay bands and the relationship between delivery performance and customer review score.

![Delivery Performance Dashboard](powerbi/dashboard_screenshots/delivery_performance.png)

---

### Product, Freight & Seller Performance

This page analyses product category order volume, freight cost, late delivery rate by product category, seller state concentration and review score by category.

![Product Freight Seller Dashboard](powerbi/dashboard_screenshots/product_freight_seller_performance.png)

---

## Project Summary

This project is an end-to-end data analysis portfolio project focused on e-commerce fulfilment, delivery performance, freight cost, customer satisfaction and late delivery risk.

The project uses the Olist Brazilian E-Commerce Public Dataset and demonstrates Python, SQL, SQLite, Power BI, GitHub documentation and business analysis skills.

## Tools Used

- Python
- pandas
- SQL / SQLite
- Power BI
- Git and GitHub
- VS Code
- Jupyter Notebook

## Project Pipeline

Raw CSV files → Python cleaning → Processed datasets → SQLite database → SQL views → Power BI dashboard

---

## Key Outputs

This project includes the following completed outputs:

- Data understanding notebook
- Data cleaning and preparation notebook
- Exploratory data analysis notebook
- Cleaned processed datasets
- Analysis-ready master dataset
- SQLite database
- SQL data quality checks
- SQL analysis queries
- SQL views for Power BI
- Power BI dashboard file
- Dashboard screenshots
- Executive summary report
- Methodology report
- Business recommendations report

---

## Reports

The project includes three written report files:

| Report                                                          | Purpose                                                                                           |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| [Executive Summary](reports/executive_summary.md)               | Summarises the project purpose, dashboard KPIs, key findings, limitations and future improvements |
| [Methodology](reports/methodology.md)                           | Explains the end-to-end project approach, tools, data preparation and analysis process            |
| [Business Recommendations](reports/business_recommendations.md) | Converts the analysis into practical actions for an e-commerce fulfilment or operations team      |

---

## How to Run This Project

To run this project locally:

1. Clone the repository.
2. Create a Python virtual environment.
3. Install the required packages from `requirements.txt`.
4. Download the Olist Brazilian E-Commerce Public Dataset from Kaggle.
5. Place the raw CSV files inside `data/raw/`.
6. Run the notebooks in order:
   - `01_data_understanding.ipynb`
   - `02_data_cleaning.ipynb`
   - `03_exploratory_data_analysis.ipynb`
7. Run the Python scripts in `src/` to create the SQLite database and export Power BI views.
8. Open `powerbi/dashboard.pbix` in Power BI Desktop.

Raw data files are not uploaded to this repository. Users should download the dataset directly from the original source.

## CV-Ready Project Summary

**E-commerce Fulfilment & Delivery Performance Analysis**  
Built an end-to-end data analysis project using Python, SQL, SQLite and Power BI to analyse e-commerce delivery performance, late delivery risk, freight cost, seller geography, product category behaviour and customer review impact. Created cleaned datasets, SQL analysis queries, reporting views, an interactive Power BI dashboard and business recommendations for fulfilment operations.

### Technical Highlights

- Cleaned and prepared multi-table e-commerce order data using Python and pandas.
- Created an analysis-ready master dataset combining orders, customers, products, sellers, payments, freight and reviews.
- Built SQLite database tables, SQL quality checks, SQL analysis queries and Power BI reporting views.
- Developed a Power BI dashboard covering executive KPIs, delivery performance, product categories, freight cost and seller state analysis.

### Business Highlights

- Identified that late deliveries had a clear negative impact on customer review score.
- Analysed regional delivery performance and customer state-level fulfilment risk.
- Highlighted product categories with higher freight cost and late delivery exposure.
- Produced practical recommendations for fulfilment monitoring, regional investigation, freight cost review and future late delivery prediction.

## Current Project Status

**Current stage:** Power BI dashboard created and documented.

**Next stage:** Final portfolio polish, CV project write-up and interview story.

## Interview Talking Point

I chose this project because it connects directly to fulfilment, logistics and operations performance. In an e-commerce operation, late delivery is not just a reporting metric; it affects customer experience, review scores, service performance and business reputation.

I used the Olist public dataset to build a full analytics workflow. I started by understanding and checking the raw data, then cleaned and prepared the orders, created delivery performance fields, joined multiple tables into an analysis-ready dataset, created a SQLite database, wrote SQL queries and built a Power BI dashboard.

The project demonstrates that I can combine operational thinking with technical data skills. I can take a business problem, prepare the data, analyse performance, build dashboards and explain the findings in a way that supports management decision-making.
