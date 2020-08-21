-- This is the first query:

 SELECT DISTINCT year from population_years;

-- Add your additional queries below:

 SELECT MAX(population)
 FROM population_years;

 SELECT *
 FROM population_years
 WHERE year = 2005
 ORDER BY population
 LIMIT 10;

 SELECT DISTINCT country
 FROM population_years
 WHERE year = 2010
   AND population > 100;

 SELECT COUNT(*)
 FROM population_years
 WHERE country LIKE '%Islands%';

 SELECT population
 WHERE (country = 'Indonesia'
           AND year = 2010)
 -      
       (country = 'Indonesia'
           AND year = 2000)
 FROM population_years;

-- This is the alternative with no subtraction operation

SELECT
  (SELECT population 
  FROM population_years
  WHERE country = 'Indonesia'
    AND year = 2010)
- 
  (SELECT population 
  FROM population_years
  WHERE country = 'Indonesia'
    AND year = 2000)
AS indonesia_growth;


-- This is the alternative with no subtraction operation

SELECT year, population
FROM population_years
WHERE 
    (country = 'Indonesia'
    AND year = 2010) 
  OR 
    (country = 'Indonesia'
    AND year = 2000)
ORDER BY year DESC;
