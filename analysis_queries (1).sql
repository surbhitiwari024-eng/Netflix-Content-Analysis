
-- Netflix Data Analysis using SQL
-- Dataset: netflix_cleaned.csv
-- Table Name: netflix

-- 1. Total number of titles on Netflix
SELECT COUNT(*) AS total_titles
FROM netflix;

-- 2. Movies vs TV Shows count
SELECT type, COUNT(*) AS total
FROM netflix
GROUP BY type;

-- 3. Percentage split of Movies vs TV Shows
SELECT 
  type,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix), 2) AS percentage
FROM netflix
GROUP BY type;

-- 4. Top 10 content producing countries
SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country != 'Unknown'
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

-- 5. Content added over the years
SELECT year_added, COUNT(*) AS titles_added
FROM netflix
WHERE year_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;

-- 6. Distribution of ratings
SELECT rating, COUNT(*) AS total
FROM netflix
GROUP BY rating
ORDER BY total DESC;

-- 7. Top 10 most common genres
SELECT primary_genre, COUNT(*) AS total
FROM netflix
GROUP BY primary_genre
ORDER BY total DESC
LIMIT 10;

-- 8. Average duration of movies (in minutes)
SELECT ROUND(AVG(duration_number), 2) AS avg_movie_duration_minutes
FROM netflix
WHERE type = 'Movie'
AND duration_type = 'min';

-- 9. TV Shows by number of seasons
SELECT duration_number AS seasons, COUNT(*) AS total_shows
FROM netflix
WHERE type = 'TV Show'
AND duration_type = 'Seasons'
GROUP BY duration_number
ORDER BY duration_number;

-- 10. Top 10 directors by number of titles
SELECT director, COUNT(*) AS total_titles
FROM netflix
WHERE director != 'Unknown'
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

-- 11. Content added in the last 5 years
SELECT COUNT(*) AS recent_content
FROM netflix
WHERE year_added >= (SELECT MAX(year_added) - 5 FROM netflix);

-- 12. Movies released after 2015
SELECT COUNT(*) AS modern_movies
FROM netflix
WHERE type = 'Movie'
AND release_year >= 2015;
