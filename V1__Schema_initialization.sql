DROP TABLE IF EXISTS Flights CASCADE;
DROP TABLE IF EXISTS Passengers CASCADE;
DROP TABLE IF EXISTS Aircrafts CASCADE;
DROP TABLE IF EXISTS Airlines CASCADE;
DROP TABLE IF EXISTS Airports CASCADE;


CREATE TABLE Airports (
    airport_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE Airlines (
    airline_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    headquarters_location VARCHAR(255)
);

CREATE TABLE Aircrafts (
    aircraft_id SERIAL PRIMARY KEY,
    model VARCHAR(255),
    capacity INT,
    airline_id INT,
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id)
);

CREATE TABLE Flights (
    flight_id SERIAL PRIMARY KEY,
    departure_airport_id INT,
    destination_airport_id INT,
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP,
    airline_id INT,
    FOREIGN KEY (departure_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (destination_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id)
);

CREATE TABLE Passengers (
    passenger_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    nationality VARCHAR(255),
    contact_information VARCHAR(255)
);
