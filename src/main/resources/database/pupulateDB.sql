USE shop;

# Creating new records in table manufacturer
INSERT INTO `shop`.`manufacturer` (`id`, `name`) VALUES (1, 'Apple');
INSERT INTO `shop`.`manufacturer` (`id`, `name`) VALUES (2, 'Xiaomi');
INSERT INTO `shop`.`manufacturer` (`id`, `name`) VALUES (3, 'HP');
INSERT INTO `shop`.`manufacturer` (`id`, `name`) VALUES (4, 'Asus');
INSERT INTO `shop`.`manufacturer` (`id`, `name`) VALUES (5, 'Samsung');

# Creating new records in table product
INSERT INTO `shop`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (1, 'Iphone X', 1225, 1);
INSERT INTO `shop`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (2, 'iPad 7', 556, 1);
INSERT INTO `shop`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (3, 'Xiaomi Redmi 5 plus', 185, 2);
INSERT INTO `shop`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (4, 'Xiaomi Mi Mix 2', 495, 2);
INSERT INTO `shop`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (5, 'Loptop HP ProBook 430 G4', 850, 3);
INSERT INTO `shop`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (6, 'Asus VivoBook 15 X510UQ ', 6000, 4);
INSERT INTO `shop`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (7, 'Samsung Galaxy S8 64GB Midnight Black', 1020, 5);
INSERT INTO `shop`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (8, 'Samsung Galaxy A8 2018 32GB Orchid Gray', 420.84, 5);

# Creating new records in table role
INSERT INTO `shop`.`role` (`id`, `name`) VALUES (1, 'ADMIN');
INSERT INTO `shop`.`role` (`id`, `name`) VALUES (2, 'USER');

# Creating new records in table user
INSERT INTO `shop`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `role_id`) VALUES (1, 'johnSmith@gmail.com', 'john123', 'John', 'Smith', 1);
INSERT INTO `shop`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `role_id`) VALUES (2, 'sarahJones@gmail.com', 'sarah123', 'Sarah', 'Jones', 2);
INSERT INTO `shop`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `role_id`) VALUES (3, 'oliviaEvans@gmail.com', 'olivia123', 'Olivia', 'Evans', 2);
INSERT INTO `shop`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `role_id`) VALUES (4, 'danielBrown@gmail.com', 'daniel123', 'Daniel', 'Brown', 2);
INSERT INTO `shop`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `role_id`) VALUES (5, 'danielSmith@gmail.com', 'daniel123', 'Daniel', 'Smith', 1);