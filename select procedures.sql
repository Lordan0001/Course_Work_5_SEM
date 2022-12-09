go
--Получения списка альбомов
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

--Поиск альбома по имени
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


--получение все информауии о группе по имени
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
-- получение списка групп
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


--получение списка гоородов
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


--поиск информации по имени 
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

--поиск города по дате
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


--получение списка групп
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
--поиск группы по имени 
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
--получение списка забронированных билетов
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
--поиск забронированного билета по имеи пользователя
go
create or alter procedure GetOrderedTicketByUserame
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

exec GetOrderedTicketByUserame 'Vlad'

--просмотр адресов мероприятия
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

--поиск города по адресу 
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
--получение информации о билетах
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
--просмотр билетов в конкретном городе
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

exec GetTicketsByCityName 'Minsk'
