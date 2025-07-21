USE bank_db; -- Ensure you are using the correct database

-- Before transaction: Check initial balances
SELECT id, name, balance FROM accounts WHERE id IN (1, 2);

-- Start a new transaction
START TRANSACTION;

-- Step 1: Deduct money from Alice's account
UPDATE accounts
SET balance = balance - 200.00
WHERE id = 1;

-- Step 2: Add money to Bob's account
UPDATE accounts
SET balance = balance + 200.00
WHERE id = 2;

-- Step 3: Record the transaction for Alice (deduction)
INSERT INTO transactions (account_id, amount)
VALUES (1, -200.00);

-- Step 4: Record the transaction for Bob (addition)
INSERT INTO transactions (account_id, amount)
VALUES (2, 200.00);

-- If all steps are successful, commit the transaction
COMMIT;

-- After transaction: Check final balances and recorded transactions
SELECT id, name, balance FROM accounts WHERE id IN (1, 2);
SELECT account_id, amount, timestamp FROM transactions ORDER BY timestamp DESC LIMIT 2;