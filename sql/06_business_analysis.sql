SELECT
    country,
    SUM(subscribers) AS total_subscribers
FROM youtube_statistics
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_subscribers DESC
LIMIT 10;
SELECT
    country,
    SUM(video_views) AS total_views
FROM youtube_statistics
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_views DESC
LIMIT 10;
SELECT
    country,
    COUNT(*) AS total_channels
FROM youtube_statistics
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_channels DESC;
SELECT
    category,
    ROUND(AVG(subscribers),0) AS avg_subscribers
FROM youtube_statistics
WHERE category IS NOT NULL
GROUP BY category
ORDER BY avg_subscribers DESC;
SELECT
    category,
    ROUND(AVG(highest_yearly_earnings),2) AS avg_earnings
FROM youtube_statistics
GROUP BY category
ORDER BY avg_earnings DESC;
SELECT
    category,
    SUM(uploads) AS total_uploads
FROM youtube_statistics
GROUP BY category
ORDER BY total_uploads DESC;
SELECT
    youtuber,
    highest_yearly_earnings
FROM youtube_statistics
ORDER BY highest_yearly_earnings DESC
LIMIT 10;
SELECT
    channel_type,
    ROUND(AVG(highest_yearly_earnings),2) AS avg_earnings
FROM youtube_statistics
GROUP BY channel_type
ORDER BY avg_earnings DESC;
SELECT
    youtuber,
    subscribers_last_30_days
FROM youtube_statistics
ORDER BY subscribers_last_30_days DESC
LIMIT 10;
SELECT
    youtuber,
    video_views_last_30_days
FROM youtube_statistics
ORDER BY video_views_last_30_days DESC
LIMIT 10;
SELECT
    youtuber,
    uploads
FROM youtube_statistics
ORDER BY uploads DESC
LIMIT 10;
SELECT
    country,
    ROUND(AVG(uploads),0) AS avg_uploads
FROM youtube_statistics
GROUP BY country
ORDER BY avg_uploads DESC;
SELECT
    country,
    unemployment_rate
FROM youtube_statistics
GROUP BY country, unemployment_rate
ORDER BY unemployment_rate DESC;
SELECT
    country,
    gross_tertiary_education_enrollment
FROM youtube_statistics
GROUP BY country, gross_tertiary_education_enrollment
ORDER BY gross_tertiary_education_enrollment DESC;
SELECT
    created_year,
    COUNT(*) AS channels_created
FROM youtube_statistics
WHERE created_year IS NOT NULL
GROUP BY created_year
ORDER BY created_year;
SELECT
    youtuber,
    created_year
FROM youtube_statistics
ORDER BY created_year
LIMIT 10;
SELECT
    rank_no,
    youtuber,
    subscribers
FROM youtube_statistics
ORDER BY rank_no;
SELECT
    rank_no,
    youtuber,
    subscribers
FROM youtube_statistics
WHERE country='India'
ORDER BY rank_no;
SELECT
    youtuber,
    subscribers
FROM youtube_statistics
WHERE subscribers>100000000
ORDER BY subscribers DESC;
SELECT
    youtuber,
    highest_yearly_earnings
FROM youtube_statistics
WHERE highest_yearly_earnings>50000000
ORDER BY highest_yearly_earnings DESC;
