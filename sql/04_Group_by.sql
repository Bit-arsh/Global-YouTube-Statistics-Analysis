-- Number of channels by country
SELECT country,
       COUNT(*) AS total_channels
FROM youtube_statistics
GROUP BY country
ORDER BY total_channels DESC;
SELECT category,
       COUNT(*) AS total_channels
FROM youtube_statistics
GROUP BY category
ORDER BY total_channels DESC;
SELECT category,
       ROUND(AVG(subscribers),0) AS avg_subscribers
FROM youtube_statistics
GROUP BY category
ORDER BY avg_subscribers DESC;
SELECT category,
       ROUND(AVG(video_views),0) AS avg_video_views
FROM youtube_statistics
GROUP BY category
ORDER BY avg_video_views DESC;
SELECT category,
       ROUND(AVG(uploads),0) AS avg_uploads
FROM youtube_statistics
GROUP BY category
ORDER BY avg_uploads DESC;
SELECT country,
       SUM(subscribers) AS total_subscribers
FROM youtube_statistics
GROUP BY country
ORDER BY total_subscribers DESC;
SELECT country,
       SUM(video_views) AS total_views
FROM youtube_statistics
GROUP BY country
ORDER BY total_views DESC;
SELECT category,
       MAX(subscribers) AS highest_subscribers
FROM youtube_statistics
GROUP BY category
ORDER BY highest_subscribers DESC;
SELECT category,
       ROUND(AVG(highest_yearly_earnings),2) AS avg_yearly_earnings
FROM youtube_statistics
GROUP BY category
ORDER BY avg_yearly_earnings DESC;
SELECT country,
       ROUND(AVG(highest_monthly_earnings),2) AS avg_monthly_earnings
FROM youtube_statistics
GROUP BY country
ORDER BY avg_monthly_earnings DESC;
SELECT country,
       COUNT(*) AS total_channels
FROM youtube_statistics
GROUP BY country
HAVING COUNT(*) > 20
ORDER BY total_channels DESC;
SELECT category,
       AVG(subscribers) AS avg_subscribers
FROM youtube_statistics
GROUP BY category
HAVING AVG(subscribers) > 50000000
ORDER BY avg_subscribers DESC;
SELECT country,
       SUM(video_views) AS total_views
FROM youtube_statistics
GROUP BY country
HAVING SUM(video_views) > 10000000000
ORDER BY total_views DESC;
SELECT category,
       COUNT(*) AS total_channels
FROM youtube_statistics
GROUP BY category
HAVING COUNT(*) > 30;
SELECT country,
       SUM(subscribers) AS total_subscribers
FROM youtube_statistics
GROUP BY country
ORDER BY total_subscribers DESC
LIMIT 10;
SELECT category,
       SUM(video_views) AS total_views
FROM youtube_statistics
GROUP BY category
ORDER BY total_views DESC
LIMIT 10;
SELECT channel_type,
       ROUND(AVG(subscribers),0) AS avg_subscribers
FROM youtube_statistics
GROUP BY channel_type
ORDER BY avg_subscribers DESC;
SELECT country,
       ROUND(AVG(highest_yearly_earnings),2) AS avg_earnings
FROM youtube_statistics
GROUP BY country
ORDER BY avg_earnings DESC;
SELECT channel_type,
       ROUND(AVG(uploads),0) AS avg_uploads
FROM youtube_statistics
GROUP BY channel_type
ORDER BY avg_uploads DESC;
SELECT channel_type,
       ROUND(AVG(uploads),0) AS avg_uploads
FROM youtube_statistics
GROUP BY channel_type
ORDER BY avg_uploads DESC;
SELECT created_year,
       COUNT(*) AS total_channels
FROM youtube_statistics
WHERE created_year IS NOT NULL
GROUP BY created_year
ORDER BY created_year;