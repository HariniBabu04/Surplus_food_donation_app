--Sample Database

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('ADMIN', 'DONOR', 'NGO') NOT NULL,
    status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE'
);

CREATE TABLE donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    food_type VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    latitude DOUBLE,
    longitude DOUBLE,
    expiry_time DATETIME NOT NULL,
    status ENUM('AVAILABLE', 'ACCEPTED', 'EXPIRED') DEFAULT 'AVAILABLE',
    FOREIGN KEY (donor_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    donation_id INT NOT NULL,
    ngo_id INT NOT NULL,
    request_status ENUM('PENDING', 'APPROVED', 'COMPLETED') DEFAULT 'PENDING',
    pickup_time DATETIME,
    FOREIGN KEY (donation_id) REFERENCES donations(donation_id)
        ON DELETE CASCADE,
    FOREIGN KEY (ngo_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE otp_verification (
    otp_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    otp VARCHAR(6) NOT NULL,
    expiry_time DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);
