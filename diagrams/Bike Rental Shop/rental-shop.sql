-- Product Table
CREATE TABLE Product (
    productId UUID PRIMARY KEY,
    name VARCHAR(255),
    rentalPrice DECIMAL(10, 2),
    type VARCHAR(50)
);

CREATE TABLE Product_Audit (
    id UUID PRIMARY Key,
    productId UUID,
    name VARCHAR(255),
    rentalPrice DECIMAL(10, 2),
    type VARCHAR(50)
);

-- Bike Table
CREATE TABLE Bike (
    productId UUID PRIMARY KEY,
    size VARCHAR(50),
    style VARCHAR(50),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE Bike_AUDIT (
    id UUID PRIMARY Key,
    productId UUID,
    size VARCHAR(50),
    style VARCHAR(50),
    productId UUID
);

-- Scooter Table
CREATE TABLE Scooter (
    productId UUID PRIMARY KEY,
    motorType VARCHAR(50),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE Scooter_Audit (
    id UUID PRIMARY KEY,
    productId UUID,
    motorType VARCHAR(50),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE Rental(
    rentalId UUID PRIMARY KEY,
    FOREIGN KEY customerId REFERENCES Customer(customerId),
    FOREIGN KEY productId REFERENCES Product(productId),
    startTime DateTime,
    endTime DateTime,
    status Enum[Allotted, Returned],
    expectedReturnTime DateTime,
    totalAmount Decimal(10, 2)
);

CREATE TABLE Rental_Audit(
    id UUID PRIMARY KEY,
    rentalId UUID,
    customerId UUID,
    productId UUID,
    startTime DateTime,
    endTime DateTime,
    status Enum[Allotted, Returned],
    expectedReturnTime DateTime,
    totalAmount Decimal(10, 2)
);


CREATE TABLE Customer(
    customerId UUID PRIMARY KEY,
    customerName VARCHAR(255),
    email VARCHAR(255),
    contact INT,
    balance DECIMAL(10, 2)
);

CREATE TABLE Customer_Audit(
    id UUID PRIMARY KEY,
    customerId UUID,
    customerName VARCHAR(255),
    email VARCHAR(255),
    contact INT,
    balance DECIMAL(10, 2)
);

CREATE TABLE Payment(
    paymentId UUID PRIMARY KEY,
    FOREIGN KEY rentalId REFERENCES Rental(rentalId),
    paymentStatus Enum(Initiated, Processed, Failed)
);

CREATE TABLE Payment_Audit(
    id UUID PRIMARY KEY,
    paymentId UUID,
    rentalId UUID,
    paymentStatus Enum(Initiated, Processed, Failed)
);