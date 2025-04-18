

-- Question 1: Achieving 1NF (First Normal Form)

CREATE TABLE ProductDetail_1NF (
  OrderID INT,
  CustomerName VARCHAR(255),
  Product VARCHAR(255)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Question 2: Achieving 2NF (Second Normal Form)

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(255)
);

CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(255),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName FROM OrderDetails;

INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity FROM OrderDetails;