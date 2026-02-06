select * from actual_vs_bud

SELECT
    DATENAME(MONTH, [Month_Start]) AS MonthName, 
    YEAR([Month_Start]) AS Year,
    MONTH([Month_Start]) AS MonthNumber,

    MAX(CASE WHEN Revenue_Type = 'Actual' THEN Net_Revenue_GBP END) AS Actual,
    MAX(CASE WHEN Revenue_Type = 'Budget' THEN Net_Revenue_GBP END) AS Budget,
    (MAX(CASE WHEN Revenue_Type = 'Actual' THEN Net_Revenue_GBP END) - 
        MAX(CASE WHEN Revenue_Type = 'Budget' THEN Net_Revenue_GBP END)) AS Variance,
    CASE 
        WHEN MAX(CASE WHEN Revenue_Type = 'Budget' THEN Net_Revenue_GBP END) = 0 THEN NULL
        ELSE (MAX(CASE WHEN Revenue_Type = 'Actual' THEN Net_Revenue_GBP END) - 
              MAX(CASE WHEN Revenue_Type = 'Budget' THEN Net_Revenue_GBP END)) * 100.0 /
             MAX(CASE WHEN Revenue_Type = 'Budget' THEN Net_Revenue_GBP END)
    END AS VariancePct
FROM 
    actual_vs_bud 
GROUP BY 
    [Month_Start] 
ORDER BY 
    [Month_Start];

