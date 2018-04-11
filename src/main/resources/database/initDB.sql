# Creating schema
CREATE SCHEMA shop DEFAULT CHARACTER SET utf8mb4;
USE shop;

# Creating a manufacturer table
CREATE TABLE `shop`.`manufacturer`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(100) NOT NULL
);

# Creating a product table
CREATE TABLE `shop`.`product`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(100) NOT NULL,
	`cost` DECIMAL(10, 2),
    `manufacturer_id` INT NOT NULL,
    FOREIGN KEY(`manufacturer_id`) REFERENCES manufacturer (`id`)
);

# Creating a role table
CREATE TABLE `shop`.`role`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(100) NOT NULL
);

# Creating a user table
CREATE TABLE `shop`.`user`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(100) NOT NULL,
	`password` VARCHAR(100) NOT NULL,
	`first_name` VARCHAR(100) NOT NULL,
	`last_name` VARCHAR(100) NOT NULL,
    `role_id` INT NOT NULL,
    FOREIGN KEY(`role_id`) REFERENCES role (`id`)
);
