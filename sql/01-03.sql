CREATE DATABASE youtube_analytics;
USE youtube_analytics;
CREATE TABLE youtube_statistics (
    rank_no INT,
    youtuber VARCHAR(255),
    subscribers BIGINT,
    video_views BIGINT,
    category VARCHAR(100),
    title VARCHAR(255),
    uploads INT,
    country VARCHAR(100),
    abbreviation VARCHAR(10),
    channel_type VARCHAR(100),
    video_views_rank INT,
    country_rank INT,
    channel_type_rank INT,
    video_views_last_30_days BIGINT,
    lowest_monthly_earnings DECIMAL(15,2),
    highest_monthly_earnings DECIMAL(15,2),
    lowest_yearly_earnings DECIMAL(15,2),
    highest_yearly_earnings DECIMAL(15,2),
    subscribers_last_30_days BIGINT,
    created_year INT,
    created_month VARCHAR(20),
    created_date INT,
    gross_tertiary_education_enrollment DECIMAL(5,2),
    population BIGINT,
    unemployment_rate DECIMAL(5,2),
    urban_population BIGINT,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6)
);
SHOW TABLES;
DESCRIBE youtube_statistics;
SELECT COUNT(*) FROM youtube_statistics;
SELECT * FROM youtube_statistics
LIMIT 10;
SELECT youtuber
FROM youtube_statistics;
SELECT youtuber, subscribers
FROM youtube_statistics;
SELECT country, category
FROM youtube_statistics;
SELECT COUNT(*)
FROM youtube_statistics;
SELECT COUNT(DISTINCT country)
FROM youtube_statistics;
SELECT COUNT(DISTINCT category)
FROM youtube_statistics;
SELECT youtuber, subscribers
FROM youtube_statistics
ORDER BY subscribers DESC
LIMIT 10;
SELECT youtuber, subscribers
FROM youtube_statistics
ORDER BY subscribers ASC
LIMIT 10;
SELECT youtuber, uploads
FROM youtube_statistics
ORDER BY uploads DESC
LIMIT 10;
SELECT *
FROM youtube_statistics
WHERE country = 'India';
SELECT *
FROM youtube_statistics
WHERE category = 'Music';
SELECT youtuber, subscribers
FROM youtube_statistics
WHERE subscribers > 100000000;
SELECT youtuber, created_year
FROM youtube_statistics
WHERE created_year > 2015;
SELECT MAX(subscribers)
FROM youtube_statistics;
SELECT MIN(subscribers)
FROM youtube_statistics;
SELECT AVG(subscribers)
FROM youtube_statistics;
SELECT MAX(video_views)
FROM youtube_statistics;
SELECT AVG(uploads)
FROM youtube_statistics;
SELECT version();



