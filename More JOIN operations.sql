-- More JOIN operations

-- 1.
SELECT id, title
 FROM movie
 WHERE yr=1962;
 
-- 2.
SELECT yr FROM movie
WHERE title='Citizen Kane';

-- 3.
SELECT id, title, yr 
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4.
SELECT id FROM actor
WHERE name='Glenn Close';

-- 5.
SELECT id FROM movie
WHERE title='Casablanca';

-- 6. 
SELECT a.name 
FROM casting c LEFT JOIN actor a ON c.actorid= a.id
WHERE movieid=11768;

-- 7. 
SELECT a.name 
FROM casting c LEFT JOIN actor a ON c.actorid= a.id
WHERE movieid=10522;

-- 8. 
SELECT title 
FROM casting c LEFT JOIN movie m ON c.movieid=m.id
WHERE actorid=(SELECT id FROM actor WHERE name='Harrison Ford');

-- 9.
SELECT title
FROM casting c LEFT JOIN movie m ON c.movieid=m.id
WHERE actorid=(SELECT id FROM actor WHERE name='Harrison Ford') AND c.ord>1;

-- 10.
SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1962 AND casting.ord = 1;

-- 11. 
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
