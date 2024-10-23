create database Academy2;

use Academy2;

create table teachers (
    ID int not null identity(1,1),
    Name varchar(255) not null,
    Premium money not null default 0,
    Salary money not null,
    DateHired date not null,
    primary key (ID)
);

create table groups (
    ID int identity(1,1) not null,
    Name nvarchar(10) not null unique (ID),
    Rating int not null,
    Year int not null,
    primary key (ID)
);

create table faculties (
    ID int not null Identity(1,1),
    Name nvarchar(100) not null unique(ID);
);

create table departments(
    ID int not null identity(1,1),
    Financing money not null default 0,
    Name nvarchar(100) not null unique (ID);
    primary key (ID)
);
