-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)


TRUNCATE TABLE posts, users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO users (user_account, email_address, username) VALUES ('user_account_1', 'email1@yahoo.co.uk', 'username_1');
INSERT INTO users (user_account, email_address, username) VALUES ('user_account_2', 'email2@yahoo.co.uk', 'username_2');
INSERT INTO users (user_account, email_address, username) VALUES ('user_account_3', 'email3@yahoo.co.uk', 'username_3');
INSERT INTO posts (title, content, number_of_views, user_id) VALUES ('Title_1', 'Content_1', '10', '1');
INSERT INTO posts (title, content, number_of_views, user_id) VALUES ('Title_2', 'Content_2', '15', '2');
INSERT INTO posts (title, content, number_of_views, user_id) VALUES ('Title_3', 'Content_3', '20', '3');