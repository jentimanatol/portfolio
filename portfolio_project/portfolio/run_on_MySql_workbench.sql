------------------------------
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
    CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
    CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create django_session table for session management
CREATE TABLE IF NOT EXISTS `django_session` (
    `session_key` varchar(40) NOT NULL,
    `session_data` longtext NOT NULL,
    `expire_date` datetime(6) NOT NULL,
    PRIMARY KEY (`session_key`),
    KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ------------------------------
-- Portfolio App-specific Tables
-- ------------------------------

-- Create portfolio_contactmessage table for contact form submissions
CREATE TABLE IF NOT EXISTS `portfolio_contactmessage` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `email` varchar(254) NOT NULL,
    `subject` varchar(200) NOT NULL,
    `message` longtext NOT NULL,
    `created_at` datetime(6) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `portfolio_contactmessage_created_at_idx` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ------------------------------
-- Insert initial required data
-- ------------------------------

-- Insert content types for our models
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES 
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'portfolio', 'contactmessage');

-- Record this migration in django_migrations
INSERT INTO `django_migrations` (`app`, `name`, `applied`) VALUES 
('contenttypes', '0001_initial', NOW()),
('auth', '0001_initial', NOW()),
('admin', '0001_initial', NOW()),
('admin', '0002_logentry_remove_auto_add', NOW()),
('admin', '0003_logentry_add_action_flag_choices', NOW()),
('contenttypes', '0002_remove_content_type_name', NOW()),
('auth', '0002_alter_permission_name_max_length', NOW()),
('auth', '0003_alter_user_email_max_length', NOW()),
('auth', '0004_alter_user_username_opts', NOW()),
('auth', '0005_alter_user_last_login_null', NOW()),
('auth', '0006_require_contenttypes_0002', NOW()),
('auth', '0007_alter_validators_add_error_messages', NOW()),
('auth', '0008_alter_user_username_max_length', NOW()),
('auth', '0009_alter_user_last_name_max_length', NOW()),
('auth', '0010_alter_group_name_max_length', NOW()),
('auth', '0011_update_proxy_permissions', NOW()),
('auth', '0012_alter_user_first_name_max_length', NOW()),
('sessions', '0001_initial', NOW()),
('portfolio', '0001_initial', NOW());




GRANT ALL PRIVILEGES ON portfolio_db.* TO 'admin'@'localhost';

SELECT * FROM portfolio_db.portfolio_contactmessage;


SELECT * FROM portfolio_db.portfolio_contactmessage;

SELECT * FROM portfolio_db.auth_user;

GRANT ALL PRIVILEGES ON portfolio_db.* TO 'admin'@'localhost';

GRANT ALL PRIVILEGES ON portfolio_db.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

