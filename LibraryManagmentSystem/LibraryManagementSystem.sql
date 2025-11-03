CREATE DATABASE LibrarySystem;
USE LibrarySystem;

CREATE TABLE Book(
BookId bigint primary key identity(1,1),
title nvarchar(60) not null,
author nvarchar(60) not null,
publicationYear date ,
ISBN nvarchar(60),
availableStatus nvarchar(60),
GenrelID bigint foreign key references Genres(GenrelID),
PublisherID bigint foreign key references Publishers(PublisherID),
BranchID bigint foreign key references LibraryBranches(BranchID)
);

CREATE TABLE Genres(
GenrelID bigint primary key not null,
GenrelName nvarchar(90),
BookID bigint foreign key references Book(BookID),
);

CREATE TABLE Publishers(
PublisherID bigint primary key not null,
Name nvarchar(90),
ContactDetails nvarchar(90),
BookID bigint foreign key references Book(BookID)
);

CREATE TABLE LibraryBranches(
BranchID bigint primary key not null,
Name nvarchar(90),
Street nvarchar(90),
Zone nvarchar(90),
PhoneNumber nvarchar(90),
BookID bigint foreign key references Book(BookID),
StaffID bigint foreign key references LibraryStaff(staffID)
);

CREATE TABLE LibraryStaff(
staffID bigint primary key not null,
Name nvarchar(90),
Position nvarchar(90),
PhoneNumber nvarchar(90),
Email nvarchar(90) not null,
BranchID bigint foreign key references LibraryBranches(BranchID),
TransactionID bigint foreign key references Transactions(TransactionID)
);

CREATE TABLE Transactions(
TransactionID bigint primary key not null,
DuaDate date default Current_timestamp not null,
ReturnDate date not null,
FineAmount money not null,
MemberID bigint foreign key references LibraryMembers(MemberID),
BookBorrowed date not null,
BookID bigint foreign key references Book(BookID)
);

CREATE TABLE LibraryMembers(
MemberID bigint primary key,
Name nvarchar(90),
Street nvarchar(90),
Zone nvarchar(90),
PhoneNumber nvarchar(90),
Email nvarchar(90) not null,
MembershipStatus nvarchar(90) not null,
TransactionID bigint foreign key references Transactions(TransactionID)
);


CREATE TABLE Authors(
AuthorsID bigint primary key,
Name nvarchar(90),
Nationality nvarchar(90),
NotableWorks nvarchar(90),
BookID bigint foreign key references Book(BookID)
);