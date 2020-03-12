#Author RICARDO OLIVEIRA - W0428722
#Create and connect to DB
DROP DATABASE IF EXISTS Products_DDL;
CREATE DATABASE Products_DDL;

USE Products_DDL;

#Drop tables - Clean slate;

DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS SUPPLIER;
DROP TABLE IF EXISTS CLOTHINGCATEGORY;
DROP TABLE IF EXISTS CLOTHINGSIZE;
DROP TABLE IF EXISTS COLOUR;


# TABLES AND COLUMNS CREATE STATEMENTS;

CREATE TABLE PRODUCT (
    ProductID INTEGER,
    ProductCode CHAR(8),
    ProductName VARCHAR(50),
    Description VARCHAR(100),
    RetailPrice DOUBLE(10,2),
    SalePrice DOUBLE(10,2),
    ProductRating INTEGER,
    NumberInStock INTEGER,
    IsActive BIT,
    IsDiscontinued BIT,
    SupplierID INTEGER
);
CREATE TABLE SUPPLIER (
    SupplierID INTEGER,
    SupplierName VARCHAR(100),
    Address VARCHAR(255),
    ContactName VARCHAR(100),
    ContactPhone VARCHAR(20),
    ContactEmail VARCHAR(50),
    IsActive BIT
);
CREATE TABLE CLOTHINGCATEGORY (
    CategoryId INTEGER,
    CategoryName VARCHAR(50),
    IsActive BIT
);
CREATE TABLE CLOTHINGSIZE (
    SizeID INTEGER,
    SizeName VARCHAR(50),
    SizeAbbreviation VARCHAR(3),
    isActive BIT
);
CREATE TABLE COLOUR (
    ColourID INTEGER,
    ColourName VARCHAR(50),
    ColourCode CHAR(3),
    IsActive BIT
);