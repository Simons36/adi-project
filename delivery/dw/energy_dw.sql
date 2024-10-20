DROP DATABASE IF EXISTS energy_dw;

CREATE DATABASE energy_dw;

USE energy_dw;

CREATE TABLE dim_time {
    time_id DATETIME PRIMARY KEY,
    year INT,
    season VARCHAR(6),
    month INT
}

CREATE TABLE dim_location {
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(50),
    municipality VARCHAR(50),
    parish VARCHAR(50)
}

-- Create the fact table for energy consumption
CREATE TABLE fact_energy_consumption (
    fact_id INT AUTO_INCREMENT PRIMARY KEY,
    time_id INT NOT NULL,
    location_id INT NOT NULL,
    energy_consumption DECIMAL(10,2) NOT NULL, -- Energy consumption in kWh
    percentage_smart_meters DECIMAL(5,4) NOT NULL -- Percentage with 4 decimal places
    FOREIGN KEY (time_id) REFERENCES dim_time(time_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id)
);