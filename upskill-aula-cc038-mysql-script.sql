DROP DATABASE IF EXISTS upskill_2021_blog;
CREATE DATABASE IF NOT EXISTS upskill_2021_blog;
USE upskill_2021_blog;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
	id CHAR(12) NOT NULL,
	name VARCHAR(50) NOT NULL,
	birthdate DATE DEFAULT NULL,
	job VARCHAR(50) DEFAULT NULL,
	PRIMARY KEY (id),
	KEY name (name)
);

INSERT INTO users (id, name, birthdate, job) VALUES
('obama', 'Barack Obama', '1961-08-04', 'President'),
('ccoutinho', 'Carlos Coutinho', '1973-03-20', 'Programmer'),
('linus', 'Linus Torvalds', '1969-12-28', 'Developer'),
('richard', 'Richard Stallman', '1968-03-01', 'Evangelizer'),
('user1', 'User One', '1981-05-18', 'Unemployed'),
('user2', 'User 2', '1990-05-26', 'Blogger'),
('user3', 'User 3', '1943-12-02', 'Blogger'),
('user4', 'User 4', '1990-06-01', 'Unemployed');


DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments (
	id int NOT NULL AUTO_INCREMENT,
	body text,
	user_id CHAR(12) NOT NULL,
	post_id int NOT NULL,
	PRIMARY KEY (id),
	KEY body (body(255)),
	KEY post_id (post_id),
	KEY user_id (user_id)
);

INSERT INTO comments (id, body, user_id, post_id) VALUES
(1, 'You rock!', 'obama', 1),
(NULL, 'And you rule!', 'linus', 1),
(3, 'No comments', 'ccoutinho', 2),
(4, 'Will you get Linux ruling?', 'obama', 1),
(5, 'You wished!', 'richard', 1),
(16, 'M$ sucks!', 'obama', 3),
(NULL, 'Yeah, but we will deal with it!', 'linus', 3),
(20, 'This time I agree with you!', 'richard', 3);

DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts (
	id int NOT NULL AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	body text NOT NULL,
	creation_date timestamp DEFAULT NOW(),
	user_id CHAR(12) NOT NULL,
	photo blob,
	PRIMARY KEY (id),
	KEY title (title),
	KEY body (body(200)),
	KEY user_id (user_id)
);

INSERT INTO posts (id, title, body, creation_date, user_id, photo) VALUES
(NULL, 'Linux is great!', 'Blah blah blah blah. Blah blah blah blah. Blah blah blah blah. Blah blah blah blah. Linux. Blah blah blah blah. Blah blah blah blah.', '2021-05-03 18:07:19', 'obama', NULL),
(NULL, 'Post 2', 'Post 2', '2021-05-06 15:11:21', 'ccoutinho', NULL),
(NULL, 'M$ is rotten!', 'Blah blah blah blah. Blah blah blah blah. Blah blah blah blah. Blah blah blah blah. Microsoft. Blah blah blah blah. Blah blah blah blah. Blah blah blah blah. Blah blah blah blah. ', '2021-05-03 18:08:54', 'linus', NULL),
(NULL, 'FMI', 'Help, the FMI is coming!', '2021-05-03 18:11:42', 'user1', NULL),
(NULL, 'iPhone is dead!', 'iPhone is dead!', '2011-05-13 18:25:53', 'linus', NULL),
(NULL, 'Android is great!', 'iPad is dead! Apple sucks!', NULL, 'linus', NULL);


