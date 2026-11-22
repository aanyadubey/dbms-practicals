# Experiment 7: Database Normalization

## Aim
To identify functional dependencies and normalize a denormalized Sales table from UNF through 1NF, 2NF, 3NF, and BCNF.

## Software Requirements
- MySQL 8.0+
- MySQL Workbench

## Concepts Covered
- Unnormalized Form (UNF)
- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)
- Boyce-Codd Normal Form (BCNF)
- Functional Dependencies
- Lossless Join
- Dependency Preservation

## Procedure
1. Create the unnormalized Sales table.
2. Insert sample sales records.
3. Identify functional dependencies.
4. Convert the table into First Normal Form (1NF).
5. Remove partial dependencies to achieve Second Normal Form (2NF).
6. Remove transitive dependencies to achieve Third Normal Form (3NF).
7. Verify the normalized tables and their relationships.
8. Check lossless join and dependency preservation.

## Expected Output
- UNF table displays sales records containing multiple product values.
- 1NF table stores one product per row.
- 2NF separates sale-level and product-level details.
- 3NF separates Customer, Salesperson, Product, Sale, and Sale_Item tables.
- Lossless join verification reconstructs the original six sample rows.
- Functional dependencies are checked for consistency.

## Result
Database normalization is performed to reduce data redundancy and improve data consistency.

## Conclusion
The experiment demonstrates the conversion of an unnormalized database into normalized forms using functional dependencies and relational decomposition.

## Files
- Experiment_07.sql — SQL implementation of database normalization.
