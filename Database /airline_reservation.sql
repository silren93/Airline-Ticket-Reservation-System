-- phpMyAdmin SQL Dump
    -- version 4.2.11
    -- http://www.phpmyadmin.net
    --

    -- Host: 127.0.0.1
    -- Generation Time: Aug 23, 2019 at 09:21 AM
    -- Server version: 5.6.21
    -- PHP Version: 5.5.19


CREATE SCHEMA IF NOT EXISTS `airline_reservation`;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- A. TẠO BẢNG
-- Tạo bảng `admin`
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` varchar(20) NOT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `customer`
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `name` nvarchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `address` nvarchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `jet_details`
CREATE TABLE IF NOT EXISTS `jet_details` (
  `jet_id` varchar(10) NOT NULL,
  `jet_type` varchar(20) DEFAULT NULL,
  `total_capacity` int(5) DEFAULT NULL,
  `active` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `group_flight`
CREATE TABLE IF NOT EXISTS `group_flight` (
  `group_id` varchar(7) NOT NULL,
  `captain` varchar(7) DEFAULT NULL,
  `first_officer` varchar(7) DEFAULT NULL,
  `jet_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `employee`
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` varchar(7) NOT NULL, 
  `pwd` varchar(20) DEFAULT NULL,
  `name` nvarchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `address` nvarchar(35) DEFAULT NULL,
  `group_id` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `static_flight`
CREATE TABLE IF NOT EXISTS `static_flight` (
  `static_flight_no` varchar(10) NOT NULL,
  `from_city` nvarchar(20) DEFAULT NULL,
  `to_city` nvarchar(20) DEFAULT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `jet_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `flight_details`
CREATE TABLE IF NOT EXISTS `flight_details` (
  `flight_no` varchar(10) NOT NULL,
  `from_city` nvarchar(20) DEFAULT NULL,
  `to_city` nvarchar(20) DEFAULT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `seats_economy` int(5) DEFAULT NULL,
  `seats_business` int(5) DEFAULT NULL,
  `price_economy` int(10) DEFAULT NULL,
  `price_business` int(10) DEFAULT NULL,
  `jet_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `frequent_flier_details`
CREATE TABLE IF NOT EXISTS `frequent_flier_details` (
  `frequent_flier_no` varchar(20) NOT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `mileage` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `passengers`
CREATE TABLE IF NOT EXISTS `passengers` (
  `passenger_id` int(10) NOT NULL,
  `pnr` varchar(15) NOT NULL,
  `name` nvarchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `meal_choice` varchar(5) DEFAULT NULL,
  `frequent_flier_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `payment_details`
CREATE TABLE IF NOT EXISTS `payment_details` (
  `payment_id` varchar(20) NOT NULL,
  `pnr` varchar(15) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` int(6) DEFAULT NULL,
  `payment_mode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tạo bảng `luggage`
CREATE TABLE IF NOT EXISTS `luggage` (
  `luggage_id` varchar(7) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `passenger_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tạo bảng `ticket_details`
CREATE TABLE IF NOT EXISTS `ticket_details` (
  `pnr` varchar(15) NOT NULL,
  `date_of_reservation` date DEFAULT NULL,
  `flight_no` varchar(10) DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `booking_status` varchar(20) DEFAULT NULL,
  `no_of_passengers` int(5) DEFAULT NULL,
  `lounge_access` varchar(5) DEFAULT NULL,
  `priority_checkin` varchar(5) DEFAULT NULL,
  `insurance` varchar(5) DEFAULT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `customer_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE admin CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE customer CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE flight_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE frequent_flier_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jet_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE passengers CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE payment_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE ticket_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE employee CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE static_flight CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- B. TẠO KHÓA 
-- Tạo khóa cho bảng `admin`
ALTER TABLE `admin` ADD PRIMARY KEY (`admin_id`);

-- Tạo khóa cho bảng `customer`
ALTER TABLE `customer` ADD PRIMARY KEY (`customer_id`);

-- Tạo khóa cho bảng `jet_details`
ALTER TABLE `jet_details` ADD PRIMARY KEY (`jet_id`);

-- Tạo khóa cho bảng `group_flight`
ALTER TABLE `group_flight` ADD PRIMARY KEY (`group_id`);
ALTER TABLE `group_flight` ADD KEY `jet_id` (`jet_id`);
ALTER TABLE `group_flight` ADD CONSTRAINT `jet_id_foreignkey` FOREIGN KEY (`jet_id`) 
REFERENCES `jet_details` (`jet_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo khóa cho bảng `employee`
ALTER TABLE `employee` ADD PRIMARY KEY (`employee_id`);
ALTER TABLE `employee` ADD KEY `group_id` (`group_id`);
ALTER TABLE `employee` ADD CONSTRAINT `group_id_foreignkey` FOREIGN KEY (`group_id`) 
REFERENCES `group_flight` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo khóa cho bảng `static_flight`
ALTER TABLE `static_flight` ADD PRIMARY KEY (`static_flight_no`,`departure_date`);
ALTER TABLE `static_flight` ADD KEY `jet_id` (`jet_id`);
ALTER TABLE `static_flight` ADD CONSTRAINT `static_flight_foreignkey` FOREIGN KEY (`jet_id`) 
REFERENCES `jet_details` (`jet_id`) ON DELETE CASCADE ON UPDATE CASCADE;


-- Tạo khóa cho bảng `flight_details`
ALTER TABLE `flight_details` ADD PRIMARY KEY (`flight_no`,`departure_date`);
ALTER TABLE `flight_details` ADD KEY `jet_id` (`jet_id`);
ALTER TABLE `flight_details` ADD CONSTRAINT `flight_details_ibfk_1` FOREIGN KEY (`jet_id`) 
REFERENCES `jet_details` (`jet_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo khóa cho bảng `frequent_flier_details`
ALTER TABLE `frequent_flier_details` ADD PRIMARY KEY (`frequent_flier_no`); 
ALTER TABLE `frequent_flier_details` ADD KEY `customer_id` (`customer_id`);
ALTER TABLE `frequent_flier_details` ADD CONSTRAINT `frequent_flier_details_ibfk_1` FOREIGN KEY (`customer_id`) 
REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tạo khóa cho bảng `ticket_details`
ALTER TABLE `ticket_details` ADD PRIMARY KEY (`pnr`);   
ALTER TABLE `ticket_details` ADD KEY `flight_no` (`flight_no`); 
ALTER TABLE `ticket_details` ADD KEY `customer_id` (`customer_id`);
ALTER TABLE `ticket_details` ADD KEY `journey_date` (`journey_date`);
ALTER TABLE `ticket_details` ADD KEY `flight_no_2` (`flight_no`,`journey_date`);
ALTER TABLE `ticket_details` ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`customer_id`) 
REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `ticket_details` ADD CONSTRAINT `ticket_details_ibfk_3` FOREIGN KEY (`flight_no`, `journey_date`) 
REFERENCES `flight_details` (`flight_no`, `departure_date`) ON DELETE SET NULL ON UPDATE CASCADE;

-- Tạo khóa cho bảng `passengers`
ALTER TABLE `passengers` ADD PRIMARY KEY (`passenger_id`,`pnr`);  
ALTER TABLE `passengers` ADD KEY `pnr` (`pnr`);
ALTER TABLE `passengers` ADD KEY `frequent_flier_no` (`frequent_flier_no`);
ALTER TABLE `passengers` ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`pnr`) 
REFERENCES `ticket_details` (`pnr`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `passengers` ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`frequent_flier_no`) 
REFERENCES `frequent_flier_details` (`frequent_flier_no`) ON UPDATE CASCADE;

-- Tạo khóa cho bảng `luggage`
ALTER TABLE `luggage` ADD PRIMARY KEY (`luggage_id`);
ALTER TABLE `luggage` ADD KEY `passenger_id` (`passenger_id`);
ALTER TABLE `luggage` ADD CONSTRAINT `luggage_foreignkey` FOREIGN KEY (`passenger_id`) 
REFERENCES `passenger` (`passenger_id`) ON UPDATE CASCADE;

-- Tạo khóa cho bảng `payment_details`
ALTER TABLE `payment_details` ADD PRIMARY KEY (`payment_id`);
ALTER TABLE `payment_details` ADD KEY `pnr` (`pnr`);
ALTER TABLE `payment_details` ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`pnr`) 
REFERENCES `ticket_details` (`pnr`) ON UPDATE CASCADE;

-- C. TẠO RÀNG BUỘC
-- Email của mỗi admin là duy nhất
ALTER TABLE `admin` ADD CONSTRAINT `U_admin_email` UNIQUE (`email`);
-- Email của mỗi customer là duy nhất
ALTER TABLE `customer` ADD CONSTRAINT `U_customer_email` UNIQUE (`email`);
-- Số điện thoại mỗi customer là duy nhất
ALTER TABLE `customer` ADD CONSTRAINT `U_customer_phone_no` UNIQUE  (`phone_no`);
--Email của mỗi employee là duy nhất
ALTER TABLE `employee` ADD CONSTRAINT `U_employee_email` UNIQUE (`email`);
-- Số điện thoại mỗi employee là duy nhất
ALTER TABLE `employee` ADD CONSTRAINT `U_employee_phone_no` UNIQUE  (`phone_no`);
-- Ngày cất cánh luôn nhỏ hơn bằng ngày hạ cánh
ALTER TABLE `flight_details` ADD CONSTRAINT ck_flidet_depart_arri CHECK (`departure_date` <= `arrival_date`);
ALTER TABLE `static_flight` ADD CONSTRAINT ck_stafli_depart_arri CHECK (`departure_date` <= `arrival_date`);
-- Số ghế hạng phổ thông luôn nhiều hơn hạng thương gia
ALTER TABLE `flight_details` ADD CONSTRAINT ck_seat CHECK (`seats_economy` > `seats_business`);
-- Giá ghế hạng phổ thông luôn nhỏ hơn hạng thương gia
ALTER TABLE `flight_details` ADD CONSTRAINT ck_price CHECK (`price_economy` < `price_business`);

-- D. TẠO DỮ LIỆU MẪU 
-- Tạo dữ liệu mẫu cho bảng `admin`
INSERT INTO `admin` (`admin_id`, `pwd`, `staff_id`, `name`, `email`) VALUES
('admin', '22520653', 'admin', 'Tran Lam Ngoc Khanh', 'me123lac@gmail.com');

-- Tạo dữ liệu mẫu cho bảng `customer` 
INSERT INTO `customer` (`customer_id`, `pwd`, `name`, `email`, `phone_no`, `address`) VALUES
('CUS001', 'passA5@', 'Nguyễn Văn A', 'nguyenvana@gmail.com', '0123456789', 'Hà Nội'),
('CUS002', 'passB2$', 'Trần Hoàng B', 'tranhoangb@gmail.com', '0987654321', 'Hồ Chí Minh'),
('CUS003', 'passC7%', 'Lê Minh C', 'leminhc@gmail.com', '0369852147', 'Hải Phòng'),
('CUS004', 'passD9^', 'Phạm Thị D', 'phamthid@gmail.com', '0123789456', 'Đà Nẵng'),
('CUS005', 'passE3*', 'Hoàng Văn E', 'hoangvane@gmail.com', '0876543210', 'Cần Thơ'),
('CUS006', 'passF1!', 'Vũ Thị F', 'vuthif@gmail.com', '0987456123', 'Bình Dương'),
('CUS007', 'passG8&', 'Nguyễn Minh Ngọc G', 'tranminhngocg@gmail.com', '0369852148', 'Đồng Nai'),
('CUS008', 'passH4#', 'Lê Thị H', 'lethih@gmail.com', '0789654123', 'Đồng Tháp'),
('CUS009', 'passI0@', 'Lê Thị I', 'lethii@gmail.com', '0912345678', 'An Giang'),
('CUS010', 'passJ6%', 'Phạm Trần Mỹ K', 'phamtranmyk@gmail.com', '0345678912', 'Bà Rịa - Vũng Tàu'),
('CUS011', 'passK3*', 'Đinh Hoàng L', 'dinhhoangl@gmail.com', '0567891234', 'Bắc Giang'),
('CUS012', 'passL7!', 'Hoàng Minh M', 'hoangminhm@gmail.com', '0654123789', 'Bắc Kạn'),
('CUS013', 'passM2#', 'Trần Thanh N', 'tranthanhn@gmail.com', '0321654987', 'Bạc Liêu'),
('CUS014', 'passN5$', 'Phạm Thị O', 'phamthio@gmail.com', '0412378965', 'Bắc Ninh'),
('CUS015', 'passO9@', 'Lê Văn P', 'levanp@gmail.com', '0432165987', 'Bến Tre'),
('CUS016', 'passP4%', 'Nguyễn Thị Q', 'nguyenthiq@gmail.com', '0875642139', 'Bình Định'),
('CUS017', 'passQ8^', 'Trần Thị Bảo R', 'tranthibaor@gmail.com', '0765432987', 'Bình Phước'),
('CUS018', 'passR3*', 'Lê Văn S', 'levans@gmail.com', '0897654321', 'Bình Thuận'),
('CUS019', 'passS6$', 'Hoàng Thị T', 'hoangthit@gmail.com', '0654897231', 'Cà Mau'),
('CUS020', 'passT1!', 'Vũ Thị U', 'vuthiu@gmail.com', '0912876543', 'Cần Thơ');

-- Tạo dữ liệu mẫu cho bảng `jet_details`
INSERT INTO `jet_details` (`jet_id`, `jet_type`, `total_capacity`, `active`) VALUES
('JET001', 'Boeing 777', 178, 'Yes'),
('JET002', 'Airbus A320', 184, 'Yes'),
('JET003', 'Boeing 737', 203, 'Yes'),
('JET004', 'Airbus A380', 269, 'Yes'),
('JET005', 'Boeing 787', 269, 'Yes'),
('JET006', 'Airbus A350', 239, 'Yes'),
('JET007', 'Boeing 767', 253, 'Yes'),
('JET008', 'Airbus A330', 200, 'Yes'),
('JET009', 'Airbus A321', 260, 'Yes'),
('JET010', 'Boeing 747', 311, 'Yes');

-- Tạo dữ liệu mẫu cho bảng `group_flight`
INSERT INTO group_flight (group_id, captain, first_officer, jet_id) VALUES
('GR001', 'NV001', 'NV011', 'JET001'),
('GR002', 'NV002', 'NV012', 'JET002'),
('GR003', 'NV003', 'NV013', 'JET003'),
('GR004', 'NV004', 'NV014', 'JET004'),
('GR005', 'NV005', 'NV015', 'JET005'),
('GR006', 'NV006', 'NV016', 'JET006'),
('GR007', 'NV007', 'NV017', 'JET007'),
('GR008', 'NV008', 'NV018', 'JET008'),
('GR009', 'NV009', 'NV019', 'JET009'),
('GR010', 'NV010', 'NV020', 'JET010');

-- Tạo dữ liệu mẫu cho bảng `employee`
INSERT INTO employee (employee_id, pwd, name, age, email, phone_no, address, group_id) VALUES
('NV001', 'pwd001', 'Nguyễn Văn A', 30, 'nv001@gmail.com', '0901001001', 'TP.HCM', 'GR001'),
('NV002', 'pwd002', 'Nguyễn Văn B', 28, 'nv002@gmail.com', '0901001002', 'Hà Nội', 'GR002'),
('NV003', 'pwd003', 'Nguyễn Văn C', 32, 'nv003@gmail.com', '0901001003', 'Đà Nẵng', 'GR003'),
('NV004', 'pwd004', 'Nguyễn Văn D', 27, 'nv004@gmail.com', '0901001004', 'Hải Phòng', 'GR004'),
('NV005', 'pwd005', 'Nguyễn Văn E', 29, 'nv005@gmail.com', '0901001005', 'Cần Thơ', 'GR005'),
('NV006', 'pwd006', 'Nguyễn Văn F', 31, 'nv006@gmail.com', '0901001006', 'Huế', 'GR006'),
('NV007', 'pwd007', 'Nguyễn Văn G', 33, 'nv007@gmail.com', '0901001007', 'Quảng Ninh', 'GR007'),
('NV008', 'pwd008', 'Nguyễn Văn H', 30, 'nv008@gmail.com', '0901001008', 'Bình Dương', 'GR008'),
('NV009', 'pwd009', 'Nguyễn Văn I', 28, 'nv009@gmail.com', '0901001009', 'Đồng Nai', 'GR009'),
('NV010', 'pwd010', 'Nguyễn Văn K', 29, 'nv010@gmail.com', '0901001010', 'Thái Bình', 'GR010'),
('NV011', 'pwd011', 'Nguyễn Văn L', 30, 'nv011@gmail.com', '0901001011', 'Bắc Giang', 'GR001'),
('NV012', 'pwd012', 'Nguyễn Văn M', 32, 'nv012@gmail.com', '0901001012', 'Nam Định', 'GR002'),
('NV013', 'pwd013', 'Nguyễn Văn N', 31, 'nv013@gmail.com', '0901001013', 'Nghệ An', 'GR003'),
('NV014', 'pwd014', 'Nguyễn Văn O', 35, 'nv014@gmail.com', '0901001014', 'Hà Tĩnh', 'GR004'),
('NV015', 'pwd015', 'Nguyễn Văn P', 34, 'nv015@gmail.com', '0901001015', 'Sơn La', 'GR005'),
('NV016', 'pwd016', 'Nguyễn Văn Q', 33, 'nv016@gmail.com', '0901001016', 'Thanh Hóa', 'GR006'),
('NV017', 'pwd017', 'Nguyễn Văn R', 32, 'nv017@gmail.com', '0901001017', 'Vĩnh Long', 'GR007'),
('NV018', 'pwd018', 'Nguyễn Văn S', 31, 'nv018@gmail.com', '0901001018', 'Cà Mau', 'GR008'),
('NV019', 'pwd019', 'Nguyễn Văn T', 30, 'nv019@gmail.com', '0901001019', 'Hậu Giang', 'GR009'),
('NV020', 'pwd020', 'Nguyễn Văn U', 29, 'nv020@gmail.com', '0901001020', 'An Giang', 'GR010'),
('NV021', 'pwd021', 'Nguyễn Văn V', 30, 'nv021@gmail.com', '0901001021', 'TP.HCM', 'GR001'),
('NV022', 'pwd022', 'Nguyễn Văn X', 28, 'nv022@gmail.com', '0901001022', 'Hà Nội', 'GR002'),
('NV023', 'pwd023', 'Nguyễn Văn Y', 32, 'nv023@gmail.com', '0901001023', 'Đà Nẵng', 'GR003'),
('NV024', 'pwd024', 'Nguyễn Văn Z', 27, 'nv024@gmail.com', '0901001024', 'Hải Phòng', 'GR004'),
('NV025', 'pwd025', 'Nguyễn Thị A', 29, 'nv025@gmail.com', '0901001025', 'Cần Thơ', 'GR005'),
('NV026', 'pwd026', 'Nguyễn Thị B', 31, 'nv026@gmail.com', '0901001026', 'Huế', 'GR006'),
('NV027', 'pwd027', 'Nguyễn Thị C', 33, 'nv027@gmail.com', '0901001027', 'Quảng Ninh', 'GR007'),
('NV028', 'pwd028', 'Nguyễn Thị D', 30, 'nv028@gmail.com', '0901001028', 'Bình Dương', 'GR008'),
('NV029', 'pwd029', 'Nguyễn Thị E', 28, 'nv029@gmail.com', '0901001029', 'Đồng Nai', 'GR009'),
('NV030', 'pwd030', 'Nguyễn Thị F', 29, 'nv030@gmail.com', '0901001030', 'Thái Bình', 'GR010');

--Tạo dữ liệu mẫu cho bảng `static_flight`
INSERT INTO static_flight (static_flight_no, departure_date, from_city, to_city, arrival_date, departure_time, arrival_time, jet_id) VALUES
('VN201', '2024-07-01', 'Hà Nội', 'TP.HCM', '2024-07-01', '08:00:00', '10:00:00', 'JET001'),
('VN202', '2024-08-01', 'Đà Nẵng', 'Hải Phòng', '2024-08-01', '09:30:00', '11:30:00', 'JET002'),
('VN203', '2024-09-01', 'Cần Thơ', 'Huế', '2024-09-01', '11:00:00', '13:00:00', 'JET003'),
('VN204', '2024-10-01', 'Hải Phòng', 'Đồng Nai', '2024-10-01', '13:30:00', '15:30:00', 'JET004'),
('VN205', '2024-11-01', 'TP.HCM', 'Hà Nội', '2024-11-01', '15:00:00', '17:00:00', 'JET005');


-- Tạo dữ liệu mẫu cho bảng `flight_details`
INSERT INTO `flight_details` (`flight_no`, `from_city`, `to_city`, `departure_date`, `arrival_date`, `departure_time`, `arrival_time`, `seats_economy`, `seats_business`, `price_economy`, `price_business`, `jet_id`)
VALUES
('VN101', 'Đà Nẵng', 'Nha Trang', '2024-09-02', '2024-09-02', '08:00:00', '09:30:00', 162, 16, 800000, 2500000, 'JET001'),
('VN102', 'Phú Quốc', 'Cần Thơ', '2024-06-23', '2024-06-23', '19:00:00', '20:00:00', 168, 16, 700000, 2000000, 'JET002'),
('VN103', 'Huế', 'Đà Lạt', '2024-07-04', '2024-07-04', '12:00:00', '12:45:00', 195, 8, 600000, 1800000, 'JET003'),
('VN104', 'Hà Nội', 'Hồ Chí Minh', '2024-11-20', '2024-11-20', '20:00:00', '22:00:00', 251, 18, 550000, 1600000, 'JET004'),
('VN105', 'Hải Phòng', 'Quy Nhơn', '2024-08-29', '2024-08-29', '17:00:00', '17:30:00', 240, 29, 650000, 1900000, 'JET005'),
('VN106', 'Cần Thơ', 'Đà Nẵng', '2024-06-07', '2024-06-07', '13:00:00', '14:30:00', 211, 28, 700000, 2000000, 'JET006'),
('VN107', 'Cà Mau', 'Vũng Tàu', '2024-09-13', '2024-09-13', '07:00:00', '08:00:00', 228, 25, 600000, 1800000, 'JET007'),
('VN108', 'Nha Trang', 'Hà Nội', '2024-09-29', '2024-09-29', '15:00:00', '16:30:00', 190, 10, 550000, 1600000, 'JET008'),
('VN109', 'Tuy Hòa', 'Hà Nội', '2024-08-03', '2024-08-03', '21:00:00', '22:45:00', 231, 29, 500000, 1500000, 'JET009'),
('VN110', 'Hồ Chí Minh', 'Nha Trang', '2024-12-11', '2024-12-11', '11:00:00', '12:30:00', 283, 28, 600000, 1700000, 'JET010'),
('VN111', 'Nha Trang', 'Cần Thơ', '2024-06-12', '2024-06-12', '18:00:00', '19:30:00', 162, 16, 650000, 1900000, 'JET001'),
('VN112', 'Phú Quốc', 'Hồ Chí Minh', '2024-07-20', '2024-07-20', '15:00:00', '16:00:00', 168, 16, 700000, 2000000, 'JET002'),
('VN113', 'Hà Nội', 'Huế', '2024-12-14', '2024-12-14', '09:00:00', '10:30:00', 195, 8, 750000, 2200000, 'JET003'),
('VN114', 'Hồ Chí Minh', 'Vinh', '2024-08-21', '2024-08-21', '12:00:00', '13:15:00', 251, 18, 650000, 1900000, 'JET004'),
('VN115', 'Hà Nội', 'Pleiku', '2024-11-06', '2024-11-06', '16:00:00', '17:45:00', 240, 29, 600000, 1800000, 'JET005'),
('VN116', 'Buôn Ma Thuột', 'Hồ Chí Minh', '2024-06-17', '2024-06-17', '22:00:00', '23:00:00', 211, 28, 550000, 1600000, 'JET006'),
('VN117', 'Nha Trang', 'Đà Lạt', '2024-07-17', '2024-07-17', '18:00:00', '18:45:00', 228, 25, 500000, 1500000, 'JET007'),
('VN118', 'Hải Phòng', 'Hà Nội', '2024-10-30', '2024-10-30', '07:00:00', '07:30:00', 190, 10, 600000, 1700000, 'JET008'),
('VN119', 'Hà Nội', 'Phú Quốc', '2024-08-08', '2024-08-08', '09:00:00', '11:30:00', 231, 29, 650000, 1900000, 'JET009'),
('VN120', 'Điện Biên', 'Hà Nội', '2024-10-25', '2024-10-25', '19:00:00', '20:15:00', 283, 28, 700000, 15000000,'JET010');

-- Tạo dữ liệu mẫu cho bảng `frequent_flier_details`
INSERT INTO `frequent_flier_details` (`frequent_flier_no`, `customer_id`, `mileage`) VALUES
('FF001', 'CUS001', 15000),
('FF002', 'CUS005', 18000),
('FF003', 'CUS012', 12000),
('FF004', 'CUS015', 20000),
('FF005', 'CUS016', 22000);

-- Tạo dữ liệu mẫu cho bảng `ticket_details`
INSERT INTO `ticket_details` (`pnr`, `date_of_reservation`, `flight_no`, `journey_date`, `class`, `booking_status`, `no_of_passengers`, `lounge_access`, `priority_checkin`, `insurance`, `payment_id`, `customer_id`) VALUES
('00112233', '2024-08-26', 'VN101', '2024-09-02', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'No', 'PAY001', 'CUS001'),
('11223344', '2024-06-16', 'VN102', '2024-06-23', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'No', 'PAY002', 'CUS002'),
('22334455', '2024-06-27', 'VN103', '2024-07-04', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'Yes', 'PAY003', 'CUS003'),
('33445566', '2024-11-13', 'VN104', '2024-11-20', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'No', 'PAY004', 'CUS004'),
('44556677', '2024-08-22', 'VN105', '2024-08-29', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'No', 'PAY005', 'CUS005'),
('55667788', '2024-06-01', 'VN106', '2024-06-07', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'Yes', 'PAY006', 'CUS006'),
('66778899', '2024-09-06', 'VN107', '2024-09-13', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'Yes', 'PAY007', 'CUS007'),
('77889900', '2024-09-22', 'VN108', '2024-09-29', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'No', 'PAY008', 'CUS008'),
('88990011', '2024-07-27', 'VN109', '2024-08-03', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'No', 'PAY009', 'CUS009'),
('99001122', '2024-12-04', 'VN110', '2024-12-11', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'No', 'PAY010', 'CUS010'),
('01230123', '2024-06-05', 'VN111', '2024-06-12', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'No', 'PAY011', 'CUS011'),
('12341234', '2024-07-13', 'VN112', '2024-07-20', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'Yes', 'PAY012', 'CUS012'),
('23452345', '2024-12-07', 'VN113', '2024-12-14', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'No', 'PAY013', 'CUS013'),
('34563456', '2024-08-14', 'VN114', '2024-08-21', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'Yes', 'PAY014', 'CUS014'),
('45674567', '2024-11-01', 'VN115', '2024-11-06', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'Yes', 'PAY015', 'CUS015'),
('56785678', '2024-06-10', 'VN116', '2024-06-17', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'No', 'PAY016', 'CUS016'),
('67896789', '2024-07-10', 'VN117', '2024-07-17', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'No', 'PAY017', 'CUS017'),
('78907890', '2024-10-23', 'VN118', '2024-10-30', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'Yes', 'PAY018', 'CUS018'),
('89018901', '2024-08-01', 'VN119', '2024-08-08', 'Economy', 'Confirmed', 1, 'Yes', 'No', 'Yes', 'PAY019', 'CUS019'),
('90129012', '2024-10-18', 'VN120', '2024-10-25', 'Business', 'Confirmed', 1, 'Yes', 'Yes', 'No', 'PAY020', 'CUS020');


-- Tạo dữ liệu mẫu cho bảng `passengers`
INSERT INTO `passengers` (`passenger_id`, `pnr`, `name`, `age`, `gender`, `meal_choice`, `frequent_flier_no`) 
VALUES
(1, '00112233', 'Nguyễn Văn A', 55, 'Male', 'Yes', 'FF001'),
(2, '11223344', 'Trần Hoàng B', 25, 'Male', 'No', NULL),
(3, '22334455', 'Lê Minh C', 40, 'Male', 'Yes', NULL),
(4, '33445566', 'Phạm Thị D', 65, 'Female', 'Yes', NULL),
(5, '44556677', 'Hoàng Văn E', 38, 'Male', 'No', 'FF002'),
(6, '55667788', 'Vũ Thị F', 25, 'Female', 'Yes', NULL),
(7, '66778899', 'Nguyễn Minh Ngọc G', 50, 'Female', 'Yes', NULL),
(8, '77889900', 'Lê Thị H', 33, 'Male', 'Yes', NULL),
(9, '88990011', 'Lê Thị I', 27, 'Female', 'No', NULL),
(10, '99001122', 'Phạm Trần Mỹ K', 32, 'Female', 'No', NULL),
(11, '01230123', 'Đinh Hoàng L', 29, 'Male', 'Yes', NULL),
(12, '12341234', 'Hoàng Minh M', 38, 'Male', 'Yes', 'FF003'),
(13, '23452345', 'Trần Thanh N', 31, 'Female', 'Yes', NULL),
(14, '34563456', 'Phạm Thị O', 35, 'Female', 'No', NULL),
(15, '45674567', 'Lê Văn P', 45, 'Male', 'Yes', 'FF004'),
(16, '56785678', 'Nguyễn Thị Q', 56, 'Female', 'Yes', 'FF005'),
(17, '67896789', 'Trần Thị Bảo R', 18, 'Female', 'Yes', NULL),
(18, '78907890', 'Lê Văn S', 24, 'Male', 'No', NULL),
(19, '89018901', 'Hoàng Thị T', 29, 'Female', 'Yes', NULL),
(20, '90129012', 'Vũ Minh U', 60, 'Male', 'No', NULL);

-- Tạo dữ liệu mẫu cho bảng `luggage`
INSERT INTO luggage (luggage_id, weight, passenger_id) VALUES
('LUG001', 15, 1),
('LUG002', 12, 2),
('LUG003', 18, 3),
('LUG004', 10, 4),
('LUG005', 22, 5),
('LUG006', 14, 6),
('LUG007', 19, 7),
('LUG008', 16, 8),
('LUG009', 13, 9),
('LUG010', 17, 10),
('LUG011', 11, 11),
('LUG012', 20, 12),
('LUG013', 9, 13),
('LUG014', 14, 14),
('LUG015', 21, 15),
('LUG016', 12, 16),
('LUG017', 18, 17),
('LUG018', 15, 18),
('LUG019', 16, 19),
('LUG020', 19, 20);

-- Tạo dữ liệu mẫu cho bảng `payment_details`
INSERT INTO `payment_details` (`payment_id`, `pnr`, `payment_date`, `payment_amount`, `payment_mode`) VALUES
('PAY001', '00112233', '2024-08-26', 800000, 'Cash'),
('PAY002', '11223344', '2024-06-16', 2000000, 'Credit card'),
('PAY003', '22334455', '2024-06-27', 600000, 'Bank transfer'),
('PAY004', '33445566', '2024-11-13', 1600000, 'Cash'),
('PAY005', '44556677', '2024-08-22', 650000, 'Credit card'),
('PAY006', '55667788', '2024-06-01', 2000000, 'Bank transfer'),
('PAY007', '66778899', '2024-09-06', 600000, 'Cash'),
('PAY008', '77889900', '2024-09-22', 1600000, 'Credit card'),
('PAY009', '88990011', '2024-07-27', 500000, 'Bank transfer'),
('PAY010', '99001122', '2024-12-04', 1700000, 'Cash'),
('PAY011', '01230123', '2024-06-05', 650000, 'Credit card'),
('PAY012', '12341234', '2024-07-13', 2000000, 'Bank transfer'),
('PAY013', '23452345', '2024-12-07', 750000, 'Cash'),
('PAY014', '34563456', '2024-08-14', 1900000, 'Credit card'),
('PAY015', '45674567', '2024-11-01', 600000, 'Bank transfer'),
('PAY016', '56785678', '2024-06-10', 1600000, 'Cash'),
('PAY017', '67896789', '2024-07-10', 500000, 'Credit card'),
('PAY018', '78907890', '2024-10-23', 1700000, 'Bank transfer'),
('PAY019', '89018901', '2024-08-01', 650000, 'Cash'),
('PAY020', '90129012', '2024-10-18', 1500000, 'Credit card');




DELIMITER $$
--
-- Procedures
--
-- CURSOR: GetFlights
-- Lấy danh sách số chuyến bay từ thành phố này đến thành phố kia  từ bảng flight_details.
CREATE DEFINER=`Khanh`@`localhost` PROCEDURE `GetFlightStatistics`(IN `j_date` DATE)
BEGIN
 select flight_no,departure_date,IFNULL(no_of_passengers, 0) as no_of_passengers,total_capacity from (
select f.flight_no,f.departure_date,sum(t.no_of_passengers) as no_of_passengers,j.total_capacity 
from flight_details f left join ticket_details t 
on t.booking_status='CONFIRMED' 
and t.flight_no=f.flight_no 
and f.departure_date=t.journey_date 
inner join jet_details j on j.jet_id=f.jet_id
group by flight_no,journey_date) k where departure_date=j_date;
 END$$

DELIMITER ;

--
--Procedure: 1. Search Flight
--Content: Find airline tickets
DELIMITER //

CREATE PROCEDURE sp_SearchFlight(
    IN in_origin VARCHAR(255),
    IN in_destination VARCHAR(255),
    IN in_dep_date DATE,
    IN in_no_of_pass INT,
    IN in_class VARCHAR(50)
)
BEGIN
    IF in_class = 'Economy' THEN
        SELECT * FROM flight_details
        WHERE from_city = in_origin
        AND to_city = in_destination
        AND departure_date = in_dep_date
        AND seats_economy >= in_no_of_pass;
    ELSEIF in_class = 'Business' THEN
        SELECT * FROM flight_details
        WHERE from_city = in_origin
        AND to_city = in_destination
        AND departure_date = in_dep_date
        AND seats_business >= in_no_of_pass;
    END IF;
END //

DELIMITER ;

--Procedure: 2. Add Ticket
--Content: Add airline tickets
DELIMITER //

CREATE PROCEDURE sp_AddTicket(
    IN in_pnr INT,
    IN in_date_of_res DATE,
    IN in_flight_no VARCHAR(10) COLLATE utf8mb4_unicode_ci,
    IN in_journey_date DATE,
    IN in_class VARCHAR(10) COLLATE utf8mb4_unicode_ci,
    IN in_booking_status VARCHAR(20) COLLATE utf8mb4_unicode_ci,
    IN in_no_of_pass INT,
    IN in_lounge_access VARCHAR(3) COLLATE utf8mb4_unicode_ci,
    IN in_priority_checkin VARCHAR(3) COLLATE utf8mb4_unicode_ci,
    IN in_insurance VARCHAR(3) COLLATE utf8mb4_unicode_ci,
    IN in_payment_id INT,
    IN in_customer_id VARCHAR(50) COLLATE utf8mb4_unicode_ci,
    IN in_total_no_of_meals INT,
    IN in_pass_names TEXT COLLATE utf8mb4_unicode_ci,
    IN in_pass_ages TEXT COLLATE utf8mb4_unicode_ci,
    IN in_pass_genders TEXT COLLATE utf8mb4_unicode_ci,
    IN in_pass_meals TEXT COLLATE utf8mb4_unicode_ci,
    IN in_pass_ff_ids TEXT COLLATE utf8mb4_unicode_ci
)
BEGIN
    DECLARE ticket_price DECIMAL(10,2);
    DECLARE ff_mileage DECIMAL(10,2);
    DECLARE i INT DEFAULT 1;
    DECLARE total_no_of_meals INT DEFAULT 0;
    DECLARE pass_name VARCHAR(255);
    DECLARE pass_age INT;
    DECLARE pass_gender VARCHAR(10);
    DECLARE pass_meal VARCHAR(10);
    DECLARE pass_ff_id VARCHAR(255);
    DECLARE cnt INT;
    DECLARE pass_ff_id_actual VARCHAR(255);

    -- Get ticket price based on class
    IF in_class = 'Economy' THEN
        SELECT price_economy INTO ticket_price
        FROM Flight_Details
        WHERE flight_no = in_flight_no AND departure_date = in_journey_date;
    ELSEIF in_class = 'Business' THEN
        SELECT price_business INTO ticket_price
        FROM Flight_Details
        WHERE flight_no = in_flight_no AND departure_date = in_journey_date;
    END IF;

    -- Calculate frequent flier mileage
    SET ff_mileage = ticket_price / 10;

    -- Insert into Ticket_Details
    INSERT INTO Ticket_Details (pnr, date_of_reservation, flight_no, journey_date, class, booking_status, no_of_passengers, lounge_access, priority_checkin, insurance, payment_id, customer_id)
    VALUES (in_pnr, in_date_of_res, in_flight_no, in_journey_date, in_class, in_booking_status, in_no_of_pass, in_lounge_access, in_priority_checkin, in_insurance, in_payment_id, in_customer_id);

    -- Loop through passengers
    WHILE i <= in_no_of_pass DO
        SET pass_name = SUBSTRING_INDEX(SUBSTRING_INDEX(in_pass_names, ',', i), ',', -1);
        SET pass_age = SUBSTRING_INDEX(SUBSTRING_INDEX(in_pass_ages, ',', i), ',', -1);
        SET pass_gender = SUBSTRING_INDEX(SUBSTRING_INDEX(in_pass_genders, ',', i), ',', -1);
        SET pass_meal = SUBSTRING_INDEX(SUBSTRING_INDEX(in_pass_meals, ',', i), ',', -1);
        SET pass_ff_id = SUBSTRING_INDEX(SUBSTRING_INDEX(in_pass_ff_ids, ',', i), ',', -1);

        IF pass_ff_id = '' THEN
            SET pass_ff_id_actual = NULL;
        ELSE
            SET pass_ff_id_actual = pass_ff_id;

            -- Check if frequent flier ID exists
            SELECT count(*) INTO cnt
            FROM Customer c, Frequent_Flier_Details f
            WHERE c.name = pass_name AND f.frequent_flier_no = pass_ff_id_actual AND c.customer_id = f.customer_id;

            IF cnt = 1 THEN
                -- Update mileage
                UPDATE Frequent_Flier_Details
                SET mileage = mileage + ff_mileage
                WHERE frequent_flier_no = pass_ff_id_actual;
            END IF;
        END IF;

        -- Insert into Passengers
        INSERT INTO Passengers (passenger_id, pnr, name, age, gender, meal_choice, frequent_flier_no)
        VALUES (i, in_pnr, pass_name, pass_age, pass_gender, pass_meal, pass_ff_id_actual);

        -- Update total meals count
        IF pass_meal = 'yes' THEN
            SET total_no_of_meals = total_no_of_meals + 1;
        END IF;

        SET i = i + 1;
    END WHILE;

    -- Update total number of meals in session
    SET in_total_no_of_meals = total_no_of_meals;
END //

DELIMITER ;
--
--Procedure: 3. Delete Ticket
--Content: Delete airline tickets
DELIMITER //

CREATE PROCEDURE sp_DeleteTicket(
    IN in_pnr VARCHAR(15) COLLATE utf8mb4_unicode_ci,
    IN in_customer_id VARCHAR(20) COLLATE utf8mb4_unicode_ci
)
BEGIN
    DECLARE todays_date DATE;
    DECLARE cnt INT;

    -- Get today's date
    SET todays_date = CURDATE();

    -- Check if the ticket exists and the journey date is in the future
    SELECT count(*)
    INTO cnt
    FROM Ticket_Details
    WHERE pnr = in_pnr AND journey_date >= todays_date;

    IF cnt != 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ticket not found or journey date has passed.';
    END IF;

    -- Update the ticket status to 'CANCELED'
    UPDATE Ticket_Details
    SET booking_status = 'CANCELED'
    WHERE pnr = in_pnr AND customer_id = in_customer_id;

    IF ROW_COUNT() != 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Failed to update ticket status.';
    END IF;

    -- Other logic to handle refunds and update seat availability
END //

DELIMITER ;

--Procedure: 4. List Booked Tickets
--Content: View the list of booked flight tickets
DELIMITER //

CREATE PROCEDURE sp_ListBookedTickets (
    IN flight_no VARCHAR(10),
    IN departure_date DATE
)
BEGIN
    SELECT 
        pnr,
        date_of_reservation,
        class,
        no_of_passengers,
        payment_id,
        customer_id
    FROM 
        Ticket_Details
    WHERE 
        flight_no = flight_no
        AND journey_date = departure_date 
        AND booking_status = 'CONFIRMED'
    ORDER BY 
        class;
END //

DELIMITER ;

--Procedure: 5. Add Flight Details
--Content: Add new flight
DELIMITER //

CREATE PROCEDURE sp_AddFlightDetails (
    IN p_flight_no VARCHAR(10),
    IN p_origin VARCHAR(50),
    IN p_destination VARCHAR(50),
    IN p_dep_date DATE,
    IN p_arr_date DATE,
    IN p_dep_time TIME,
    IN p_arr_time TIME,
    IN p_seats_eco INT,
    IN p_seats_bus INT,
    IN p_price_eco DECIMAL(10, 2),
    IN p_price_bus DECIMAL(10, 2),
    IN p_jet_id VARCHAR(10)
)
BEGIN
    INSERT INTO flight_details (
        flight_no,
        from_city,
        to_city,
        departure_date,
        arrival_date,
        departure_time,
        arrival_time,
        seats_economy,
        seats_business,
        price_economy,
        price_business,
        jet_id
    ) VALUES (
        p_flight_no,
        p_origin,
        p_destination,
        p_dep_date,
        p_arr_date,
        p_dep_time,
        p_arr_time,
        p_seats_eco,
        p_seats_bus,
        p_price_eco,
        p_price_bus,
        p_jet_id
    );
END //

DELIMITER ;

--Procedure: 6. Delete Flight Details
--Content: Delete a flight
DELIMITER //

CREATE PROCEDURE sp_DeleteFlightDetails (
    IN p_flight_no VARCHAR(10),
    IN p_dep_date DATE
)
BEGIN
    DELETE FROM flight_details
    WHERE flight_no = p_flight_no AND departure_date = p_dep_date;
END //

DELIMITER ;

--Procedure: 7. Most Booked Flight
--Content: Most Booked Flight
DELIMITER //

CREATE PROCEDURE sp_MostBookedFlights()
BEGIN
    -- Create a temporary table to store the most booked flights for each month
    CREATE TEMPORARY TABLE temp_most_booked_flights (
        flightYear INT,
        flightMonth INT,
        flightNo VARCHAR(10),
        seatsBooked INT
    );

    -- Insert the most booked flights
    INSERT INTO temp_most_booked_flights (flightYear, flightMonth, flightNo, seatsBooked)
    SELECT
        YEAR(journey_date) AS flightYear,
        MONTH(journey_date) AS flightMonth,
        flight_no,
        SUM(no_of_passengers) AS seatsBooked
    FROM ticket_details
    WHERE booking_status = 'CONFIRMED'
    GROUP BY flightYear, flightMonth, flight_no;

    -- Select the most booked flights
    SELECT
        tmf.flightNo,
        f.from_city,
        f.to_city,
        tmf.seatsBooked,
        tmf.flightYear,
        tmf.flightMonth
    FROM temp_most_booked_flights tmf
    JOIN flight_details f ON tmf.flightNo = f.flight_no
    WHERE
        tmf.seatsBooked = (
            SELECT MAX(seatsBooked)
            FROM temp_most_booked_flights
            WHERE flightYear = tmf.flightYear AND flightMonth = tmf.flightMonth
        )
    ORDER BY tmf.flightYear, tmf.flightMonth;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_most_booked_flights;
END //

DELIMITER ;

--Procedure: 8. FindSuitableFlightsForCrew
--Content: Return the list of flights suitable for the flight team
DELIMITER //

CREATE PROCEDURE sp_FindSuitableFlightsForCrew(
    IN in_group_id VARCHAR(7),
    IN in_dep_date DATE,
    IN in_from_city NVARCHAR(20),
    IN in_to_city NVARCHAR(20),
    IN in_jet_type VARCHAR(20)
)
BEGIN
    -- Select flights that match the given group ID, departure date, and other criteria
    SELECT fd.flight_no, fd.from_city, fd.to_city, fd.departure_date, fd.arrival_date,
           fd.departure_time, fd.arrival_time, jd.jet_id, jd.jet_type, jd.total_capacity,
           gf.captain, gf.first_officer
    FROM flight_details fd
    INNER JOIN group_flight gf ON gf.jet_id = fd.jet_id
    INNER JOIN jet_details jd ON jd.jet_id = fd.jet_id
    WHERE gf.group_id = in_group_id
      AND fd.departure_date = in_dep_date
      AND fd.from_city = in_from_city
      AND fd.to_city = in_to_city
      AND jd.jet_type = in_jet_type
      AND fd.departure_time > NOW() -- Ensure the flight is in the future
    ORDER BY fd.departure_time; -- Order by departure time
END //

DELIMITER ;

--TRIGGER
--Trigger: 1.TICKET_AfterInsert
--Content: Update the number of available seats when tickets are purchased
DELIMITER //

CREATE TRIGGER TR_TICKET_AfterInsert
AFTER INSERT ON ticket_details
FOR EACH ROW
BEGIN
    DECLARE bookedSeats INT;
    
    -- Determine the number of seats booked
    SET bookedSeats = NEW.no_of_passengers;
    
    -- Check the class and update the corresponding available seats
    IF NEW.class = 'Economy' THEN
        -- Update available economy seats
        UPDATE flight_details
        SET seats_economy = seats_economy - bookedSeats
        WHERE flight_no = NEW.flight_no AND departure_date = NEW.journey_date
        AND seats_economy >= bookedSeats;
    ELSEIF NEW.class = 'Business' THEN
        -- Update available business seats
        UPDATE flight_details
        SET seats_business = seats_business - bookedSeats
        WHERE flight_no = NEW.flight_no AND departure_date = NEW.journey_date
        AND seats_business >= bookedSeats;
    END IF;
    
    -- Handle the situation where seats are insufficient
    IF (ROW_COUNT() = 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot update flight details. Insufficient seats available.';
    END IF;
END //

DELIMITER ;

--Trigger: 2. TICKET_AfterDelete
--Content: Update the number of available seats after ticket cancellation
DELIMITER //

CREATE TRIGGER TR_TICKET_AfterDelete
AFTER DELETE ON ticket_details
FOR EACH ROW
BEGIN
    DECLARE canceledSeats INT;
    
    -- Determine the number of seats that were booked
    SET canceledSeats = OLD.no_of_passengers;
    
    -- Check the class and update the corresponding available seats
    IF OLD.class = 'Economy' THEN
        -- Update available economy seats
        UPDATE flight_details
        SET seats_economy = seats_economy + canceledSeats
        WHERE flight_no = OLD.flight_no AND departure_date = OLD.journey_date;
    ELSEIF OLD.class = 'Business' THEN
        -- Update available business seats
        UPDATE flight_details
        SET seats_business = seats_business + canceledSeats
        WHERE flight_no = OLD.flight_no AND departure_date = OLD.journey_date;
    END IF;
END //

DELIMITER ;

--Trigger: 3. FLIGHT_BEFORE_INSVALID
--Content: Check if a flight already exists before adding a new flight
DELIMITER //

CREATE TRIGGER TR_FLIGHT_BeforeInsValid
BEFORE INSERT ON flight_details
FOR EACH ROW
BEGIN
    DECLARE flightExists INT;

    -- Check if the flight already exists
    SELECT COUNT(*)
    INTO flightExists
    FROM flight_details
    WHERE flight_no = NEW.flight_no AND departure_date = NEW.departure_date;

    -- If the flight exists, raise an error
    IF flightExists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Flight already exists for the given flight number and departure date.';
    END IF;
END //

DELIMITER ;

--Trigger: 4. FLIGHT_BeforeInsSeat
--Content: Check the number of seats created when creating an additional flight to ensure the number of seats must be <= the number of seats the aircraft can accommodate
DELIMITER //

CREATE TRIGGER TR_FLIGHT_BeforeInsSeat
BEFORE INSERT ON flight_details
FOR EACH ROW
BEGIN
    DECLARE jetCapacity INT;
    DECLARE totalSeats INT;

    -- Calculate the total number of seats for the new flight
    SET totalSeats = NEW.seats_economy + NEW.seats_business;

    -- Get the jet's total capacity
    SELECT total_capacity
    INTO jetCapacity
    FROM jet_details
    WHERE jet_id = NEW.jet_id;

    -- Check if the total seats exceed the jet's capacity
    IF totalSeats > jetCapacity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total number of seats exceeds the jet\ is capacity.';
    END IF;
END //

DELIMITER ;

--Trigger: 5. Payment_AfterPay
--Content: Update ticket booking confirmation after payment
DELIMITER //

CREATE TRIGGER TR_Payment_AfterPay
AFTER INSERT ON payment_details
FOR EACH ROW
BEGIN
    UPDATE ticket_details
    SET
        booking_status = 'Confirmed',
        payment_id = NEW.payment_id
    WHERE
        pnr = NEW.pnr;
END //

DELIMITER ;

--Trigger: 6. CheckLuggageLimit
--Content: Check the amount of luggage of passengers after booking
DELIMITER //
CREATE TRIGGER TR_CheckLuggageLimit
AFTER INSERT ON ticket_details
FOR EACH ROW
BEGIN
    DECLARE totalWeight DECIMAL(10,2);
    DECLARE maxWeightPerPassenger DECIMAL(10,2);
    DECLARE numberOfPassengers INT;
    DECLARE totalLuggageWeight DECIMAL(10,2);

    -- Assume each passenger can carry a maximum of 20 kg of luggage
    SET maxWeightPerPassenger = 20.0;

    -- Get the number of passengers from the new record
    SET numberOfPassengers = NEW.no_of_passengers;
    SET totalWeight = numberOfPassengers * maxWeightPerPassenger;

    -- Calculate the current total weight of luggage for the flight (assuming luggage table has a pnr column to link with ticket_details)
    SELECT COALESCE(SUM(weight), 0) INTO totalLuggageWeight
    FROM luggage
    WHERE pnr = NEW.pnr; 

    SET totalLuggageWeight = totalLuggageWeight + totalWeight;
    -- Assume the maximum total luggage weight for the flight is 3000 kg
    IF totalLuggageWeight > 3000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exceeded luggage weight limit for the flight. Please adjust your luggage.';
    END IF;
END //

DELIMITER ;

--Trigger: 7. UpdateFrequentFlierMileage
--Content: Regular mileage updates for customers after flight completion
DELIMITER //
CREATE TRIGGER TR_UpdateFrequentFlierMileage
AFTER INSERT ON ticket_details
FOR EACH ROW
BEGIN
    DECLARE distance INT;
    DECLARE frequentFlierNo VARCHAR(20);
    DECLARE passengerID INT;
    DECLARE currentMileage INT;

    -- Assume a fixed distance per flight for simplicity
    SET distance = 1000; 
    -- Get frequent flier number and passenger ID from the new record
    SELECT frequent_flier_no, passenger_id INTO frequentFlierNo, passengerID
    FROM passengers
    WHERE pnr = NEW.pnr;

    -- Check if the passenger has a frequent flier number
    IF frequentFlierNo IS NOT NULL THEN
        -- Get the current mileage of the frequent flier
        SELECT mileage INTO currentMileage
        FROM frequent_flier_details
        WHERE frequent_flier_no = frequentFlierNo;

        -- Update frequent flier mileage
        UPDATE frequent_flier_details
        SET mileage = currentMileage + distance
        WHERE frequent_flier_no = frequentFlierNo;
    END IF;
END //

DELIMITER ;


--FUNTION
--Function: 1. Tinh_Doanhthu
--Content: Calculate total revenue for 1 day, 1 month, 1 year or all
DELIMITER //

CREATE FUNCTION Tinh_Doanhthu(
    p_day INT,
    p_month INT,
    p_year INT
) RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE totalRevenue DECIMAL(10,2);

    -- Validate input parameters
    IF (p_day IS NOT NULL AND p_month IS NULL) OR
       (p_month IS NOT NULL AND p_year IS NULL) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid combination of input parameters. Please provide day, month, and year appropriately.';
        RETURN NULL;
    END IF;

    -- Calculate total revenue based on parameters
    IF p_day IS NOT NULL THEN
        -- Calculate total revenue for a specific day
        SELECT COALESCE(SUM(pd.payment_amount), 0)
        INTO totalRevenue
        FROM payment_details pd
        WHERE YEAR(pd.payment_date) = p_year
          AND MONTH(pd.payment_date) = p_month
          AND DAY(pd.payment_date) = p_day;
    ELSEIF p_month IS NOT NULL THEN
        -- Calculate total revenue for a specific month
        SELECT COALESCE(SUM(pd.payment_amount), 0)
        INTO totalRevenue
        FROM payment_details pd
        WHERE YEAR(pd.payment_date) = p_year
          AND MONTH(pd.payment_date) = p_month;
    ELSEIF p_year IS NOT NULL THEN
        -- Calculate total revenue for a specific year
        SELECT COALESCE(SUM(pd.payment_amount), 0)
        INTO totalRevenue
        FROM payment_details pd
        WHERE YEAR(pd.payment_date) = p_year;
    ELSE
        -- Calculate total revenue for all time
        SELECT COALESCE(SUM(pd.payment_amount), 0)
        INTO totalRevenue
        FROM payment_details pd;
    END IF;

    RETURN totalRevenue;
END //

DELIMITER ;

--Function: 2. CountKHTheoThang
--Content: Calculate the number of customers traveling for each flight class in 1 month
DELIMITER //

CREATE FUNCTION FN_CountKHTheoThang(
    p_month INT,
    p_year INT
) RETURNS JSON
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE economy_count INT;
    DECLARE business_count INT;
    DECLARE result JSON;

    -- Tính số lượng khách hàng hạng Economy
    SELECT COUNT(DISTINCT customer_id)
    INTO economy_count
    FROM ticket_details
    WHERE MONTH(journey_date) = p_month
      AND YEAR(journey_date) = p_year
      AND class = 'Economy'
      AND booking_status = 'Confirmed';

    -- Tính số lượng khách hàng hạng Business
    SELECT COUNT(DISTINCT customer_id)
    INTO business_count
    FROM ticket_details
    WHERE MONTH(journey_date) = p_month
      AND YEAR(journey_date) = p_year
      AND class = 'Business'
      AND booking_status = 'Confirmed';

    -- Tạo kết quả dưới dạng JSON
    SET result = JSON_OBJECT(
        'Economy', economy_count,
        'Business', business_count
    );

    RETURN result;
END //

DELIMITER ;







-- PHÂN QUYỀN --
-- Tạo role admin_role
CREATE ROLE admin_role;

-- Tạo role customer_role
CREATE ROLE customer_role;

-- Tạo role employee_role
CREATE ROLE employee_role;


-- Tạo người dùng admin và gán role admin_role
CREATE USER admin_user;
GRANT admin_role TO admin_user;

-- Tạo người dùng customer và gán role customer_role
CREATE USER customer_user;
GRANT customer_role TO customer_user;

-- Tạo người dùng employee và gán role employee_role
CREATE USER employee_user;
GRANT employee_role TO employee_user;

-- ROLE admin -- Tables
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.admin TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.jet_details TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.flight_details TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.customer TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.frequent_flier_details TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.passengers TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.payment_details TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.ticket_details TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.group_flight TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.employee TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.static_flight TO admin_role WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.luggage TO admin_role WITH GRANT OPTION;
-- ROLE admin -- Stored Procedure
GRANT EXECUTE ON PROCEDURE airline_reservation.sp_ListBookedTickets TO admin_role WITH GRANT OPTION;
GRANT EXECUTE ON PROCEDURE airline_reservation.sp_AddFlightDetails TO admin_role WITH GRANT OPTION;
GRANT EXECUTE ON PROCEDURE airline_reservation.sp_DeleteFlightDetails TO admin_role WITH GRANT OPTION;
-- ROLE admin -- Function
GRANT EXECUTE ON FUNCTION airline_reservation.Tinh_Doanhthu TO admin_role WITH GRANT OPTION;
GRANT EXECUTE ON FUNCTION airline_reservation.FN_CountKHTheoHang TO admin_role WITH GRANT OPTION;



-- ROLE customer -- Tables
GRANT SELECT, INSERT, UPDATE ON airline_reservation.customer TO customer_role;
GRANT SELECT, INSERT ON airline_reservation.payment_details TO customer_role;
GRANT SELECT ON airline_reservation.flight_details TO customer_role;
GRANT SELECT ON airline_reservation.ticket_details TO customer_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.luggage TO customer_role;

-- ROLE customer -- Stored Procedure 
GRANT EXECUTE ON PROCEDURE airline_reservation.sp_SearchFlight TO customer_role;
GRANT EXECUTE ON PROCEDURE airline_reservation.sp_AddTicket TO customer_role;
GRANT EXECUTE ON PROCEDURE airline_reservation.sp_DeleteTicket TO customer_role;



-- ROLE employee -- Tables
GRANT SELECT ON airline_reservation.flight_details TO employee_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.customer TO employee_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.frequent_flier_details TO employee_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.passengers TO employee_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.ticket_details TO employee_role;
GRANT SELECT, UPDATE, DELETE ON airline_reservation.group_flight TO employee_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.employee TO employee_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON airline_reservation.luggage TO employee_role;





-- MÃ HÓA --
-- Bước 1: Thêm cột salt vào bảng admin và customer.

-- Add column salt into table admin
ALTER TABLE admin
ADD COLUMN salt VARCHAR(255) NOT NULL;
-- Add column salt into table customer
ALTER TABLE customer
ADD COLUMN salt VARCHAR(255) NOT NULL;


-- Bước 2: Tạo Stored Procedure admin_Add_Salt và customer_Add_Salt để sử dụng giá trị salt mới 
--         và băm mật khẩu trước khi lưu vào cơ sở dữ liệu.

-- admin_Add_Salt
DELIMITER // 
CREATE PROCEDURE admin_Add_Salt(
    IN p_pwd VARCHAR(30),
    IN p_staff_id VARCHAR(20),
    IN p_name VARCHAR(20),
    IN p_email VARCHAR(35)
)
BEGIN
    DECLARE salt_value VARCHAR(255);
    -- Generate a new salt value
    SET salt_value = SHA2(UUID(), 256);
    -- Hash the password with the salt
    SET p_pwd = SHA2(CONCAT(p_pwd, salt_value), 256);
    -- Insert new customer with hashed password and salt
    INSERT INTO admin (pwd, staff_id, name, email, salt)
    VALUES (p_pwd, p_staff_id, p_name, p_email, salt_value);
END //
DELIMITER ;


-- customer_Add_Salt
DELIMITER // 
CREATE PROCEDURE customer_Add_Salt(
    IN p_pwd VARCHAR(20),
    IN p_name VARCHAR(20),
    IN p_email VARCHAR(35),
    IN p_phone_no VARCHAR(15),
    IN p_address VARCHAR(35)
)
BEGIN
    DECLARE salt_value VARCHAR(255);
    -- Generate a new salt value
    SET salt_value = SHA2(UUID(), 256);
    -- Hash the password with the salt
    SET p_pwd = SHA2(CONCAT(p_pwd, salt_value), 256);
    -- Insert new customer with hashed password and salt
    INSERT INTO customer (pwd, name, email, phone_no, address, salt)
    VALUES (p_pwd, p_name, p_email, p_phone_no, p_address, salt_value);
END //
DELIMITER ;

