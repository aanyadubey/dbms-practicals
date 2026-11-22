# Experiment 8: Transactions and Concurrency Control

## Aim
To implement database transactions and demonstrate COMMIT, ROLLBACK, SAVEPOINT, and transaction isolation levels.

## Software Requirements
- MySQL 8.0+
- MySQL Workbench

## Concepts Covered
- Database Transactions
- START TRANSACTION
- COMMIT
- ROLLBACK
- SAVEPOINT
- Transaction Isolation Levels
- Concurrency Control

## Procedure
1. Create a Bank_Account table.
2. Insert sample bank account records.
3. Perform a money transfer using START TRANSACTION.
4. Use COMMIT to permanently save the changes.
5. Use ROLLBACK to undo uncommitted changes.
6. Create a SAVEPOINT within a transaction.
7. Roll back to the specified savepoint.
8. Set and verify different transaction isolation levels.
9. Display the final account balances and transaction log.

## Expected Output
- COMMIT permanently saves the money transfer.
- ROLLBACK reverses uncommitted changes.
- SAVEPOINT allows partial rollback within a transaction.
- Transaction isolation levels are displayed successfully.
- The transaction log displays the committed transfer details.

## Result
Transaction management operations are successfully demonstrated using COMMIT, ROLLBACK, SAVEPOINT, and isolation levels.

## Conclusion
The experiment demonstrates how database transactions maintain data consistency and support controlled execution of multiple database operations.

## Files
- Experiment_08.sql — SQL implementation of transactions and concurrency control.

## Note
Concurrency anomalies require two separate database sessions for practical demonstration.
