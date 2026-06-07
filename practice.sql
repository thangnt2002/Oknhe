CREATE DATABASE PRACTICE

USE PRACTICE


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    City NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName NVARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2),
    CategoryID INT,
    Stock INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    OrderDate DATETIME,
    Status NVARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    Amount DECIMAL(10,2),
    PaymentMethod NVARCHAR(50),
    PaymentDate DATETIME,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY IDENTITY,
    ShipperName NVARCHAR(100)
);

CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ShipperID INT,
    ShippedDate DATETIME,
    DeliveryDate DATETIME,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    Comment NVARCHAR(255),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Coupons (
    CouponID INT PRIMARY KEY IDENTITY,
    Code NVARCHAR(50),
    DiscountPercent INT,
    ExpiryDate DATETIME
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    PositionName NVARCHAR(100),
    ManagerID INT NULL,
    HireDate DATE
);


INSERT INTO Employees
(EmployeeID, EmployeeName, PositionName, ManagerID, HireDate)
VALUES

-- Level 0
(1, 'Nguyen Van CEO', 'CEO', NULL, '2020-01-01'),

-- Level 1
(2, 'Tran CTO', 'CTO', 1, '2020-02-01'),
(3, 'Le CFO', 'CFO', 1, '2020-02-01'),
(4, 'Pham COO', 'COO', 1, '2020-03-01'),

-- Level 2
(5, 'Hoang Dev Manager', 'Development Manager', 2, '2021-01-01'),
(6, 'Vu QA Manager', 'QA Manager', 2, '2021-01-01'),

(7, 'Do Finance Manager', 'Finance Manager', 3, '2021-02-01'),
(8, 'Bui Accounting Manager', 'Accounting Manager', 3, '2021-02-01'),

(9, 'Nguyen Operation Manager', 'Operation Manager', 4, '2021-03-01'),

-- Level 3
(10, 'Dev A', 'Senior Java Developer', 5, '2022-01-01'),
(11, 'Dev B', 'Java Developer', 5, '2022-02-01'),
(12, 'Dev C', 'Frontend Developer', 5, '2022-03-01'),

(13, 'QA A', 'Senior QA', 6, '2022-04-01'),
(14, 'QA B', 'QA Engineer', 6, '2022-05-01'),

(15, 'Finance A', 'Financial Analyst', 7, '2022-06-01'),
(16, 'Finance B', 'Financial Analyst', 7, '2022-07-01'),

(17, 'Accountant A', 'Accountant', 8, '2022-08-01'),

(18, 'Operation A', 'Operation Specialist', 9, '2022-09-01'),
(19, 'Operation B', 'Operation Specialist', 9, '2022-10-01'),

-- Level 4
(20, 'Intern A', 'Intern', 10, '2024-01-01'),
(21, 'Intern B', 'Intern', 11, '2024-02-01'),
(22, 'Intern C', 'Intern', 13, '2024-03-01');

INSERT INTO Categories (CategoryName)
VALUES
('Laptop'),
('Smartphone'),
('Tablet'),
('Accessory');


INSERT INTO Products (ProductName, Price, CategoryID, Stock)
VALUES
('MacBook Air M3', 29990000, 1, 50),
('Dell XPS 13', 32990000, 1, 30),
('ThinkPad X1 Carbon', 35990000, 1, 20),

('iPhone 16', 24990000, 2, 100),
('Samsung S25', 22990000, 2, 80),
('Xiaomi 15', 15990000, 2, 60),

('iPad Air', 16990000, 3, 40),
('Galaxy Tab S10', 14990000, 3, 35),

('AirPods Pro', 5990000, 4, 120),
('Logitech MX Master 3S', 2490000, 4, 90),
('USB-C Hub', 990000, 4, 200),
('Gaming Mouse XYZ', 1290000, 4, 100); -- chưa từng bán


INSERT INTO Customers (FullName, Email, City)
VALUES
('Nguyen Van An', 'an@gmail.com', 'Ha Noi'),
('Tran Thi Binh', 'binh@gmail.com', 'Ha Noi'),
('Le Quang Huy', 'huy@gmail.com', 'Da Nang'),
('Pham Minh Duc', 'duc@gmail.com', 'HCM'),
('Hoang Lan', 'lan@gmail.com', 'HCM'),
('Vo Tuan Kiet', 'kiet@gmail.com', 'Can Tho'),
('Nguyen Thi Mai', 'mai@gmail.com', 'Hai Phong'),
('Do Anh Tuan', 'tuan@gmail.com', 'Ha Noi'),
('Bui Thanh Nam', 'nam@gmail.com', 'Da Nang'),
('Pham Gia Bao', 'bao@gmail.com', 'Hue'); -- chưa từng mua


INSERT INTO Orders (CustomerID, OrderDate, Status)
VALUES
(1,'2025-01-05','Completed'),
(1,'2025-02-10','Completed'),
(1,'2025-03-15','Completed'),

(2,'2025-01-08','Completed'),
(2,'2025-04-01','Completed'),

(3,'2025-01-20','Completed'),
(3,'2025-02-20','Completed'),
(3,'2025-03-20','Completed'),
(3,'2025-04-20','Completed'),

(4,'2025-03-01','Pending'),
(4,'2025-03-25','Completed'),

(5,'2025-02-14','Completed'),
(5,'2025-05-01','Completed'),

(6,'2025-01-18','Cancelled'),

(7,'2025-04-10','Completed'),
(7,'2025-04-25','Completed'),

(8,'2025-05-10','Pending'),
(9,'2025-05-15','Completed');


INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
VALUES

(1,1,1,29990000),
(1,9,1,5990000),

(2,4,1,24990000),

(3,10,1,2490000),

(4,5,1,22990000),
(4,11,2,990000),

(5,2,1,32990000),

(6,4,1,24990000),

(7,5,1,22990000),
(7,9,1,5990000),

(8,1,1,29990000),

(9,7,1,16990000),

(10,6,2,15990000),

(11,2,1,32990000),
(11,10,1,2490000),

(12,4,1,24990000),

(13,1,1,29990000),
(13,9,2,5990000),

(14,3,1,35990000),

(15,5,1,22990000),

(16,7,1,16990000),

(17,4,1,24990000),

(18,11,3,990000);


INSERT INTO Payments
(OrderID, Amount, PaymentMethod, PaymentDate)
VALUES

(1,35980000,'Credit Card','2025-01-05'),
(2,24990000,'Bank Transfer','2025-02-10'),
(3,2490000,'Momo','2025-03-15'),

(4,24970000,'Credit Card','2025-01-08'),
(5,32990000,'Bank Transfer','2025-04-01'),

(6,24990000,'Credit Card','2025-01-20'),
(7,28980000,'Credit Card','2025-02-20'),
(8,29990000,'Bank Transfer','2025-03-20'),
(9,16990000,'Momo','2025-04-20'),

(11,35480000,'Credit Card','2025-03-25'),

(12,24990000,'Bank Transfer','2025-02-14'),

(13,41970000,'Credit Card','2025-05-01'),

(15,22990000,'Momo','2025-04-10'),

(16,16990000,'Credit Card','2025-04-25'),

(18,2970000,'Bank Transfer','2025-05-15');


INSERT INTO Shippers (ShipperName)
VALUES
('GHN'),
('GHTK'),
('Viettel Post');

INSERT INTO Shipments
(OrderID, ShipperID, ShippedDate, DeliveryDate)
VALUES

(1,1,'2025-01-06','2025-01-08'),
(2,2,'2025-02-11','2025-02-13'),
(3,1,'2025-03-16','2025-03-18'),

(4,3,'2025-01-09','2025-01-11'),

(6,1,'2025-01-21','2025-01-24'),

(7,2,'2025-02-21','2025-02-23'),

(8,1,'2025-03-21','2025-03-23'),

(11,2,'2025-03-26','2025-03-28'),

(12,3,'2025-02-15','2025-02-17');


INSERT INTO Reviews
(ProductID, CustomerID, Rating, Comment)
VALUES

(1,1,5,'Excellent laptop'),
(1,5,5,'Very good battery'),

(4,1,5,'Love it'),
(4,3,4,'Good phone'),

(5,2,4,'Worth the money'),
(5,7,3,'Average'),

(7,3,5,'Great tablet'),

(9,1,5,'Best earbuds'),
(9,3,4,'Nice sound'),

(10,4,2,'Scroll wheel issue');

INSERT INTO Coupons
(Code, DiscountPercent, ExpiryDate)
VALUES

('WELCOME10',10,'2025-12-31'),
('SALE20',20,'2025-08-31'),
('VIP30',30,'2025-12-31');


---------------
--1
SELECT c.CustomerID, c.FullName, COUNT(o.OrderID) as ORDER_COUNT
FROM Orders o
INNER JOIN Customers c
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FullName

--3
SELECT * FROM Products p
LEFT JOIN OrderItems o
ON o.ProductID = p.ProductID
WHERE o.ProductID IS NULL

-- 4
WITH OrdersPrice AS (
SELECT oi.OrderID, SUM(oi.Quantity * Price) AS TotalPrice FROM Orders o 
INNER JOIN OrderItems oi
ON o.OrderID = oi.OrderID
GROUP BY oi.OrderID
)
SELECT o.OrderId, o.TotalPrice FROM OrdersPrice o WHERE 
o.TotalPrice > (
    SELECT AVG(TotalPrice) From OrdersPrice
)

