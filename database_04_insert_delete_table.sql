USE transactions;

SHOW TABLES;

DELETE FROM banking_customers;

INSERT INTO banking_customers (id, first_name, last_name, email, phone_number) VALUES
(1, 'Alice', 'Tan', 'alice.tan@example.com', '91234567'),
(2, 'Bob', 'Lim', 'bob.lim@example.com', '98765432');


DELETE FROM banking_accounts;

INSERT INTO banking_accounts (id, customer_id, account_number, account_type, balance, open_date) VALUES
(101, 1, 'SG001001', 'Savings', 5000.00, '2024-01-01'),
(102, 1, 'SG001002', 'Current', 1200.00, '2024-02-15'),
(103, 2, 'SG002001', 'Savings', 750.50, '2024-03-10');

DELETE FROM banking_transactions;

INSERT INTO banking_transactions (id, account_id, transaction_type, amount) VALUES
(1001, 101, 'Deposit', 1500.00),
(1002, 101, 'Withdrawal', 200.00),
(1003, 102, 'Deposit', 500.00),
(1004, 103, 'Withdrawal', 50.00);

SELECT * FROM banking_customers;

SELECT * FROM banking_accounts;

SELECT * FROM banking_transactions;

