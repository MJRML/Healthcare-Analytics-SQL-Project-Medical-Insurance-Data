/* ============================================================
   Query 1: Average Charges by Smoking Status
   Purpose: Compare cost differences between smokers and non-smokers
   Techniques: GROUP BY, AVG(), ORDER BY
   ============================================================ */
SELECT smoker,
       ROUND(AVG(charges), 2) AS avg_charges
FROM medical_insurance
GROUP BY smoker
ORDER BY avg_charges DESC;
