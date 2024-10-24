DROP DATABASE IF EXISTS energy_dw;

CREATE DATABASE energy_dw;

USE energy_dw;

CREATE TABLE dim_time (
    time_id DATE PRIMARY KEY,
    year_id INT,
    season_id INT,             -- 1: Winter, 2: Spring, 3: Summer, 4: Autumn
    season_name VARCHAR(10),
    month_id INT,
    month_name VARCHAR(10)
);

CREATE TABLE dim_location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(50),
    municipality VARCHAR(50),
    parish VARCHAR(50),
    parish_code INT -- due to discrepancies between the names of the parishes in the two datasets, we will use the code
);

-- Create the fact table for energy consumption
CREATE TABLE fact_energy_stats (
    fact_id INT AUTO_INCREMENT PRIMARY KEY,
    time_id DATE,
    location_id INT,
    energy_consumption DECIMAL(10,2), -- Energy consumption in kWh
    percentage_smart_meters DECIMAL(5,4), -- Percentage with 4 decimal places
    FOREIGN KEY (time_id) REFERENCES dim_time(time_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id)
);