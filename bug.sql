The following SQL query is prone to a race condition:

```sql
BEGIN TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT TRANSACTION;
```

If two concurrent transactions attempt to execute this query, it's possible that one transaction reads the balance before the other updates it, leading to an inaccurate balance and potential data corruption.