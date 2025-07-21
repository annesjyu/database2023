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