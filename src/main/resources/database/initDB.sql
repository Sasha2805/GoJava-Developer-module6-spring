# Creating schema
CREATE SCHEMA `spring_hw` DEFAULT CHARACTER SET utf8mb4;
USE spring_hw;

# Creating a manufacturer table
CREATE TABLE IF NOT EXISTS `spring_hw`.`manufacturer`(
  `id` BINARY(16) NOT NULL PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL
);

# Creating a product table
CREATE TABLE IF NOT EXISTS `spring_hw`.`product`(
  `id` BINARY(16) NOT NULL PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `cost` DECIMAL(10, 2),
  `manufacturer_id` BINARY(16) NOT NULL,
  FOREIGN KEY(`manufacturer_id`) REFERENCES manufacturer (`id`)
);

# Creating a role table
CREATE TABLE IF NOT EXISTS `spring_hw`.`role`(
  `id` BINARY(16) NOT NULL PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL
);

# Creating a user table
CREATE TABLE IF NOT EXISTS `spring_hw`.`user`(
  `id` BINARY(16) NOT NULL PRIMARY KEY,
  `email` VARCHAR(255),
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL
);

# Creating a user_roles table
CREATE TABLE IF NOT EXISTS `spring_hw`.`user_roles`(
  `user_id` BINARY(16) NOT NULL,
  `role_id` BINARY(16) NOT NULL,
  FOREIGN KEY(`user_id`) REFERENCES `spring_hw`.`user` (`id`),
  FOREIGN KEY(`role_id`) REFERENCES `spring_hw`.`role` (`id`),
  UNIQUE (`user_id`, `role_id`)
);