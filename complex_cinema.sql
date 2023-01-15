/*Create database*/
CREATE DATABASE IF NOT EXISTS complex_cinema CHARACTER SET UTF8mb4 COLLATE utf8mb4_general_ci;

/*Create table customers*/
CREATE TABLE IF NOT EXISTS customers
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastname VARCHAR(30) NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    password VARCHAR(60) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
) ENGINE = InnoDB;
