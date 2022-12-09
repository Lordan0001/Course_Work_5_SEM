CREATE LOGIN Manager WITH PASSWORD = 'orcl';
use Course_Work;
create user festManager for login Manager;

CREATE LOGIN Vlad WITH PASSWORD = 'orcl';
create user festUser for login Vlad;

grant execute on authorizationUser to festUser
grant execute on OrderTicket to festUser
grant execute on  GetCityInfoByName to festUser
grant execute on GetBandInfo to festUser

grant execute on AddUser  to festManager
grant execute on DeleteUserByUsername  to festManager
grant execute on UpdateUsername to festManager
grant execute on  GetCityInfoByName to festManager
grant execute on OrderTicket to festManager
grant execute on DeleteOrderedTicket to festManager

grant execute on authorizationUser to festManager

grant execute on AddCity  to festManager
grant execute on DeleteCity  to festManager
grant execute on AddBand to festManager
grant execute on DeleteBand to festManager
grant execute on GetBandInfo to festManager