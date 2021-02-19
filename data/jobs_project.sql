-- #1 SELECT COUNT(*) FROM data_analyst_jobs; 1793 rows
-- #2 SELECT * FROM data_analyst_jobs LIMIT 10; ExxonMobil
-- #3a SELECT COUNT(*) FROM data_analyst_jobs WHERE location = 'TN'; 21
-- #3b SELECT COUNT(*) FROM data_analyst_jobs WHERE location = 'TN' OR location ='KY'; 27
/* #4 SELECT COUNT(*) FROM data_analyst_jobs 
WHERE location = 'TN'
AND star_rating > 4; 3 */
/* #5 SELECT COUNT(*) FROM data_analyst_jobs 
WHERE review_count > 500 AND review_count < 1000; 150 */
/* #6 SELECT location AS state, AVG(star_rating) AS avg_rating 
FROM data_analyst_jobs
GROUP BY state
ORDER BY avg_rating DESC; NE */
/* #7 SELECT DISTINCT title FROM data_analyst_jobs; 881 */
/* #8 SELECT DISTINCT title FROM data_analyst_jobs WHERE location = 'CA'; 230 */
/* #9 SELECT company AS name, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY name; 41 - should there be null results? */
/* #10 SELECT company AS name, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY name
ORDER BY avg_rating DESC; General Motors 4.2, top 5 are exactly the same? */
/* #11 SELECT DISTINCT title 
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%'; 754 */
/* #12 SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' AND title NOT LIKE '%Analytics%'; 
26 They mostly have those words just in all lowercase or all caps */
/* Bonus SELECT domain, COUNT(domain) AS number_of_jobs
FROM data_analyst_jobs
WHERE domain IS NOT null
AND skill LIKE '%SQL'
AND days_since_posting > 21 
GROUP BY domain
ORDER BY number_of_jobs DESC; 
Consulting (30), internet(19), health care(17), and finance(12) */