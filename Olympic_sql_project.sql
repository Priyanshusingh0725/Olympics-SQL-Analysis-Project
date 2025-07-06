-- -----------------------------------------
--  Olympics SQL Project: All Query Levels
-- Author: Priyanshu Singh
-- -----------------------------------------


-- -------------------------------
--  BASIC LEVEL QUERIES
-- -------------------------------

-- 1. Get all unique sports
SELECT DISTINCT(Sport) FROM olympic.`olympics dataset`;

-- 2. Count how many athletes are from China
SELECT COUNT(*) FROM olympic.`olympics dataset`
WHERE Team='China';

-- 3. Get all athletes who won a medal
SELECT COUNT(*) FROM olympic.`olympics dataset`
WHERE Medal != 'NA';

-- 4. Find the average age of all athletes
SELECT AVG(Age) FROM olympic.`olympics dataset`;

-- 5. List athletes who competed in the Winter Olympics
SELECT Name, Season, Year, Team, Sport 
FROM olympic.`olympics dataset`
WHERE Games LIKE '%Winter';



-- -------------------------------
--  INTERMEDIATE LEVEL QUERIES
-- -------------------------------

-- 6. Count how many athletes per team
SELECT Team, COUNT(DISTINCT(Name)) 
FROM olympic.`olympics dataset`
GROUP BY Team;

-- 7. Get average weight by sex
SELECT Sex, AVG(Weight) 
FROM olympic.`olympics dataset`
GROUP BY Sex;

-- 8. Find the oldest athlete
SELECT * FROM olympic.`olympics dataset`
WHERE Age = (SELECT MAX(Age) FROM olympic.`olympics dataset`);

-- 9. Find all events where the word ‘Skating’ appears
SELECT * FROM olympic.`olympics dataset` 
WHERE Sport LIKE '%Skating%';

-- 10. Which cities hosted the Games and how many events happened in each
SELECT City, COUNT(*) AS events 
FROM olympic.`olympics dataset`
GROUP BY City;



-- -------------------------------
-- 🚀 ADVANCED LEVEL QUERIES
-- -------------------------------

-- 11. Find athletes who competed more than once
SELECT Name, COUNT(*) AS c 
FROM olympic.`olympics dataset`
GROUP BY Name 
HAVING c > 2 
ORDER BY c;

-- 12. Get the medal count by team and type
SELECT NOC, COUNT(*) AS c 
FROM olympic.`olympics dataset`
WHERE Medal = 'Gold'
GROUP BY NOC 
ORDER BY c DESC;

-- 13. Rank athletes by age within each sport
SELECT *, RANK() OVER (PARTITION BY Sport ORDER BY Age)
FROM olympic.`olympics dataset`;

-- 14. Find the team with the most athletes 
SELECT COUNT(DISTINCT(Name)) AS c, NOC 
FROM olympic.`olympics dataset`
GROUP BY NOC 
ORDER BY c DESC 
LIMIT 1;

-- 15. Find athletes who never won a medal but participated more than once
SELECT Name, COUNT(*) AS c 
FROM olympic.`olympics dataset`
WHERE Medal = 'NA'
GROUP BY Name 
HAVING c > 1;

-- 16. Which athlete has won the most gold medals?
SELECT Name, COUNT(Medal) AS c 
FROM olympic.`olympics dataset`
WHERE Medal = 'Gold'
GROUP BY Name 
ORDER BY c DESC 
LIMIT 1;

-- 17. Find the average height and weight of medal-winning athletes by sport.
SELECT Sport, AVG(Height), AVG(Weight) 
FROM olympic.`olympics dataset`
WHERE Medal != 'NA'
GROUP BY Sport;

-- 18. Which city has hosted the Olympics most frequently?
SELECT City, COUNT(DISTINCT Year) AS Times_Hosted
FROM olympic.`olympics dataset`
GROUP BY City
ORDER BY Times_Hosted DESC
LIMIT 1;

-- 19. What is the age range of athletes who have won medals?
SELECT MAX(Age) - MIN(Age) AS Age_Range 
FROM olympic.`olympics dataset`
WHERE Medal != 'NA';

-- 20. Find duplicate entries (same athlete, same year, same event)
SELECT Name, Year, Event, COUNT(*) AS c 
FROM olympic.`olympics dataset` 
GROUP BY Name, Year, Event 
HAVING c > 1;



-- -------------------------------
--  MORE ADVANCED QUERIES
-- -------------------------------

-- 21. Rank athletes by the number of medals they’ve won
SELECT 
    Name,
    COUNT(Medal) AS nu_of_medals,
    RANK() OVER (ORDER BY COUNT(Medal)) AS 'rank' 
FROM olympic.`olympics dataset` 
WHERE Medal != 'NA'
GROUP BY Name;

-- 22. Find all athletes who participated in more than one Olympic event (across years)
SELECT Name, COUNT(DISTINCT Event) AS nu_of_times_participated 
FROM olympic.`olympics dataset` 
GROUP BY Name 
HAVING nu_of_times_participated > 1;

-- 23. Find the most common age at which athletes win medals
SELECT Age, COUNT(DISTINCT Name) AS frequency 
FROM olympic.`olympics dataset` 
WHERE Medal != 'NA'
GROUP BY Age 
ORDER BY frequency DESC 
LIMIT 1;

-- 24. List events where the same athlete won multiple medals
SELECT Name, Event, COUNT(Medal) AS frequency 
FROM olympic.`olympics dataset` 
WHERE Medal != 'NA' 
GROUP BY Name, Event 
HAVING frequency > 1;

-- 25. Identify which sports are more dominated by a particular country
SELECT NOC, Sport, COUNT(*) AS c 
FROM olympic.`olympics dataset` 
WHERE Medal != 'NA'
GROUP BY NOC, Sport 
ORDER BY c DESC;
