/*Create database*/
CREATE DATABASE IF NOT EXISTS complex_cinema CHARACTER SET UTF8mb4 COLLATE utf8mb4_general_ci;

/*Create table customers*/
CREATE TABLE IF NOT EXISTS customers
(
    id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastname VARCHAR(30) NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    password VARCHAR(60) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR (20) NOT NULL
) ENGINE = InnoDB;

/*Create table role*/
CREATE TABLE IF NOT EXISTS roles
(
    id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_role VARCHAR (30) NOT NULL
) ENGINE = InnoDB;

/*Create table userRole*/
CREATE TABLE IF NOT EXISTS userRole
(
    customers_id INT(11) NOT NULL,
    roles_id INT(11) NOT NULL,
    PRIMARY KEY (customers_Id, roles_Id),
    CONSTRAINT `fk_customers_id` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_roles_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB;