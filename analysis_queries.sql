-- Query 1: Average Charges by Smoking Status
-- Description: Compare average medical costs between smokers and non-smokers

SELECT smoker, 
       ROUND(AVG(charges), 2) AS avg_charges
FROM medical_insurance
GROUP BY smoker
ORDER BY avg_charges DESC;
