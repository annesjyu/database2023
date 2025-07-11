CREATE or REPLACE DATABASE transactions;

USE transactions;

CREATE TABLE banking_customers (
  id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  phone_number VARCHAR(20) NOT NULL
);

SHOW TABLES;

CREATE TABLE banking_accounts (
  id INT NOT NULL PRIMARY KEY,
  customer_id INT NOT NULL,
  account_number VARCHAR(20) NOT NULL UNIQUE,
  account_type VARCHAR(50) NOT NULL,
  balance DECIMAL(10, 2) NOT NULL,
  open_date DATE NOT NULL,
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES banking_customers(id) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE
);

SHOW TABLES;

CREATE TABLE banking_transactions (
  id INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  transaction_type VARCHAR(50) NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_account FOREIGN KEY (account_id) REFERENCES banking_accounts(id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

SHOW TABLES;