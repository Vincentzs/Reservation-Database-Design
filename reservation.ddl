drop schema if exists reservation cascade;
create schema reservation;
set search_path to reservation;

CREATE TABLE Skipper (
    -- sID of the skipper
    sID INTEGER PRIMARY KEY,
    -- skipper's name
    sName VARCHAR(255) NOT NULL,
    -- NULLABLE for new skippers
    rating FLOAT check (rating >= 0 AND rating <= 5),  
    -- skippers age, should be beyond 0
    age INTEGER NOT NULL check (age > 0)
);

CREATE TABLE Model (
    -- the model's ID
    mID INTEGER PRIMARY KEY,
    -- length of the model, > 0
    length FLOAT NOT NULL check (length >= 0)
);

CREATE TABLE Record (
    -- date when a craft is reserved for
    day DATE,
    sID INTEGER REFERENCES Skipper,
    mID INTEGER NOT NULL REFERENCES Model,
    -- dock ID
    dID INTEGER NOT NULL,
    PRIMARY KEY (day, sID)
);

-- \COPY Skipper FROM 'skipper.csv' DELIMITER ',' CSV header;
-- \COPY Model FROM 'model.csv' DELIMITER ',' CSV header;
-- \COPY Record FROM 'record.csv' DELIMITER ',' CSV header;