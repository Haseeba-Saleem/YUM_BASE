--FA22-BSE-114
--FA22-BSE-078
--FA22-BSE-165

CREATE TABLE Customer (
  customer_id VARCHAR(255) PRIMARY KEY,  
  fName VARCHAR(255) NOT NULL,
  lName VARCHAR(255) NOT NULL,
  eMail VARCHAR(255) NOT NULL, 
  phone_number VARCHAR(255) NOT NULL,
  customer_address TEXT,
  customer_password VARCHAR(255) NOT NULL  
);

CREATE TABLE Restaurant (
  restaurant_id VARCHAR(255) PRIMARY KEY, 
  restaurant_name VARCHAR(255) NOT NULL,  
  restaurant_address TEXT,
  rating INT,
  restaurant_password VARCHAR(255) NOT NULL  
);

CREATE TABLE Orders(
  order_id VARCHAR(255) PRIMARY KEY,
  order_date DATE,
  customer_id VARCHAR(255) NOT NULL REFERENCES Customer(customer_id),
  restaurant_id VARCHAR(255) NOT NULL REFERENCES Restaurant(restaurant_id),
  total_price FLOAT,
  order_status VARCHAR(255),
  delivery_address TEXT
);

CREATE TABLE Payment(
  payment_id VARCHAR(255) PRIMARY KEY,
  order_id VARCHAR(255) REFERENCES Orders(order_id),
  payment_method VARCHAR(255) NOT NULL,
  payment_time TIMESTAMP NOT NULL,
  payment_date DATE,
  payment_amount FLOAT NOT NULL
);

CREATE TABLE Order_Item(
  order_item_id VARCHAR(255) PRIMARY KEY,
  order_id VARCHAR(255) NOT NULL REFERENCES Orders(order_id),
  menu_id VARCHAR(255) NOT NULL REFERENCES Menu_Item(menu_id),
  quantity INTEGER NOT NULL
);

CREATE TABLE Menu_Item(
  menu_id VARCHAR(255) PRIMARY KEY,
  restaurant_id VARCHAR(255) NOT NULL REFERENCES Restaurant(restaurant_id),
  item_name VARCHAR(255) NOT NULL,
  description TEXT,
  item_price FLOAT NOT NULL
);

CREATE TABLE Delivery(
  delivery_id VARCHAR(255) PRIMARY KEY,
  order_id VARCHAR(255) NOT NULL REFERENCES Orders(order_id),
  delivery_status VARCHAR(255),
  delivery_time TIMESTAMP
);

CREATE TABLE Login(
  login_id VARCHAR(255) PRIMARY KEY,
  customer_id VARCHAR(255) REFERENCES Customer(customer_id),  
  restaurant_id VARCHAR(255) REFERENCES Restaurant(restaurant_id), 
  login_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO Customer (customer_id, fName, lName, eMail, phone_number, customer_address, customer_password)
VALUES 
('CUST001', 'Ali', 'Khan', 'ali@gmail.com', '+92 123456789', '123 Main St, Lahore, Pakistan', 'password123'),
('CUST002', 'Sara', 'Ahmed', 'sara@gmail.com', '+92 987654321', '456 Park Ave, Islamabad, Pakistan', 'sara_password'),
('CUST003', 'Ahmad', 'Hussain', 'ahmad@yahoo.com', '+92 333444555', '789 Liberty Road, Karachi, Pakistan', 'ahmadpass'),
('CUST004', 'Fatima', 'Raza', 'fatima@gmail.com', '+92 111222333', '101 Ocean View, Islamabad, Pakistan', 'fatimapass'),
('CUST005', 'Ayesha', 'Khalid', 'ayesha@yahoo.com', '+92 999888777', '234 Green Lane, Lahore, Pakistan', 'ayeshapass');


INSERT INTO Restaurant (restaurant_id, restaurant_name, restaurant_address, rating, restaurant_password)
VALUES 
('REST001', 'Spice Village', '789 Stadium Road, Karachi, Pakistan', 4, 'spice_pass'),
('REST002', 'Cafe Aylanto', '101 Mall Road, Lahore, Pakistan', 5, 'cafe_pass'),
('REST003', 'Pizza Max', '456 Sunset Boulevard, Islamabad, Pakistan', 3, 'pizza_max_pass'),
('REST004', 'Biryani House', '321 Liberty Market, Lahore, Pakistan', 4, 'biryani_pass'),
('REST005', 'Noodle King', '789 Green Avenue, Karachi, Pakistan', 4, 'noodle_pass');


INSERT INTO Orders (order_id, order_date, customer_id, restaurant_id, total_price, order_status, delivery_address)
VALUES 
('ORD001', '2024-05-09', 'CUST001', 'REST001', 50.00, 'Pending', '123 Main St, Lahore, Pakistan'),
('ORD002', '2024-05-10', 'CUST002', 'REST002', 35.00, 'Completed', '456 Park Ave, Islamabad, Pakistan'),
('ORD003', '2024-05-11', 'CUST003', 'REST003', 25.00, 'Pending', '789 Liberty Road, Karachi, Pakistan'),
('ORD004', '2024-05-12', 'CUST004', 'REST004', 40.00, 'Completed', '101 Ocean View, Islamabad, Pakistan'),
('ORD005', '2024-05-13', 'CUST005', 'REST005', 30.00, 'Pending', '234 Green Lane, Lahore, Pakistan');

-- Inserting sample data into the Payment table
INSERT INTO Payment (payment_id, order_id, payment_method, payment_time, payment_date, payment_amount)
VALUES 
('PAY001', 'ORD001', 'Credit Card', '2024-05-09 12:00:00', '2024-05-09', 50.00),
('PAY002', 'ORD002', 'Cash', '2024-05-10 10:30:00', '2024-05-10', 35.00),
('PAY003', 'ORD003', 'Credit Card', '2024-05-11 11:45:00', '2024-05-11', 25.00),
('PAY004', 'ORD004', 'Cash', '2024-05-12 09:15:00', '2024-05-12', 40.00),
('PAY005', 'ORD005', 'Credit Card', '2024-05-13 08:30:00', '2024-05-13', 30.00);

INSERT INTO Menu_Item (menu_id, restaurant_id, item_name, description, item_price)
VALUES 
('MENU001', 'REST001', 'Biryani', 'Traditional Pakistani rice dish with spices and meat', 10.00),
('MENU002', 'REST001', 'Kebabs', 'Tender grilled meat skewers with spices', 15.00),
('MENU003', 'REST002', 'Pasta', 'Creamy pasta with choice of sauce', 12.00),
('MENU004', 'REST002', 'Steak', 'Juicy grilled steak served with vegetables', 20.00),
('MENU005', 'REST003', 'Pepperoni Pizza', 'Pizza topped with pepperoni and cheese', 18.00);


INSERT INTO Order_Item (order_item_id, order_id, menu_id, quantity)
VALUES 
('ORDER_ITEM001', 'ORD001', 'MENU001', 2), 
('ORDER_ITEM002', 'ORD001', 'MENU002', 1), 
('ORDER_ITEM003', 'ORD002', 'MENU003', 3), 
('ORDER_ITEM004', 'ORD003', 'MENU005', 1), 
('ORDER_ITEM005', 'ORD004', 'MENU004', 2); 


INSERT INTO Delivery (delivery_id, order_id, delivery_status, delivery_time)
VALUES 
('DEL001', 'ORD001', 'Out for delivery', '2024-05-09 14:00:00'),
('DEL002', 'ORD002', 'Delivered', '2024-05-10 13:30:00'),
('DEL003', 'ORD003', 'Processing', '2024-05-11 12:45:00'),
('DEL004', 'ORD004', 'Delivered', '2024-05-12 11:15:00'),
('DEL005', 'ORD005', 'Processing', '2024-05-13 10:30:00');


INSERT INTO Login (login_id, customer_id, restaurant_id)
VALUES 
('LOGIN001', 'CUST001', NULL),
('LOGIN002', NULL, 'REST001'),
('LOGIN003', 'CUST002', NULL),
('LOGIN004', NULL, 'REST002'),
('LOGIN005', 'CUST003', NULL);

