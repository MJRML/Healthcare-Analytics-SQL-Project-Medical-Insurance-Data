-- Query 1 — Average Charges by Smoking Status

-- Goal: Compare cost differences between smokers and non-smokers.
-- Skills: GROUP BY, AVG(), ORDER BY.

-- Query 1: Average Charges by Smoking Status
SELECT smoker,
       ROUND(AVG(charges), 2) AS avg_charges
FROM medical_insurance
GROUP BY smoker
ORDER BY avg_charges DESC;
