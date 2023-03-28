create database Course
use Course

create table Students(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50),
  [Surname] nvarchar(50),
  [Age] int,
  [Email] nvarchar(100) unique
)


create table StudentArchives(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50),
  [Surname] nvarchar(50),
  [Age] int,
  [Email] nvarchar(100)
)

insert into Students([Name],[Surname],[Age],[Email])
values('Mubariz','Agayev',18,'mubariz@gmail.com')

create trigger trg_deletetStudent on Students
after delete
as
BEGIN
   insert into StudentArchives([Name],[Surname],[Age],[Email])
   select [Name],[Surname],[Age],[Email] from deleted
END




create procedure usp_deleteStudent
@id int
as
BEGIN
  delete from Students where Id = @id
END


exec usp_deleteStudent 2