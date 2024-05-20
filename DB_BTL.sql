-- Tạo cơ sở dữ liệu QuanLy_Kho
CREATE DATABASE QuanLy_Kho;
GO

-- Sử dụng cơ sở dữ liệu QuanLy_Kho
USE QuanLy_Kho;
GO

-- Tạo bảng Category
CREATE TABLE  Category (
    categoryId varchar(15) PRIMARY KEY,
    categoryName nvarchar(200) NOT NULL UNIQUE,
    status bit 
);

-- Tạo bảng Product
CREATE TABLE Product (
    productId int IDENTITY PRIMARY KEY,
    productName nvarchar(200) NOT NULL UNIQUE,
    producer nvarchar(100) NOT NULL,
    status bit ,
    manufactureDate date,
    expirationDate date,
    price float,
    categoryId varchar(15),
    proImg varchar(255),
    FOREIGN KEY (categoryId) REFERENCES Category(categoryId)
);

-- Tạo bảng User
CREATE TABLE role(
	id int IDENTITY(1,1) NOT NULL primary key,
	name varchar(50) NULL,
)
GO
CREATE TABLE users(
	id int IDENTITY(1,1) NOT NULL primary key,
	username varchar(45) NULL,
	password varchar(200) NULL,
	enabled bit NULL,
	fullname nvarchar(70) NULL,
	gender bit NULL,
	birthday datetime NULL,
	address nvarchar(200) NULL,
	email varchar(100) NULL,
	telephone varchar(20) NULL,
)
GO
CREATE TABLE users_roles(
	id int IDENTITY(1,1) NOT NULL primary key,
	userId int NULL foreign key references users(id),
	roleId int NULL foreign key references role(id),
)


-- Chèn dữ liệu mẫu vào bảng Category
INSERT INTO Category (categoryId, categoryName, status)
VALUES ('CAT001', 'Electronics', 1),
       ('CAT002', 'Clothing', 1),
       ('CAT003', 'Books', 1);

-- Chèn dữ liệu mẫu vào bảng Product
INSERT INTO Product (productName, producer, status, manufactureDate, expirationDate, price, categoryId, proImg)
VALUES ('Smartphone', 'Samsung', 1, '2023-01-15', '2025-01-15', 500, 'CAT001', 'smartphone.jpg'),
       ('T-shirt', 'Nike', 1, '2023-02-20', '2024-02-12', 20, 'CAT002', 'tshirt.jpg'),
       ('Book1', 'Publisher1', 1, '2022-12-10', '2022-12-10', 15, 'CAT003', 'book1.jpg'),
       ('Book2', 'Publisher2', 1, '2023-03-05', '2022-12-10', 12, 'CAT003', 'book2.jpg');

select * from Category;
select * from Product;


GO

INSERT role VALUES (N'ROLE_ADMIN')
GO
INSERT role VALUES (N'ROLE_USER')
GO
INSERT users VALUES (N'admin',
N'$2a$12$s8FyYcAauHqILMBcI6x0BepO5JI.9/C16QRYMswF7Avt0rRkOiR0u', 1 ,N'Nguyễn Thành
Trung', 1, '2000-02-12', N'Ba Vì - Hà Nội', N'trung.nt@gmail.com', N'0123456789')
GO
INSERT users VALUES (N'user',
N'$2a$12$s8FyYcAauHqILMBcI6x0BepO5JI.9/C16QRYMswF7Avt0rRkOiR0u', 1, N'Nguyễn Khánh
Nam', 1, '2001-05-11', N'Ý Yên - Nam Định', N'nam.nk@gmail.com', N'0911233455')
GO
INSERT users_roles (userId, roleId) VALUES (1, 1)
GO
INSERT users_roles (userId, roleId) VALUES (1, 2)
GO
INSERT users_roles (userId, roleId) VALUES (2, 2)
select * from role

