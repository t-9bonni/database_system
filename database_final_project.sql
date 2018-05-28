DROP DATABASE IF EXISTS www;
CREATE DATABASE www;
USE www;


DROP TABLE IF EXISTS experience;
CREATE TABLE experience
(
	experience_code INT(11) PRIMARY KEY AUTO_INCREMENT,
    experience_name VARCHAR(45))
    CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;

DROP TABLE IF EXISTS guest;
CREATE TABLE guest
(
	guest_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
    age INT(11) NOT NULL,
    weight INT(11) NOT NULL,
    isSwimmer TINYINT(1) NOT NULL,
    mobile_phone VARCHAR(20),
    experience_code INT(11) NOT NULL,
    
    CONSTRAINT guest_fk_experience FOREIGN KEY (experience_code)
		REFERENCES experience (experience_code))
        CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;

DROP TABLE IF EXISTS role;
CREATE TABLE role
(
	role_code INT(11) PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(45) NOT NULL)
    CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;

DROP TABLE IF EXISTS gathering_point;
CREATE TABLE gathering_point
(
	gathering_point_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    gathering_point_description VARCHAR(255) NOT NULL)
    CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;


DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(
	employee_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    nickname VARCHAR(45) NOT NULL,
    mobile_phone VARCHAR(20),
    home_phone VARCHAR(20),
    availability_notes VARCHAR(255))
    CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;
    
DROP TABLE IF EXISTS plays_role;
CREATE TABLE plays_role
(
	employee_id INT(11) NOT NULL,
	role_code INT(11) NOT NULL,
    
    CONSTRAINT plays_role_fk_employee FOREIGN KEY (employee_id)
		REFERENCES employee (employee_id),
	
    CONSTRAINT plays_role_fk_role FOREIGN KEY (role_code)
		REFERENCES role (role_code))
        CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;


DROP TABLE IF EXISTS destination;
CREATE TABLE destination
(
	destination_code INT(11) PRIMARY KEY AUTO_INCREMENT,
    destination_name VARCHAR(45))
    CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;

DROP TABLE IF EXISTS trip_type;
CREATE TABLE trip_type
(
	trip_type_code INT(11) PRIMARY KEY AUTO_INCREMENT,
    trip_type_name VARCHAR(45) NOT NULL)
    CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;
    
    
DROP TABLE IF EXISTS can_guide;
CREATE TABLE can_guide
(
	employee_id INT(11),
    trip_type_code INT(11),
    
    CONSTRAINT can_guide_fk_employee FOREIGN KEY (employee_id)
		REFERENCES employee (employee_id),
	
    CONSTRAINT can_guide_fk_trip_type FOREIGN KEY (trip_type_code)
		REFERENCES trip_type (trip_type_code))
        CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;

DROP TABLE IF EXISTS trip;
CREATE TABLE trip 
(
	trip_number INT(11) PRIMARY KEY AUTO_INCREMENT,
	trip_date DATE NOT NULL,
    capacity INT(11) NOT NULL,
    latest_guest_arrival_time TIME NOT NULL,
    departure_time TIME NOT NULL,
    estimated_return_time TIME,
    destination_code INT(11) NOT NULL,
    trip_type_code INT(11) NOT NULL,
    guide_employee_id INT(11) NOT NULL,
    gear_employee_id INT(11),
    gathering_point_id INT(11) NOT NULL,
    
    CONSTRAINT trip_fk_destination FOREIGN KEY (destination_code)
		REFERENCES destination (destination_code),
	
    CONSTRAINT trip_fk_trip_type FOREIGN KEY (trip_type_code)
		REFERENCES trip_type (trip_type_code),
	
    CONSTRAINT trip_fk_guide_employee FOREIGN KEY (guide_employee_id)
		REFERENCES employee (employee_id),
	
    CONSTRAINT trip_fk_employee FOREIGN KEY (gear_employee_id)
		REFERENCES employee (employee_id),
	
	CONSTRAINT trip_fk_gathering_point FOREIGN KEY (gathering_point_id)
		REFERENCES gathering_point (gathering_point_id))
        CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;
        
DROP TABLE IF EXISTS reservation;
CREATE TABLE reservation
(
	trip_number INT(11) NOT NULL,
    guest_id INT(11) NOT NULL,
    
    CONSTRAINT reservation_fk_trip FOREIGN KEY (trip_number)
		REFERENCES trip (trip_number),
	
    CONSTRAINT reservation_fk_guest FOREIGN KEY (guest_id)
		REFERENCES guest (guest_id))
        CHARSET UTF8 COLLATE UTF8_GENERAL_CI ENGINE=INNODB;

LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/experience.csv'
INTO TABLE experience
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;    

        
LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/guest.csv'
INTO TABLE guest
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;
        
LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/role.csv'
INTO TABLE role
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;
        
LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/gathering_point.csv'
INTO TABLE gathering_point
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;
        
LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/employee.csv'
INTO TABLE employee
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;
        
LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/plays_role.csv'
INTO TABLE plays_role
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/destination.csv'
INTO TABLE destination
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/trip_type.csv'
INTO TABLE trip_type
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/can_guide.csv'
INTO TABLE can_guide
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;
        
LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/trip.csv'
INTO TABLE trip
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;
        
LOAD DATA LOCAL INFILE '~/Documents/Introduction to Databases 490/Final Project/test_data_for_final_project/reservation.csv'
INTO TABLE reservation
FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
        IGNORE 1 LINES;
        


        
        
        
        
        


    
    