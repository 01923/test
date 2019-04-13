CREATE TABLE Host_Verification
(
   Method_ID INT,
   Method VARCHAR (20),
   PRIMARY KEY (Method_ID)
);


CREATE TABLE Host
(
   Host_ID INT,
   Host_Url VARCHAR (50),
   Response_Time INT,
   Host_Picture_Url VARCHAR (50),
   Host_Since DATE,
   Response_rate FLOAT,
   Host_Neighbourhood VARCHAR (200),
   Host_Name VARCHAR (50),
   PRIMARY KEY (Host_ID)
);


CREATE TABLE Listing_Owns
(
   Listing_ID INT,
   Host_ID INT NOT NULL,
   nom VARCHAR (100),
   summ VARCHAR (500),
   Transit VARCHAR (1000),
   Description VARCHAR (1050),
   Country CHAR (10),
   City VARCHAR (100),
   presentation_space VARCHAR (1050),
   Neighborhood_Overview VARCHAR (1050),
   House_Rules VARCHAR (1050),
   Notes VARCHAR (1050),
   Longitude FLOAT,
   Latitude FLOAT,
   Security_Desposit FLOAT,
   Cancellation_Policy VARCHAR (100),
   Neighbourhood VARCHAR (100),
   Interaction VARCHAR (500),
   Guest_Included INT,
   PRIMARY KEY (Listing_ID),
   FOREIGN KEY (Host_ID) REFERENCES Host
);


CREATE TABLE Amenities
(   Amenities_ID INT,
   Amenity VARCHAR (20),
   PRIMARY KEY (Amenities_ID)
);


CREATE TABLE Is_Available_Calendar
(
   Listing_ID INT,
   daate DATE,
   Price FLOAT,
   Available INT,
   PRIMARY KEY (Listing_ID, daate),
   FOREIGN KEY (Listing_ID) REFERENCES Listing_Owns
);


CREATE TABLE Is_Accommodation
(
   Listing_ID INT,
   Beds INT,
   Bedrooms INT,
   Accommodates INT,
   Square_Foot FLOAT,
   Room_type VARCHAR (50),
   PRIMARY KEY (Listing_ID),
   FOREIGN KEY (Listing_ID) REFERENCES Listing_Owns
);


CREATE TABLE Rates_Score
(
   Listing_ID INT,
   Checking FLOAT,
   Cleanliness FLOAT,
   Rate FLOAT,
   Accuracy FLOAT,
   Communication FLOAT,
   Value FLOAT,
   PRIMARY KEY (Listing_ID),
   FOREIGN KEY (Listing_ID) REFERENCES Listing_Owns
);


CREATE TABLE Critisize_Review
(
   Review_id INT,
   Listing_ID INT NOT NULL,
   Reviewer_ID INT,
   Comments VARCHAR (1000),
   Reviewer_Name VARCHAR (20),
   PRIMARY KEY (Review_id),
   FOREIGN KEY (Listing_ID) REFERENCES Listing_Owns
);


CREATE TABLE Has
(
   Listing_ID INT,
   Amenities_ID INT,
   PRIMARY KEY (Listing_ID, Amenities_ID),
   FOREIGN KEY (Listing_ID) REFERENCES Listing_Owns,
   FOREIGN KEY (Amenities_ID) REFERENCES Amenities
);


CREATE TABLE Verified_Using
(
   Host_ID INT,
   Method_ID INT,
   FOREIGN KEY (Host_ID) REFERENCES Host,
   FOREIGN KEY (Method_ID) REFERENCES Host_Verification
);
