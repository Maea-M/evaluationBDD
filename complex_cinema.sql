/*Create database*/
CREATE DATABASE IF NOT EXISTS complex_cinema CHARACTER SET UTF8mb4 COLLATE utf8mb4_general_ci;

USE complex_cinema

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
    admin_id INT DEFAULT 1,
    CONSTRAINT `fk_erreur_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `customers`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT
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
    time TIME
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
) ENGINE=InnoDB;

/* ------------------ DATA -------------*/

/* Data customers*/
insert into customers (id, lastname, firstname, password, email, role) values (1, 'Aurelius', 'Cathie', '$2y$10$XqKUExRx3bz.jAmwW3/5juPRyuwUA0Iwj5QO.U1haEtQeZURfY.py', 'caurelius0@instagram.com', 'admin');
insert into customers (id, lastname, firstname, password, email, role) values (2, 'Papaminas', 'Klemens', '$2y$10$gLHXEi1vM5.DSyIvAnHKme28HxSmQLSeTTiNVIsWQQrao/E.PPgvW', 'kpapaminas1@rambler.ru', 'admin');
insert into customers (id, lastname, firstname, password, email, role) values (3, 'Elby', 'Lulita', '$2y$10$6cSqmn0Kph.lCNFAyETi1eZQhkaRrFFkF.BrDG7q/lrCHphNSgxdy', 'lelby2@dropbox.com', 'manager');
insert into customers (id, lastname, firstname, password, email, role) values (4, 'Henniger', 'Clerkclaude', '$2y$10$duAFuTJbzEGEnopHarqH9O4/1C6EAlYtNvquAv4t2eVTXUAJwDG9.', 'chenniger3@artisteer.com', 'manager');
insert into customers (id, lastname, firstname, password, email, role) values (5, 'Sprigging', 'Rickard', '$2y$10$OtAB4IKIOhUvD1FV020oNeR1IE1fORZblLH8WbOD5P87qZ/nWS4cO', 'rsprigging4@deliciousdays.com', 'user');
insert into customers (id, lastname, firstname, password, email, role) values (6, 'Waud', 'Torey', '$2y$10$3kzuzLkRMySewTWUEAC4J.9erXp4dvKT8TRpAvK/JOBpRzZ7kxczq', 'twaud5@webeden.co.uk', 'user');
insert into customers (id, lastname, firstname, password, email, role) values (7, 'Fullicks', 'Rebecka', '$2y$10$uC6y2H4Wpnkc3dQR/bqZT.F2Gh3cymjEn/zLbsQfZUODRxzyJiu5y', 'rfullicks6@last.fm', 'user');
insert into customers (id, lastname, firstname, password, email, role) values (8, 'Clayden', 'Myrah', '$2y$10$IZHjfCEprElvr0FXR8V1ceZ0BwmRNDJXqyamo0ghE8GuO/LFE2okm', 'mclayden7@blogger.com', 'user');
insert into customers (id, lastname, firstname, password, email, role) values (9, 'Jills', 'Jordanna', '$2y$10$2tTpZ7uUSVs0nVrahtwwsu7vKs/UmM3goUZzS5F9o/JauJ9KXqga6', 'jjills8@google.com.au', 'user');
insert into customers (id, lastname, firstname, password, email, role) values (10, 'Lefort', 'Gypsy', '$2y$10$gtyY1tlde4mIe8ze89HPFuMAzK7DJkLTlrQfzZhspq4YovbcDQ6VK', 'glefort9@over-blog.com', 'user');

/*GRANT ALL ON mydb.mytbl TO 'someuser'@'somehost';
GRANT SELECT, INSERT ON mydb.mytbl TO 'someuser'@'somehost'
*/
GRANT ALL ON complex_cinema.customers TO 'admin'@'localhost';
GRANT SELECT, INSERT ON complex_cinema.customers TO 'admin'@'localhost';

/* Data complex*/
insert into complex (id, name_cinema, adress, postal_code, city, email, phone, number_room) values (1, 'Doyle Inc', '28 Troy Street', '29250' ,'Woja', 'gtschirasche0@amazonaws.com', '1234567890', '1');
insert into complex (id, name_cinema, adress, postal_code, city, email, phone, number_room) values (2, 'Hilll, Abernathy and Senger', '1274 Butternut Place', '29600','Mengxi', 'tmilillo1@storify.com', '9876543210', '5');
insert into complex (id, name_cinema, adress, postal_code, city, email, phone, number_room) values (3, 'Rogahn LLC', '287 Hooker Court', '29200','Palotina', 'dblaes2@weather.com', '1237894560', '10');
insert into complex (id, name_cinema, adress, postal_code, city, email, phone, number_room) values (4, 'Mueller, Gutkowski and Hudson', '816 Swallow Hill', '29700', 'Magrath', 'mbum3@amazon.co.jp', '4567891302', '7');
insert into complex (id, name_cinema, adress, postal_code, city, email, phone, number_room) values (5, 'Batz, Pagac and Heidenreich', '27587 Carpenter Court', '29800','Erling', 'gabba4@narod.ru', '0147852369', '4');

/*Data rooms*/
insert into rooms (id, name_room, max_places, complex_id) values (1, 'ecarlate', 200, 1);
insert into rooms (id, name_room, max_places, complex_id) values (2, 'corail', 100, 2);
insert into rooms (id, name_room, max_places, complex_id) values (3, 'jade', 100, 2);
insert into rooms (id, name_room, max_places, complex_id) values (4, 'agate', 100, 2);
insert into rooms (id, name_room, max_places, complex_id) values (5, 'ambre', 150, 2);
insert into rooms (id, name_room, max_places, complex_id) values (6, 'rubis', 100, 2);
insert into rooms (id, name_room, max_places, complex_id) values (7, 'jaune', 100, 3);
insert into rooms (id, name_room, max_places, complex_id) values (8, 'bleu', 200, 4);
insert into rooms (id, name_room, max_places, complex_id) values (9, 'vert', 100, 2);

/* date movie*/
insert into movie (id, title, director, time) values (1, 'At War with the Army', 'Mable Sproule', '1:30');
insert into movie (id, title, director, time) values (2, 'Godzilla and Mothra', 'Shirlee Ockland', '2:50');
insert into movie (id, title, director, time) values (3, 'Never Let Me Go', 'Barbie Allman', '1:10');
insert into movie (id, title, director, time) values (4, 'Mammy', 'Barbabra Zipsell', '1:18');
insert into movie (id, title, director, time) values (5, 'Tsunami: Caught on Camera', 'Brunhilda Pocock', '1:25');

/*date price*/
insert into price (id, type, amount) values (1, 'plein tarif', 9.20);
insert into price (id, type, amount) values (2, 'étudiant', 7.60);
insert into price (id, type, amount) values (3, 'moins de 14 ans', 5.90);

/* Date sessions*/
insert into sessions (id, start_date, end_date, movie_id, rooms_id, price_id) values (1, '2023-01-18 12:00:00', '2023-01-18 13:30:00', 1, 1, 1);
insert into sessions (id, start_date, end_date, movie_id, rooms_id, price_id) values (2, '2023-01-18 12:00:00', '2023-01-18 14:50:00', 2, 2, 1);
insert into sessions (id, start_date, end_date, movie_id, rooms_id, price_id) values (3, '2023-01-18 12:00:00', '2023-01-18 13:10:00', 3, 3, 3);

/*Data booking*/
insert into booking (sessions_id, customers_id) values (3, 8);
insert into booking (sessions_id, customers_id) values (2, 2);
insert into booking (sessions_id, customers_id) values (1, 4);

/* ------------------ Restauration/sauvegarde -------------*/
/* Save*/
mysqldump -u root -p --databases complex_cinema > dump_complex_cinema_bdd.sql

/*Restore*/
mysql -u root -p complex_cinema < dump_complex_cinema_bdd.sql
