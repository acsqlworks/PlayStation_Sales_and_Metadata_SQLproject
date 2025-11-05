--Business Solutions

--1. Count Total Games by Console
--• How many games were released for each console?
SELECT Console, COUNT(*) AS TotalGames
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Console

--2. Find High-Sales Games
--• Which games have Total Sales greater than 10 million?
SELECT Console, Name, Total_Sales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Total_Sales > 10000000
ORDER BY Total_Sales DESC

--3. Count Games by Publisher
--• How many games did each publisher release? Order by count descending.
SELECT Publisher, COUNT(Game) AS TotalReleases
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]R
GROUP BY Publisher
ORDER BY TotalReleases DESC

--4. Find Exclusive Publishers
--• Which publishers released games for only one console?
SELECT Publisher,Game, MIN(Console) AS Console
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Publisher, Game
HAVING COUNT(DISTINCT Console) = 1;

--5. Average Sales by Region
--• What is the average NA Sales, PAL Sales, and Japan Sales across all games?
SELECT Name,
  AVG(NA_Sales) AS Avg_NA_Sales,
  AVG(PAL_Sales) AS Avg_PAL_Sales,
  AVG(Japan_Sales) AS Avg_Japan_Sales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE NA_Sales > 0 OR PAL_Sales > 0 or Japan_Sales > 0
GROUP BY Name

--6. Top Performing Region per Console
--• For PS3 and PS4 separately, which region (NA, PAL, Japan, Other) has the highest total sales?
SELECT TOP(100) Name,
MAX(NA_Sales) AS Highest_Total_Sales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Name
--7. Games with No Japan Sales
--• List all games where Japan Sales equals 0. How many are there?
SELECT 
Count(Game) AS WeakJapanSales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Japan_Sales = 0
Order By WeakJapanSales
--8. Minimum and Maximum Sales
--• What are the minimum and maximum Tl Sales values in the entire dataset?
SELECT
MIN(Total_Sales) AS MinimumSales,
MAX(Total_Sales) AS MaximumSales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
--9. Most Prolific Developers
--• Which developer created the most games? Count distinct games per developer.
SELECT Developer,
COUNT(DISTINCT Game) AS TotalGamesMaded
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Developer
--10. Activision's Performance
--• What are the total sales (sum of Total Sales) for all Activision published games?
SELECT Publisher, Game,
SUM(Total_Sales) AS Sales_PerformanceResults
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Publisher = 'Activision'
GROUP BY Publisher, Game
ORDER BY Sales_PerformanceResults
--11. EA Sports Portfolio
--• Count how many distinct games were published by EA Sports and what their average Total Sales were.
SELECT DISTINCT Publisher, Game,
AVG(Total_Sales) AS EA_Sports_AvgSales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Publisher = 'EA Sports'
GROUP BY Publisher, Game
ORDER BY EA_Sports_AvgSales
--12. Games by Release Year
--• Count how many games were released in each year (extract year from Release Date). Order by year.
SELECT YEAR(Release_Date) AS ReleaseYear,
Count(Game) AS GamesReleased
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY YEAR(Release_Date)
ORDER BY YEAR(Release_Date) DESC
--13. Pre-2015 vs Post-2015
--• Count games released before 2015-01-01 vs games released on or after 2015-01- 01.
SELECT 'Pre-2015' AS Era, COUNT(*) AS GamesReleased
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Release_Date < '2015-01-01'

UNION ALL

SELECT 'Post-2015' AS Era, COUNT(*) AS GamesReleased
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Release_Date >= '2015-01-01';

--14. Console Sales Distribution
--• For each console, show the total NA Sales, total PAL Sales, and total Japan Sales. Which console dominated each region?
SELECT TOP 3 Console,
  SUM(NA_Sales) AS NA_Sales,
  SUM(PAL_Sales) AS PAL_Sales,
  SUM(Japan_Sales) AS Japan_Sales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Console
ORDER BY Console
--15.Publishers with Multiple Hit Games
--• Which publishers have more than 5 games with Total Sales greater than 5 million?
SELECT Publisher,
COUNT(Total_Sales) AS SMASH_HIT
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE [Total_Sales] > 5000000
GROUP BY Publisher
HAVING COUNT(*) > 5