--Groups
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( N'3Teeth', N'3Teeth (stylized as 3TƎETH) is an American Industrial band from Los Angeles, California.', N'Industrial, industrial metal, industrial rock, alternative metal, electronic rock')
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( N'Alestorm', N'Alestorm are a Scottish heavy metal band formed in Perth, Scotland.', N'Pirate metal, folk metal, power metal, heavy metal, hard rock')
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( N'dsmack', N'dsmack is an American rock band from Lawrence, Massachusetts, formed in 1995.', N'Post-grunge, hard rock, nu metal, alternative metal, heavy metal')
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( N'Marilyn Manson', N'Marilyn Manson is an American rock band formed by namesake lead singer Marilyn Manson and guitarist Daisy Berkowitz in Fort Lauderdale, Florida, in 1989.', N'Industrial metal, industrial rock, industrial dance, post-industrial, alternative metal')
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( N'Metallica', N'Metallica is an American heavy metal band that developed the subgenre of speed metal in the early and mid-1980s.', N'Heavy metal, thrash metal, speed metal, hard rock')
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( N'Motorhead', N'Motorhead were an English rock band formed in London in 1975 by Lemmy, Larry Wallis and Lucas Fox', N'Heavy metal, hard rock, speed metal')
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( N'Ozzy Osbourne', N'Ozzy Osbourne is an English heavy metal vocalist from Aston, Birmingham.', N'Heavy metal, glam metal, hard rock, doom metal, shock rock')
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( N'Powerman 5000', N'Powerman 5000 is a Boston-based industrial metal/nu metal band formed in 1989.', N'Industrial metal, industrial rock, electronic rock, hard rock, alternative metal, nu metal')
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( N'Rob Zombie', N'The heavy metal horror icon Rob Zombie reflects on his life full of guts and glory.', N'Heavy metal, hard rock, industrial metal, shock rock, nu metal')

--Albums
INSERT  Albums (albumAuthor,  albumName ) VALUES (N'3Teeth', N'Metawar, Shutdown.exe, 3Teeth ')
INSERT  Albums (albumAuthor,  albumName ) VALUES (N'Alestorm', N'Seventh Rum of a Seventh Rum, Curse of the Crystal Coconut, No Grave But the Sea')
INSERT  Albums (albumAuthor,  albumName ) VALUES (N'dsmack', N'Lighting Up the Sky, When Legends Rise, 1000hp')
INSERT  Albums (albumAuthor,  albumName ) VALUES (N'Marilyn Manson', N'We Are Chaos, Heaven Upside Down, The Pale Emperor')
INSERT  Albums (albumAuthor,  albumName ) VALUES (N'Metallica', N'Death Magnetic, St. Anger, Reload')
INSERT  Albums (albumAuthor,  albumName ) VALUES (N'Motorhead', N'Bad Magic, Aftershock, The World Is Yours')
INSERT  Albums (albumAuthor,  albumName ) VALUES (N'Ozzy Osbourne', N'Patient Number 9, Ordinary Man, Scream')
INSERT  Albums (albumAuthor,  albumName ) VALUES (N'Powerman 5000', N'The Noble Rot, 	New Wave, Builders of the Future')
INSERT  Albums (albumAuthor,  albumName ) VALUES (N'Rob Zombie', N'The Lunar Injection Kool Aid Eclipse Conspiracy, The Electric Warlock, Venomous Rat Regeneration Vendor')

--Users
INSERT Users (userName,userPassword,email) VALUES('Vlad','admin','tempmail@mail.ru')
INSERT Users (userName,userPassword,email) VALUES('Bob','Bob123','Bob@mail.ru')
INSERT Users (userName,userPassword,email) VALUES('Tom','qwerty','Tom@mail.ru')
INSERT Users (userName,userPassword,email) VALUES('Sam','SuperSam22','Super@mail.ru')
INSERT Users (userName,userPassword,email) VALUES('Marilyn','HevyMetall344','MMlover@mail.ru')
INSERT Users (userName,userPassword,email) VALUES('Rob','awesomePassword','Awesome@mail.ru')

--Cities
INSERT Cities (cityName,concertDate) VALUES('Minsk','2023-01-01')
INSERT Cities (cityName,concertDate) VALUES('Vitebsk','2023-01-21')
INSERT Cities (cityName,concertDate) VALUES('Mogilev','2023-02-11')
INSERT Cities (cityName,concertDate) VALUES('Gomel','2023-02-21')
INSERT Cities (cityName,concertDate) VALUES('Brest','2023-03-12')
INSERT Cities (cityName,concertDate) VALUES('Grodno','2023-03-22')
INSERT Cities (cityName,concertDate) VALUES('Orsha','2023-04-14')
INSERT Cities (cityName,concertDate) VALUES('Novopolotsk','2023-04-25')

--Tickets
INSERT Tickets (cityTicket, countOfTickets) VALUES('Minsk',60)
INSERT Tickets (cityTicket, countOfTickets) VALUES('Vitebsk',60)
INSERT Tickets (cityTicket, countOfTickets) VALUES('Mogilev',60)
INSERT Tickets (cityTicket, countOfTickets) VALUES('Gomel',60)
INSERT Tickets (cityTicket, countOfTickets) VALUES('Brest',60)
INSERT Tickets (cityTicket, countOfTickets) VALUES('Grodno',60)
INSERT Tickets (cityTicket, countOfTickets) VALUES('Orsha',60)
INSERT Tickets (cityTicket, countOfTickets) VALUES('Novopolotsk',60)

--TicketPlaces
INSERT TicketPlaces (cityNameTicket, place) VALUES('Minsk','Pritytskogo 62')
INSERT TicketPlaces (cityNameTicket, place) VALUES('Vitebsk','Frunze 1')
INSERT TicketPlaces (cityNameTicket, place) VALUES('Mogilev','Pervomayskaya 7')
INSERT TicketPlaces (cityNameTicket, place) VALUES('Gomel','Privokzalnaya 4')
INSERT TicketPlaces (cityNameTicket, place) VALUES('Brest','Ordzhonikidze 14')
INSERT TicketPlaces (cityNameTicket, place) VALUES('Grodno','Gornovykh 17')
INSERT TicketPlaces (cityNameTicket, place) VALUES('Orsha','Yakub Kolas 13')
INSERT TicketPlaces (cityNameTicket, place) VALUES('Novopolotsk','Parkovaya 24')

--test Insert ordered tables
INSERT OrderedTickets(ticketUser,city,ticketPlace,ticketCount,ticketDate)
VALUES('Vlad','Minsk','Pritytskogo 62',1,'2023-01-01')

INSERT OrderedTickets(ticketUser,city,ticketPlace,ticketCount,ticketDate)
VALUES('Bob','Vitebsk','Frunze 1',1,'2023-01-21')

INSERT OrderedTickets(ticketUser,city,ticketPlace,ticketCount,ticketDate)
VALUES('Sam','Mogilev','Pervomayskaya 7',1,'2023-02-11')


