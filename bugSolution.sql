To prevent the race condition, use explicit locking mechanisms within the transaction:

```sql
BEGIN TRANSACTION;
SELECT * FROM accounts WHERE id = 1 FOR UPDATE; -- Acquire lock on account 1
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
SELECT * FROM accounts WHERE id = 2 FOR UPDATE; -- Acquire lock on account 2
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT TRANSACTION;
```

This ensures that only one transaction can access and modify the account balances at a time, guaranteeing data consistency.