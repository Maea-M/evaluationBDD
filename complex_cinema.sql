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
    PRIMARY KEY (customers_id, roles_id),
    CONSTRAINT `fk_customers_id` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_roles_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB;

/* Create table complex*/
CREATE TABLE IF NOT EXISTS complex
(
    id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_cinema VARCHAR(30) NOT NULL,
    adress VARCHAR(60) NOT NUll,
    postal_code INT(5) NOT NULL,
    city VARCHAR(60) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone INT(10) NOT NULL,
    number_room INT(20) NOT NULL,
    manager_id INT DEFAULT 1,
    CONSTRAINT `fk_erreur_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `customers`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB;

/* Create table rooms */
CREATE TABLE IF NOT EXISTS rooms
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_room VARCHAR(50) NOT NULL,
    max_places INT(255) NOT NULL,
    complex_id INT DEFAULT 1,
    CONSTRAINT `erreur_complex` FOREIGN KEY (`complex_id`) REFERENCES `complex`(`id`) ON DELETE CASCADE
) ENGINE = InnoDB;

/* Create table movie*/
CREATE TABLE IF NOT EXISTS movie
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director VARCHAR(60) NOT NULL,
    time DATETIME NOT NULL
) ENGINE = InnoDB;

/* Create table Price */
CREATE TABLE IF NOT EXISTS price
(
    id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL,
    amount DECIMAL (10,2) NOT NULL
) ENGINE = InnoDB;

/* Create table session */
CREATE TABLE IF NOT EXISTS sessions
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    movie_id INT (11),
    rooms_id INT (11),
    price_id INT (11),
    CONSTRAINT `fk_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_rooms_id` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_price_id` FOREIGN KEY (`price_id`) REFERENCES `price` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB;

/* Create table booking */
CREATE TABLE IF NOT EXISTS booking
(
    sessions_id INT (11),
    customers_id INT (11),
    CONSTRAINT `pk_booking` PRIMARY KEY (`sessions_id`, `customers_id`),
    FOREIGN KEY (`sessions_id`) REFERENCES `sessions`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`customers_id`) REFERENCES `customers`(`id`) ON DELETE CASCADE,
    UNIQUE (sessions_id, customers_id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
