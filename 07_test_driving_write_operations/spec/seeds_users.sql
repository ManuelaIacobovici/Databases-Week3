-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)


TRUNCATE TABLE users, posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.


INSERT INTO users (user_account, email_address, username) VALUES ('user_account_1', 'email1@yahoo.co.uk', 'username_1');
INSERT INTO users (user_account, email_address, username) VALUES ('user_account_2', 'email2@yahoo.co.uk', 'username_2');
INSERT INTO users (user_account, email_address, username) VALUES ('user_account_3', 'email3@yahoo.co.uk', 'username_3');