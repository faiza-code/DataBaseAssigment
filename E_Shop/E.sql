--drop database [E-Shop];
CREATE DATABASE E_Shop;
use E_Shop;

CREATE TABLE Customers(
 CustomerID  bigint primary key identity(1,1),
 Name nvarchar(70) Not null,
 Email nvarchar (50) Not null unique,
 ContactInfo nvarchar (60),
 );

 CREATE TABLE Products(
 ProductID  bigint primary key identity(1,1),
 Name nvarchar(70) Not null,
 Email nvarchar (50) Not null unique,
 Description nvarchar (60),
 Price bigint not null,
 CategoryID bigint foreign key references Categories(CategoryID)
 );

 CREATE TABLE Categories(
 CategoryID  bigint primary key identity(1,1),
 CategoryName nvarchar(70) Not null,
 );

 CREATE TABLE Orders(
 OrderID  bigint primary key identity(1,1),
 OrderDate date Not null,
 TotalPrice bigint not null,
 CustomerID bigint foreign key references Customers(CustomerID)
 );

 CREATE TABLE OrderItems(
 OrderItemID  bigint primary key identity(1,1),
 Quantity bigint not null,
 ItemPrice bigint not null,
 OrderID bigint foreign key references Orders(OrderID),
 ProductID bigint foreign key references Products(ProductID)
 );

 CREATE TABLE ShippingAddresses(
 AddressID  bigint primary key identity(1,1),
 Street nvarchar(70) Not null,
 City nvarchar(70) Not null,
 State nvarchar(70) Not null,
 Country nvarchar(70) Not null,
 PostalCode bigint not null,
 OrderID bigint foreign key references Orders(OrderID),
 CustomerID bigint foreign key references Customers(CustomerID)
 );

 CREATE TABLE PaymentInformation(
 PaymentID  bigint primary key identity(1,1),
 PaymentMethod nvarchar(70) Not null,
 CardNumber bigint not null,
 ExpirationDate date Not null,
 CVV bigint Not null,
 OrderID bigint foreign key references Orders(OrderID),
 CustomerID bigint foreign key references Customers(CustomerID)
 );

 CREATE TABLE Reviews(
 ReviewID  bigint primary key identity(1,1),
 Rating bigint not null,
 Comments nvarchar(70) Not null,
 ProductID bigint foreign key references Products(ProductID),
 CustomerID bigint foreign key references Customers(CustomerID)
 );




