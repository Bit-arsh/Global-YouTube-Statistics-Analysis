SELECT
    youtuber,
    subscribers,
    ROW_NUMBER() OVER (ORDER BY subscribers DESC) AS row_num
FROM youtube_statistics;
WITH RankedChannels AS (
    SELECT
        youtuber,
        subscribers,
        ROW_NUMBER() OVER (ORDER BY subscribers DESC) AS row_num
    FROM youtube_statistics
)

SELECT *
FROM RankedChannels
WHERE row_num <= 10;
SELECT
    youtuber,
    subscribers,
    RANK() OVER (ORDER BY subscribers DESC) AS ranking
FROM youtube_statistics;
SELECT
    youtuber,
    subscribers,
    DENSE_RANK() OVER (ORDER BY subscribers DESC) AS dr
FROM youtube_statistics;
SELECT
    country,
    youtuber,
    subscribers,
    ROW_NUMBER() OVER(
        PARTITION BY country
        ORDER BY subscribers DESC
    ) AS country_rank
FROM youtube_statistics;
WITH CountryRanking AS
(
SELECT
    country,
    youtuber,
    subscribers,
    ROW_NUMBER() OVER(
        PARTITION BY country
        ORDER BY subscribers DESC
    ) AS rn
FROM youtube_statistics
)

SELECT *
FROM CountryRanking
WHERE rn = 1;
WITH CategoryRanking AS
(
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

SELECT *
FROM CategoryRanking
WHERE rn = 1;
SELECT
    youtuber,
    subscribers,
    LAG(subscribers) OVER(
        ORDER BY subscribers DESC
    ) AS previous_subscribers
FROM youtube_statistics;
SELECT
    youtuber,
    subscribers,
    subscribers -
    LAG(subscribers) OVER(
        ORDER BY subscribers DESC
    ) AS difference
FROM youtube_statistics;
SELECT
    youtuber,
    subscribers,
    LEAD(subscribers) OVER(
        ORDER BY subscribers DESC
    ) AS next_subscribers
FROM youtube_statistics;
SELECT
    youtuber,
    subscribers,
    SUM(subscribers)
    OVER(
        ORDER BY subscribers DESC
    ) AS running_total
FROM youtube_statistics;
SELECT
    country,
    youtuber,
    subscribers,
    AVG(subscribers)
    OVER(
        PARTITION BY country
    ) AS country_average
FROM youtube_statistics;
SELECT
    youtuber,
    subscribers,
    ROUND(
        subscribers * 100.0 /
        SUM(subscribers) OVER(),
        2
    ) AS percentage_share
FROM youtube_statistics;
WITH RankedCountry AS
(
SELECT
    country,
    youtuber,
    subscribers,
    ROW_NUMBER() OVER(
        PARTITION BY country
        ORDER BY subscribers DESC
    ) rn
FROM youtube_statistics
)

SELECT *
FROM RankedCountry
WHERE rn <= 3;
WITH RankedCategory AS
(
SELECT
    category,
    youtuber,
    subscribers,
    ROW_NUMBER() OVER(
        PARTITION BY category
        ORDER BY subscribers DESC
    ) rn
FROM youtube_statistics
)

SELECT *
FROM RankedCategory
WHERE rn <= 5;
SELECT
    youtuber,
    highest_yearly_earnings,
    RANK() OVER(
        ORDER BY highest_yearly_earnings DESC
    ) AS earnings_rank
FROM youtube_statistics;
SELECT
    youtuber,
    highest_yearly_earnings,
    SUM(highest_yearly_earnings)
    OVER(
        ORDER BY highest_yearly_earnings DESC
    ) AS running_earnings
FROM youtube_statistics;
SELECT
    youtuber,
    subscribers,
    subscribers -
    LEAD(subscribers)
    OVER(
        ORDER BY subscribers DESC
    ) AS gap_to_next
FROM youtube_statistics;
