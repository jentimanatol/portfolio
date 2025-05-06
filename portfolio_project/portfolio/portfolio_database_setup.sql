-- --------------------------------
-- Portfolio Contact Database Setup
-- --------------------------------

-- Create database (if using MySQL/MariaDB)
-- Uncomment the next line if using MySQL/MariaDB
-- CREATE DATABASE IF NOT EXISTS portfolio_db;
-- USE portfolio_db;

-- For SQLite, the database is just a file, so this part can be skipped.

-- ------------------------------
-- Django Required Tables
-- ------------------------------

-- Create django_migrations table to track migrations
CREATE TABLE IF NOT EXISTS "django_migrations" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "app" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "applied" datetime NOT NULL
);

-- Create django_content_type table for content types
CREATE TABLE IF NOT EXISTS "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model")
);

-- Create auth_user table for user authentication
CREATE TABLE IF NOT EXISTS "auth_user" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "password" varchar(128) NOT NULL,
    "last_login" datetime NULL,
    "is_superuser" bool NOT NULL,
    "username" varchar(150) NOT NULL UNIQUE,
    "first_name" varchar(150) NOT NULL,
    "last_name" varchar(150) NOT NULL,
    "email" varchar(254) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" datetime NOT NULL
);

-- Create django_admin_log table for admin logs
CREATE TABLE IF NOT EXISTS "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "action_time" datetime NOT NULL,
    "object_id" text NULL,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0),
    "change_message" text NOT NULL,
    "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED
);

-- Create django_session table for session management
CREATE TABLE IF NOT EXISTS "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);

-- ------------------------------
-- Portfolio App-specific Tables
-- ------------------------------

-- Create portfolio_contactmessage table for contact form submissions
CREATE TABLE IF NOT EXISTS "portfolio_contactmessage" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" varchar(100) NOT NULL,
    "email" varchar(254) NOT NULL,
    "subject" varchar(200) NOT NULL,
    "message" text NOT NULL,
    "created_at" datetime NOT NULL
);

-- ------------------------------
-- Indexes for better performance
-- ------------------------------

-- Create index for session expiry date
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");

-- Create index for admin log content type
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");

-- Create index for admin log user
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");

-- Create index for contact message creation date
CREATE INDEX IF NOT EXISTS "portfolio_contactmessage_created_at_idx" ON "portfolio_contactmessage" ("created_at");

-- ------------------------------
-- Insert initial required data
-- ------------------------------

-- Insert content types for our models
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES 
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'portfolio', 'contactmessage');

-- Record this migration in django_migrations
INSERT INTO "django_migrations" ("app", "name", "applied") VALUES 
('contenttypes', '0001_initial', datetime('now')),
('auth', '0001_initial', datetime('now')),
('admin', '0001_initial', datetime('now')),
('admin', '0002_logentry_remove_auto_add', datetime('now')),
('admin', '0003_logentry_add_action_flag_choices', datetime('now')),
('contenttypes', '0002_remove_content_type_name', datetime('now')),
('auth', '0002_alter_permission_name_max_length', datetime('now')),
('auth', '0003_alter_user_email_max_length', datetime('now')),
('auth', '0004_alter_user_username_opts', datetime('now')),
('auth', '0005_alter_user_last_login_null', datetime('now')),
('auth', '0006_require_contenttypes_0002', datetime('now')),
('auth', '0007_alter_validators_add_error_messages', datetime('now')),
('auth', '0008_alter_user_username_max_length', datetime('now')),
('auth', '0009_alter_user_last_name_max_length', datetime('now')),
('auth', '0010_alter_group_name_max_length', datetime('now')),
('auth', '0011_update_proxy_permissions', datetime('now')),
('auth', '0012_alter_user_first_name_max_length', datetime('now')),
('sessions', '0001_initial', datetime('now')),
('portfolio', '0001_initial', datetime('now'));

-- ------------------------------
-- Sample Data (Optional)
-- ------------------------------

-- INSERT INTO "portfolio_contactmessage" ("name", "email", "subject", "message", "created_at") VALUES 
-- ('John Doe', 'john@example.com', 'Project Inquiry', 'I would like to discuss a potential project with you.', datetime('now')),
-- ('Jane Smith', 'jane@example.com', 'Collaboration Request', 'Would you be interested in collaborating on a web application?', datetime('now'));