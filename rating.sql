DROP DATABASE IF EXISTS movieratings;
CREATE DATABASE movieratings; USE movieratings;

# Delete the tables if they already exist
DROP TABLE if EXISTS Movie;
DROP TABLE if EXISTS Reviewer;
DROP TABLE if EXISTS Rating;

# Create the schema for our tables
CREATE TABLE Movie(MID INT, title TEXT, YEAR INT, director TEXT, PRIMARY KEY(MID));
CREATE TABLE Reviewer(rID INT, name TEXT, PRIMARY KEY (rID));

CREATE TABLE rating(
rID INT, MID INT, stars INT, ratingDate DATE, 
PRIMARY KEY(rID, MID), 
FOREIGN KEY(MID) REFERENCES movie(MID),
FOREIGN KEY(rID) REFERENCES reviewer(rID));

# populate the tables with our data

# Add movies
INSERT INTO Movie (MID, title, YEAR, director) VALUES 
(1, 'Sunset Dreams', 2020, 'Alice Johnson'),
(2, 'Moonrise Chronicles', 2019, 'Bob Smith'),
(3, 'Ocean Whispers', 2022, 'Charlie Davis'),
(4, 'Stellar Winds', 2021, 'Diana Ross'),
(5, 'Galactic Echoes', 2018, 'Edward Norton'),
(6, 'Forest Whispers', 2015, 'Fiona Apple'),
(7, 'Mountain Mysteries', 2017, 'George Lucas'),
(8, 'River Tales', 2016, 'Helen Mirren'),
(9, 'Desert Secrets', 2023, 'Igor Stravinsky'),
(10, 'Island Adventures', 2020, 'Jack Nicholson'),
(11, 'Urban Legends', 2021, 'Katie Holmes'),
(12, 'Winter Whispers', 2019, 'Louis Armstrong'),
(13, 'Spring Secrets', 2018, 'Maria Callas'),
(14, 'Summer Memories', 2017, 'Nancy Wilson'),
(15, 'Autumn Echoes', 2020, 'Oscar Wilde'),
(16, 'Garden Mysteries', 2022, 'Pablo Picasso'),
(17, 'Jungle Journeys', 2023, 'Quincy Jones'),
(18, 'Arctic Adventures', 2019, 'Rachael Ray'),
(19, 'Tropical Tales', 2020, 'Steve Jobs'),
(20, 'Cave Secrets', 2018, 'Tina Turner'),
(100, 'Starlight Memories', 2023, 'Zara Kim');

# Add more older movies
INSERT INTO Movie VALUES(101, 'Gone with the Wind', 1939, 'Victor Fleming');
INSERT INTO Movie VALUES(102, 'Star Wars', 1977, 'George Lucas');
INSERT INTO Movie VALUES(103, 'The Sound of Music', 1965, 'Robert Wise');
INSERT INTO Movie VALUES(104, 'E.T.', 1982, 'Steven Spielberg');
INSERT INTO Movie VALUES(105, 'Titanic', 1997, 'James Cameron');
INSERT INTO Movie VALUES(106, 'Snow White', 1937, NULL);
INSERT INTO Movie VALUES(107, 'Avatar', 2009, 'James Cameron');
INSERT INTO Movie VALUES(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

# Add reviewers
INSERT INTO Reviewer (rID, name) VALUES
(1, 'Andrew Simmons'),
(2, 'Barbara Young'),
(3, 'Charlie Zhang'),
(4, 'Daphne Vasquez'),
(5, 'Edward Martinez'),
(6, 'Fiona Kennedy'),
(7, 'George Lincoln'),
(8, 'Helen Robinson'),
(9, 'Ivan Gomez'),
(10, 'Julia King'),
(11, 'Kenneth Watson'),
(12, 'Laura Johnson'),
(13, 'Mario Fernandez'),
(14, 'Nina Gonzalez'),
(15, 'Oscar Peterson'),
(16, 'Paula Hamilton'),
(17, 'Quincy Adams'),
(18, 'Rebecca Sanchez'),
(19, 'Steven Harris'),
(20, 'Tina Wallace'),
(100, 'Zara Kim');

# Add more old reviewers.
INSERT INTO Reviewer VALUES(201, 'Sarah Martinez');
INSERT INTO Reviewer VALUES(202, 'Daniel Lewis');
INSERT INTO Reviewer VALUES(203, 'Brittany Harris');
INSERT INTO Reviewer VALUES(204, 'Mike Anderson');
INSERT INTO Reviewer VALUES(205, 'Chris Jackson');
INSERT INTO Reviewer VALUES(206, 'Elizabeth Thomas');
INSERT INTO Reviewer VALUES(207, 'James Cameron');
INSERT INTO Reviewer VALUES(208, 'Ashley White');

# Add ratings.
INSERT INTO Rating (rID, MID, stars, ratingDate) VALUES 
(1, 1, 5, '2023-01-01'),
(2, 2, 4, '2023-01-02'),
(3, 3, 3, '2023-01-03'),
(4, 4, 2, '2023-01-04'),
(5, 5, 5, '2023-01-05'),
(6, 6, 4, '2023-01-06'),
(7, 7, 3, '2023-01-07'),
(8, 8, 4, '2023-01-08'),
(9, 9, 5, '2023-01-09'),
(10, 10, 4, '2023-01-10'),
(11, 11, 3, '2023-01-11'),
(12, 12, 2, '2023-01-12'),
(13, 13, 5, '2023-01-13'),
(14, 14, 4, '2023-01-14'),
(15, 15, 3, '2023-01-15'),
(16, 16, 4, '2023-01-16'),
(17, 17, 5, '2023-01-17'),
(18, 18, 4, '2023-01-18'),
(19, 19, 3, '2023-01-19'),
(20, 20, 5, '2023-01-20'),
(100, 100, 5, '2023-04-10');

# Add more ratings for older movies.
INSERT INTO Rating VALUES(201, 101, 2, '2011-01-22');
INSERT INTO Rating VALUES(201, 102, 4, '2011-01-27');
INSERT INTO Rating VALUES(202, 106, 4, NULL);
INSERT INTO Rating VALUES(203, 103, 2, '2011-01-20');
INSERT INTO Rating VALUES(203, 108, 4, '2011-01-12');
INSERT INTO Rating VALUES(203, 107, 2, '2011-01-30');
INSERT INTO Rating VALUES(204, 101, 3, '2011-01-09');
INSERT INTO Rating VALUES(205, 103, 3, '2011-01-27');
INSERT INTO Rating VALUES(205, 104, 2, '2011-01-22');
INSERT INTO Rating VALUES(205, 108, 4, NULL);
INSERT INTO Rating VALUES(206, 107, 3, '2011-01-15');
INSERT INTO Rating VALUES(206, 106, 5, '2011-01-19');
INSERT INTO Rating VALUES(207, 107, 5, '2011-01-20');
INSERT INTO Rating VALUES(208, 104, 3, '2011-01-02');

