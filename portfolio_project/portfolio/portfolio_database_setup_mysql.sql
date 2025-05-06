-- --------------------------------
-- Portfolio Contact Database Setup for MySQL
-- --------------------------------

-- Create database
CREATE DATABASE IF NOT EXISTS portfolio_db;
USE portfolio_db;

-- ------------------------------
-- Django Required Tables
-- ------------------------------

-- Create django_migrations table to track migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
    `id` int NOT NULL AUTO_INCREMENT,
    `app` varchar(255) NOT NULL,
    `name` varchar(255) NOT NULL,
    `applied` datetime(6) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create django_content_type table for content types
CREATE TABLE IF NOT EXISTS `django_content_type` (
    `id` int NOT NULL AUTO_INCREMENT,
    `app_label` varchar(100) NOT NULL,
    `model` varchar(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`, `model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create auth_permission table
CREATE TABLE IF NOT EXISTS `auth_permission` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `content_type_id` int NOT NULL,
    `codename` varchar(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`, `codename`),
    CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create auth_group table
CREATE TABLE IF NOT EXISTS `auth_group` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(150) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create auth_group_permissions table
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
    `id` int NOT NULL AUTO_INCREMENT,
    `group_id` int NOT NULL,
    `permission_id` int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`, `permission_id`),
    KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
    KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`),
    CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
    CONSTRAINT `auth_group_permissions_permission_id_84c5c92e_fk` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create auth_user table for user authentication
CREATE TABLE IF NOT EXISTS `auth_user` (
    `id` int NOT NULL AUTO_INCREMENT,
    `password` varchar(128) NOT NULL,
    `last_login` datetime(6) NULL,
    `is_superuser` tinyint(1) NOT NULL,
    `username` varchar(150) NOT NULL,
    `first_name` varchar(150) NOT NULL,
    `last_name` varchar(150) NOT NULL,
    `email` varchar(254) NOT NULL,
    `is_staff` tinyint(1) NOT NULL,
    `is_active` tinyint(1) NOT NULL,
    `date_joined` datetime(6) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create auth_user_groups table
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `group_id` int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`, `group_id`),
    KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
    KEY `auth_user_groups_group_id_97559544` (`group_id`),
    CONSTRAINT `auth_user_groups_group_id_97559544_fk` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
    CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create auth_user_user_permissions table
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `permission_id` int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`, `permission_id`),
    KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
    KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`),
    CONSTRAINT `auth_user_user_permissions_permission_id_1fbb5f2c_fk` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
    CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create django_admin_log table for admin logs
CREATE TABLE IF NOT EXISTS `django_admin_log` (
    `id` int NOT NULL AUTO_INCREMENT,
    `action_time` datetime(6) NOT NULL,
    `object_id` longtext NULL,
    `object_repr` varchar(200) NOT NULL,
    `action_flag` smallint UNSIGNED NOT NULL,
    `change_message` longtext NOT NULL,
    `content_type_id` int NULL,
    `user_id` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
    KEY `django_admin_log_user_id_c564eba6` (`user_id`),
    CONSTRAINT `django_admin_log_content_type_id_c4bce