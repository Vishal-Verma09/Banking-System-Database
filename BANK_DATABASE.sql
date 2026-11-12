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
references customers(customerid

 
alter table CUSTOMERS
modify firstname varchar(50) not null,
modify email varchar(50) unique;

