create database academy;

create table curators (
    Id int not null primary key identity(1,1),
    Name nvarchar(max) not null,
    Surname nvarchar(max) not null
);

create table departments (
    Id int not null primary key identity(1,1),
    financing money not null default 0 check(financing not < 0),
    Name nvarchar(100) not null identity(1,1),
    FacultyId int not null,
    foreign key(FacultyId) references Faculties (Id)
):

create table faculties (
    Id int not null primary key identity(1,1),
    Financing money not null default 0 check(financing not < 0),
    Name nvarchar(100) not null unique,
);

create table groups (
    Id int not null primary key identity(1,1),
    Name nvarchar(10) not null unique,
    Year int not null check(year between 1 and 5),
    DepartmentId int not null,
    foreign key (DepartmentId) references departments (Id)
);

create table GroupsCurators (
    Id int not null primary key identity(1,1),
    CuratorId int not null,
    GroupId int not null,
    foreign key(CuratorId) references curators (Id),
    foreign key(GroupId) references groups (Id)
);

create table GroupsLectures (
    Id int not null primary key identity(1,1),
    GroupId int not null,
    LectureId int not null,
    foreign key (GroupId) references groups (Id),
    foreign key (LectureId) references Lectures (Id),
);

create table Lectures (
    Id int not null primary key identity(1,1),
    LectureRoom nvarchar(max) not null,
    SubjectId int not null,
    TeacherId int not null,
    foreign key (SubjectId) references Subjects (Id),
    foreign key (TeacherId) references Teachers (Id),
);

create table Subjects (
    Id int not null primary key identity(1,1),
    Name nvarchar(100) not null unique
);

create table Teachers (
    Id int not null primary key identity(1,1),
    Name nvarchar(max) not null,
    Salary money not null check(Salary not <= 0),
    Surname nvarchar(max) not null
);

select *
