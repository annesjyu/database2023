USE transactions;

DROP TABLE IF EXISTS banking_banker;

CREATE OR REPLACE TABLE banking_banker (
    employment_id VARCHAR(20) NOT NULL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    title VARCHAR(50) NOT NULL,
    branch VARCHAR(100) NOT NULL,
    employment_status ENUM('active', 'inactive', 'terminated') NOT NULL
);

SHOW TABLES;

INSERT INTO banking_banker (
    employment_id,
    employee_name,
    title,
    branch,
    employment_status
)
VALUES (
    'ABC202021',
    'David Chen',
    'Account Manager',
    'Cupertino',
    'active'
);

SELECT * FROM banking_banker;

ALTER TABLE banking_accounts
#ADD COLUMN banker_id VARCHAR(20),
ADD CONSTRAINT fk_banker
FOREIGN KEY (banker_id)
REFERENCES banking_banker(employment_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

UPDATE banking_accounts
SET banker_id = 'ABC202021'
WHERE account_number = '101';

SELECT * FROM banking_banker;
