# PlayStation Sales and Metadata SQL Analysis
![Playstation](https://github.com/acsqlworks/PlayStation_Sales_and_Metadata_SQLproject/blob/main/playstation%20logo.jpg)

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

## Business Questions Analyzed

### 1. **Console Distribution**
Count of games released per console (PS3 vs PS4 vs PS5)

### 2. **High-Performance Titles**
Games exceeding 10 million in total sales

### 3. **Publisher Analysis**
Number of games released by each publisher, ranked by volume

### 4. **Regional Sales Performance**
Average sales by region (North America, PAL, Japan, Other)

### 5. **Top Regional Markets**
Identifying which regions generate the most revenue per console

### 6. **Japan Market Gaps**
Games with zero sales in the Japanese market

### 7. **Sales Range Analysis**
Minimum and maximum sales values across the dataset

### 8. **Developer Productivity**
Most prolific game developers by title count

### 9. **Publisher Performance**
Total sales analysis for major publishers (e.g., Activision)

### 10. **Sports Game Publishers**
Portfolio analysis for EA Sports titles

### 11. **Release Timeline**
Games released per year with temporal trends

### 12. **Era Comparison**
Pre-2015 vs Post-2015 release distribution

### 13. **Console Market Dominance**
Regional sales totals by console platform

### 14. **Blockbuster Publishers**
Publishers with multiple titles exceeding 5 million sales

### 15. **Sales Benchmarks**
Games meeting specific sales thresholds by publisher

## Technical Implementation

### Database Setup
- **Platform:** Microsoft SQL Server Management Studio (SSMS)
- **Import Method:** Flat File Source (CSV import)
- **Data Cleaning:** VARCHAR to DECIMAL conversions for sales columns

### Key SQL Patterns Used

```sql
-- Grouping and Aggregation
SELECT Publisher, COUNT(Game) AS TotalReleases
FROM [PlayStation Sales and Metadata]
GROUP BY Publisher
ORDER BY TotalReleases DESC;

-- Date Extraction
SELECT YEAR(Release_Date) AS ReleaseYear,
       COUNT(Game) AS GamesReleased
FROM [PlayStation Sales and Metadata]
GROUP BY YEAR(Release_Date)
ORDER BY ReleaseYear;

-- Multi-condition Filtering
SELECT Console, Name, [Total Sales]
FROM [PlayStation Sales and Metadata]
WHERE [Total Sales] > 10000000
  AND Console IN ('PS3', 'PS4');
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
