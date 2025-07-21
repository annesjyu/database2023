-- Create database
DROP DATABASE if EXISTS bank_db;

CREATE DATABASE bank_db;

-- Use the database
USE bank_db;

-- Create accounts table
CREATE TABLE accounts (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  balance DECIMAL(10, 2) DEFAULT 0
);

-- Create transactions table with foreign key
CREATE TABLE transactions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  account_id INT NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (account_id) REFERENCES accounts(id)
);

DESC accounts;
DESC transactions;

-- Insert sample accounts
INSERT INTO accounts (id, name, balance) VALUES
  (1, 'Alice', 1000.00),
  (2, 'Bob', 1500.50),
  (3, 'Charlie', 500.75);

-- Insert sample transactions
INSERT INTO transactions (account_id, amount) VALUES
  (1, -100.00),
  (1, 200.00),
  (2, -50.50),
  (3, 300.00),
  (2, -200.00);

SELECT accounts.id, accounts.`name`, accounts.balance, 
	transactions.amount, transactions.timestamp FROM accounts 
INNER JOIN transactions ON accounts.id=transactions.account_id;
