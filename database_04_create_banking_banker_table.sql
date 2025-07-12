USE transactions;

DROP TABLE IF EXISTS banking_banker;

CREATE TABLE banking_banker (
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

