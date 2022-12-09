CREATE TABLE Groups(
	Id int Not Null PRIMARY KEY IDENTITY,
	bandName [nvarchar](254) NOT NULL unique,
	bandDescription [nvarchar](254) NOT NULL,
	bandStyle [nvarchar](254) NOT NULL)

CREATE TABLE Albums(
	Id int Not Null PRIMARY KEY IDENTITY,
	albumAuthor [nvarchar](254) NOT NULL unique  REFERENCES Groups (bandName),
	albumName [nvarchar](254) NOT NULL)

CREATE TABLE Users(
	Id int Not Null PRIMARY KEY IDENTITY,
	userName nvarchar(254) NOT NULL unique,
	userPassword [nvarchar](254) NOT NULL,
	email nvarchar(254) UNIQUE NOT NULL)

Create TABLE Cities(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	cityName nvarchar(254) NOT NULL UNIQUE,
	concertDate date UNIQUE NOT NULL)

Create TABLE Tickets(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	cityTicket nvarchar(254) UNIQUE NOT NULL REFERENCES Cities (cityName),
	countOfTickets int Check(countOfTickets>=0 AND countOfTickets <= 60) NOT NULL)

Create TABLE TicketPlaces(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	cityNameTicket nvarchar(254) NOT NULL REFERENCES Cities (cityName),
	place  nvarchar(254) NOT NULL UNIQUE)

CREATE TABLE OrderedTickets(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	ticketUser nvarchar(254) UNIQUE REFERENCES Users (userName) NOT NULL,
	city nvarchar(254) REFERENCES Cities (cityName) NOT NULL,
	ticketPlace nvarchar(254) REFERENCES TicketPlaces (place) NOT NULL,
	ticketCount int NOT NULL,
	ticketDate date  REFERENCES Cities (concertDate) NOT NULL)

	CREATE TABLE AlbumsFromXML(
	Id int Not Null PRIMARY KEY IDENTITY,
	albumAuthor [nvarchar](254) NOT NULL unique  REFERENCES Groups (bandName),
	albumName [nvarchar](254) NOT NULL)
