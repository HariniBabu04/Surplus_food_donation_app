### System Architecture

The Surplus Food Donation Web Application follows a three-tier architecture to ensure scalability, security, and efficient data management. The system integrates web technologies with Java, Python, and MySQL Server to provide a robust solution for surplus food donation management.

### Architecture Overview

The system is divided into the following layers:

1. Presentation Layer (Frontend)
2. Application Layer (Backend Services)
3. Data Layer (Database)

### 1. Presentation Layer

The presentation layer provides the user interface for all users including Admin, Donors, and NGOs/Volunteers. It is developed using HTML, CSS, JavaScript, and Bootstrap. Google Maps API is integrated in this layer to enable location-based food donation and pickup.

Users interact with the system through web browsers to register, log in, post food donations, view available food, and monitor donation status.

### 2. Application Layer

The application layer contains the core business logic of the system and is divided into two services:

#### a) Java Spring Boot Service

- Handles user authentication and authorization
- Manages donor, NGO, and admin functionalities
- Processes food donation data
- Communicates with the MySQL Server database
- Integrates with Python services using REST APIs

#### b) Python Flask Service

- Sends OTP and notification alerts to users
- Automatically checks and updates food expiry status
- Generates donation statistics and analytics data
- Supports scheduled background tasks

### 3. Data Layer

The data layer uses MySQL Server to store and manage all system data securely. It includes information related to users, food donations, requests, OTP verification, and system logs. Proper constraints and relationships are maintained to ensure data integrity.

### Integration of Advanced Features

- Google Maps API is used to store and display donor locations for easy pickup
- OTP verification ensures secure user registration and pickup confirmation
- Automatic food expiry handling improves food safety
- Analytics dashboard provides insights into donation trends and system usage

### Architecture Flow

1. User accesses the system through a web browser
2. Requests are sent to the Java backend
3. Java service processes business logic and stores data in MySQL Server
4. Python services handle notifications, expiry checks, and analytics
5. Processed data is displayed back to users through the frontend

This architecture ensures modularity, maintainability, and efficient coordination between system components.
