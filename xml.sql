use Course_Work;

--экспорт данных из таблицы Albums в XML
Select * FROM Albums as Album
FOR XML auto,elements,Root('Albums')

--FROM XML
--CREATE TABLE AlbumsFromXML(
--	Id int Not Null PRIMARY KEY IDENTITY,
--albumAuthor [nvarchar](254) NOT NULL unique,
--	albumName [nvarchar](254) NOT NULL)

--импорт данных из xml документа в таблицу AlbumsFromXML
INSERT AlbumsFromXML
select 
A.Album.query('albumAuthor').value('.','nvarchar(254)') as albumAuthor,
A.Album.query('albumName').value('.','nvarchar(254)') as albumName
from
(
select cast(c as xml) from
openrowset(bulk 'C:\Users\User\Desktop\scripts\AlbumData.xml',single_blob) as T(c)
) as S(c)

cross apply c.nodes('/Albums/Album') as A(Album)  


select * from Groups;