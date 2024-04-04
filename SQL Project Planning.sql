/*
Two different ways to solve the SQL Project Planning problem on HackerRank in ORACLE SQL

https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true


Taking advantage of joins, where conditions, and not exists, we can have a relatively fast implementation
such that SQL optimizer can use anti-joins to rapidly evaluate the output.
*/

SELECT  
    P.Start_Date AS Project_Start_Date, 
    MIN(P2.End_Date) AS Project_End_Date
FROM 
    Projects P
INNER JOIN 
    Projects P2 ON P.Start_Date < P2.End_Date
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM Projects 
        WHERE End_Date = P.Start_Date
    )
AND 
    NOT EXISTS (
        SELECT 1 
        FROM Projects 
        WHERE Start_Date = P2.End_Date
    )
GROUP BY 
    P.Start_Date
ORDER BY 
    (Project_End_Date - Project_Start_Date), 
    Project_Start_Date;