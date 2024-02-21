CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    birth_date DATE NOT NULL,
    profession VARCHAR(255),
    nationality VARCHAR(255),
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);
