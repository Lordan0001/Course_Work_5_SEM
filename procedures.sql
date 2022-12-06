go
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

EXEC OrderTicket 'Tom','Vitebsk','Frunze 1',5,'2023-01-21'
