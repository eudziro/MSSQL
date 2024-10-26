create database academy;

create table curators (
    Id int not null primary key identity(1,1),
    Name nvarchar(max) not null,
    Surname nvarchar(max) not null
);

create table departments (
    Id int not null primary key identity(1,1),
    financing money not null default 0 check(financing not < 0),
    Name nvarchar(100) not null unique,
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

select Teachers.Name + ' ' + Teachers.Surname AS FullName, Groups.Name
from Teachers, Groups;

select Faculties.Name from Faculties, Departments
where Departments.Financing > Faculties.Financing;

select Curators.Name + ' ' + Curators.Surname AS Fullname, Groups.Name
from Curators, Groups, GroupsCurators
where Curators.Id = GroupsCurators.CuratorId and Groups.Id = GroupsCurators.GroupId;

select Teachers.Name + ' ' + Teachers.Surname AS Fullname
from Teachers, Lectures, GroupsLectures, Groups
where Groups.Name = '1-phys-1' and Teachers.Id = Lectures.TeacherId
and GroupsLectures.LectureId = Lectures.Id and GroupsLectures.GroupId = Groups.Id;

select Teachers.Surname, Faculties.Name
from Teachers, Lectures, GroupsLectures, Groups, Departments, Faculties
where Teachers.Id = Lectures.TeacherId and GroupsLectures.LectureId = Lectures.Id
and Groups.Id = GroupsLectures.GroupId and Departments.Id = Groups.DepartmentId
and Faculties.Id = Departments.FacultyId;

select Departments.Name AS DepartmentsName, Groups.Name AS GroupsName
from Departments, Groups
where Departments.Id = Groups.DepartmentId;

select Teachers.Name + ' ' + Teachers.Surname AS TeachersFullName,
Subjects.Name AS SubjectName
from Teachers, Lectures, Subjects
where Teachers.Name = 'Anatoly' and Teachers.Surname = 'Vasserman'
and Teachers.Id = Lectures.TeacherId and Subjects.Id = Lectures.SubjectId;

select Departments.Name
from Departments, Groups, GroupsLectures, Lectures, Subjects
where Subjects.Name = 'physics' and Subjects.Id = Lectures.SubjectId
and GroupsLectures.LectureId = Lectures.Id and Groups.Id = GroupsLectures.GroupId
and Departments.Id = Groups.DepartmentId;

select Groups.Name
from Groups, Departments, Faculties
where Faculties.Name = 'psysics' and Groups.DepartmentId = Departments.Id
and Faculties.Id = Departments.FacultyId;

select Groups.Name AS GroupsName, Faculties.Name AS FacultiesName
from Groups, Departments, Faculties
where Groups.Year = 1 and Departments.Id = Groups.DepartmentId
and Faculties.Id = Departments.FacultyId;

select Teachers.Name + ' ' + Teachers.Surname AS fullname,
Subjects.Name AS SubjectsName, Groups.Name AS GroupsName
from Teachers, Lectures, Subjects, Groups, GroupsLectures
where Subjects.Id = Lectures.SubjectId and Teachers.Id = Lectures.TeacherId
and GroupsLectures.GroupId = Groups.Id and GroupsLectures.LectureId = Lectures.Id
and Groups.Name = '1-astr-1';
