# Executive Summary

## Project Title

E-commerce Fulfilment & Delivery Performance Analysis

## Project Purpose

This project analyses e-commerce fulfilment and delivery performance using the Olist Brazilian E-Commerce Public Dataset.

The aim is to understand delivery performance, late delivery risk, freight cost patterns, customer review impact, seller geography and product category behaviour.

The project was built as an end-to-end data analyst portfolio project using Python, SQL, SQLite, Power BI and GitHub documentation.

---

## Key Dashboard KPIs

| KPI                      | Result |
| ------------------------ | -----: |
| Total Delivered Orders   |    96K |
| Late Delivered Orders    |     7K |
| Late Delivery Rate       |  6.77% |
| Average Delivery Days    |  12.09 |
| Average Days vs Estimate | -11.88 |
| Average Review Score     |   4.16 |
| Average Freight Value    |  22.79 |
| Total Freight Value      |  2.20M |
| Freight % of Item Value  |    17% |

---

## Key Findings

### 1. Most delivered orders were on time or early

The dashboard shows that approximately 93% of delivered orders were delivered on time or earlier than the estimated delivery date.

This suggests that the overall fulfilment and delivery process performed well across the dataset.

---

### 2. Late delivery had a clear negative impact on customer review score

The Power BI dashboard shows that late deliveries received a much lower average review score than orders delivered on time or early.

This suggests that delivery reliability is strongly linked to customer satisfaction.

From an operational perspective, reducing late deliveries could improve customer experience and protect marketplace reputation.

---

### 3. Delivery performance varied by customer state

The delivery performance page shows that some customer states had higher late delivery rates and longer average delivery days than others.

This suggests that geography may be an important driver of delivery performance.

A fulfilment or logistics team could use this insight to investigate regional delivery constraints, carrier performance or network coverage issues.

---

### 4. Product categories showed different freight cost patterns

The product and freight page shows that some product categories had much higher average freight values than others.

This may be linked to item size, weight, category type or fulfilment complexity.

This insight could support freight cost monitoring, product-level margin analysis and carrier pricing reviews.

---

### 5. Seller activity was concentrated in a small number of seller states

The seller state chart shows that seller activity was heavily concentrated in certain regions.

This may affect delivery performance because seller location can influence dispatch distance, carrier routing and delivery lead time.

A fulfilment team could use this to understand whether seller geography contributes to late delivery risk.

---

## Business Value

This project shows how e-commerce fulfilment data can be transformed into operational insight.

The dashboard could help a fulfilment or marketplace operations team:

- Track late delivery rate
- Identify high-risk customer regions
- Monitor product categories with high freight costs
- Compare review scores by delivery performance
- Understand seller geography and fulfilment concentration
- Prioritise areas for operational improvement

---

## Recommended Business Actions

1. Monitor late delivery rate as a core fulfilment KPI.
2. Investigate customer states with higher late delivery rates.
3. Review product categories with high freight cost and low review scores.
4. Analyse seller states with high order volume and late delivery risk.
5. Build proactive alerts for orders at risk of late delivery.
6. Use review score trends as a customer experience signal.
7. Combine delivery performance with carrier data if available.

---

## Limitations

This analysis is based on a public dataset and does not include all operational factors.

Key limitations include:

- The data is historical and covers a specific marketplace/time period.
- Carrier-level data is not available.
- Warehouse processing timestamps are not available.
- Stock availability data is not included.
- Some product or review fields contain missing values.
- Public dataset findings should not be assumed to represent all e-commerce markets.

---

## Future Improvements

Future improvements could include:

- Building a late delivery prediction model.
- Adding carrier-level data if available.
- Adding warehouse processing time analysis.
- Creating more advanced Power BI drill-through pages.
- Comparing customer review comments using text analysis.
- Building a Power BI refresh process.
- Rebuilding the database in PostgreSQL or SQL Server.
