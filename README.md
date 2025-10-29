# Healthcare Analytics SQL Project — *Medical Insurance Data*

## Overview
This project analyzes a **medical insurance dataset** using **PostgreSQL** to uncover insights about healthcare costs, lifestyle factors, and regional patterns.  
SQL skills, including **aggregations, window functions, CTEs, conditional logic**, and **percentile analysis** 

---

## Dataset

**Table name:** medical_insurance     
Imported from a CSV file (**insurance.csv**) **https://www.kaggle.com/datasets/mirichoi0218/insurance?resource=download**

| Column | Type | Description |
|---------|------|-------------|
| `age` | INT | Age of the insured person |
| `sex` | VARCHAR(10) | Gender (male/female) |
| `bmi` | DECIMAL(5,2) | Body Mass Index |
| `children` | INT | Number of dependents covered by insurance |
| `smoker` | VARCHAR(5) | Smoking status (`yes` / `no`) |
| `region` | VARCHAR(25) | Residential area in the US |
| `charges` | DECIMAL(10,2) | Individual medical costs billed by health insurance |

---

## Table Creation


CREATE TABLE medical_insurance (  
    age INT,  
    sex VARCHAR(10),  
    bmi DECIMAL(5,2),  
    children INT,  
    smoker VARCHAR(5),  
    region VARCHAR(25),  
    charges DECIMAL(10,2)  
);

## SQL Techniques Demonstrated

This project covers 15 analytical SQL techniques grouped by skill level.

| Skill | Techniques |
|--------|-------------|
| **Aggregation & Grouping** | `AVG()`, `SUM()`, `GROUP BY`, `ORDER BY` |
| **Conditional Logic** | `CASE WHEN` for categorization |
| **Filtering & Ranking** | `LIMIT`, `RANK()`, `PERCENTILE_CONT()` |
| **Window Functions** | `RANK() OVER`, `SUM() OVER (PARTITION BY …)` |
| **Common Table Expressions (CTEs)** | Used for step-by-step analysis |
| **Data Segmentation** | Age groups, BMI categories, smoker status |
| **Outlier Detection** | Top 10% charges using percentile analysis |

---

## Analysis Queries

Below are the 15 SQL queries implemented in `analysis_queries.sql`:

| # | Query | Description |
|---|-------|--------------|
| 1 | **Average Charges by Smoking Status** | Compare cost differences between smokers and non-smokers |
| 2 | **Average Charges by Region** | Identify regions with highest healthcare costs |
| 3 | **Average Charges by BMI Category** | Analyze impact of BMI on insurance charges |
| 4 | **Top 10 Most Expensive Patients** | Retrieve highest medical expenses |
| 5 | **Average Charges by Number of Children** | Assess relationship between family size and cost |
| 6 | **Charges by Age Group** | Group patients into age categories |
| 7 | **Gender-Based Cost Comparison** | Compare male vs female average charges |
| 8 | **BMI and Charges Ranking** | Rank patients by BMI and charges |
| 9 | **Smoker vs Non-Smoker by Region** | Regional smoker cost comparison |
| 10 | **High-Cost Patients (Top 10%)** | Identify 90th percentile of medical charges |
| 11 | **Top 3 Patients per Region** | Use window functions to rank within partitions |
| 12 | **Smoker Impact by BMI Category** | Two-dimensional analysis (BMI + smoker) |
| 13 | **Age-Adjusted High-Cost Patients** | Compare charges to age-group averages (CTE) |
| 14 | **Regional Charge Contribution** | Compute patient’s % of total regional costs |
| 15 | **Outlier Detection (High BMI + High Charges)** | Identify extreme health and cost outliers |

---

## Key Insights

-  **Smokers** have significantly higher medical costs compared to non-smokers, highlighting lifestyle as a major cost driver.  
-  **BMI** is strongly correlated with insurance charges — obese individuals tend to incur higher expenses.  
-  **Age** and **number of children** moderately influence total charges, with middle-aged patients showing higher averages.  
-  **Regional differences** exist — certain regions have consistently higher healthcare costs, possibly due to demographic or lifestyle factors.  
-  The **top 10% of patients** account for a disproportionately large share of total medical expenses, indicating cost concentration.  
-  Combining **smoking status** and **BMI category** gives a clearer picture of risk-based cost variation.  
-  Outlier detection using percentiles helps identify extreme cases useful for predictive modeling and policy adjustments.

---

-  ### Example Query — High-Cost Patients (Top 10%)

```sql
SELECT *
FROM medical_insurance
WHERE charges >= (
    SELECT PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY charges)
    FROM medical_insurance
)
ORDER BY charges DESC;
