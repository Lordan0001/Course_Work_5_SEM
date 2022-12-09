--1. Регистрация и авторизация покупателей

exec AddUser 'Alex','123456','dfdjvkosd@mail.ru'
Exec DeleteUserByUsername 'Alex'
EXEC UpdateUsername 'Alex','Bruce'

Exec authorizationUser 'Vlad','admin'

--2.  Просмотр информации о фестивале в нужном городе
EXEC GetCityInfoByName 'Minsk'

--3. Бронирование билета
Exec OrderTicket 'Vlad','Minsk','Pritytskogo 62',2,'2023-01-01'
Exec DeleteOrderedTicket 'Vlad'

--4. Добавление новых городов
Exec AddCity 'zhanovichi','2024-01-01','zhanovichi 11',60
Exec DeleteCity 'zhanovichi'

--5. Добавление новых исполнителей
EXEC AddBand 'Fever 333','Fever 333 is an American rock band formed in Inglewood, California, United States, in July 2017.',
'Rap core, hardcore punk, rap metal, trap metal, rap rock, post-hardcore','Wrong generation,Made an America,Strength in Numb333rs'
EXEC DeleteBand 'Fever 333'

--6. Просмотр списка групп
EXEC GetBandInfo

--7. Импорт экспорт XML
--есть (xml.sql)

--8. 100 000 строк
--есть (100000rows.sql)

--9. резервное коирование и восстановление е
--есть
