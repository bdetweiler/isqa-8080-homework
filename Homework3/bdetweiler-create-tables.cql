// ***************************************************************************************************
// * Author:     Brian Detweiler
// * File:       bdetweiler-create-tables.cql
// * Class:      ISQA 8080
// * Assignment: Homework 3
// * Date:       06JUNE16
// ***************************************************************************************************

// Create a keyspace with replication class SimpleStrategy and replication factor 1
// since we are running a single instance on our machine
CREATE KEYSPACE bdetweiler WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

// Switch to the keyspace we just created
USE bdetweiler;

// ***************************************************************************************************
// *                    CREATE TABLES
// ***************************************************************************************************

// Create a table to lookup movies
CREATE TABLE movies (
	movie_id int,
	title text,
	year int,
	category set <text>,
	PRIMARY KEY (movie_id)
);

// Create a table to lookup ratings by movie
// NOTE: The instructions did not mention it, but I would have added a movie title since we can't join
CREATE TABLE ratings_by_movie (
	movie_id int,
	user_id int,
	rating float,
	timestamp int,
	PRIMARY KEY (movie_id, user_id)
) WITH CLUSTERING ORDER BY (user_id ASC);


// Create a table to lookup ratings by user
// NOTE: The instructions did not mention it, but I would have added a movie title since we can't join
CREATE TABLE ratings_by_user (
	user_id int,
	movie_id int,
	rating float,
	timestamp int,
	PRIMARY KEY (user_id, movie_id)
) WITH CLUSTERING ORDER BY (movie_id ASC);

// Create a table to lookup movies by category
CREATE TABLE movies_by_category (
	category text,
	movie_id int,
	title text,
	year int,
	PRIMARY KEY (category, movie_id)
) WITH CLUSTERING ORDER BY (movie_id ASC);


// ***************************************************************************************************
// *                    CREATE TABLES
// ***************************************************************************************************

// Hellraiser
INSERT INTO movies (movie_id, title, year, category)
VALUES (3917, 'Hellraiser', 1987, {'Horror'});
INSERT INTO movies_by_category (category, movie_id, title, year)
VALUES ('Horror', 3917, 'Hellraiser', 1987);
INSERT INTO ratings_by_movie (movie_id, user_id, rating, timestamp)
VALUES (3917, 7, 5, 965741268);
INSERT INTO ratings_by_user (user_id, movie_id, rating, timestamp)
VALUES (7, 3917, 5, 965741268);

// Highlander Endgame
INSERT INTO movies (movie_id, title, year, category)
VALUES (3889, 'Highlander Endgame', 2000, {'Action', 'Adventure', 'Fantasy'});
INSERT INTO movies_by_category (category, movie_id, title, year)
VALUES ('Action', 3889, 'Highlander Endgame', 2000);
INSERT INTO movies_by_category (category, movie_id, title, year)
VALUES ('Adventure', 3889, 'Highlander Endgame', 2000);
INSERT INTO movies_by_category (category, movie_id, title, year)
VALUES ('Fantasy', 3889, 'Highlander Endgame', 2000);
INSERT INTO ratings_by_movie (movie_id, user_id, rating, timestamp)
VALUES (3889, 34, 4, 965799201);
INSERT INTO ratings_by_user (user_id, movie_id, rating, timestamp)
VALUES (34, 3889, 4, 965799201);

// Serpico
INSERT INTO movies (movie_id, title, year, category)
VALUES (3735, 'Serpico', 1973, {'Crime', 'Drama'});
INSERT INTO movies_by_category (category, movie_id, title, year)
VALUES ('Crime', 3735, 'Serpico', 1973);
INSERT INTO movies_by_category (category, movie_id, title, year)
VALUES ('Drama', 3735, 'Serpico', 1973);
INSERT INTO ratings_by_movie (movie_id, user_id, rating, timestamp)
VALUES (3735, 1, 4, 966191607);
INSERT INTO ratings_by_user (user_id, movie_id, rating, timestamp)
VALUES (1, 3735, 4, 966191607);
INSERT INTO ratings_by_movie (movie_id, user_id, rating, timestamp)
VALUES (3735, 6, 4, 966192334);
INSERT INTO ratings_by_user (user_id, movie_id, rating, timestamp)
VALUES (6, 3735, 4, 966192334);

// Eraserhead
INSERT INTO movies (movie_id, title, year, category)
VALUES (3676, 'Eraserhead', 1977, {'Crime', 'Drama'});
INSERT INTO movies_by_category (category, movie_id, title, year)
VALUES ('Drama', 3676, 'Eraserhead', 1977);
INSERT INTO movies_by_category (category, movie_id, title, year)
VALUES ('Horror', 3676, 'Eraserhead', 1977);
INSERT INTO ratings_by_movie (movie_id, user_id, rating, timestamp)
VALUES (3676, 1, 5, 966363845);
INSERT INTO ratings_by_user (user_id, movie_id, rating, timestamp)
VALUES (1, 3676, 5, 966191607);
INSERT INTO ratings_by_movie (movie_id, user_id, rating, timestamp)
VALUES (3676, 2, 3, 966363845);
INSERT INTO ratings_by_user (user_id, movie_id, rating, timestamp)
VALUES (2, 3676, 3, 966363845);

// Outlaw Josie Wales, The
INSERT INTO movies (movie_id, title, year, category)
VALUES (3508, 'Outlaw Josie Wales, The', 1976, {'Western'});
INSERT INTO movies_by_category (category, movie_id, title, year)
VALUES ('Western', 3508, 'Outlaw Josie Wales, The', 1976);
INSERT INTO ratings_by_movie (movie_id, user_id, rating, timestamp)
VALUES (3508, 110, 4, 966974226);
INSERT INTO ratings_by_user (user_id, movie_id, rating, timestamp)
VALUES (110, 3508, 4, 966974226);

