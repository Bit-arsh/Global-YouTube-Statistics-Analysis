-- Channels where country is missing
SELECT *
FROM youtube_statistics
WHERE country IS NULL;
SELECT *
FROM youtube_statistics
WHERE category IS NULL;
SELECT *
FROM youtube_statistics
WHERE created_year IS NULL;
SELECT
COUNT(country) AS country_not_null,
COUNT(category) AS category_not_null,
COUNT(created_year) AS year_not_null
FROM youtube_statistics;
SELECT UPPER(youtuber) AS channel_name
FROM youtube_statistics;
SELECT LOWER(youtuber) AS channel_name
FROM youtube_statistics;
SELECT youtuber,
LENGTH(youtuber) AS characters
FROM youtube_statistics;
SELECT
youtuber,
LEFT(youtuber,10) AS short_name
FROM youtube_statistics;
SELECT
youtuber,
RIGHT(youtuber,5) AS ending
FROM youtube_statistics;
SELECT *
FROM youtube_statistics
WHERE youtuber LIKE '%Music%';
SELECT youtuber
FROM youtube_statistics
WHERE youtuber LIKE 'A%';
SELECT youtuber
FROM youtube_statistics
WHERE youtuber LIKE '%TV';
SELECT
youtuber,
subscribers,

CASE
WHEN subscribers >= 100000000 THEN 'Mega Creator'
WHEN subscribers >= 50000000 THEN 'Large Creator'
WHEN subscribers >= 10000000 THEN 'Medium Creator'
ELSE 'Small Creator'
END AS creator_level

FROM youtube_statistics;
SELECT
youtuber,
uploads,

CASE
WHEN uploads >= 10000 THEN 'Very Active'
WHEN uploads >= 3000 THEN 'Active'
ELSE 'Less Active'
END AS upload_level

FROM youtube_statistics;
SELECT
youtuber,
highest_yearly_earnings,

CASE

WHEN highest_yearly_earnings >= 50000000 THEN 'Very High'

WHEN highest_yearly_earnings >= 10000000 THEN 'High'

WHEN highest_yearly_earnings >= 1000000 THEN 'Medium'

ELSE 'Low'

END AS earning_level

FROM youtube_statistics;
SELECT DISTINCT country
FROM youtube_statistics
ORDER BY country;
SELECT DISTINCT country
FROM youtube_statistics
ORDER BY country;
SELECT DISTINCT category
FROM youtube_statistics;
SELECT
channel_type,
COUNT(*) AS total
FROM youtube_statistics
GROUP BY channel_type
ORDER BY total DESC;
SELECT
youtuber,
LENGTH(youtuber) AS length
FROM youtube_statistics
ORDER BY length DESC
LIMIT 10;
SELECT

CASE

WHEN subscribers >=100000000 THEN 'Mega'

WHEN subscribers >=50000000 THEN 'Large'

WHEN subscribers >=10000000 THEN 'Medium'

ELSE 'Small'

END AS creator_level,

COUNT(*) AS total_channels

FROM youtube_statistics

GROUP BY creator_level

ORDER BY total_channels DESC;