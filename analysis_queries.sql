/* ============================================================
   Project: Healthcare Analytics — Medical Insurance Dataset
   File: analysis_queries.sql
   Description: 15 SQL queries demonstrating analytical skills
   ============================================================ */

/* ============================================================
   Query 1: Average Charges by Smoking Status
   Purpose: Compare cost differences between smokers and non-smokers
   Techniques: GROUP BY, AVG(), ORDER BY
   ============================================================ */
SELECT 
   smoker,
   ROUND(AVG(charges), 2) AS avg_charges
FROM 
   medical_insurance
GROUP BY 
   smoker
ORDER BY 
   avg_charges DESC;

![Query1](Images/query_1.png)






