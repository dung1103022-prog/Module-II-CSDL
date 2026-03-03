-- tao bang
CREATE TABLE Customer (
    customer_id VARCHAR(5) PRIMARY KEY,
    customer_full_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL UNIQUE,
    customer_phone VARCHAR(15) NOT NULL,
    customer_address VARCHAR(255) NOT NULL
);

CREATE TABLE Room (
    room_id VARCHAR(5) PRIMARY KEY,
    room_type VARCHAR(50) NOT NULL,
    room_price DECIMAL(10,2) NOT NULL,
    room_status ENUM('Available','Booked','Maintenance') NOT NULL,
    room_area INT NOT NULL
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id VARCHAR(5) NOT NULL,
    room_id VARCHAR(5) NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_amount DECIMAL(10,2),

    CONSTRAINT fk_booking_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_booking_room
        FOREIGN KEY (room_id)
        REFERENCES Room(room_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_payment_booking
        FOREIGN KEY (booking_id)
        REFERENCES Booking(booking_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-- them du lieu vao bang
INSERT INTO Customer VALUES
('C001','Nguyen Anh Tu','tu.nguyen@example.com','0912345678','Hanoi, Vietnam'),
('C002','Tran Thi Mai','mai.tran@example.com','0923456789','Ho Chi Minh, Vietnam'),
('C003','Le Minh Hoang','hoang.le@example.com','0934567890','Danang, Vietnam'),
('C004','Pham Hoang Nam','nam.pham@example.com','0945678901','Hue, Vietnam'),
('C005','Vu Minh Thu','thu.vu@example.com','0956789012','Hai Phong, Vietnam'),
('C006','Nguyen Thi Lan','lan.nguyen@example.com','0967890123','Quang Ninh, Vietnam'),
('C007','Bui Minh Tuan','tuan.bui@example.com','0978901234','Bac Giang, Vietnam'),
('C008','Pham Quang Hieu','hieu.pham@example.com','0989012345','Quang Nam, Vietnam'),
('C009','Le Thi Lan','lan.le@example.com','0990123456','Da Lat, Vietnam'),
('C010','Nguyen Thi Mai','mai.nguyen@example.com','0901234567','Can Tho, Vietnam');

ALTER TABLE Room
MODIFY room_status ENUM('Available','Booked','Maintenance') NOT NULL;
INSERT INTO Room VALUES
('R001','Single',100.0,'Available',25),
('R002','Double',150.0,'Booked',40),
('R003','Suite',250.0,'Available',60),
('R004','Single',120.0,'Booked',30),
('R005','Double',160.0,'Available',35);

INSERT INTO Booking (booking_id, customer_id, room_id, check_in_date, check_out_date, total_amount) VALUES
(1,'C001','R001','2025-03-01','2025-03-05',400.0),
(2,'C002','R002','2025-03-02','2025-03-06',600.0),
(3,'C003','R003','2025-03-03','2025-03-07',1000.0),
(4,'C004','R004','2025-03-04','2025-03-08',480.0),
(5,'C005','R005','2025-03-05','2025-03-09',800.0),
(6,'C006','R001','2025-03-06','2025-03-10',400.0),
(7,'C007','R002','2025-03-07','2025-03-11',600.0),
(8,'C008','R003','2025-03-08','2025-03-12',1000.0),
(9,'C009','R004','2025-03-09','2025-03-13',480.0),
(10,'C010','R005','2025-03-10','2025-03-14',800.0);

INSERT INTO Payment (payment_id, booking_id, payment_method, payment_date, payment_amount) VALUES
(1,1,'Cash','2025-03-05',400.0),
(2,2,'Credit Card','2025-03-06',600.0),
(3,3,'Bank Transfer','2025-03-07',1000.0),
(4,4,'Cash','2025-03-08',480.0),
(5,5,'Credit Card','2025-03-09',800.0),
(6,6,'Bank Transfer','2025-03-10',400.0),
(7,7,'Cash','2025-03-11',600.0),
(8,8,'Credit Card','2025-03-12',1000.0),
(9,9,'Bank Transfer','2025-03-13',480.0),
(10,10,'Cash','2025-03-14',800.0);

-- update   
UPDATE Booking b
JOIN Room r ON b.room_id = r.room_id
SET b.total_amount = r.room_price * DATEDIFF(b.check_out_date, b.check_in_date)
WHERE r.room_status = 'Booked'
  AND b.check_in_date < CURDATE();
  
-- delete 
DELETE FROM Payment
WHERE payment_method = 'Cash'
  AND payment_amount < 500;

-- lay thong tin khach hang, sap xep tang dan
SELECT customer_id, customer_full_name, customer_email, customer_phone, customer_address
FROM Customer
ORDER BY customer_full_name ASC;

-- lay thong tin phong, sap xep giam dan
SELECT room_id, room_type, room_price, room_area
FROM Room
ORDER BY room_price DESC;

-- lay thong tin khachs hang, phong da dat
SELECT c.customer_id, c.customer_full_name, b.room_id, b.check_in_date, b.check_out_date
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id;

-- lay khach hang, tong tien thanh toan, sap xep giam dan
SELECT c.customer_id, c.customer_full_name, p.payment_method, p.payment_amount
FROM Payment p
JOIN Booking b ON p.booking_id = b.booking_id
JOIN Customer c ON b.customer_id = c.customer_id
ORDER BY p.payment_amount DESC;

-- khach hang tu vi tri 2-4
SELECT customer_id, customer_full_name, customer_email, customer_phone, customer_address
FROM Customer
ORDER BY customer_full_name ASC
LIMIT 1, 3;

-- khach hang da dat it nhat 2 phong, tong tien tren 1000
SELECT c.customer_id, c.customer_full_name, COUNT(b.booking_id) AS num_rooms
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
JOIN Payment p ON b.booking_id = p.booking_id
GROUP BY c.customer_id, c.customer_full_name
HAVING COUNT(b.booking_id) >= 2
   AND SUM(p.payment_amount) > 1000;

-- phong co tong thanh toan <1000, cos it nhat 3 khach da dat
SELECT b.room_id, r.room_type, r.room_price, SUM(p.payment_amount) AS total_payment
FROM Booking b
JOIN Room r ON b.room_id = r.room_id
JOIN Payment p ON b.booking_id = p.booking_id
GROUP BY b.room_id, r.room_type, r.room_price
HAVING total_payment < 1000
   AND COUNT(DISTINCT b.customer_id) >= 3;

-- khach hang co tong thanh toan lon hon 1000
SELECT c.customer_id, c.customer_full_name, b.room_id, SUM(p.payment_amount) AS total_payment
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
JOIN Payment p ON b.booking_id = p.booking_id
GROUP BY c.customer_id, c.customer_full_name, b.room_id
HAVING total_payment > 1000;
-- khach hang co ten chua Minh, dia chi Hanoi
SELECT customer_id, customer_full_name, customer_email, customer_phone
FROM Customer
WHERE customer_full_name LIKE '%Minh%'
   OR customer_address LIKE '%Hanoi%'
ORDER BY customer_full_name ASC;

-- lay 5 phong tiep theo
SELECT room_id, room_type, room_price
FROM Room
ORDER BY room_price DESC
LIMIT 5, 5;

-- phong khahch da dat checkin 25/3/10
CREATE OR REPLACE VIEW view_room_customer_before_2025 AS
SELECT 
    r.room_id,
    r.room_type,
    c.customer_id,
    c.customer_full_name
FROM Booking b
JOIN Room r ON b.room_id = r.room_id
JOIN Customer c ON b.customer_id = c.customer_id
WHERE b.check_in_date < '2025-03-10';
SELECT * FROM view_room_customer_before_2025;

-- khach hang da dat phong dien tich >30
CREATE OR REPLACE VIEW view_customer_room_large AS
SELECT 
    c.customer_id,
    c.customer_full_name,
    r.room_id,
    r.room_area
FROM Booking b
JOIN Room r ON b.room_id = r.room_id
JOIN Customer c ON b.customer_id = c.customer_id
WHERE r.room_area > 30;
SELECT * FROM view_customer_room_large;

-- tao trigger check_insert_booking
DELIMITER $$
CREATE TRIGGER check_insert_booking
BEFORE INSERT ON Booking
FOR EACH ROW
BEGIN
    IF NEW.check_in_date > NEW.check_out_date THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Ngày đặt phòng không thể sau ngày trả phòng được !';
    END IF;
END$$
DELIMITER ;

-- tao trigger update_room
DELIMITER $$
CREATE TRIGGER update_room_status_on_booking
AFTER INSERT ON Booking
FOR EACH ROW
BEGIN
    UPDATE Room
    SET room_status = 'Booked'
    WHERE room_id = NEW.room_id;
END$$
DELIMITER ;

-- tao store procedure add_customer
DELIMITER $$
CREATE PROCEDURE add_customer(
    IN p_customer_id VARCHAR(5),
    IN p_full_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(20),
    IN p_address VARCHAR(255)
)BEGIN
    INSERT INTO Customer (customer_id, customer_full_name, customer_email, customer_phone, customer_address)
    VALUES (p_customer_id, p_full_name, p_email, p_phone, p_address);
END$$
DELIMITER ;

-- tao store procedure add_payment
DELIMITER $$
CREATE PROCEDURE add_payment(
    IN p_booking_id INT,
    IN p_payment_method VARCHAR(50),
    IN p_payment_amount DECIMAL(10,2),
    IN p_payment_date DATE
)
BEGIN
    INSERT INTO Payment (booking_id, payment_method, payment_amount, payment_date)
    VALUES (p_booking_id, p_payment_method, p_payment_amount, p_payment_date);
END$$
DELIMITER ;