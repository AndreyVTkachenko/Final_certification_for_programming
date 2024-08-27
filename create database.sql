-- Создание базы данных, если она не существует
CREATE DATABASE IF NOT EXISTS lakeSide_hotel_db;

-- Выбор базы данных
USE lakeSide_hotel_db;

-- Создание таблицы для пользователей
CREATE TABLE IF NOT EXISTS user (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Создание таблицы для ролей
CREATE TABLE IF NOT EXISTS role (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- Создание таблицы для комнат
CREATE TABLE IF NOT EXISTS room (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    room_type VARCHAR(255),
    room_price DECIMAL(10, 2),
    is_booked BOOLEAN DEFAULT FALSE,
    photo BLOB
);

-- Создание таблицы для забронированных комнат
CREATE TABLE IF NOT EXISTS booked_room (
    booking_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    check_in DATE,
    check_out DATE,
    guest_full_name VARCHAR(255),
    guest_email VARCHAR(255),
    adults INT,
    children INT,
    total_guest INT,
    confirmation_code VARCHAR(255),
    room_id BIGINT,
    FOREIGN KEY (room_id) REFERENCES room(id) ON DELETE SET NULL
);

-- Создание таблицы для связей пользователей и ролей
CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT,
    role_id BIGINT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE
);
