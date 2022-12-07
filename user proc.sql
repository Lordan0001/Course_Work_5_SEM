use Course_Work;
--1. Регистрация и авторизация покупателей

exec AddUser 'Alex','123456','dfdjvkosd@mail.ru'
Exec DeleteUserByUsername 'Alex'
EXEC UpdateUsername 'Alex','Bruce'

--2.  Просмотр информации о фестивале в нужном городе
EXEC GetCityInfoByName 'Minsk'

--3. Бронирование билета
EXEC OrderTicket 'Tom','Vitebsk','Frunze 1',5,'2023-01-21'

--4. Добавление новых городов
Exec AddCity 'zhanovichi','2024-01-01','zhanovichi 11',60
Exec DeleteCity 'zhanovichi'

--5. Добавление новых исполнителей
EXEC AddBand 'Fever 333','Fever 333 is an American rock band formed in Inglewood, California, United States, in July 2017.',
'Rap core, hardcore punk, rap metal, trap metal, rap rock, post-hardcore','Wrong generation,Made an America,Strength in Numb333rs'
EXEC DeleteBand 'Fever 333'

--6. Просмотр списка групп
EXEC GetBandInfo