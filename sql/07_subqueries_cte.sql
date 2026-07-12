-- Business Question:
-- Which channels have more subscribers than the average channel?
SELECT
    youtuber,
    subscribers
FROM youtube_statistics
WHERE subscribers >
(
    SELECT AVG(subscribers)
    FROM youtube_statistics
)
ORDER BY subscribers DESC;
SELECT
    youtuber,
    video_views
FROM youtube_statistics
WHERE video_views >
(
    SELECT AVG(video_views)
    FROM youtube_statistics
)
ORDER BY video_views DESC;
SELECT
    youtuber,
    highest_yearly_earnings
FROM youtube_statistics
WHERE highest_yearly_earnings =
(
    SELECT MAX(highest_yearly_earnings)
    FROM youtube_statistics
);
SELECT
    youtuber,
    created_year
FROM youtube_statistics
WHERE created_year =
(
    SELECT MIN(created_year)
    FROM youtube_statistics
);
SELECT
    youtuber,
    category,
    subscribers
FROM youtube_statistics t1
WHERE subscribers >
(
    SELECT AVG(subscribers)
    FROM youtube_statistics t2
    WHERE t1.category = t2.category
);
SELECT
    youtuber,
    country,
    highest_yearly_earnings
FROM youtube_statistics t1
WHERE highest_yearly_earnings >
(
    SELECT AVG(highest_yearly_earnings)
    FROM youtube_statistics t2
    WHERE t1.country = t2.country
);
WITH CountryAverage AS
(
SELECT
country,
AVG(subscribers) AS avg_subscribers
FROM youtube_statistics
GROUP BY country
)

SELECT *
FROM CountryAverage
ORDER BY avg_subscribers DESC;
SELECT version();
WITH CountryAverage AS
(
SELECT
country,
AVG(subscribers) avg_subscribers
FROM youtube_statistics
GROUP BY country
)

SELECT *
FROM CountryAverage
WHERE avg_subscribers >
(
SELECT AVG(subscribers)
FROM youtube_statistics
);
WITH CategoryEarnings AS
(
SELECT
category,
AVG(highest_yearly_earnings) avg_earnings
FROM youtube_statistics
GROUP BY category
)

SELECT *
FROM CategoryEarnings
ORDER BY avg_earnings DESC;
WITH CountrySubscribers AS
(
SELECT
country,
SUM(subscribers) total_subscribers
FROM youtube_statistics
GROUP BY country
)

SELECT *
FROM CountrySubscribers
ORDER BY total_subscribers DESC;
SELECT
youtuber,
subscribers
FROM
(
SELECT *
FROM youtube_statistics
WHERE subscribers >
(
SELECT AVG(subscribers)
FROM youtube_statistics
)
) AS TopChannels

ORDER BY subscribers DESC
LIMIT 10;
SELECT *
FROM
(
SELECT
category,
AVG(uploads) avg_uploads
FROM youtube_statistics
GROUP BY category
) t

WHERE avg_uploads >
(
SELECT AVG(uploads)
FROM youtube_statistics
);
SELECT
country,
SUM(subscribers) total_subscribers
FROM youtube_statistics
GROUP BY country
HAVING total_subscribers >
(
SELECT SUM(subscribers)
FROM youtube_statistics
WHERE country='India'
);
SELECT
category,
AVG(highest_yearly_earnings) avg_earnings
FROM youtube_statistics
GROUP BY category
HAVING avg_earnings >
(
SELECT AVG(highest_yearly_earnings)
FROM youtube_statistics
WHERE category='Entertainment'
);
WITH CountryCounts AS
(
SELECT
country,
COUNT(*) total_channels
FROM youtube_statistics
GROUP BY country
)

SELECT *
FROM CountryCounts
WHERE total_channels >
(
SELECT AVG(total_channels)
FROM CountryCounts
);
SELECT
category,
MAX(subscribers) highest_subscribers
FROM youtube_statistics
GROUP BY category;
SELECT
youtuber,
category,
uploads
FROM youtube_statistics t1

WHERE uploads =
(
SELECT MAX(uploads)
FROM youtube_statistics t2
WHERE t1.category=t2.category
);
SELECT
country,
AVG(highest_yearly_earnings) avg_earnings
FROM youtube_statistics
GROUP BY country
HAVING avg_earnings>20000000;
SELECT
youtuber,
country,
subscribers
FROM youtube_statistics t1

WHERE subscribers>
(
SELECT AVG(subscribers)
FROM youtube_statistics t2
WHERE t1.country=t2.country
);
SELECT
country,
AVG(video_views) avg_views
FROM youtube_statistics
GROUP BY country
ORDER BY avg_views DESC
LIMIT 5;



