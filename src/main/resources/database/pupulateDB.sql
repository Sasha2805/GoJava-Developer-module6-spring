USE spring_hw;

# Creating new records in table manufacturer
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (unhex(replace(uuid(), '-', '')), 'Apple');
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (unhex(replace(uuid(), '-', '')), 'Xiaomi');
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (unhex(replace(uuid(), '-', '')), 'HP');
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (unhex(replace(uuid(), '-', '')), 'Asus');
INSERT INTO `spring_hw`.`manufacturer` (`id`, `name`) VALUES (unhex(replace(uuid(), '-', '')), 'Samsung');

# Getting manufacturers id
SELECT @apple_id := id FROM manufacturer WHERE name = 'Apple';
SELECT @xiaomi_id := id FROM manufacturer WHERE name = 'Xiaomi';
SELECT @hp_id := id FROM manufacturer WHERE name = 'HP';
SELECT @asus_id := id FROM manufacturer WHERE name = 'Asus';
SELECT @samsung_id := id FROM manufacturer WHERE name = 'Samsung';

# Creating new records in table product
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (unhex(replace(uuid(), '-', '')), 'Iphone X', 1225, @apple_id);
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (unhex(replace(uuid(), '-', '')), 'iPad 7', 556, @apple_id);
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (unhex(replace(uuid(), '-', '')), 'Xiaomi Redmi 5 plus', 185, @xiaomi_id);
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (unhex(replace(uuid(), '-', '')), 'Xiaomi Mi Mix 2', 495, @xiaomi_id);
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (unhex(replace(uuid(), '-', '')), 'Loptop HP ProBook 430 G4', 850, @hp_id);
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (unhex(replace(uuid(), '-', '')), 'Asus VivoBook 15 X510UQ ', 6000,  @asus_id);
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (unhex(replace(uuid(), '-', '')), 'Samsung Galaxy S8 64GB Midnight Black', 1020, @samsung_id);
INSERT INTO `spring_hw`.`product` (`id`, `name`, `cost`, `manufacturer_id`) VALUES (unhex(replace(uuid(), '-', '')), 'Samsung Galaxy A8 2018 32GB Orchid Gray', 420.84, @samsung_id);

# Creating new records in table role
INSERT INTO `spring_hw`.`role` (`id`, `name`) VALUES (unhex(replace(uuid(), '-', '')), 'ADMIN');
INSERT INTO `spring_hw`.`role` (`id`, `name`) VALUES (unhex(replace(uuid(), '-', '')), 'USER');

# Getting roles id
SELECT @admin_id := id FROM role WHERE name = 'ADMIN';
SELECT @user_id := id FROM role WHERE name = 'USER';

# Creating new records in table user
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `first_name`, `last_name`) VALUES (unhex(replace(uuid(), '-', '')), 'johnSmith@gmail.com', 'john123', 'John', 'Smith');
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `first_name`, `last_name`) VALUES (unhex(replace(uuid(), '-', '')), 'sarahJones@gmail.com', '$2a$10$DZN7xi1GdAU6j2LTvYzhE.B8a.00Y7/KCr9u2BqQpiacNnjXDG8e6', 'Sarah', 'Jones'); /*password-sarah123*/
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `first_name`, `last_name`) VALUES (unhex(replace(uuid(), '-', '')), 'oliviaEvans@gmail.com', 'olivia123', 'Olivia', 'Evans');
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `first_name`, `last_name`) VALUES (unhex(replace(uuid(), '-', '')), 'danielBrown@gmail.com', '$2a$10$wfNkudEGNVg7igQap95zhe07cC49OTFy4RUEr5BCp4av2xEamTie6', 'Daniel', 'Brown');  /*password-daniel123*/
INSERT INTO `spring_hw`.`user` (`id`, `email`, `password`, `first_name`, `last_name`) VALUES (unhex(replace(uuid(), '-', '')), 'danielSmith@gmail.com', 'daniel123', 'Daniel', 'Smith');

# Getting users id
SELECT @johnSmith_id := id FROM user WHERE email = 'johnSmith@gmail.com';
SELECT @sarahJones_id := id FROM user WHERE email = 'sarahJones@gmail.com';
SELECT @oliviaEvans_id := id FROM user WHERE email = 'oliviaEvans@gmail.com';
SELECT @danielBrown_id := id FROM user WHERE email = 'danielBrown@gmail.com';
SELECT @danielSmith_id := id FROM user WHERE email = 'danielSmith@gmail.com';

# Creating new records in table user_roles
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES (@johnSmith_id, @admin_id);
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES (@sarahJones_id, @user_id);
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES (@oliviaEvans_id, @user_id);
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES (@danielBrown_id, @admin_id);
INSERT INTO `spring_hw`.`user_roles` (`user_id`, `role_id`) VALUES (@danielSmith_id, @user_id);

