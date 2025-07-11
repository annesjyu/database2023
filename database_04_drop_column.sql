USE transactions;

ALTER TABLE banking_accounts DROP COLUMN IF EXISTS active;

-- Now, add the 'active' column with the specified properties.
-- This will always succeed after the potential drop operation above.
ALTER TABLE banking_accounts ADD COLUMN active BOOL NOT NULL DEFAULT TRUE;

-- Show the updated table structure to verify the changes.
SHOW CREATE TABLE banking_accounts;

SELECT * FROM banking_accounts;