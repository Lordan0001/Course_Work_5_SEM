go
--добавление пользователя 
create or alter procedure AddUser
@userName nvarchar(254),
@userPassword nvarchar(254),
@email nvarchar(254)
as begin
begin try 
INSERT Users(userName,userPassword,email)
Values(@userName,@userPassword,@email)
print 'User added!'
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
print 'User with the same name already exists'
end catch
end;
go

exec AddUser 'Alex','123456','dfdjvkosd@mail.ru'





go
--авторизация
create or alter procedure authorizationUser
@userName nvarchar(254),
@userPassword nvarchar(254)
as begin
Declare @nameCount int
begin try 
Select @nameCount = count(UserName) from Users 
Where UserName = @userName AND userPassword = @userPassword

if @nameCount > 0
begin 
print 'user is authorized!'
end;
else
print 'user is not authorized!'
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
print 'user is not authorized!'
end catch
end;
go

Exec authorizationUser 'Vlad','admin'

go
--удаление пользователя по имени
create or alter procedure DeleteUserByUsername
 @Name nvarchar(254)
as begin
begin try 
IF EXISTS (select userName from Users where userName = @Name)
BEGIN DELETE Users 
Where userName = @Name;
print 'User Deleted'
END
ELSE
BEGIN
print('User with this name does not exist')
END
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

Exec DeleteUserByUsername 'Alex'


go
--изменение имени пользователя
create or alter procedure UpdateUsername
@oldName nvarchar(254),
@newName nvarchar(254)
as begin
begin try 
Update Users
SET userName = @newName
WHERE userName = @oldName
print 'Username updated!'
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
print 'User with this name does not exist'
end catch
end;
go

EXEC UpdateUsername 'Alex','Bruce'

go
--бронирование билета 
create or alter procedure OrderTicket
@Name nvarchar(254),
@City nvarchar(254),
@TicketPlace nvarchar(254),
@TicketCount int,
@TicketDate date
as begin
begin try 
BEGIN TRANSACTION
INSERT OrderedTickets(ticketUser,city,ticketPlace,ticketCount,ticketDate)
Values(@Name,@City,@TicketPlace,@TicketCount,@TicketDate);
UPDATE Tickets
Set countOfTickets = countOfTickets - @TicketCount
Where cityTicket = @City;
print 'Ticket ordered!'
COMMIT TRANSACTION
end try
begin catch
ROLLBACK
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
print 'Failed to order Ticket'
end catch
end;
go



go
--удаление забронированного билета через имя пользователя
create or alter procedure DeleteOrderedTicket
@Name nvarchar(254)
as begin
Declare @num int,@city nvarchar(254)
begin try 
--get values part
Set @num = (select ticketCount from OrderedTickets where ticketUser =  @Name)
Set @city = (select city from OrderedTickets where ticketUser =  @Name)
--change ticket count part
UPDATE Tickets
Set countOfTickets = countOfTickets + @num
Where cityTicket = @city;
--delete part
Delete OrderedTickets
where ticketUser = @Name;
print 'ordered ticket deleted!'
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
print 'Failed to delete ticket'
end catch
end;
go

Exec DeleteOrderedTicket 'Vlad'

go
--добавление города
create or alter procedure AddCity
@cityName nvarchar(254),
@concertDate date,
@place nvarchar(254), --to TicketPlace
@countOfTickets int -- to Tickets
as begin
begin try 
BEGIN TRANSACTION

INSERT Cities (cityName,concertDate)
Values(@cityName, @concertDate);

INSERT TicketPlaces (cityNameTicket,place)
Values(@cityName, @place);


INSERT Tickets (cityTicket,countOfTickets)
Values(@cityName, @countOfTickets);

print 'New cite Added'
COMMIT TRANSACTION
end try

begin catch
ROLLBACK
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
print 'Failed add city'
end catch
end;
go

Exec AddCity 'zhanovichi','2024-01-01','zhanovichi 11',60


go
--удаление города по имени
create or alter procedure DeleteCity
@cityName nvarchar(254)
as begin
begin try 
BEGIN TRANSACTION
DELETE Tickets
Where cityTicket = @cityName

DELETE TicketPlaces
Where cityNameTicket = @cityName

DELETE Cities
Where cityName = @cityName

print 'City deleted!'
COMMIT TRANSACTION
end try

begin catch
ROLLBACK
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
print 'Failed to delete city'
end catch
end;
go

Exec DeleteCity 'zhanovichi'




go
--добавление группы и альбома
create or alter procedure AddBand
--Groups
@bandName nvarchar(254),
@bandDescription nvarchar(254),
@bandStyle nvarchar(254),
--Albums
@albumName nvarchar(254)
as begin
begin try 
BEGIN TRANSACTION

INSERT Groups(bandName,bandDescription,bandStyle)
VALUES(@bandName,@bandDescription,@bandStyle);

INSERT Albums(albumAuthor,albumName)
VALUES(@bandName,@albumName);

print 'New band Added'
COMMIT TRANSACTION
end try

begin catch
ROLLBACK
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
print 'Failed add band'
end catch
end;
go

EXEC AddBand 'Fever 333','Fever 333 is an American rock band formed in Inglewood, California, United States, in July 2017.',
'Rap core, hardcore punk, rap metal, trap metal, rap rock, post-hardcore','Wrong generation,Made an America,Strength in Numb333rs'

go
--удаление всей информации о группе
create or alter procedure DeleteBand
@bandName nvarchar(254)
as begin
begin try 
BEGIN TRANSACTION

DELETE Albums
WHERE albumAuthor = @bandName;

DELETE Groups
WHERE bandName = @bandName;

print 'Band deleted!'
COMMIT TRANSACTION
end try

begin catch
ROLLBACK
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
print 'Failed to delette band'
end catch
end;
go

EXEC DeleteBand 'Fever 333'

--EXEC GetBandInfo


go
--получить полную информацию о гродек через имя города
create or alter procedure GetCityInfoByName
@Name nvarchar(50)
as begin
begin try
Select Cities.cityName, Cities.concertDate, TicketPlaces.place, Tickets.countOfTickets
FROM Cities
JOIN TicketPlaces
ON Cities.cityName =  TicketPlaces.cityNameTicket 
JOIN Tickets 
ON Cities.cityName =  Tickets.cityTicket where Cities.cityName = @Name;
end try
begin catch
print 'Error: ' + cast(error_number() as varchar(6)) + ': ' + error_message();
end catch
end;
go

EXEC GetCityInfoByName 'Minsk'

