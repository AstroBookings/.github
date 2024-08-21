# AstroBookings: Project Briefing

> Timestamp: 2024-08-20 19:00:00 UTC

AstroBookings is a comprehensive platform connecting space agencies with travelers for commercial space flights. It manages rocket launches, bookings, payments, and communications, ensuring a seamless experience for agencies and travelers while maintaining robust backend operations and monitoring.

The project is divided into seven main `domains`: `Authentication`, `Agency Management`, `Booking Management`, `Financial Operations`, `Notification System`, `Data Synchronization`, and `System Monitoring`. Each domain has specific requirements that cater to different user roles and system functionalities.

The solution will be developed using a microservices architecture, with separate components for web applications, API services, databases, and external services. This modular approach combined with modern `technologies` like `Angular`, `NestJS`, `Postgres`, and `MongoDB`, will allow for better scalability, maintainability, and flexibility in the system.

The common vocabulary and understanding of the system's requirements is based on the following domain `entities`: `User`, `Traveler`, `Agency`, `Rocket`, `Launch`, `Booking`, `Invoice`, `Payment`, `Notification`, `EntryLog`, and `JobQueue`. These entities represent the core concepts of the space travel booking system and define the interactions between users, agencies, launches, and financial transactions.

## Requirements by Domain

### 0. Authentication

1. Register an account
2. Log in to the system
3. Log out of the system
4. Generate a JWT for a validated user
5. Validate a JWT and identify the user

### 1. Agency Management

1. Create and manage agency profile
2. Add and manage rockets
3. Schedule new launches
4. View the occupancy of scheduled launches
5. Delay, abort, fail or mark as successful scheduled launches
6. View a report of bookings for successful launches

### 2. Booking Management

1. View available launches as an anonymous visitor
2. Register as a traveler with contact and tax information
3. Book seats on a launch as a registered traveler
4. View updates on the status of booked launches
5. Cancel booking and receive a refund if eligible

### 3. Financial Operations

1. Generate invoices for agencies based on successful launches
2. Generate invoices for agencies for aborted launches
3. Track payment status of invoices
4. View a revenue report for each agency
5. Generate an annual report of actual and pending revenues

### 4. Notification System

1. Receive email notifications about launches for agencies
2. Receive email notifications about bookings for travelers
3. Receive exclusive notifications about new launches for VIP travelers
4. View the status of the notification queue as an IT employee
5. Change the status of notifications as an IT employee

### 5. Data Synchronization

1. Record the origin of each data change
2. Initiate synchronization processes between databases
3. Monitor the status of data synchronization processes

### 6. System Monitoring

1. Save logs of all activities
2. View system logs to monitor system behavior
3. Check the status of the notification service

## System Components

### 🌐 Web Applications

0. `🌐 AuthWeb`: Authentication and user management interface
1. `🌐 PublicWeb`: Showcase of available launches and public information
2. `🌐 AgencyWeb`: Management interface for space agencies
3. `🌐 TravelerWeb`: Booking and management interface for travelers
4. `🌐 SystemWeb`: Administrative interface for AstroBookings employees

All web applications are built with **Angular**.

### 🧑‍💼 API Services

0. `🧑‍💼 SystemAPI`: Handles authentication, authorization, and system-wide operations
1. `🧑‍💼 AgencyAPI`: Manages agency profiles and launches
2. `🧑‍💼 BookingAPI`: Handles seat reservations and cancellations
3. `🧑‍💼 FinanceAPI`: Manages invoicing and payments
4. `🧑‍💼 NotifyAPI`: Handles email notifications

All API services are developed using **NestJS**.

### 📇 Databases

0. `📇 SystemDB`: Stores user profiles, authentication data, and system logs
1. `📇 OperationsDB`: Stores structured data for bookings, launches, and financial transactions
2. `📇 CacheDB`: Provides quick data access for frequently requested information

Databases use a combination of **Postgres** and **MongoDB**, with **Redis** for caching.

### 👽 External Services

1. `👽 EmailSvc`: For sending notifications
2. `👽 PaymentGW`: For processing payments

## Main Entities

1. `User`: Base entity for all system users. Contains common information such as login credentials and contact data.
2. `Traveler`: Specialization of User. Represents clients who make bookings for space travels.
3. `Agency`: Specialization of User. Represents space agencies that offer launches.
4. `Rocket`: Represents spacecraft owned by agencies. Includes details such as capacity and range.
5. `Launch`: Represents a scheduled space trip. Includes information such as date, destination, and price per seat.
6. `Booking`: Represents the reservation of seats on a specific launch made by a traveler.
7. `Invoice`: Represents charges generated for agencies for completed launches.
8. `Payment`: Represents payments made by agencies to settle issued invoices.
9. `Notification`: Represents messages sent to system users about various events.
10. `EntryLog`: Represents system activity logs, used for monitoring and auditing.
11. `JobQueue`: Represents pending tasks for data synchronization between different parts of the system.
