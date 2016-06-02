CREATE KEYSPACE tutorial WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

use tutorial;

CREATE TABLE comments_by_follower (
	follower_username text,
	comment_date timestamp,
	post_ID int,
	artist_username text,
	comment_content text,
	PRIMARY KEY (follower_username, comment_date)
) WITH CLUSTERING ORDER BY (comment_date DESC);


CREATE TABLE comments_by_post (
	post_ID int,
	comment_date timestamp,
	comment_content text,
	follower_username text,
	PRIMARY KEY (post_ID, comment_date)
) WITH CLUSTERING ORDER BY (comment_date DESC);


CREATE TABLE pledge_by_artist (
	artist_username text,
	follower_username text,
	pledge_start_Date timestamp,
	pledge_end_date timestamp,
	amount float,
	PRIMARY KEY (artist_username, follower_username, pledge_start_Date)
) WITH CLUSTERING ORDER BY (follower_username ASC, pledge_start_Date DESC);

CREATE TABLE pledge_by_follower (
	follower_username text,
	artist_username text,
	pledge_start_Date timestamp,
	pledge_end_date timestamp,
	amount float,
	PRIMARY KEY (follower_username, artist_username, pledge_start_Date)
) WITH CLUSTERING ORDER BY (artist_username ASC, pledge_start_Date DESC);



INSERT INTO comments_by_follower (follower_username, comment_Date, post_ID, artist_username, comment_content)
VALUES ('Tim', '2016-04-12 21:24:00', 1, 'Ruby', 'Good content, thanks!!!');
INSERT INTO comments_by_post (post_ID, comment_Date, comment_content, follower_username)
VALUES (  1, '2016-04-12 21:24:00', 'Good content, thanks !!!', 'Tim');

INSERT INTO comments_by_follower (follower_username, comment_Date, post_ID, artist_username, comment_content)
VALUES ('Joe', '2016-04-12 21:49:00', 1, 'Ruby', 'Great picture.');
INSERT INTO comments_by_post (post_ID, comment_Date, comment_content, follower_username)
VALUES (  1, '2016-04-12 21:49:00', 'Great picture.', 'Joe');

INSERT INTO comments_by_follower (follower_username, comment_Date, post_ID, artist_username, comment_content)
VALUES ('Tim', '2015-04-12 21:54:00', 2, 'Ruby', 'Very well done again!');
INSERT INTO comments_by_post (post_ID, comment_Date, comment_content, follower_username)
VALUES (  2, '2016-04-12 21:54:00', 'Very well done again!', 'Tim');


INSERT INTO pledge_by_artist (artist_username, follower_username, pledge_start_date, amount)
VALUES ('Ruby', 'Tim', '2016-04-02 14:40:00', 4);
INSERT INTO pledge_by_follower (follower_username, artist_username, pledge_start_date, amount)
VALUES ('Tim', 'Ruby', '2016-04-02 14:40:00', 4);

INSERT INTO pledge_by_artist (artist_username, follower_username, pledge_start_date, amount)
VALUES ('Ruby', 'Joe', '2016-04-02 18:40:00', 1.5);
INSERT INTO pledge_by_follower (follower_username, artist_username, pledge_start_date, amount)
VALUES ('Joe', 'Ruby', '2016-04-02 18:40:00', 1.5);
