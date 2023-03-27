show databases;
/* create database for EBE */
CREATE DATABASE EBE_ChristiansonPaloma;
USE EBE_ChristiansonPaloma;
/* create table for Client */
CREATE TABLE Client ( 
ClientID INT PRIMARY KEY NOT NULL,
ClientName VARCHAR(30) NOT NULL,
Street VARCHAR(30),
City VARCHAR(20),
State CHAR(2),
Zip CHAR(5)
);
/* create table for Contact */
CREATE TABLE Contact ( 
ContactName VARCHAR(30) NOT NULL,
ClientID INT NOT NULL,
ContactPhone CHAR(10) NOT NULL,
ContactEmail VARCHAR(30) NOT NULL,
PRIMARY KEY (ClientID, ContactName),
FOREIGN KEY (ClientID) REFERENCES Client(ClientID) 
);
/* create table for Venue */
CREATE TABLE Venue ( 
VenueID INT PRIMARY KEY NOT NULL,
VenueName VARCHAR(30),
Capacity INT,
Street VARCHAR(30),
City VARCHAR(20),
State CHAR(2),
Zip CHAR(5),
Parking BOOL, 
LocationContactName VARCHAR(30),
LocationContactPhone CHAR(10)
);
/* create table for Event */
CREATE TABLE Event ( 
EventCode INT PRIMARY KEY NOT NULL,
EventName VARCHAR(30) NOT NULL,
EventDesc TEXT(100),
EventDate DATE NOT NULL,
StartTime TIME,
EndTime TIME,
Ticket BOOLEAN,
VenueID INT,
ClientID INT
); 
/* add FKs to Table Event */
ALTER TABLE Event
ADD CONSTRAINT FK_VenueID_Event
					FOREIGN KEY (VenueID) REFERENCES Venue (VenueID);
ALTER TABLE Event 
ADD CONSTRAINT FK_ClientID_Event
					FOREIGN KEY (ClientID) REFERENCES Client (ClientID);
/* create table for Event_Contact */					
CREATE TABLE Event_Contact ( 
ClientID INT NOT NULL,
ContactName VARCHAR(30) NOT NULL,
EventCode INT NOT NULL, 
PRIMARY KEY (ClientID, ContactName, EventCode),
FOREIGN KEY (ClientID, ContactName) REFERENCES Contact(ClientID, ContactName),
FOREIGN KEY (EventCode) REFERENCES Event(EventCode) 
);					
/* create table for Ticketed_Event */					
CREATE TABLE Ticketed_Event ( 
EventCode INT PRIMARY KEY NOT NULL,
TicketPrice INT,
TicketsAvailable INT,
TicketsSold INT, 
Wristbands BOOLEAN,
HandStamp BOOLEAN,
FOREIGN KEY (EventCode) REFERENCES Event(EventCode) 
);
/* create table for Non_Ticketed_Event */					
CREATE TABLE Non_Ticketed_Event ( 
EventCode INT PRIMARY KEY NOT NULL,
GuestList BOOLEAN,
ExpectedAttendance INT,
ActualAttendance INT, 
FOREIGN KEY (EventCode) REFERENCES Event(EventCode) 
);
/* insert values into Client table */
INSERT INTO Client (ClientID, ClientName, Street, City, State, Zip)
VALUES (12423, 'Maggie Steven', '123 Cloudsdale', 'Vermont', 'FL', 32824);

/* insert values into Contact table */
INSERT INTO Contact (ContactName, ClientID, ContactPhone, ContactEmail)
VALUES ( 'Billy Bob', 12423, (123)-456-7890, 'billybobqueen@aol.com');

/* insert values into Venue table */
INSERT INTO Venue (VenueID, VenueName, Capacity, State, Parking, LocationContactPhone)
VALUES (1324, 'Motel Rox', 1000, 'WA', TRUE, (352)-123-123);

/* insert values into Event table */
INSERT INTO Event (EventCode, EventName, EventDate)
VALUES (981234, 'Nother Mature', '2022-12-13');

/* insert values into Event_Contact table */
INSERT INTO Event_Contact (ClientID, ContactName, EventCode)
VALUES (12423, 'Billy Bob', 981234); 

/* insert values into Ticketed_Event table */
INSERT INTO Ticketed_Event (EventCode, TicketPrice, TicketsAvailable, TicketsSold, Wristbands)
VALUES (981234, 25, 1200, 987, FALSE); 

/* insert values into Non_Ticketed_Event table */
INSERT INTO Non_Ticketed_Event (EventCode, GuestList, ExpectedAttendance, ActualAttendance)
VALUES (981234, TRUE, 900, 640); 




					
										
