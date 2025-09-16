-- Use the correct database
USE bank_db;

SELECT * FROM accounts ORDER BY accounts.id;

-- ---------------------------------------------
-- Start a transaction
-- ---------------------------------------------
START TRANSACTION;

-- Deduct from sender
UPDATE accounts 
SET balance = balance - 20000.00 
WHERE id = 1;

-- Credit to the receiver
UPDATE accounts 
SET balance = balance + 20000.00 
WHERE id = 2;

-- Insert transaction records
INSERT INTO transactions (account_id, amount) VALUES 
    (1, -20000.00),
    (2,  20000.00);

-- Check sender balance
SELECT balance FROM accounts WHERE id = 1;

-- The balance is negative, should rollback

ROLLBACK;

-- ---------------------------------------------
-- END of Transaction
-- ---------------------------------------------

-- The same balances as before the transaction.
SELECT * FROM accounts ORDER BY accounts.id;

-- NO new transactions.
SELECT accounts.id, accounts.`name`, accounts.balance, 
	transactions.amount, transactions.timestamp FROM accounts 
INNER JOIN transactions ON accounts.id=transactions.account_id;
