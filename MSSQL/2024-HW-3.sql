create database Academy3;

use Academy3;

create table departments (
    Id int not null primary key IDENTITY(1,1),
    financing money not null check(financing not < 0) default 0,
    name nvarchar(100) not null Unique
);

create table faculties (
    Id int not null primary key IDENTITY(1,1),
    dean nvarchar(max) not null,
    [Name] nvarchar(100) not null
);

create table groups (
    Id int not null primary key IDENTITY(1,1),
    [Name] nvarchar(10) not null unique,
    rating int not null check(rating BETWEEN 0 and 5),
    Year int not null check(Year BETWEEN 1 and 5),
);

create table Teachers (
    Id int not null primary key IDENTITY(1,1),
    DateHired date not null check(dateHired > 01.01.1990),
    IsAssisant bit not null default 0,
    IsProfessor bit not NULL default 0,
    [Name] nvarchar(max) not null,
    Position nvarchar(max) NOT NULL,
    Premium money not null check(Premium not < 0) default 0,
    Salary money not null check(Salary NOT <= 0),
    Surname nvarchar(max) not null
);

-- запросы

select * from Departments
order by Id DESC;

select Name AS [Group name], rating AS [group rating]
from groups;

select Surname, Salary + Premium from teaches;
select 'the dean of ' + DeanOf + ' ' + ' is ' + Name + ' ' + Surname
from faculties;

select Surname from teachers
where IsProfessor = 1, salary > 1050;

select Name from departments
where financing not BETWEEN 11000 and 25000;

select * from faculties
where Name != 'Computer Science';

select Surname, Position from Teachers
where IsProfessor = 0;

select Surname, Position from Teachers
where IsAssisant = 1 and salary + Premium BETWEEN 160 and 550;

select Surname, Salary from teachers;

SELECT Surname, position from teachers
where datehired < '01.01.2000';

SELECT ''

SELECT surname from teachers
where salary + premium < 1200;

select name from groups
where year = 5 and rating between 2 and 4;

select surname from teachers
where salary < 550 or premium < 200;
