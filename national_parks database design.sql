CREATE DATABASE national_parks;
USE national_parks;

CREATE TABLE us_np (
	ParkID CHAR(4),
    ParkName VARCHAR(255),
    Size DOUBLE,
    StateID CHAR(2),
    RegionID CHAR(2),
    ShapeArea DOUBLE PRECISION,
    ShapeLength DOUBLE PRECISION);
    
ALTER TABLE us_np ADD PRIMARY KEY(ParkID);

SELECT * FROM us_np;

 CREATE TABLE annual_visits (
	ParkID CHAR(4) NOT NULL,
    VisitYear YEAR NOT NULL,
    TotalVisits INTEGER NOT NULL,
    FOREIGN KEY (ParkID)
		REFERENCES us_np(ParkID)
        ON UPDATE CASCADE);
    
 SELECT COUNT(*) FROM annual_visits WHERE ParkID = "grsm" ;

INSERT INTO annual_visits (ParkID, VisitYear, TotalVisits) VALUES
("JEFF",	1941	,0);

UPDATE annual_visits SET ParkID = "BRCA" WHERE ParkID = "BLCA";
