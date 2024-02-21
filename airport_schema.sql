
CREATE TABLE Airports (
    airport_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location_city VARCHAR(255) NOT NULL,
    location_country VARCHAR(255) NOT NULL,
    code VARCHAR(5) NOT NULL
);


CREATE TABLE Airlines (
    airline_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    headquarters VARCHAR(255),
    founded_year INT
);


CREATE TABLE Aircrafts (
    aircraft_id INT PRIMARY KEY,
    model VARCHAR(255) NOT NULL,
    capacity INT NOT NULL,
    airline_id INT,
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id)
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    status VARCHAR(50),
    aircraft_id INT,
    origin_airport_id INT,
    destination_airport_id INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircrafts(aircraft_id),
    FOREIGN KEY (origin_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (destination_airport_id) REFERENCES Airports(airport_id)
);


CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    passport_number VARCHAR(20) NOT NULL
);


CREATE TABLE FlightBookings (
    booking_id INT PRIMARY KEY,
    flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
    seat_number VARCHAR(5),
    class VARCHAR(50),
    booking_date TIMESTAMP NOT NULL,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);
