# Experiment 10: Customer Order Query Optimization and Indexing

## Aim
To analyze and optimize customer order queries using database indexing and compare query performance before and after applying indexes.

## Software Requirements
- MySQL 8.0.18+
- MySQL Workbench

## Dataset
A Customer Order database containing 10,000 sample order records.

## Concepts Covered
- Customer Order Database
- Dataset Generation
- SQL Query Optimization
- Database Indexing
- Single-Column Index
- Composite Index
- Aggregate Queries
- EXPLAIN
- EXPLAIN ANALYZE
- Query Performance Comparison

## Procedure
1. Create the Customer_Order table.
2. Generate and insert 10,000 sample customer order records.
3. Execute different queries before creating indexes.
4. Analyze query execution plans using EXPLAIN.
5. Create an index on the City column.
6. Create a composite index on Customer_ID and Order_Date.
7. Create indexes on Category and Status columns.
8. Create an index to optimize city-wise aggregate queries.
9. Execute the same queries after indexing.
10. Compare query execution plans and verify the indexes.

## Expected Output
- A Customer_Order table containing 10,000 records is created.
- Queries retrieve customer orders based on city, customer ID, date, category, and status.
- EXPLAIN ANALYZE displays query execution details.
- Single-column and composite indexes are created successfully.
- SHOW INDEX displays the indexes created on the table.
- Query execution plans can be compared before and after indexing.

## Result
Customer order queries are analyzed and optimized using database indexes and execution plan analysis.

## Conclusion
The experiment demonstrates how database indexing improves query performance and how EXPLAIN ANALYZE helps evaluate query execution.

## Files
- Experiment_10.sql — SQL implementation of customer order query optimization and indexing.

## Note
Actual query execution times and execution plans may vary depending on MySQL version, hardware, database statistics, and data distribution. EXPLAIN ANALYZE requires MySQL 8.0.18 or later.
