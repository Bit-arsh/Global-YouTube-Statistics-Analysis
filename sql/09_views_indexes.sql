CREATE VIEW top_channels AS
SELECT
    youtuber,
    subscribers,
    country,
    category
FROM youtube_statistics
WHERE subscribers > 100000000;
SELECT *
FROM top_channels;
CREATE VIEW country_summary AS
SELECT
    country,
    COUNT(*) AS total_channels,
    SUM(subscribers) AS total_subscribers
FROM youtube_statistics
GROUP BY country;
SELECT *
FROM country_summary
ORDER BY total_subscribers DESC;
DROP VIEW top_channels;
CREATE INDEX idx_country
ON youtube_statistics(country);
CREATE INDEX idx_category
ON youtube_statistics(category);
CREATE INDEX idx_subscribers
ON youtube_statistics(subscribers);
SHOW INDEX
FROM youtube_statistics;
CREATE TEMPORARY TABLE top10_channels AS
SELECT
    youtuber,
    subscribers
FROM youtube_statistics
ORDER BY subscribers DESC
LIMIT 10;
SELECT *
FROM top10_channels;
DELIMITER $$

CREATE PROCEDURE GetIndianChannels()
BEGIN
    SELECT *
    FROM youtube_statistics
    WHERE country = 'India';
END $$

DELIMITER ;
CALL GetIndianChannels();
DELIMITER $$

CREATE PROCEDURE GetChannelsByCountry(IN country_name VARCHAR(100))
BEGIN
    SELECT
        youtuber,
        subscribers
    FROM youtube_statistics
    WHERE country = country_name;
END $$

DELIMITER ;
CALL GetChannelsByCountry('India');
CALL GetChannelsByCountry('United States');
SHOW TABLES;
DESCRIBE youtube_statistics;
SELECT COUNT(*)
FROM youtube_statistics;
SELECT
    table_name,
    ROUND((data_length + index_length)/1024/1024,2) AS size_mb
FROM information_schema.tables
WHERE table_schema = 'youtube_analytics';
CREATE VIEW business_dashboard AS
SELECT
    country,
    category,
    COUNT(*) AS channels,
    ROUND(AVG(subscribers),0) AS avg_subscribers,
    ROUND(AVG(highest_yearly_earnings),2) AS avg_earnings
FROM youtube_statistics
GROUP BY country, category;
SELECT *
FROM business_dashboard
ORDER BY avg_subscribers DESC;
SELECT *
FROM country_summary
ORDER BY total_subscribers DESC
LIMIT 5;
SELECT *
FROM top_channels
ORDER BY subscribers DESC;