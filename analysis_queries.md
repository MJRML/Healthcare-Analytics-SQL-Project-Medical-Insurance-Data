# Healthcare Analytics — Medical Insurance Dataset

This file contains 15 SQL queries analyzing the medical insurance dataset.  
Each query includes its purpose, SQL code, a screenshot placeholder, and key insights.

---

## Query 1: Average Charges by Smoking Status

**Purpose:** Compare cost differences between smokers and non-smokers.  
**Techniques:** GROUP BY, AVG(), ORDER BY

```sql
SELECT
  smoker,
  ROUND(AVG(charges), 2) AS avg_charges
FROM
  medical_insurance
GROUP BY
  smoker
ORDER BY
  avg_charges DESC;
```

![Query1](Images/query_1.png)  

**Insight:** Smokers tend to have significantly higher insurance charges.

---

## Query 2: Average Charges by Region

**Purpose:** Identify regions with the highest healthcare costs.  
**Techniques:** GROUP BY, AVG(), ORDER BY  

```sql
SELECT
  region,
  ROUND(AVG(charges), 2) AS avg_charges
FROM
  medical_insurance
GROUP BY
  region
ORDER BY
  avg_charges DESC;
```

![Query2](Images/query_2.png)  

**Insight:**
Charges vary across regions, likely reflecting demographics and healthcare costs.

---

## Query 3: Average Charges by BMI Category

**Purpose:** Analyze how BMI impacts insurance charges.  
**Techniques:** CASE WHEN, GROUP BY, ORDER BY

```sql
SELECT
    CASE
        WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END AS bmi_category,
    ROUND(AVG(charges), 2) AS avg_charges
FROM
  medical_insurance
GROUP BY
  bmi_category
ORDER BY
  avg_charges DESC;
```

![Query3](Images/query__3.png)  

**Insight:**
Obese patients have the highest average medical charges.

--

## Query 4: Top 10 Most Expensive Patients

**Purpose:** Identify patients with the highest medical charges.  
**Techniques:** ORDER BY, LIMIT  

```sql
SELECT *
FROM
  medical_insurance
ORDER BY
  charges DESC
LIMIT 10;
```

![Query4](Images/query_4.png)  

**Insight:**
Highlights extreme outliers in medical costs.

---

## Query 5: Average Charges by Number of Children

**Purpose:** Examine how family size affects medical costs.  
**Techniques:** GROUP BY, AVG()

```sql
SELECT
  children,
  ROUND(AVG(charges), 2) AS avg_charges
FROM
  medical_insurance
GROUP BY
  children
ORDER BY
  children;
```

![Query5](Images/query_5.png)  

**Insight:**
Families with more children tend to incur slightly higher costs.

---

## Query 6: Charges by Age Group

**Purpose:** Group patients into age categories and analyze charges.   
**Techniques:** CASE WHEN, GROUP BY, ORDER BY

```sql
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18–25'
        WHEN age BETWEEN 26 AND 35 THEN '26–35'
        WHEN age BETWEEN 36 AND 45 THEN '36–45'
        WHEN age BETWEEN 46 AND 55 THEN '46–60'
        ELSE '60+'
    END AS age_group,
    ROUND(AVG(charges), 2) AS avg_charges
FROM
  medical_insurance
GROUP BY
  age_group
ORDER BY
  avg_charges DESC;
```

![Query6](Images/query_6.png)  

**Insight:**
Older age groups generally have higher medical costs.

---

## Query 7: Gender-Based Cost Comparison

**Purpose:** Compare average medical charges between male and female patients.  
**Techniques:** GROUP BY, AVG()

```sql
SELECT
  sex,
  ROUND(AVG(charges), 2) AS avg_charges
FROM
  medical_insurance
GROUP BY
  sex;
```

![Query7](Images/query_7.png) 

**Insight:**
Shows any gender-based difference in healthcare spending.

---

## Query 8: BMI and Charges Ranking  

**Purpose:** Rank patients by BMI and medical charges.
**Techniques:** RANK() OVER, ORDER BY

```sql
SELECT
  age,
  sex,
  bmi,
  charges,
  RANK() OVER (ORDER BY charges DESC) AS charge_rank,
  RANK() OVER (ORDER BY bmi DESC) AS bmi_rank
FROM
  medical_insurance
ORDER BY
  charge_rank;
```
![Query8](Images/query_8.png)  

**Insight:**
Helps visualize correlation between BMI rank and charges rank.
