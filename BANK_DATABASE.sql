CREATE DATABASE banking_sysdb;  -- create database 
USE banking_sysdb; -- use database

SHOW DATABASES;    -- see the databases
SHOW TABLES;      -- show the tables in database
create table CUSTOMERS(
CUSTOMERID int,
FIRSTNAME varchar(50),
LASTNAME varchar(50),
EMAIL varchar(100),
PHONE varchar(10));

describe table CUSTOMERS;
describe CUSTOMERS;

select * from CUSTOMERS;

alter table CUSTOMERS
add column  ACCOUNTCREATIONDATE date;


create table ACCOUNTS(
ACCOUNTID int,
ACCOUNTTYPE varchar(20),
BALANANCE decimal(10,2));

create table TRANSACTIONS(
TRANSACTIONID int,
TRANSACTIONDATE date,
AMOUNT decimal(10,2),
TRANSACTIONTYPE varchar(20));

create table BRANCHES(
BRANCHID int,
BRANCHNAME varchar(100),
BRANCHADDRESS varchar(255),
BRANCHPHONE varchar(20));

create table ACCOUNTBRANCHES(
ASSIGNEDDATE DATE);

create table LOANS(
LOANID  int,
LOANAMOUNT decimal(10,2),
INTERESTRATE decimal(5,2),
STARTDATE date,
ENDDATE date);

show tables;

alter table CUSTOMERS
drop column ACCOUNTCREATIONDATE;

select * from CUSTOMERS;

alter table CUSTOMERS
add column BIRTHDATE DATE;

alter table CUSTOMERS
modify PHONE varchar(20),
add primary key (CUSTOMERID);

describe CUSTOMERS;

drop table ACCOUNTBRANCHES;