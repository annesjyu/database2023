-- Use the correct database
USE bank_db;

-- The same balances as before transaction.
SELECT * FROM accounts ORDER BY accounts.id;

-- Drop procedure if it exists
DROP PROCEDURE IF EXISTS transfer_funds;

DELIMITER //

CREATE PROCEDURE transfer_funds(
    IN sender_id INT,
    IN receiver_id INT,
    IN transfer_amt DECIMAL(10,2)
)
BEGIN
    DECLARE sender_balance DECIMAL(10,2);

    START TRANSACTION;
		
	 -- Deduct and credit accounts
    UPDATE accounts SET balance = balance - transfer_amt WHERE id = sender_id;
    UPDATE accounts SET balance = balance + transfer_amt WHERE id = receiver_id;
	 INSERT INTO transactions (account_id, amount) VALUES 
    (sender_id, -transfer_amt),
    (receiver_id, transfer_amt);
    
	 SELECT balance INTO sender_balance FROM accounts WHERE id = sender_id;
    IF sender_balance >= 0 THEN
        COMMIT;
        SELECT 'Transaction successful.' AS Message;
    ELSE
        ROLLBACK;
        SELECT 'Transaction failed: Insufficient funds.' AS Message;
    END IF;
END;
//

DELIMITER ;

CALL transfer_funds(1, 2, 20000.00);

-- The same balances as before transaction.
SELECT * FROM accounts ORDER BY accounts.id;

-- NO new transactions.
SELECT accounts.id, accounts.`name`, accounts.balance, 
	transactions.amount, transactions.timestamp FROM accounts 
INNER JOIN transactions ON accounts.id=transactions.account_id;