CREATE DATABASE FAMOUS_PEOPLE;
USE FAMOUS_PEOPLE;

CREATE TABLE famous_people (
    people_id INT PRIMARY KEY,
    name VARCHAR(20),
    country_of_birth VARCHAR(20),
    date_oTablesf_birth DATE,
    industry VARCHAR(20)
);

INSERT INTO famous_people VALUES 
(1, 'Beyoncé', 'USA', '1981-09-04', 'Music & Movies'),
(2, 'Rihanna', 'Barbados', '1988-02-20', 'Music & Movies'),
(3, 'Davido', 'Nigeria', '1992-11-21', 'Music'),
(4, 'Tyla', 'South Africa', '2002-01-30', 'Music'),
(5, 'Stonebwoy', 'Ghana', '1988-03-05', 'Music'),
(6, 'Vybz Kartel', 'Jamaica', '1976-01-07', 'Music'),
(7, 'Jux', 'Tanzania', '1989-09-01', 'Music'),
(8, 'Diamond Platnumz', 'Tanzania', '1989-10-02', 'Music'),
(9, 'Kendrick Lamar', 'USA', '1987-06-17', 'Music'),
(10, 'Sarkodie', 'Ghana', '1985-07-10', 'Music'),
(11, 'Chloe Bailey', 'USA', '1998-07-01', 'Music & Movies'),
(12, 'Jackie Appiah', 'Ghana', '1983-12-05', 'Movies'),
(13, 'Kevin Hart', 'USA', '1979-07-06', 'Movies'),
(14, 'Rotimi', 'USA', '1988-11-30', 'Music & Movies'),
(15, 'Lady Gaga', 'USA', '1986-03-28', 'Music & Movies');



CREATE TABLE music (
    music_id INT PRIMARY KEY,
    artist_name VARCHAR(20),
    genre VARCHAR(20),
    release_year INT,
    revenue DECIMAL(10,2),
    people_id INT,
    FOREIGN KEY (people_id) REFERENCES famous_people(people_id)
);

INSERT INTO music VALUES 
(1, 'Beyoncé', 'R&B, Pop', 2016, 500, 1),
(2, 'Rihanna', 'Pop, R&B', 2016, 600, 2),
(3, 'Davido', 'Afrobeats', 2020, 50, 3),
(4, 'Tyla', 'Amapiano', 2023, 10, 4),
(5, 'Stonebwoy', 'Reggae, Dancehall', 2017, 20, 5),
(6, 'Vybz Kartel', 'Dancehall', 2014, 15, 6),
(7, 'Jux', 'Bongo Flava', 2018, 50, 7),
(8, 'Diamond Platnumz', 'Bongo Flava', 2019, 25, 8),
(9, 'Kendrick Lamar', 'Hip-Hop', 2017, 450, 9),
(10, 'Sarkodie', 'Hip-Hop, Afrobeats', 2020, 30, 10),
(11, 'Chloe Bailey', 'R&B, Pop', 2022, 12, 11),
(12, 'Rotimi', 'R&B, Afrobeats', 2021, 8, 14),
(13, 'Lady Gaga', 'Pop, Dance', 2020, 400, 15);

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name TEXT,
    actor VARCHAR(20),
    genre VARCHAR(50),
    release_year INT,
    revenue DECIMAL(10,2),
    people_id INT,
    FOREIGN KEY (people_id) REFERENCES famous_people(people_id)
);

INSERT INTO movies VALUES 
(1, 'Beyoncé', 'Musical, Drama', 2006, 155, 1),
(2, 'Rihanna', 'Sci-Fi, Action', 2012, 303, 2),
(3, 'Jackie Appiah', 'Drama, Romance', 2015, 10, 12),
(4, 'Kevin Hart', 'Comedy', 2016, 800, 13),
(5, 'Rotimi', 'Crime, Drama', 2014, 100, 14),
(6, 'Lady Gaga', 'Drama, Romance', 2018, 436, 15);

CREATE TABLE attributes (
    attribute_id INT PRIMARY KEY,
    name VARCHAR(20),
    gender VARCHAR(10),
    marital_status VARCHAR(20),
    networth DECIMAL(10,2),
    people_id INT,
    FOREIGN KEY (people_id) REFERENCES famous_people(people_id)
);

INSERT INTO attributes VALUES 
(1, 'Beyoncé', 'Female', 'Married', 540, 1),
(2, 'Rihanna', 'Female', 'Marriage', 1400, 2),
(3, 'Davido', 'Male', 'Married', 50, 3),
(4, 'Tyla', 'Female', 'Single', 50, 4),
(5, 'Stonebwoy', 'Male', 'Married', 82, 5),
(6, 'Vybz Kartel', 'Male', 'Single', 840, 6),
(7, 'Jux', 'Male', 'Married', 1400, 7),
(8, 'Diamond Platnumz', 'Male', 'Single', 50, 8),
(9, 'Kendrick Lamar', 'Male', 'Single', 85, 9),
(10, 'Sarkodie', 'Male', 'Married', 108, 10),
(11, 'Chloe Bailey', 'Female', 'Married', 540, 11),
(12, 'Jackie Appiah', 'Female', 'Single', 1400, 12),
(13, 'Kevin Hart', 'Male', 'Married', 50, 13),
(14, 'Rotimi', 'Male', 'Married', 100, 14),
(15, 'Lady Gaga', 'Female', 'Single', 230, 15);

CREATE TABLE awards (
    award_id INT PRIMARY KEY,
    industry VARCHAR(20),
    award_category VARCHAR(50),
    year INT,
    receiver VARCHAR(50),
    people_id INT,
    FOREIGN KEY (people_id) REFERENCES famous_people(people_id)
);

INSERT INTO awards VALUES 
(1, 'Music', 'Best Female Artist', 2017, 'Beyoncé', 1),
(2, 'Music', 'Best R&B Album', 2018, 'Rihanna', 2),
(3, 'Music', 'Best International Act', 2018, 'Davido', 3),
(4, 'Music', 'Best New Artist', 2023, 'Tyla', 4),
(5, 'Music', 'Best Reggae Act', 2015, 'Stonebwoy', 5),
(6, 'Music', 'Best Dancehall Artist', 2014, 'Vybz Kartel', 6),
(7, 'Music', 'Best Male Vocalist', 2019, 'Jux', 7),
(8, 'Music', 'Best African Act', 2017, 'Diamond Platnumz', 8),
(9, 'Music', 'Best Rap Album', 2018, 'Kendrick Lamar', 9),
(10, 'Music', 'Best Hiphop Artist', 2021, 'Sarkodie', 10),
(11, 'Music & Movies', 'Best Rising Star', 2022, 'Chloe Bailey', 11),
(12, 'Movies', 'Best Actress', 2013, 'Jackie Appiah', 12),
(13, 'Movies', 'Best Comedic Performance', 2017, 'Kevin Hart', 13),
(14, 'Music & Movies', 'Best Multi-talented Artist', 2021, 'Rotimi', 14),
(15, 'Music & Movies', 'Best Pop Performance', 2020, 'Lady Gaga', 15);

# Query 1: Retrieve all music artists with their genres, release years, and their associated net worth
SELECT 
    m.artist_name AS Artist,
    m.genre AS Genre,
    m.release_year AS Release_Year,
    a.networth AS Net_Worth
FROM 
    music m
JOIN 
    famous_people fp ON m.people_id = fp.people_id
JOIN 
    attributes a ON fp.people_id = a.people_id
WHERE 
    fp.industry LIKE '%Music%';

# Query 2: Find the top 3 movies with the highest revenue along with the actor's name
SELECT 
    mv.actor AS Actor,
    mv.genre AS Genre,
    mv.revenue AS Revenue
FROM 
    movies mv
JOIN 
    famous_people fp ON mv.people_id = fp.people_id
ORDER BY 
    mv.revenue DESC
LIMIT 3;

# Query 3: Get a list of awards won by famous people born in the USA
SELECT 
    a.award_category AS Award,
    a.year AS Award_Year,
    fp.name AS Recipient,
    fp.country_of_birth AS Country
FROM 
    awards a
JOIN 
    famous_people fp ON a.people_id = fp.people_id
WHERE 
    fp.country_of_birth = 'USA';
    
# Query 4: Calculate the total revenue generated by artists in the music industry
SELECT 
    SUM(m.revenue) AS Total_Music_Revenue
FROM 
    music m;
    
# Query 5: Retrieve all multi-talented individuals (in both Music & Movies) with their attributes and awards
SELECT 
    fp.name AS Name,
    fp.industry AS Industry,
    a.gender AS Gender,
    a.networth AS Net_Worth,
    aw.award_category AS Award
FROM 
    famous_people fp
JOIN 
    attributes a ON fp.people_id = a.people_id
JOIN 
    awards aw ON fp.people_id = aw.people_id
WHERE 
    fp.industry = 'Music & Movies';
