CREATE DATABASE AirportReservationSystem;

USE AirportReservationSystem;

CREATE TABLE Passengers (
  Pass_ID INT NOT NULL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50),
  Phone VARCHAR(15) NOT NULL,
  Address VARCHAR(100)
);

CREATE TABLE Flight (
  Flight_ID VARCHAR(6) NOT NULL PRIMARY KEY,
  Dep_Date_Time DATETIME NOT NULL,
  Arrival_Date_Time DATETIME NOT NULL,
  Available_Seats INT NOT NULL,
  Price DECIMAL(10, 2) NOT NULL,
  Num_Seats INT NOT NULL,
  Duration VARCHAR(10) NOT NULL,
  Dep_Air VARCHAR(5) NOT NULL,
  Arrival_Air VARCHAR(5) NOT NULL,
);

CREATE TABLE Reservation (
  Res_ID VARCHAR(4) NOT NULL PRIMARY KEY,
  Pass_ID INT NOT NULL,
  Flight_ID VARCHAR(6) NOT NULL,
  Seat_Num VARCHAR(3) NOT NULL,
  Res_Date_Time DATETIME NOT NULL,
  Status VARCHAR(10) NOT NULL,
  FOREIGN KEY (Pass_ID) REFERENCES Passengers(Pass_ID),
  FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);

CREATE TABLE Airport (
  Airport_Code VARCHAR(5) NOT NULL PRIMARY KEY,
  City VARCHAR(20) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  State VARCHAR(30),
  Country VARCHAR(20) NOT NULL
);

CREATE TABLE Ticket (
  Ticket_Num VARCHAR(3) NOT NULL PRIMARY KEY,
  Res_ID VARCHAR(4) NOT NULL,
  Pass_ID INT NOT NULL,
  Seat_Num VARCHAR(3) NOT NULL,
  Issued_Date_Time DATETIME NOT NULL,
  Flight_ID VARCHAR(6) NOT NULL,
  FOREIGN KEY (Res_ID) REFERENCES Reservation(Res_ID),
  FOREIGN KEY (Pass_ID) REFERENCES Passengers(Pass_ID),
  FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);