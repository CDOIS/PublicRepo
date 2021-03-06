#Author RICARDO OLIVEIRA - W0428722
#Create and Connect to the DB
# DROP DATABASE IF EXISTS Products_DDL;
# CREATE DATABASE Products_DDL;
USE Products_DDL;
# DROP TABLE IF EXISTS PRODUCT;
# DROP TABLE IF EXISTS SUPPLIER;
# DROP TABLE IF EXISTS CLOTHINGCATEGORY;
# DROP TABLE IF EXISTS CLOTHINGSIZE;
# DROP TABLE IF EXISTS COLOUR;

# PRODUCT TABLE - MODIFIERS AND CONSTRAINTS

ALTER TABLE product ADD PRIMARY KEY(ProductID);
ALTER TABLE product MODIFY ProductID INTEGER AUTO_INCREMENT;
ALTER TABLE product MODIFY ProductCode char(8) not null;
ALTER TABLE product ADD CONSTRAINT unq_PCode UNIQUE(ProductCode);
ALTER TABLE product MODIFY ProductName VARCHAR(50) not null;
ALTER TABLE product MODIFY RetailPrice DOUBLE(10,2) not null;
ALTER TABLE product MODIFY SalePrice DOUBLE(10,2) not null;
ALTER TABLE product MODIFY ProductRating INTEGER not null;
ALTER TABLE product MODIFY NumberInStock INTEGER not null;
ALTER TABLE product MODIFY IsActive BIT not null;
ALTER TABLE product MODIFY IsDiscontinued BIT not null;
ALTER TABLE product ALTER COLUMN NumberinStock SET DEFAULT 0;
ALTER TABLE product ALTER COLUMN IsActive SET DEFAULT 1;
ALTER TABLE product ALTER COLUMN IsDiscontinued SET DEFAULT 0;
ALTER TABLE product ADD CONSTRAINT chkProdRating CHECK (1 < ProductRating < 5);
ALTER TABLE product ADD CONSTRAINT chkRetailSale CHECK (RetailPrice > 0);
ALTER TABLE product ADD CONSTRAINT chkSalePrice CHECK ( SalePrice > 0);

# SUPPLIER TABLE MODIFIERS AND CONSTRAINTS

ALTER TABLE SUPPLIER ADD PRIMARY KEY(SupplierID);
ALTER TABLE SUPPLIER MODIFY SupplierID INTEGER AUTO_INCREMENT;
ALTER TABLE SUPPLIER MODIFY SupplierName VARCHAR(100) NOT NULL;
ALTER TABLE SUPPLIER MODIFY Address VARCHAR(255) NOT NULL;
ALTER TABLE SUPPLIER MODIFY isActive BIT NOT NULL;
ALTER TABLE SUPPLIER ALTER COLUMN isActive set default 1;

# CLOTHINGCATEGORY TABLE MODIFIERS AND CONSTRAINTS

ALTER TABLE clothingcategory ADD PRIMARY KEY(CategoryId);
ALTER TABLE clothingcategory MODIFY CategoryId INTEGER AUTO_INCREMENT;
ALTER TABLE clothingcategory MODIFY CategoryName VARCHAR(50) NOT NULL;
ALTER TABLE clothingcategory MODIFY IsActive BIT NOT NULL;
ALTER TABLE clothingcategory ALTER COLUMN IsActive set default 1;

# CLOTHINGSIZE TABLE MODIFIERS AND CONSTRAINTS

ALTER TABLE clothingsize ADD PRIMARY KEY(SizeID);
ALTER TABLE clothingsize MODIFY SizeID INTEGER AUTO_INCREMENT;
ALTER TABLE clothingsize MODIFY SizeName VARCHAR(50) NOT NULL;
ALTER TABLE clothingsize MODIFY SizeAbbreviation VARCHAR(3) NOT NULL;
ALTER TABLE clothingsize MODIFY isActive BIT NOT NULL;
ALTER TABLE clothingsize ALTER COLUMN isActive set default 1;
ALTER TABLE clothingsize ADD CONSTRAINT chkSizeAbbreviation CHECK (SizeAbbreviation IN ('XS', 'S', 'M', 'L', 'XL', 'XXL'));

# COLOUR TABLE MODIFIERS AND CONSTRAINTS

ALTER TABLE colour ADD PRIMARY KEY(ColourID);
ALTER TABLE colour MODIFY ColourID INTEGER AUTO_INCREMENT;
ALTER TABLE colour ADD CONSTRAINT unq_PCode UNIQUE(ColourCode);
ALTER TABLE colour MODIFY ColourName VARCHAR(50) NOT NULL;
ALTER TABLE colour MODIFY ColourCode CHAR(3) NOT NULL;
ALTER TABLE colour MODIFY isActive BIT NOT NULL;
ALTER TABLE colour ALTER COLUMN isActive set default 1;
