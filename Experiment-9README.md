# Experiment 9: Railway Booking Query Performance and Indexing

## Aim
To analyze railway booking query performance before and after applying single-column and composite indexes.

## Software Requirements
- MySQL 8.0.18+
- MySQL Workbench

## Dataset
A Railway Booking database containing 5,000 sample booking records.

## Concepts Covered
- Railway Booking Database
- Dataset Generation
- Database Indexing
- Single-Column Index
- Composite Index
- EXPLAIN
- EXPLAIN ANALYZE
- Query Execution Plans
- Performance Comparison

## Procedure
1. Create the Railway_Booking table.
2. Generate and insert 5,000 sample booking records.
3. Execute queries before creating indexes.
4. Analyze query execution plans using EXPLAIN.
5. Create a single-column index on Train_No.
6. Execute the same queries after indexing.
7. Create a composite index on Train_No and Journey_Date.
8. Execute queries using both train number and journey date.
9. Compare execution plans and verify the created indexes.

## Expected Output
- A railway booking table containing 5,000 records is created.
- Queries retrieve booking details for the selected train.
- EXPLAIN displays the query execution plan before and after indexing.
- Single-column and composite indexes are created successfully.
- SHOW INDEX displays the indexes created on the table.

## Result
The impact of single-column and composite indexing on railway booking query performance is analyzed.

## Conclusion
The experiment demonstrates how database indexes can improve data retrieval and how execution plans help analyze query performance.

## Files
- Experiment_09.sql — SQL implementation of railway booking query performance and indexing.

## Note
Actual execution plans and query execution times may vary depending on MySQL version, database statistics, hardware, and data distribution. EXPLAIN ANALYZE requires MySQL 8.0.18 or later.
