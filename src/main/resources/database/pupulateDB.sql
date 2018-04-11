USE spring_hw;

# Creating new records in table manufacturer
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (uuid(), 'Apple');
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (uuid(), 'Xiaomi');
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (uuid(), 'HP');
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (uuid(), 'Asus');
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (uuid(), 'Samsung');

# Creating new records in table product
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (uuid(), 'Iphone X', 1225, '575e7644-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (uuid(), 'iPad 7', 556, '575e7644-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (uuid(), 'Xiaomi Redmi 5 plus', 185, '5766efdd-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (uuid(), 'Xiaomi Mi Mix 2', 495, '5766efdd-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (uuid(), 'Loptop HP ProBook 430 G4', 850, '576df115-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (uuid(), 'Asus VivoBook 15 X510UQ ', 6000, '5772d603-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (uuid(), 'Samsung Galaxy S8 64GB Midnight Black', 1020, '577c4b71-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (uuid(), 'Samsung Galaxy A8 2018 32GB Orchid Gray', 420.84, '577c4b71-3da1-11e8-9ec2-0024542b49b4');

# Creating new records in table role
INSERT INTO `spring_hw`.`role` (`id`, `name`) VALUES (uuid(), 'ADMIN');
INSERT INTO `spring_hw`.`role` (`id`, `name`) VALUES (uuid(), 'USER');

# Creating new records in table user
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `firstName`, `lastName`) VALUES (uuid(), 'johnSmith@gmail.com', 'john123', 'John', 'Smith');
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `firstName`, `lastName`) VALUES (uuid(), 'sarahJones@gmail.com', 'sarah123', 'Sarah', 'Jones');
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `firstName`, `lastName`) VALUES (uuid(), 'oliviaEvans@gmail.com', 'olivia123', 'Olivia', 'Evans');
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `firstName`, `lastName`) VALUES (uuid(), 'danielBrown@gmail.com', 'daniel123', 'Daniel', 'Brown');
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `firstName`, `lastName`) VALUES (uuid(), 'danielSmith@gmail.com', 'daniel123', 'Daniel', 'Smith');

# Creating new records in table user_roles
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES ('2648fb8e-3da2-11e8-9ec2-0024542b49b4', 'd1fe5cd2-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES ('2651f82c-3da2-11e8-9ec2-0024542b49b4', 'd2047695-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES ('2657fd81-3da2-11e8-9ec2-0024542b49b4', 'd2047695-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES ('265e0c70-3da2-11e8-9ec2-0024542b49b4', 'd1fe5cd2-3da1-11e8-9ec2-0024542b49b4');
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES ('2663daac-3da2-11e8-9ec2-0024542b49b4', 'd2047695-3da1-11e8-9ec2-0024542b49b4');

