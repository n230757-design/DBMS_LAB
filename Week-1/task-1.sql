CREATE DATABASE taxation_db;
USE taxation_db;
CREATE table Taxpayer(
   taxpayer_id INT PRIMARY KEY,
   pan_number VARCHAR(10) NOT NULL UNIQUE,
   full_name VARCHAR(25) NOT NULL,
   date_of_birth DATE NOT NULL,
   occupation VARCHAR(50) NOT NULL,
   annual_income DECIMAL(12,2) NOT NULL,
   email varchar(100) UNIQUE,
   is_active BOOLEAN
);
INSERT INTO Taxpayer
(taxpayer_id, pan_number, full_name, date_of_birth, occupation, annual_income, email, is_active)
VALUES
(101,'ABCDE1234F','Ravi Kumar','1995-06-15','Software Engineer',850000.00,'ravi.kumar@example.com',TRUE),
(102,'BCDEF2345G','Priya Sharma','1992-11-22','Doctor',1200000.00,'priya.sharma@example.com',TRUE),
(103,'CDEFG3456H','Arjun Reddy','1988-03-10','Business Owner',1800000.00,'arjun.reddy@example.com',TRUE),
(104,'DEFGH4567J','Sneha Patel','1998-08-05','Teacher',620000.00,'sneha.patel@example.com',TRUE),
(105,'EFGHJ5678K','Kiran Rao','1990-01-18','Freelancer',750000.00,'kiran.rao@example.com',TRUE),
(106,'FGHJK6789L','Meera Singh','1985-12-30','Consultant',1500000.00,'meera.singh@example.com',FALSE);
SELECT *FROM Taxpayer;
CREATE table Income_Category(
   category_id INT PRIMARY KEY,
   category_name VARCHAR(50) NOT NULL UNIQUE,
   description VARCHAR(200) NOT NULL,
   taxable BOOLEAN NOT NULL
);
INSERT INTO Income_Category
(category_id,category_name,description,taxable)
VALUES
(1,'Salary','Income receives from employement',TRUE),
(2,'Business','Income earned from ubsiness activities',TRUE),
(3,'House Property','Income received from property or rent',TRUE),
(4,'Capital Gains','Income from transfer of eligible assets',TRUE),
(5,'Other Sources','Income such as bank interest',TRUE),
(6,'Agricultural Income','Income from eligible agricultural activities',FALSE);
SELECT *FROM Income_Category;
CREATE TABLE Financial_Year (
    year_id INT PRIMARY KEY,
    year_label VARCHAR(9) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    filing_deadline DATE,
    is_current BOOLEAN NOT NULL
);
INSERT INTO Financial_Year
(year_id, year_label, start_date, end_date, filing_deadline, is_current)
VALUES
(1,'2020-2021','2020-04-01','2021-03-31','2021-07-31',FALSE),
(2,'2021-2022','2021-04-01','2022-03-31','2022-07-31',FALSE),
(3,'2022-2023','2022-04-01','2023-03-31','2023-07-31',FALSE),
(4,'2023-2024','2023-04-01','2024-03-31','2024-07-31',FALSE),
(5,'2024-2025','2024-04-01','2025-03-31','2025-07-31',FALSE),
(6,'2025-2026','2025-04-01','2026-03-31','2026-07-31',TRUE);
SELECT *FROM Financial_Year;
CREATE TABLE Income_Record (
    income_id INT PRIMARY KEY,
    taxpayer_id INT NOT NULL,
    income_source VARCHAR(100) NOT NULL,
    category_name VARCHAR(50) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    received_date DATE NOT NULL,
    financial_year VARCHAR(9) NOT NULL
);
INSERT INTO Income_Record
(income_id, taxpayer_id, income_source, category_name, amount, received_date, financial_year)
VALUES
(1001,101,'TechNova Solutions','Salary',850000.00,'2026-03-31','2025-2026'),
(1002,102,'City Care Hospital','Salary',1200000.00,'2026-03-31','2025-2026'),
(1003,103,'Reddy Enterprises','Business',1800000.00,'2026-03-31','2025-2026'),
(1004,104,'Sunrise School','Salary',620000.00,'2026-03-31','2025-2026'),
(1005,105,'Web Design Projects','Business',750000.00,'2026-03-31','2025-2026'),
(1006,106,'Professional Consulting','Business',1500000.00,'2026-03-31','2025-2026');
SELECT *FROM Income_Record;
/*INSERT-Add a new taxpayer*/
INSERT INTO Taxpayer
(taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
VALUES
(107,'GHJKL7890M','Rahul','1997-09-20','Chartered Accountant',980000.00,'rahul@example.com',TRUE);
/*UPDATE-Change Ravi Kumars annual income to 950000.00*/
UPDATE Taxpayer
SET annual_income=950000.00
WHERE taxpayer_id=101;
/*UPDATE-CHange Kiran rao Occupation*/
UPDATE Taxpayer
SET occupation='Software Concultant'
WHERE taxpayer_id=105;
/*UPDATE-Activate Meera Singh's Accountant*/
UPDATE Taxpayer
SET is_active=TRUE
WHERE taxpayer_id=106;
/*rmeove the newly added taxpayer*/
DELETE FROM Taxpayer
WHERE taxpayer_id=107;
/*Add a new income category*/
INSERT INTO Income_Category
(category_id,category_name,description,taxable)
VALUES
(7,'Rental Income','Income earned from renting residential or commercial properties',TRUE);
/*PART E-DDL MODIFICATION TASKS*/
ALTER TABLE Income_record
ADD remarks VARCHAR(200);

/*Modify the size*/
ALTER TABLE Taxpayer
MODIFY occupation VARCHAR(100);

/*create taxoffice table*/
CREATE TABLE Tax_office(
office_id INT PRIMARY KEY,
office_name VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL
);

/*insert two sample records*/
INSERT INTO Tax_Office
(office_id,office_name,city)
VALUES 
(1,'Income Tax office Hyderabad','Hyderabad'),
(2,'Income Tax Office Vijayawada','Vijayawada');

/*Trucate and delete*/
SELECT * FROM Tax_Office;
TRUNCATE Tax_office;
SHOW TABLES;
DROP TABLE Tax_Office;
SHOW TABLES;

/*CONSTRAINT EXPERIMENT*/
INSERT INTO Taxpayer
(taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
VALUES
(101,'JKLMN1234P','Test User','1991-01-01','Engineer',500000.00,'text@example.com',TRUE);
INSERT INTO Taxpayer
(taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
VALUES
(108,'ABCDE1234F','Rahul Sharma','1998-05-10','Teacher',6500000.00,'rahul@example.com',TRUE);
INSERT INTO Taxpayer
(taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active)
VALUES
(109,'LMNOP5678Q',NULL,'1996-08-15','Manager',7000000.00,'manager@example.com',TRUE);