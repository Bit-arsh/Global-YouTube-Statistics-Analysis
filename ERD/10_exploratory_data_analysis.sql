#Dataset Overview
-- Total number of channels
SELECT COUNT(*) AS total_channels
FROM youtube_statistics;

-- Number of unique countries
SELECT COUNT(DISTINCT country) AS total_countries
FROM youtube_statistics;

-- Number of categories
SELECT COUNT(DISTINCT category) AS total_categories
FROM youtube_statistics;

-- Date range of channel creation
SELECT
MIN(created_year) AS oldest_year,
MAX(created_year) AS newest_year
FROM youtube_statistics;

#Subscriber Analysis-Buisness questions

-- Which are the Top 10 channels by subscribers?
SELECT
youtuber,
subscribers
FROM youtube_statistics
ORDER BY subscribers DESC
LIMIT 10;

-- Average subscribers by category
SELECT
category,
ROUND(AVG(subscribers),0) AS avg_subscribers
FROM youtube_statistics
GROUP BY category
ORDER BY avg_subscribers DESC;

-- Average subscribers by country
SELECT
country,
ROUND(AVG(subscribers),0) AS avg_subscribers
FROM youtube_statistics
GROUP BY country
ORDER BY avg_subscribers DESC;

#Video Views Analysis

-- Which channels have the highest video views?
SELECT
youtuber,
video_views
FROM youtube_statistics
ORDER BY video_views DESC
LIMIT 10;

-- Average video views per category
SELECT
category,
ROUND(AVG(video_views),0) AS avg_views
FROM youtube_statistics
GROUP BY category
ORDER BY avg_views DESC;

#Earnings Analysis

-- Highest earning channels
SELECT
youtuber,
highest_yearly_earnings
FROM youtube_statistics
ORDER BY highest_yearly_earnings DESC
LIMIT 10;

-- Average yearly earnings by category
SELECT
category,
ROUND(AVG(highest_yearly_earnings),2) AS avg_earnings
FROM youtube_statistics
GROUP BY category
ORDER BY avg_earnings DESC;

-- Average yearly earnings by country
SELECT
country,
ROUND(AVG(highest_yearly_earnings),2) AS avg_earnings
FROM youtube_statistics
GROUP BY country
ORDER BY avg_earnings DESC;

#Upload Analysis
-- Channels with most uploads
SELECT
youtuber,
uploads
FROM youtube_statistics
ORDER BY uploads DESC
LIMIT 10;

-- Average uploads by category
SELECT
category,
ROUND(AVG(uploads),0) AS avg_uploads
FROM youtube_statistics
GROUP BY category
ORDER BY avg_uploads DESC;

#Country Analysis

-- Number of creators by country
SELECT
country,
COUNT(*) AS total_channels
FROM youtube_statistics
GROUP BY country
ORDER BY total_channels DESC;

-- Total subscribers by country
SELECT
country,
SUM(subscribers) AS total_subscribers
FROM youtube_statistics
GROUP BY country
ORDER BY total_subscribers DESC;

#Category Analysis

-- Number of channels by category
SELECT
category,
COUNT(*) AS total_channels
FROM youtube_statistics
GROUP BY category
ORDER BY total_channels DESC;

-- Total subscribers by category
SELECT
category,
SUM(subscribers) AS total_subscribers
FROM youtube_statistics
GROUP BY category
ORDER BY total_subscribers DESC;

#Channel Age Analysis

-- Oldest channels
SELECT
youtuber,
created_year
FROM youtube_statistics
ORDER BY created_year ASC
LIMIT 10;

-- Newest channels
SELECT
youtuber,
created_year
FROM youtube_statistics
ORDER BY created_year DESC
LIMIT 10;

#Correlation Exploration

-- Do more uploads mean more subscribers?
SELECT
youtuber,
uploads,
subscribers
FROM youtube_statistics
ORDER BY uploads DESC;

-- Do more views mean higher earnings?
SELECT
youtuber,
video_views,
highest_yearly_earnings
FROM youtube_statistics
ORDER BY highest_yearly_earnings DESC;

#Top Performers
-- Top creator in each category
WITH Ranked AS (
SELECT
category,
youtuber,
subscribers,
ROW_NUMBER() OVER(
PARTITION BY category
ORDER BY subscribers DESC
) AS rn
FROM youtube_statistics
)

SELECT
category,
youtuber,
subscribers
FROM Ranked
WHERE rn=1;
