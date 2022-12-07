CREATE LOGIN Manager WITH PASSWORD = 'orcl';
use Course_Work;
create user festManager for login Manager;



grant execute on AddUser  to festManager
grant execute on DeleteUserByUsername  to festManager
grant execute on UpdateUsername to festManager
grant execute on  GetCityInfoByName to festManager
grant execute on OrderTicket to festManager

grant execute on AddCity  to festManager
grant execute on DeleteCity  to festManager
grant execute on AddBand to festManager
grant execute on DeleteBand to festManager
grant execute on GetBandInfo to festManager
