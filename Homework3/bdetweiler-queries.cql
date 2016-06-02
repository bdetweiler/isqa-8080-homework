// ***************************************************************************************************
// * Author:     Brian Detweiler
// * File:       bdetweiler-queries.cql
// * Class:      ISQA 8080
// * Assignment: Homework 3
// * Date:       06JUNE16
// ***************************************************************************************************

USE bdetweiler;

// Let's start simple by viewing all the movies in the database. 
SELECT *
  FROM movies;
  
// Man, those are some good movies. If it were me, I'd give them all 5 stars. 
// But let's see what our users rated them.
SELECT *
  FROM ratings_by_user;

// Whaaaat. How are you going to give Eraserhead 3 stars, User number 2. It was a masterpiece!
// Surely someone else has better taste in movies than you...
SELECT *
  FROM ratings_by_movie
 WHERE movie_id = 3676;

// Ahh, User 1 thinks like I do. I wonder how many movies he/she has rated? 
SELECT count(*)
  FROM ratings_by_user
 WHERE user_id = 1;

// And what might they be? 
SELECT *
  FROM ratings_by_user
 WHERE user_id = 1;
 
// Since we didn't denormalize all the way, we have to manually look up the movie titles
SELECT *
  FROM movies
 WHERE movie_id IN (3676, 3735);

// Yeah, Serpico. Love me some Pacino.
// Ok, let's see what movies User 1 rated that come after movie_id 3676
SELECT *
  FROM ratings_by_user
 WHERE user_id = 1 AND movie_id > 3676;

// Of course we already knew this, but if our dataset was larger, we wouldn't
// How many Horror movies do we have?
SELECT COUNT(*)
  FROM movies_by_category
 WHERE category = 'Horror';

// Just 2. And we know Eraserhead is one.
// Let's look at our movies in the Horror category greater than Eraserhead
SELECT *
  FROM movies_by_category
 WHERE category = 'Horror' AND movie_id > 3676;
 
// Hellraiser! One of my favorite horror movies. Let's see what ratings it got.
SELECT *
  FROM ratings_by_movie
 WHERE movie_id = 3917; 
 
// 5 stars. I couldn't agree more!