# AstroBookings System Briefing

AstroBookings is a comprehensive platform connecting space agencies with travelers for commercial space flights. It manages rocket launches, bookings, payments, and communications, ensuring a seamless experience for agencies and travelers while maintaining robust backend operations and monitoring.

## Domains and User Stories

### 0. Authentication
Manages user registration, login, and access control for agencies, travelers, and employees.

- As a `visitor` I want to **register an account** so that _I can access the system_
- As a `user` I want to **log in to the system** so that _I can access my account_
- As a `user` I want to **log out of the system** so that _I can ensure the security of my account_
- As the `system` I need to **generate a JWT for a validated user** so that _I can maintain their session securely_
- As the `system` I need to **validate a JWT and identify the user** so that _I can ensure secure access to protected resources_

### 1. Agency Management
Handles agency profiles, rockets, and launch management.

- As an `agency` I want to **create and manage my profile** so that _I can offer my services_
- As an `agency` I want to **add and manage my rockets** so that _I can use them for launches_
- As an `agency` I want to **schedule new launches** so that _travelers can book seats_
- As an `agency` I want to **view the occupancy of my scheduled launches** so that _I can decide if they are viable_
- As an `agency` I want to **delay, abort, fail or mark as successful my scheduled launches** so that _I can manage their status_
- As an `agency` I want to **view a report of bookings for successful launches** so that _I can issue invoices_

### 2. Booking Management
Manages traveler bookings, seat reservations, cancellations, and the public-facing website for showcasing launches.

- As a `visitor` I want to **view available launches** so that _I can choose a space trip_
- As a `visitor` I want to **register as a traveler with my contact and tax information** so that _I can book trips and receive proper invoicing from agencies_
- As a `traveler` I want to **book seats on a launch** so that _I can travel to space_
- As a `traveler` I want to **view updates on the status of my booked launch** so that _I can stay informed about my trip_
- As a `traveler` I want to **cancel my booking and receive a refund if eligible** so that _I can change my plans if necessary_

### 3. Financial Operations
Handles invoicing, payments, and financial reporting.

- As an `employee` I want to **generate invoices for agencies based on successful launches** so that _we can charge for our services_
- As an `employee` I want to **generate invoices for agencies for aborted launches** so that _we can cover platform usage costs_
- As an `employee` I want to **track payment status of invoices** so that _we can manage our finances effectively_
- As an `employee` I want to **view a revenue report for each agency** so that _I can analyze their financial performance_
- As an `employee` I want to **generate an annual report of actual and pending revenues** so that _I can assess the overall financial health of the platform_

### 4. Notification System
Manages communication with users about bookings, launches, and other events.

- As an `agency` I want to **receive email notifications about my launches** so that _I can stay informed about their status, bookings, and cancellations_
- As a `traveler` I want to **receive email notifications about my bookings** so that _I can stay informed about cancellations, delays, or aborts of my booked launches_
- As a `VIP traveler` I want to **receive exclusive notifications about new launches** so that _I can book early_
- As an `IT employee` I want to **view the status of the notification queue** so that _I can ensure proper system operation_
- As an `IT employee` I want to **change the status of notifications** so that _I can manage the notification system effectively_

### 5. Data Synchronization
Allows IT employees to manage and initiate synchronization processes between databases.

- As a `system` I want to **record the origin of each data change** so that _I can ensure accurate synchronization_
- As an `IT employee` I want to **initiate synchronization processes between databases** so that _I can maintain data consistency_
- As an `IT employee` I want to **monitor the status of data synchronization processes** so that _I can ensure they complete successfully_

### 6. System Monitoring
Provides logging and system status monitoring for IT operations.

- As a `system` I want to **save logs of all activities** so that _I can maintain a record of what has happened_
- As an `IT employee` I want to **view system logs** so that _I can monitor system behavior_
- As an `IT employee` I want to **check the status of the notification service** so that _I can ensure it's functioning correctly_

## Components

### 🌐 Web Applications
0. `🌐 AuthWeb`: Authentication and user management interface **Angular**
1. `🌐 PublicWeb`: Showcase of available launches and public information **Angular**
2. `🌐 AgencyWeb`: Management interface for space agencies **Angular**
3. `🌐 TravelerWeb`: Booking and management interface for travelers **Angular**
4. `🌐 SystemWeb`: Administrative interface for AstroBookings employees **Angular**

### 🧑‍💼 API Services
0. `🧑‍💼 SystemAPI`: Handles authentication, authorization, and system-wide operations **NestJS**
1. `🧑‍💼 AgencyAPI`: Manages agency profiles and launches **NestJS**
2. `🧑‍💼 BookingAPI`: Handles seat reservations and cancellations **NestJS**
3. `🧑‍💼 FinanceAPI`: Manages invoicing and payments **NestJS**
4. `🧑‍💼 NotifyAPI`: Handles email notifications **NestJS**

### 📇 Databases
0. `📇 SystemDB`: Stores user profiles, authentication data, and system logs **MongoDB**
1. `📇 OperationsDB`: Stores structured data for bookings, launches, and financial transactions **PostgreSQL**
2. `📇 CacheDB`: Provides quick data access for frequently requested information **Redis**

### 👽 External Services
1. `👽 EmailSvc`: For sending notifications
2. `👽 PaymentGW`: For processing payments

## Entities

1. `User`: Base entity for all system users, contains credentials and basic info
2. `Traveler`: Specialization of User, represents clients who make bookings
3. `Agency`: Specialization of User, represents space agencies offering launches
4. `Rocket`: Represents spacecraft owned by agencies, includes details such as capacity and range
5. `Launch`: Represents a scheduled space trip, includes information such as date, destination, and price per seat
6. `Booking`: Represents the reservation of seats on a specific launch made by a traveler
7. `Invoice`: Represents charges generated for agencies for completed launches, can be associated with one or more payments
8. `Payment`: Represents payments made by agencies to settle issued invoices
9. `Notification`: Represents messages sent to system users about various events
10. `EntryLog`: Represents system activity logs, used for monitoring and auditing
11. `JobQueue`: Represents pending tasks for data synchronization between different parts of the system
12. `SystemMetric`: Represents various system performance metrics

This briefing provides a high-level overview of the AstroBookings system, including all domains, user stories, components, and entities. It serves as a quick reference for understanding the overall structure and functionality of the platform.
