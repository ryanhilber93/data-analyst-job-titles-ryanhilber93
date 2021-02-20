-- #1 
SELECT COUNT(*) FROM data_analyst_jobs; 
-- ans: 1793 rows 
-- #2  
SELECT * FROM data_analyst_jobs LIMIT 10; 
-- ans: ExxonMobil */ 
-- #3a 
SELECT COUNT(*) FROM data_analyst_jobs WHERE location = 'TN'; 
-- ans: 21 
-- #3b 
SELECT COUNT(*) FROM data_analyst_jobs WHERE location = 'TN' OR location ='KY';
-- ans: 27 
-- could have used WHERE location IN ('TN', 'KY') b/c then could easily add more states
-- #4 
SELECT COUNT(*) FROM data_analyst_jobs 
WHERE location = 'TN'
AND star_rating > 4;
-- ans: 3 
-- #5 
SELECT COUNT(*) FROM data_analyst_jobs 
WHERE review_count BETWEEN 500 AND 1000
-- ans: 151
-- #6 
SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating 
FROM data_analyst_jobs
WHERE location IS NOT null AND star_rating IS NOT null
GROUP BY state
ORDER BY avg_rating DESC; 
-- or
SELECT location as state, ROUND(AVG(star_rating), 2) as avg_stars
FROM (SELECT DISTINCT company, location, star_rating
	FROM data_analyst_jobs
	WHERE location IS NOT NULL and star_rating IS NOT NULL) sub
GROUP BY location
ORDER BY avg_stars DESC;
-- second way accounts for companies with more than one entry per state
--ans: NE 
-- #7 
SELECT COUNT(DISTINCT title) FROM data_analyst_jobs; 
-- ans: 881 
-- #8 
SELECT COUNT(DISTINCT title) FROM data_analyst_jobs WHERE location = 'CA'; 
-- ans: 230 
-- #9 
SELECT company AS name, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT null
GROUP BY name; 
-- ans: 40  
-- #10 
SELECT company AS name, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY name
ORDER BY avg_rating DESC; 
-- ans: General Motors 4.2, top 6 are exactly the same? 
-- #11 
SELECT DISTINCT title 
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'; 
-- ans: if case sensitive - 754 
-- ans: if not case sesitive - 774
-- #12 
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%'; 
-- ans: 26 if case sensitive - analyst w/ all lowercase or all caps 
-- ans: 4 if not case sensitive - data/tableau
-- Bonus 
SELECT domain, COUNT(domain) AS number_of_jobs
FROM data_analyst_jobs
WHERE domain IS NOT null
AND skill ILIKE '%SQL%'
AND days_since_posting > 21 
GROUP BY domain
ORDER BY number_of_jobs DESC; 
-- ans: Internet (62), finance (61), consulting (57), health care (52)