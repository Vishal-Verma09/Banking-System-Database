CREATE DATABASE banking_sysdb;  -- create database 
USE banking_sysdb; -- use database

SHOW DATABASES;    -- see the databases
SHOW TABLES;      -- show the tables in database
create table CUSTOMERS(    -- created table customers
CUSTOMERID int,
FIRSTNAME varchar(50),
LASTNAME varchar(50),
EMAIL varchar(100),
PHONE varchar(10));

describe table CUSTOMERS; -- describe table with its contraints
describe CUSTOMERS;

select * from CUSTOMERS; -- to view all the table

alter table CUSTOMERS
add column  ACCOUNTCREATIONDATE date; -- added the date into the customers table


create table ACCOUNTS(
ACCOUNTID int, -- created the account table
ACCOUNTTYPE varchar(20),
BALANANCE decimal(10,2));

select * from ACCOUNTS;

create table TRANSACTIONS(
TRANSACTIONID int, -- created the trancsactions table
TRANSACTIONDATE date,
AMOUNT decimal(10,2),
TRANSACTIONTYPE varchar(20));

create table BRANCHES(
BRANCHID int, -- create the branches table
BRANCHNAME varchar(100),
BRANCHADDRESS varchar(255),
BRANCHPHONE varchar(20));

create table ACCOUNTBRANCHES(
ASSIGNEDDATE DATE); -- created the accountbranches table

create table LOANS(
LOANID  int, -- created the table loans
LOANAMOUNT decimal(10,2),
INTERESTRATE decimal(5,2),
STARTDATE date,
ENDDATE date);

show tables; -- shows all table present in the database 

alter table CUSTOMERS
drop column ACCOUNTCREATIONDATE; -- it will make the changes in customers and delete the column accountcreationdate in the customers

select * from CUSTOMERS;

alter table CUSTOMERS
add column BIRTHDATE DATE; -- it will add the birthdate in the customers table

alter table CUSTOMERS
modify PHONE varchar(20),  -- it modify the range of varchar and add the constrain as primary key to the customerid
add primary key (CUSTOMERID);

describe CUSTOMERS;

drop table ACCOUNTBRANCHES; -- delete the table accountbranches

alter table ACCOUNTS
add CUSTOMERID int;    -- add customer id into the accouts table

alter table ACCOUNTS
add constraint
foreign key (CUSTOMERID)
references CUSTOMERS(CUSTOMERID);

describe ACCOUNTS;
describe CUSTOMERS;

alter table  ACCOUNTS 
add constraint 
primary key(ACCOUNTID);

alter table TRANSACTIONS
add ACCOUNTID int,
add constraint 
foreign key (ACCOUNTID)
references ACCOUNTS(ACCOUNTID);

describe ACCOUNTS;
describe TRANSACTIONS;

alter table TRANSACTIONS
add primary key (TRANSACTIONID);


alter table BRANCHES
add primary key (BRANCHID);


alter table ACCOUNTS
add BRANCHID INT;

alter table ACCOUNTS
add constraint
foreign key(BRANCHID)
references branches(branchid);

alter table LOANS 
add primary key(loanid),
add customerid int,
add constraint 
foreign key(customerid)
references customers(customerid);

 
ALTER table CUSTOMERS
modify FIRSTNAME varchar(50) not null,
modify EMAIL varchar(50) unique;

-- Adding Records inside the tables

INSERT INTO CUSTOMERS VALUE
(101,'Rahul','Sharma','rahul.sharma@gmail.com','9767983712','1995-04-12');

SELECT * 
FROM CUSTOMERS;

INSERT INTO CUSTOMERS VALUE
(102,'Veena','Kutty','veena.kutty@gmail.com','1234567890','1997-09-10'),
(103,'Dominic','Dom','dominic.dom@gmail.com',NULL,'1996-06-03'),
(104,'Alex',NULL,'alex@gmail.com','3232323232','2000-12-12'),
(105,'Alice','George',NULL,'9090909090','2003-08-10');



INSERT INTO BRANCHES (BRANCHID,BRANCHNAME,BRANCHADDRESS,BRANCHPHONE)
VALUES (1,'Mumbai Main Branch','Andheri East, Mumbai','0220100201'),
(2,'Pune Central Branch','Shivaji Nagar, Pune','0220100202'),
(3,'Bangalore Branch','MG Road, Bangalore','0880100801'),
(4,'Delhi Branch','Connaught Palace,Delhi',NULL),
(5,'Hyderbad Branch',NULL,'0440100401');

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO ACCOUNTS VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',85000.50,102,2),
(1003,'Savings',12500.75,103,1),
(1004,'Salary',45000,104,3),
(1005,'Savings',7800.25,105,2),
(1006,'Savings',42000,101,2),
(1007,'Current',NULL,103,3),
(1008,'Savings',27500,105,4);

INSERT INTO TRANSACTIONS VALUES
(5001,'2026-01-05',10000,'Deposit',1001),
(5002,'2026-01-10',2500,'Withdrawal',1001),
(5003,'2026-01-15',5000,'Transfer',1002),
(5004,'2026-01-20',15000,'Deposit',1003),
(5005,'2026-01-25',3000,'Withdrawal',1004),
(5006,'2026-02-02',7500,'Deposit',1005),
(5007,'2026-02-05',1200,'Payment',1006),
(5008,'2026-02-10',NULL,'Deposit',1007),
(5009,'2026-02-15',8500,'Withdrawal',1008),
(5010,NULL,100,'Payment',1003),
(5011,'2026-02-20',20000,'Transfer',1006),
(5012,'2026-03-01',5000,'Deposit',1002),
(5013,'2026-03-05',10000,'Withdrawal',1007),
(5014,'2026-03-15',1500,'Deposit',1008),
(5015,'2026-03-20',25000,'Transfer',1005);

INSERT INTO LOANS VALUES
(9001,500000,8.50,'2025-01-15','2030-01-15',101),
(9002,250000,9.25,'2025-03-10','2028-03-10',103),
(9003,NULL,9.00,'2026-03-01',NULL,105),
(9004,750000,7.90,'2024-06-20','2031-06-20',102),
(9005,1000000,7.25,'2024-11-15','2034-11-15',104),
(9006,300000,10.50,'2025-07-01','2029-07-01',101);

-- Checking the Data

SELECT * 
FROM CUSTOMERS;

SELECT * 
FROM BRANCHES;

SELECT * 
FROM ACCOUNTS;

SELECT * 
FROM TRANSACTIONS;

SELECT * 
FROM LOANS;

update CUSTOMERS 
set PHONE = "1234567890"
where CUSTOMERID = 103;

delete from TRANSACTIONS
where TRANSACTIONID = 5008;

update accounts 
set balanance = 35750
where  accountid = 1003;

update transactions
set accountid = 1003
where transactionid in (5006,5007);

select FIRSTNAME,EMAIL,CUSTOMERID
from CUSTOMERS; 

select * 
from customers
where customerid = 105;

select * from CUSTOMERS
where CUSTOMERID = 102 or CUSTOMERID = 104;

select * from CUSTOMERS
where BIRTHDATE >='1995-01-01' AND BIRTHDATE <= '2000-12-31';

-- CUSTOMER ANALYSIS-------------------------------------------------------------------------------------------------------------------------------
-- HOW MANY CUSTOMER ARE THERE.
SELECT COUNT(*) AS TOTAL_CUSTOMER FROM CUSTOMERS;
-- FIND THE MISSING VALUES
SELECT * FROM CUSTOMERS;


SELECT CUSTOMERID , FIRSTNAME AS NAME
FROM CUSTOMERS
WHERE LASTNAME IS NULL OR EMAIL IS  NULL;

-- WHO ARE THE YOUNGEST /OLDEST CUSTOMERS?
SELECT 
MAX(BIRTHDATE) AS YOUNGEST_CUSTOMER,
MIN(BIRTHDATE) AS OLDEST_CUSTOMER
FROM CUSTOMERS;

-- HOW MANY CUSTOMERS WERE BORN  BEFORE/AFTER A PARTICULAR YEAR?

-- BEFORE 2000

SELECT * FROM CUSTOMERS WHERE YEAR(BIRTHDATE) <= 2000;
SELECT * FROM CUSTOMERS WHERE YEAR(BIRTHDATE) > 2000;
-- TOTAL ACCOUNT PRESENT.
SELECT CUSTOMERID, COUNT(*) AS TOTAL_ACCOUNTS
FROM ACCOUNTS 
GROUP BY CUSTOMERID
HAVING TOTAL_ACCOUNTS > 1;

-- HOW MANY SAVINGS , CURRENT AND SALARY ACCOUNT EXIST?

SELECT ACCOUNTTYPE , COUNT(*) AS TOTAL_ACCOUNTS
FROM ACCOUNTS 
GROUP BY ACCOUNTTYPE;
-- WHAT IS THE TOTAL BALANCE?
SELECT SUM(BALANANCE) AS TOTAL_BALANCE FROM ACCOUNTS;
-- WHAT IS THE TOTAL AVERAGE BALANCE?
SELECT AVG(BALANANCE) AS TOTAL_AVERAGE FROM ACCOUNTS;

SELECT CUSTOMERID , BALANANCE HIGHEST_BALANCE -- DEFINE THE COLUMN NAME .
FROM ACCOUNTS -- SELECT THE TABLE NAME
ORDER BY BALANANCE DESC LIMIT 1; -- DEFINES THE ORDER OF THE BALANCE IN DESENDING ORDER BY ONLY LIMIT OF 1.

SELECT * FROM CUSTOMERS;

