USE albums_db;
SELECT * FROM albums;
-- How many rows are in the albums table? 
-- 31 rows, counted manually
SELECT DISTINCT name from albums;
-- not the search we want
SELECT DISTINCT artist FROM albums;
-- How many unique artist names are in the albums table?
-- 23 unique 
-- What is the primary key for the albums table? 
-- id is the primary key
SELECT * FROM albums ORDER BY release_date ASC;
-- What is the oldest release date for any album in the albums table? What is the most recent release date
-- oldest release is Sgt. Pepper's Lonely Hearts Club Band, from Beatles
-- newest release is 21 from AdeleT
SELECT name, artist FROM albums WHERE artist = 'Pink Floyd';
-- The name of all albums by Pink Floyd?
-- The Dark Side of the Moon and The Wall
SELECT name, release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- The year Sgt. Pepper's Lonely Hearts Club Band was released? 
-- 1967
SELECT name, genre FROM albums WHERE name = 'Nevermind';
-- The genre for the album Nevermind?
-- Grunge, Alternative rock
SELECT name FROM albums where release_date BETWEEN 1990 AND 1999;
-- Which albums were released in the 1990s?
-- 'The Bodyguard'
/*'Jagged Little Pill'
'Come On Over'
'Falling into You'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Titanic: Music from the Motion Picture'
'Metallica'
'Nevermind'
'Supernatural'*/

SELECT name FROM albums WHERE sales < 20.0;
-- Which albums had less than 20 million certified sales?
/* 'Grease: The Original Soundtrack from the Motion Picture'
'Bad'
'Sgt. Pepper\'s Lonely Hearts Club Band'
'Dirty Dancing'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Abbey Road'
'Born in the U.S.A.'
'Brothers in Arms'
'Titanic: Music from the Motion Picture'
'Nevermind'
'The Wall'*/
SELECT *
FROM albums
WHERE genre REGEXP '^Rock|Hard rock|Progressive rock';
/*  query results does not include albums with a genre of "Hard rock" or "Progressive rock"?
becuase it looks for genre "Rock" only useless specified otherwise

-- 