use tutorial;

SELECT *
FROM comments_by_follower;

SELECT count(*)
FROM comments_by_follower;

SELECT *
FROM comments_by_follower
WHERE artist_username = 'Ruby';
// Does not work. We would need to make artist_username a clustering key ((follower_username), artist_username, comment_date)
// This is why you need to consider your queries before you design your tables

SELECT *
FROM comments_by_post;

SELECT *
FROM comments_by_post
WHERE comment_date > '2016-4-12 09:30:00';
// We discussed this in class. Cassandra would need to go to all rows and all nodes which is not efficient.
// A great explanation can be found here: http://www.datastax.com/dev/blog/allow-filtering-explained-2

SELECT *
FROM comments_by_post
WHERE post_ID= 2 AND comment_date > '2016-4-12 09:30:00';
// Strangely, I get an error in developer but can execute the query here and in the cql shell without problems.
// Bug in the developer? Because this query is efficient and should not have troubles with performance.




