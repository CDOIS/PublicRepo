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

# CREATE TABLES, COLUMNS CONSTRAINTS AND RULES;

CREATE TABLE PRODUCT (
    ProductID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ProductCode CHAR(8) UNIQUE NOT NULL,
    ProductName VARCHAR(50) NOT NULL ,
    Description VARCHAR(100),
    RetailPrice DOUBLE(10,2) NOT NULL,
    SalePrice DOUBLE(10,2) NOT NULL,
    ProductRating INTEGER NOT NULL,
    NumberInStock INTEGER DEFAULT 0 NOT NULL,
    IsActive BIT DEFAULT 1 NOT NULL,
    IsDiscontinued BIT DEFAULT 0 NOT NULL,
    SupplierID INTEGER,
    CONSTRAINT chkProdRating CHECK (1 < ProductRating < 5),
    CONSTRAINT chkRetailSale CHECK (RetailPrice > 0),
    CONSTRAINT chkSalePrice CHECK ( SalePrice > 0)
);
CREATE TABLE SUPPLIER (
    SupplierID INTEGER PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL ,
    ContactName VARCHAR(100),
    ContactPhone VARCHAR(20),
    ContactEmail VARCHAR(50),
    isActive BIT NOT NULL DEFAULT 1
);
CREATE TABLE CLOTHINGCATEGORY (
    CategoryId INTEGER PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1
);
CREATE TABLE CLOTHINGSIZE (
    SizeID INTEGER PRIMARY KEY AUTO_INCREMENT,
    SizeName VARCHAR(50) NOT NULL,
    SizeAbbreviation VARCHAR(3) NOT NULL,
    isActive BIT NOT NULL DEFAULT 1,
    CONSTRAINT chkSizeAbbreviation CHECK (SizeAbbreviation IN ('XS', 'S', 'M', 'L', 'XL', 'XXL'))
);
CREATE TABLE COLOUR (
    ColourID INTEGER PRIMARY KEY  AUTO_INCREMENT,
    ColourName VARCHAR(50) NOT NULL ,
    ColourCode CHAR(3) NOT NULL UNIQUE,
    isActive BIT NOT NULL DEFAULT 1
);