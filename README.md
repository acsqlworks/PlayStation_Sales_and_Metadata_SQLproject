# PlayStation Sales and Metadata Analysed Using SQL
![Playstation](https://github.com/acsqlworks/PlayStation_Sales_and_Metadata_SQLproject/blob/main/playstation%20logo.png)

## Project Overview

This project analyzes PlayStation gaming sales data across three console generations (PS3, PS4, PS5) using SQL. The dataset combines sales figures from VGChartz with game metadata from the RAWG API to provide comprehensive insights into gaming industry trends, publisher performance, and regional market distributions.

## Dataset Information

**Data Sources:**
- **Sales Data:** VGChartz (updated through October 2025)
- **Metadata:** RAWG API (game ratings, genres, platforms, release dates)

**Coverage:**
- **PS3 & PS4:** Sales data updated through end of 2020
- **PS5:** Limited sales data due to platform recency (as of October 2025)

**Key Columns:**
- Game, Console, Publisher, Developer
- Total Sales, NA Sales, PAL Sales, Japan Sales, Other Sales
- Total Shipped, Release Date
- Rating, Ratings Count, Metacritic Score
- Genres, Platforms

## SQL Skills Demonstrated

This project showcases fundamental SQL querying techniques:

- `SELECT`, `FROM`, `WHERE`
- Aggregate functions: `COUNT()`, `AVG()`, `MIN()`, `MAX()`, `SUM()`
- `GROUP BY` and `ORDER BY`
- `DISTINCT` for unique values
- `AND`, `OR`, `NOT IN` logical operators
- Date functions: `YEAR()`
- Data type conversions and table modifications
- Filtering and conditional logic

## Technical Implementation

### Database Setup
- **Platform:** Microsoft SQL Server Management Studio (SSMS)
- **Import Method:** Flat File Source (CSV import)
- **Data Cleaning:** VARCHAR to DECIMAL conversions for sales columns

## 15 Business Questions Analyzed

### How many games were released for each console?
```sql
SELECT Console, COUNT(*) AS TotalGames
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Console
```
### Which games have Total Sales greater than 10 million?
```sql
SELECT Console, Name, Total_Sales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Total_Sales > 10000000
ORDER BY Total_Sales DESC
```
### How many games did each publisher release? Order by count descending.
SELECT Publisher, COUNT(Game) AS TotalReleases
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]R
GROUP BY Publisher
ORDER BY TotalReleases DESC

### Which publishers released games for only one console?
```sql
SELECT Publisher,Game, MIN(Console) AS Console
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Publisher, Game
HAVING COUNT(DISTINCT Console) = 1;
```
### What is the average NA Sales, PAL Sales, and Japan Sales across all games?
```sql
SELECT Name,
  AVG(NA_Sales) AS Avg_NA_Sales,
  AVG(PAL_Sales) AS Avg_PAL_Sales,
  AVG(Japan_Sales) AS Avg_Japan_Sales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE NA_Sales > 0 OR PAL_Sales > 0 or Japan_Sales > 0
GROUP BY Name
```
### For PS3 and PS4 separately, which region (NA, PAL, Japan, Other) has the highest total sales?
```sql
SELECT TOP(100) Name,
MAX(NA_Sales) AS Highest_Total_Sales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Name
```
### List all games where Japan Sales equals 0. How many are there?
```sql
SELECT 
Count(Game) AS WeakJapanSales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Japan_Sales = 0
Order By WeakJapanSales
```
### What are the minimum and maximum Tl Sales values in the entire dataset?
```sql
SELECT
MIN(Total_Sales) AS MinimumSales,
MAX(Total_Sales) AS MaximumSales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
```
### Which developer created the most games? Count distinct games per developer.
```sql
SELECT Developer,
COUNT(DISTINCT Game) AS TotalGamesMaded
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Developer
```
### What are the total sales (sum of Total Sales) for all Activision published games?
```sql
SELECT Publisher, Game,
SUM(Total_Sales) AS Sales_PerformanceResults
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Publisher = 'Activision'
GROUP BY Publisher, Game
ORDER BY Sales_PerformanceResults
```
### Count how many distinct games were published by EA Sports and what their average Total Sales were.
```sql
SELECT DISTINCT Publisher, Game,
AVG(Total_Sales) AS EA_Sports_AvgSales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Publisher = 'EA Sports'
GROUP BY Publisher, Game
ORDER BY EA_Sports_AvgSales
```
### Count how many games were released in each year (extract year from Release Date). Order by year.
```sql
SELECT YEAR(Release_Date) AS ReleaseYear,
Count(Game) AS GamesReleased
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY YEAR(Release_Date)
ORDER BY YEAR(Release_Date) DESC
```
### Count games released before 2015-01-01 vs games released on or after 2015-01- 01.
```sql
SELECT 'Pre-2015' AS Era, COUNT(*) AS GamesReleased
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Release_Date < '2015-01-01'

UNION ALL

SELECT 'Post-2015' AS Era, COUNT(*) AS GamesReleased
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE Release_Date >= '2015-01-01';
```
### For each console, show the total NA Sales, total PAL Sales, and total Japan Sales. Which console dominated each region?
```sql
SELECT TOP 3 Console,
  SUM(NA_Sales) AS NA_Sales,
  SUM(PAL_Sales) AS PAL_Sales,
  SUM(Japan_Sales) AS Japan_Sales
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
GROUP BY Console
ORDER BY Console
```
### Which publishers have more than 5 games with Total Sales greater than 5 million?
```sql
SELECT Publisher,
COUNT(Total_Sales) AS SMASH_HIT
FROM [PlayStation Sales and Metadata (PS3PS4PS5) (Oct 2025)]
WHERE [Total_Sales] > 5000000
GROUP BY Publisher
HAVING COUNT(*) > 5
```

## Key Insights

- Analysis reveals console generation transitions and market evolution
- Regional preferences show distinct gaming market characteristics
- Publisher concentration highlights industry leaders
- Temporal patterns demonstrate gaming industry growth trends

## Files Included

- `Business Solutions Playstation.sql` - All 15 business solution queries
- `Business Problems Playstation.sql` - All 15 business problem questions
- `PlayStation_Sales_Metadata.csv` - Original dataset

## How to Use

1. **Import Data:** Use SSMS Import Wizard with Flat File Source
2. **Set Data Types:** Configure sales columns as DECIMAL(18,2)
3. **Run Queries:** Execute queries from `queries.sql`
4. **Analyze Results:** Review output for business insights

## Learning Outcomes

This project demonstrates:
- Practical SQL query construction for business intelligence
- Data cleaning and type conversion in SSMS
- Aggregate analysis and grouping techniques
- Date manipulation and extraction
- Multi-table dataset preparation and analysis

## Future Enhancements

- Add JOIN operations for multi-table analysis
- Implement subqueries for advanced filtering
- Create views for commonly used query patterns
- Develop stored procedures for repeatable analysis
- Add data visualization integration

## Author

Created as part of SQL learning and portfolio development

## Acknowledgments

- **VGChartz** for sales data
- **RAWG API** for game metadata
- Data compiled and cleaned October 2025

---

*Note: This is an educational project for demonstrating SQL analysis skills. Sales figures are historical and may not reflect current market conditions.*
