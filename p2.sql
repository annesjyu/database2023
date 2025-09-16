C:\Program Files\MariaDB 12.0\bin>mysql --user=root --password=root < C:\Users\admin\Downloads\mysql_dump.sql

-- loan, trans, account, 
-- constraints:
-- Step 1
ALTER TABLE loan 
DROP FOREIGN KEY fk_loan_account;

-- Step 2
ALTER TABLE loan
ADD CONSTRAINT fk_loan_account
FOREIGN KEY (account_id) REFERENCES account(account_id);

ALTER TABLE loan
DROP PRIMARY KEY,
ADD CONSTRAINT PRIMARY KEY (account_id);

SHOW CREATE TABLE trans;

ALTER TABLE trans
ADD CONSTRAINT PRIMARY KEY (trans_id);

ALTER TABLE trans
ADD CONSTRAINT fk_trans_account
FOREIGN KEY (account_id) REFERENCES account(account_id);

-- data types
SELECT `date` FROM trans LIMIT 10;

SELECT STR_TO_DATE(trans.date, '%y%m%d') as formatted_date from trans LIMIT 10;

ALTER TABLE trans ADD column formatted_date DATE;

UPDATE trans SET trans.formatted_date = STR_TO_DATE(trans.date, '%y%m%d');

SELECT `date` AS original_date, formatted_date FROM trans LIMIT 10;

-- missing values
SELECT COUNT(distinct trans_id, account_id) FROM trans WHERE amount IS NULL OR amount = 0;

UPDATE trans
SET amount =
  (SELECT AVG(amount)
   FROM trans WHERE amount IS NOT NULL
  OR amount <> 0)
WHERE amount IS NULL OR amount = 0;

-- duplicates

SELECT trans_id, account_id, COUNT(*) FROM trans GROUP BY 1 HAVING COUNT(*) > 2;

SELECT account_id, COUNT(*) FROM account GROUP BY account_id HAVING COUNT(*) > 2;

-- transformation

SELECT DISTINCT `type` FROM trans;

ALTER TABLE trans
ADD COLUMN formatted_type VARCHAR(100);

UPDATE trans
SET formatted_type = (
case `type`
when 'PRIJEM' then 	'incoming credit'
when 'VYDAJ' then 	'outgoing debit'
when 'VYBER' then 	'withdrawal'
ELSE NULL
END);

SELECT DISTINCT `type`, formatted_type FROM trans;

-- create a new joined view or table

CREATE VIEW account_loan_jt AS
  (SELECT account.account_id,
          account.district_id,
          account.frequency,
          account.date AS account_date,
          loan.loan_id,
          loan.date AS loan_date,
          loan.amount,
          loan.duration,
          loan.payments,
          loan.`status`
   FROM ACCOUNT
   INNER JOIN loan ON account.account_id = loan.account_id);

-- Rename columns

ALTER TABLE district CHANGE COLUMN A1 district_id INT;
SELECT district_id FROM district LIMIT 10;

ALTER TABLE district CHANGE COLUMN A2 district_name VARCHAR(100);
SELECT district_name FROM district LIMIT 10;

