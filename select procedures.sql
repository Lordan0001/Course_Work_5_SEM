go
create or alter procedure GetAlbums
as begin
begin try
select albumAuthor, albumName from Albums
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

EXEC GetAlbums;

go
create or alter procedure GetAlbumByName
@Name nvarchar(50)
as begin
begin try
select albumAuthor, albumName from Albums where @Name = albumAuthor
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

exec GetAlbumByName 'Marilyn Manson';

go
create or alter procedure GetBandInfoByName
@Name nvarchar(50)
as begin
begin try
Select Groups.bandName, Groups.bandStyle, Groups.bandDescription,Albums.albumName
FROM Groups
JOIN Albums ON Groups.bandName =  Albums.albumAuthor where @Name = Groups.bandName;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;

exec GetBandInfoByName 'Rob Zombie'

go
create or alter procedure GetBandInfo
as begin
begin try
Select Groups.bandName, Groups.bandStyle, Groups.bandDescription,Albums.albumName
FROM Groups
JOIN Albums ON Groups.bandName =  Albums.albumAuthor;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;

exec GetBandInfo;

go
create or alter procedure GetCities
as begin
begin try
Select cityName, concertDate from Cities;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

EXEC GetCities;

go
create or alter procedure GetCityByName
@Name nvarchar(50)
as begin
begin try
select cityName, concertDate from Cities where @Name = cityName;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go
exec GetCityByName 'Minsk';


go
create or alter procedure GetCityByDate
@Date nvarchar(50)
as begin
begin try
select cityName, concertDate from Cities where @Date = concertDate;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go
exec GetCityByDate '2023-01-01';



go
create or alter procedure GetGroups
as begin
begin try
Select bandName,bandDescription,bandStyle from Groups;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go
exec GetGroups

go
create or alter procedure GetGroupByName
@Name nvarchar(50)
as begin
begin try
Select bandName,bandDescription,bandStyle from Groups where @Name = bandName
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go
exec GetGroupByName '3Teeth'

go
create or alter procedure GetOrderedTickets
as begin
begin try
Select ticketUser,city,ticketPlace,ticketCount,ticketDate from OrderedTickets;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

EXEC GetOrderedTickets;

go
create or alter procedure GetAlbumByUserame
@Name nvarchar(50)
as begin
begin try
Select ticketUser,city,ticketPlace,ticketCount,ticketDate from OrderedTickets where @Name = ticketUser
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

exec GetAlbumByUserame 'Vlad'

go
create or alter procedure GetTicketPlaces
as begin
begin try
Select cityNameTicket,place from TicketPlaces;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

EXEC GetTicketPlaces;


go
create or alter procedure GetTicketsPlaceByPlace
@Place nvarchar(50)
as begin
begin try
Select cityNameTicket,place from TicketPlaces where @Place = place
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go
exec GetTicketsPlaceByPlace 'Frunze 1'

go
create or alter procedure GetTickets
as begin
begin try
Select cityTicket,countOfTickets from Tickets;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

exec GetTickets;


go
create or alter procedure GetTicketsByCityName
@Name nvarchar(50)
as begin
begin try
Select cityTicket,countOfTickets from Tickets where @Name = cityTicket
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

exec TicketsByCityName 'Minsk'
