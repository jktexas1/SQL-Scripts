-- fn: TEAM3OIE2S.sql 

-- SQL COMMENTED SQL COMMANDS

CREATE TABLE Audit(
	auditID INTEGER IDENTITY(1,1),
	userID INTEGER,
	userName VARCHAR(100),
	date DATETIME,
	DBtable VARCHAR(100),
	attribute VARCHAR(100),
	access VARCHAR(100),
	PRIMARY KEY(auditID),
);

DROP TABLE Testimonial;
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Institution', NULL, 'Drop');
DROP TABLE Image;
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Image', NULL, 'Drop');
DROP TABLE Series;
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Series', NULL, 'Drop');
DROP TABLE Study;
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Study', NULL, 'Drop');
DROP TABLE Endograft;
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Endograft', NULL, 'Drop');
DROP TABLE Brand;
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Brand', NULL, 'Drop');
DROP TABLE Patient;
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Patient', NULL, 'Drop');
DROP TABLE Surgeon;
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Surgeon', NULL, 'Drop');
DROP TABLE Institution;
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Institution', NULL, 'Drop');

CREATE TABLE Institution(
	institutionID INTEGER IDENTITY(1,1),
	institutionName VARCHAR(100),
	institutionLocation VARCHAR(100),
	PRIMARY KEY(institutionID),
)
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Institution', NULL, 'Create');

CREATE TABLE Surgeon(
	surgeonID INTEGER IDENTITY(1,1),
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	username VARCHAR(100),
	password VARCHAR(100),
	email VARCHAR(100),
	institutionID INTEGER,
	PRIMARY KEY(surgeonID),
	FOREIGN KEY(institutionID) REFERENCES Institution
);
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Surgeon', NULL, 'Create');

CREATE TABLE Patient(
		patientID INTEGER IDENTITY(1,1),
		originalID INTEGER,
		sex VARCHAR(1),
		age INTEGER,
		entryDate DATETIME,
		dateOfSurgery DATETIME,
		surgeonID INTEGER,
		PRIMARY KEY(patientID),
		FOREIGN KEY(surgeonID) REFERENCES Surgeon
);
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Patient', NULL, 'Create');

CREATE TABLE Brand(
	brandID INTEGER IDENTITY(1,1),
	brandName VARCHAR(100),
	PRIMARY KEY(brandID),
);
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Brand', NULL, 'Create');

CREATE TABLE Endograft(
	endograftID INTEGER IDENTITY(1,1),
	diameter INTEGER,
	length INTEGER,
	unilateralLegDiameter INTEGER,
	unilateralLegLength INTEGER,
	controlaterLegDiameter INTEGER,
	controlaterLegLength INTEGER,
	entryDate DATETIME,
	brandID INTEGER,
	patientID INTEGER,
	PRIMARY KEY(endograftID),
	FOREIGN KEY(brandID) REFERENCES Brand,
	FOREIGN KEY(patientID) REFERENCES Patient
);
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Endograft', NULL, 'Create');

CREATE TABLE Study(
	studyID INTEGER IDENTITY(1,1),
	originalStudyID INTEGER,
	studyDescription VARCHAR(100),
	studyDate DATETIME,
	delay INTEGER,
	patientID INTEGER,
	PRIMARY KEY(studyID),
	FOREIGN KEY(patientID) REFERENCES Patient
);
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Study', NULL, 'Create');

CREATE TABLE Series(
	seriesID INTEGER IDENTITY(1,1),
	originalSeriesStudyID INTEGER,
	seriesDescription VARCHAR(100),
	seriesDate DATETIME,
	totalNumberofSlices INTEGER,
	ROIBegin INTEGER,
	IlliacBif INTEGER,
	comments VARCHAR(100),
	ROIEnd INTEGER,
	totalSlicesInROI INTEGER,
	studyID INTEGER,
	PRIMARY KEY(seriesID),
	FOREIGN KEY(studyID) REFERENCES Study
);
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Series', NULL, 'Create');

CREATE TABLE Image(
	imageID INTEGER IDENTITY(1,1),
	imageOrder INTEGER,
	imageFilename VARCHAR(100),
	imageTitle VARCHAR(100),
	sliceThickness INTEGER,
	pixelSize INTEGER,
	seriesID INTEGER,
	PRIMARY KEY(imageID),
	FOREIGN KEY(seriesID) REFERENCES Series
);
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Image', NULL, 'Create');

CREATE TABLE Testimonial(
	testimonialID INTEGER IDENTITY(1,1),
	content VARCHAR(250),
	date DATETIME,
	surgeonID INTEGER,
	PRIMARY KEY(testimonialID),
	FOREIGN KEY(surgeonID) REFERENCES Surgeon,
);
INSERT INTO Audit(userID, userName, date, DBTable, attribute, access)
VALUES(NULL, 'TEAM3OIE2S', CURRENT_TIMESTAMP, 'Testimonial', NULL, 'Create');


