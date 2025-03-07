--Netflix SQL Project
--1. Count the number of Movies vs TV Shows
SELECT type,
  count(*)
FROM netflix
GROUP BY type;
--2. Find the most common rating for movies and TV shows
SELECT type,
  rating
FROM (
    SELECT type,
      rating,
      count(*),
      rank() OVER (
        PARTITION BY type
        ORDER BY count(*) DESC
      ) AS rank
    FROM netflix
    GROUP BY 1,
      2
  ) as t1
WHERE rank = 1;
--3. List all movies released in a specific year (e.g., 2020)
SELECT *
FROM netflix
WHERE release_year = 2020
  AND type = 'Movie';
--4. Find the top 5 countries with the most content on Netflix
SELECT country,
  count(*)
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY count(*) DESC
LIMIT 5;
--5. Identify the longest movie
SELECT *
FROM netflix
WHERE duration = (
    SELECT max(duration)
    FROM netflix
  );
--6. Find content added in the last 5 years
SELECT *
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= current_date - interval '5 years';
--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT *
FROM netflix
WHERE director LIKE '%Rajiv Chilaka%';
--8. List all TV shows with more than 5 seasons
SELECT *
FROM netflix
WHERE type = 'TV Show'
  AND split_part(duration, ' ', 1)::int > 5;
--9. Count the number of content items in each genre
SELECT UNNEST(STRING_TO_ARRAY(listed_in, ', ')) as ganre,
  count(show_id)
FROM netflix
GROUP BY 1;
--10.Find each year and the average numbers of content release in India on netflix.return top 5 year with highest avg content release!
SELECT extract(
    year
    FROM TO_DATE(date_added, 'Month DD, YYYY')
  ) as year,
  count(*) as content_count,
  round(
    count(*)::numeric /(
      SELECT count(*)
      FROM netflix
      WHERE country = 'India'
    )::numeric * 100,
    2
  ) as avg_content
FROM netflix
WHERE country = 'India'
GROUP BY 1 --11. List all movies that are documentaries
SELECT *
FROM netflix
WHERE type = 'Movie'
  AND listed_in LIKE '%Documentaries%';
--12. Find all content without a director
SELECT *
FROM netflix
WHERE director IS NULL;
--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
SELECT *
FROM netflix
WHERE casts LIKE '%Salman Khan%'
  AND TO_DATE(date_added, 'Month DD, YYYY') >= current_date - interval '10 years';
--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT UNNEST(STRING_TO_ARRAY(casts, ', ')) as actor,
  count(*)
FROM netflix
WHERE country LIKE '%India%'
GROUP BY 1
ORDER BY count(show_id) DESC;
--15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
  --the description field. Label content containing these keywords as 'Bad' and all other 
  --content as 'Good'. Count how many items fall into each category.
SELECT CASE
    WHEN description LIKE '%kill%'
    OR description LIKE '%violence%' THEN 'Bad'
    ELSE 'Good'
  END as category,
  count(*)
FROM netflix
GROUP BY 1;
