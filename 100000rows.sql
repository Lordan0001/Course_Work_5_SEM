DECLARE @number INT
DECLARE @name nvarchar(254)
Set @number = 0

WHILE @number< 100000

Begin
--PRINT CONVERT(NVARCHAR,@number)
SET @number = @number + 1
SET @name = @number
INSERT Groups  ( bandName, bandDescription, bandStyle) VALUES ( @name, N'TESTDB', N'TESTDB')

END


select * from Groups;

--delete Groups
--where bandDescription = 'TESTDB'
