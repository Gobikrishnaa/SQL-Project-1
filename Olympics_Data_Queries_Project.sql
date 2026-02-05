create database olympics_db;
use olympics_db;

create table olympics
( ID int, Name	varchar(100), Sex varchar(100), 	Age int,	Height	int, 
Weight	int , Team varchar(100), 	NOC varchar(100), 
	Games	varchar(100), Year int,	Season varchar(100), 	City varchar(100), 	
    Sport	varchar(100), Event	varchar(300), Medal varchar(100));

select* from olympics limit 200;

-- 1. Top 10 countries with the highest medals

SELECT n.reg AS country, COUNT(*) AS total_medals
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
WHERE o.Medal <> 'None'
GROUP BY n.reg
ORDER BY total_medals DESC
LIMIT 10;

-- 2. Country with the most Gold medals each year

WITH medal_count AS (
SELECT n.reg AS country, o.Year, COUNT(*) AS golds
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
WHERE o.Medal = 'Gold'
GROUP BY n.reg, o.Year
),
ranked AS (
SELECT country, Year, golds,
ROW_NUMBER() OVER (PARTITION BY Year ORDER BY golds DESC) AS rn
FROM medal_count
)
SELECT * 
FROM ranked 
WHERE rn = 1;

-- 3. Unique athletes per country

SELECT n.reg AS country, COUNT(DISTINCT o.Name) AS athletes
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
GROUP BY n.reg
having athletes >=1000
ORDER BY athletes DESC;

-- 4. Most successful athlete in each country

WITH medal_table AS (
SELECT n.reg AS country, o.Name, COUNT(*) AS medals
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
WHERE o.Medal <> 'None'
GROUP BY n.reg, o.Name
),
ranked AS (
SELECT country, Name, medals,
ROW_NUMBER() OVER (PARTITION BY country ORDER BY medals DESC) AS rn
FROM medal_table
)
SELECT * 
FROM ranked 
WHERE rn = 1;

-- 5. Medal trend pre/post 2000

SELECT n.reg AS country,
SUM(CASE WHEN Year < 2000 AND Medal <> 'None' THEN 1 ELSE 0 END) AS before_2000,
SUM(CASE WHEN Year >= 2000 AND Medal <> 'None' THEN 1 ELSE 0 END) AS after_2000
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
GROUP BY n.reg
limit 10;

-- 6.YoY medal growth(India)

WITH yearly AS (
SELECT n.reg AS country, Year, COUNT(*) AS medals
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
WHERE Medal <> 'None' and n.reg = "India"
GROUP BY n.reg, Year
)
SELECT country, Year, medals, medals - LAG(medals) OVER (PARTITION BY country ORDER BY Year) AS yoy_change
FROM yearly;

-- 7. Countries Winning Gold Without Winning Silver or Bronze

WITH medal_breakdown AS (SELECT n.reg AS country,
SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS golds,
SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS silvers,
SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS bronzes
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
GROUP BY n.reg
)
SELECT country, golds
FROM medal_breakdown
WHERE golds > 0 AND silvers = 0 AND bronzes = 0
ORDER BY golds DESC;

-- 8.Countries that won medals in every Olympic year

WITH medal_years AS (SELECT n.reg AS country,Year,COUNT(*) AS year_medals
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
WHERE Medal <> 'None'
GROUP BY n.reg, Year
),
country_years AS (
SELECT country,COUNT(*) AS years_with_medals,SUM(year_medals) AS total_medals
FROM medal_years
GROUP BY country
),
total_olympic_years AS (SELECT COUNT(DISTINCT Year) AS total_years
FROM olympics
)
SELECT c.country, c.total_medals, c.years_with_medals
FROM country_years c JOIN total_olympic_years t ON c.years_with_medals = t.total_years
ORDER BY total_medals DESC;

-- 9.Athletes with medal streaks 

WITH t AS (SELECT Name, Year,
ROW_NUMBER() OVER (PARTITION BY Name ORDER BY Year) AS rn
FROM olympics
WHERE Medal <> 'None'
)
SELECT distinct(Name), COUNT(*) AS streak
FROM t
GROUP BY Name, (Year - rn)
HAVING streak > 4
ORDER BY streak DESC;

-- 10. Youngest & oldest gold medalist

SELECT Name, Age, NOC, sport, Medal 
FROM olympics
WHERE Medal = 'Gold' AND Age !=0
ORDER BY Age ASC
LIMIT 1;

SELECT Name, Age, NOC, sport, Medal 
FROM olympics
WHERE Medal = 'Gold' AND Age IS NOT NULL
ORDER BY Age DESC
LIMIT 1;

-- 11. Countries Sending the Tallest Athletes (Avg Height)

SELECT n.reg AS country, ROUND(AVG(o.Height),2) AS avg_height
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
WHERE Height IS NOT NULL 
GROUP BY n.reg
having avg_height>=170
ORDER BY avg_height DESC;

-- 12. No.of countries paricipating in each sport

SELECT Sport, COUNT(DISTINCT n.reg) AS countries_involved
FROM olympics o JOIN noc_region n ON o.NOC = n.noc_region
GROUP BY Sport
ORDER BY countries_involved DESC;

-- 13. Average Height ,weight, Age of participants by sport
SELECT Sport, ROUND(AVG(Age),2) AS avg_age, ROUND(AVG(Height),2) AS avg_height, ROUND(AVG(Weight),2) AS avg_weight
FROM olympics
WHERE Age IS NOT NULL AND Height IS NOT NULL AND Weight IS NOT NULL
GROUP BY Sport
ORDER BY avg_height DESC;


-- 14.Sports growth over recent years

SELECT Sport,Year,COUNT(DISTINCT Name) AS participation,
LAG(COUNT(DISTINCT Name)) OVER (PARTITION BY Sport ORDER BY Year) AS prev_year_participation,
(COUNT(DISTINCT Name) - LAG(COUNT(DISTINCT Name)) OVER (PARTITION BY Sport ORDER BY Year)) AS growth
FROM olympics
where sport = "Boxing"
GROUP BY Sport, Year
ORDER BY Sport, Year;














