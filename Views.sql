Create or ALTER VIEW BandInfoView AS
Select Groups.bandName, Groups.bandStyle, Groups.bandDescription,Albums.albumName
from Groups inner JOIN Albums ON Groups.bandName = Albums.albumAuthor;

select * from BandInfoView

Create or ALTER VIEW CityView  AS
Select cityName,concertDate from Cities;

select * from CityView;

Create or ALTER VIEW AlbumsView  AS
Select albumAuthor,albumName from Albums;

select * from AlbumsView;


Create or ALTER VIEW GroupsView  AS
Select bandName,bandDescription,bandStyle from Groups;

select * from GroupsView;

Create or ALTER VIEW OrderedTicketsView  AS
Select ticketUser,city,ticketPlace,ticketCount,ticketDate from OrderedTickets;

select * from OrderedTicketsView;

Create or ALTER VIEW TicketPlacesView  AS
Select cityNameTicket,place from TicketPlaces;

select * from TicketPlacesView;

Create or ALTER VIEW TicketsView  AS
Select cityTicket,countOfTickets from Tickets;

select * from TicketsView;


Create or ALTER VIEW UsersView  AS
Select userName,userPassword,email from Users;

select * from UsersView;
