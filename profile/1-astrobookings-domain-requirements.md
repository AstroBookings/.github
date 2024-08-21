# AstroBookings: Domain Requirements

> Timestamp: 2024-08-19 14:00:00 UTC

AstroBookings is a comprehensive platform connecting space agencies with travelers for commercial space flights. It manages rocket launches, bookings, payments, and communications, ensuring a seamless experience for agencies and travelers while maintaining robust backend operations and monitoring.

## Domains

0. `Authentication`: Manages user registration, login, and access control for agencies, travelers, and employees.
1. `Agency Management`: Handles agency profiles, rockets, and launch management.
2. `Booking Management`: Manages traveler bookings, seat reservations, cancellations, and the public-facing website for showcasing launches.
3. `Financial Operations`: Handles invoicing, payments, and financial reporting.
4. `Notification System`: Manages communication with users about bookings, launches, and other events.
5. `Data Synchronization`: Allows IT employees to manage and initiate synchronization processes between databases.
6. `System Monitoring`: Provides logging and system status monitoring for IT operations.

## Roles

- `visitor`: An unregistered user browsing the platform.
- `user`: Any registered user of the system (includes agencies, travelers, and employees).
- `agency`: A space agency offering launch services.
- `traveler`: A registered user interested in booking space trips.
- `VIP traveler`: A traveler who has booked at least two trips.
- `employee`: An AstroBookings staff member managing various system operations.
- `IT employee`: A specialized employee managing technical aspects of the system.
- `system`: The AstroBookings platform itself, performing automated tasks.

## User Stories by Domain

### 0. Authentication

- As a `visitor` I want to **register an account** so that _I can access the system_
- As a `user` I want to **log in to the system** so that _I can access my account_
- As a `user` I want to **log out of the system** so that _I can ensure the security of my account_
- As the `system` I need to **generate a JWT for a validated user** so that _I can maintain their session securely_
- As the `system` I need to **validate a JWT and identify the user** so that _I can ensure secure access to protected resources_

### 1. Agency Management

- As an `agency` I want to **create and manage my profile** so that _I can offer my services_
- As an `agency` I want to **add and manage my rockets** so that _I can use them for launches_
- As an `agency` I want to **schedule new launches** so that _travelers can book seats_
- As an `agency` I want to **view the occupancy of my scheduled launches** so that _I can decide if they are viable_
- As an `agency` I want to **delay, abort, fail or mark as successful my scheduled launches** so that _I can manage their status_
- As an `agency` I want to **view a report of bookings for successful launches** so that _I can issue invoices_

### 2. Booking Management

- As a `visitor` I want to **view available launches** so that _I can choose a space trip_
- As a `visitor` I want to **register as a traveler with my contact and tax information** so that _I can book trips and receive proper invoicing from agencies_
- As a `traveler` I want to **book seats on a launch** so that _I can travel to space_
- As a `traveler` I want to **view updates on the status of my booked launch** so that _I can stay informed about my trip_
- As a `traveler` I want to **cancel my booking and receive a refund if eligible** so that _I can change my plans if necessary_

### 3. Financial Operations

- As an `employee` I want to **generate invoices for agencies based on successful launches** so that _we can charge for our services_
- As an `employee` I want to **generate invoices for agencies for aborted launches** so that _we can cover platform usage costs_
- As an `employee` I want to **track payment status of invoices** so that _we can manage our finances effectively_
- As an `employee` I want to **view a revenue report for each agency** so that _I can analyze their financial performance_
- As an `employee` I want to **generate an annual report of actual and pending revenues** so that _I can assess the overall financial health of the platform_

### 4. Notification System

- As an `agency` I want to **receive email notifications about my launches** so that _I can stay informed about their status, bookings, and cancellations_
- As a `traveler` I want to **receive email notifications about my bookings** so that _I can stay informed about cancellations, delays, or aborts of my booked launches_
- As a `VIP traveler` I want to **receive exclusive notifications about new launches** so that _I can book early_
- As an `IT employee` I want to **view the status of the notification queue** so that _I can ensure proper system operation_
- As an `IT employee` I want to **change the status of notifications** so that _I can manage the notification system effectively_

### 5. Data Synchronization

- As a `system` I want to **record the origin of each data change** so that _I can ensure accurate synchronization_
- As an `IT employee` I want to **initiate synchronization processes between databases** so that _I can maintain data consistency_
- As an `IT employee` I want to **monitor the status of data synchronization processes** so that _I can ensure they complete successfully_

### 6. System Monitoring

- As a `system` I want to **save logs of all activities** so that _I can maintain a record of what has happened_
- As an `IT employee` I want to **view system logs** so that _I can monitor system behavior_
- As an `IT employee` I want to **check the status of the notification service** so that _I can ensure it's functioning correctly_

---

## 0. Authentication

Supports user registration, login, and secure access control for all system users including agencies, travelers, and employees. Implements JWT (JSON Web Token) for maintaining secure sessions.

### 0.1 As a visitor, I want to register an account, so that I can access the system.

- Collect user information including email, password, name, and role (agency, traveler, or employee).
- Validate email uniqueness.
- Encrypt password before storage.
- Generate a confirmation email.

### 0.2 As a user, I want to log in to the system, so that I can access my account.

- Validate user credentials against stored information.
- Handle failed login attempts with appropriate error messages.
- Implement rate limiting to prevent brute force attacks.

### 0.3 As a user, I want to log out of the system to ensure the security of my account.

- Invalidate the current session.
- Clear any client-side stored session data.
- Redirect to the login page after logout.

### 0.4 As the system, I need to generate a JWT for a validated user to maintain their session securely.

- Generate a JWT upon successful login.
- Include user identifier and role in the JWT payload.
- Set an appropriate expiration time for the JWT.

### 0.5 As the system, I need to validate a JWT and identify the user to ensure secure access to protected resources.

- Implement middleware to check JWT validity for protected routes.
- Decode the JWT to extract user information.
- Handle expired or invalid JWTs appropriately.

---

## 1. Agency Management

Handles the creation and management of agency profiles, their rockets, and launch operations. Provides tools for agencies to schedule and manage their space launches.

### 1.1 As an agency, I want to create and manage my profile so that I can offer my services.

- Collect agency details including name, description, and contact information.
- Allow agencies to update their profile information.
- Implement validation for required fields.

### 1.2 As an agency, I want to add and manage my rockets so that I can use them for launches.

- Allow agencies to add new rockets with details such as name, capacity, and range.
- Provide functionality to edit and delete rocket information.
- Implement validation for rocket specifications.

### 1.3 As an agency, I want to schedule new launches so that travelers can book seats.

- Create a form for agencies to input launch details including date, destination, and associated rocket.
- Implement date validation to ensure launches are scheduled in the future.
- Associate the launch with the correct agency and rocket.

### 1.4 As an agency, I want to view the occupancy of my scheduled launches to decide if they are viable.

- Display a list of scheduled launches with their current occupancy rates.
- Show the minimum occupancy required for a launch to be viable.
- Provide sorting and filtering options for easy review.

### 1.5 As an agency, I want to delay, abort, fail or mark as successful my scheduled launches.

- Implement status change functionality for launches.
- Ensure proper validation before allowing status changes (e.g., can't mark as successful before launch date).
- Trigger appropriate notifications when launch status changes.

### 1.6 As an agency, I want to view a report of bookings for successful launches so that I can issue invoices.

- Generate a detailed report of bookings for each successful launch.
- Include information such as traveler details, number of seats booked, and total revenue.
- Provide export functionality for the report.

---

## 2. Booking Management

Manages the process of viewing available launches, booking seats, and handling cancellations for travelers. Also includes the public-facing website for showcasing upcoming launches.

### 2.1 As a visitor, I want to view available launches so that I can choose a space trip.

- Display a list of upcoming launches with basic information (date, destination, available seats).
- Implement filtering and sorting options for launches.
- Show pricing information for each launch.

### 2.2 As a visitor, I want to register as a traveler with my contact and tax information so that I can book trips and receive proper invoicing from agencies.

- Create a registration form for travelers.
- Collect necessary contact and tax information.
- Implement validation for required fields and data formats (e.g., email, tax ID).
- Store the information securely in the database.

### 2.3 As a registered traveler, I want to book seats on a launch so that I can travel to space.

- Allow selection of number of seats (up to 4 for regular travelers, up to 6 for VIP travelers).
- Implement a booking process with seat selection and payment.
- Update launch occupancy upon successful booking.
- Generate a booking confirmation.

### 2.4 As a traveler, I want to view updates on the status of my booked launch (delays, aborts, etc.) so that I can stay informed about my trip.

- Provide a dashboard for travelers to view their booked launches.
- Display current status of each booked launch.
- Implement a system to show status change history.

### 2.5 As a traveler, I want to cancel my booking and receive a refund if eligible.

- Implement a cancellation process for bookings.
- Calculate refund amount based on cancellation policy and time until launch.
- Update launch occupancy upon cancellation.
- Trigger refund process if eligible.

---

## 3. Financial Operations

Handles all financial aspects of the platform including invoicing, payment tracking, and financial reporting.

### 3.1 As an employee, I want to generate invoices for agencies based on successful launches, applying different fee rates based on agency reliability.

- Implement an invoice generation system for successful launches.
- Apply fee rates based on agency reliability (1% for new agencies, 0.8% for reliable agencies).
- Include all necessary information on the invoice (launch details, number of passengers, total revenue, fee amount).

### 3.2 As an employee, I want to generate invoices for agencies for aborted launches to cover platform usage costs.

- Create a system to generate fixed-fee invoices (1000 USD) for aborted launches.
- Include relevant details such as the aborted launch information and reason for abort if available.

### 3.3 As an employee, I want to track payment status of invoices.

- Implement a system to record and update payment status of invoices.
- Provide options to mark invoices as paid, partially paid, or overdue.
- Set up automated reminders for overdue invoices.

### 3.4 As an employee, I want to view a revenue report for each agency to analyze their financial performance.

- Generate detailed revenue reports for each agency.
- Include information such as number of launches, total revenue, fees paid, and reliability status.
- Provide options to view reports for different time periods (monthly, quarterly, annually).

### 3.5 As an employee, I want to generate an annual report of actual and pending revenues to assess the overall financial health of the platform.

- Create a comprehensive annual financial report.
- Include actual revenue received, pending payments, and projections based on scheduled launches.
- Provide a breakdown of revenue by agency and by month.
- Generate visual representations (graphs, charts) of the financial data.

---

## 4. Notification System

Manages all communications with users about bookings, launches, and other important events.

### 4.1 As an agency, I want to receive email notifications about the status, bookings, and cancellations of my launches.

- Implement an email notification system for agencies.
- Send notifications for new bookings, cancellations, and status changes of launches.
- Include relevant details in each notification (e.g., launch date, number of seats booked/cancelled).

### 4.2 As a traveler, I want to receive email notifications about my bookings, cancellations, and any delays or aborts of the launches I have booked.

- Set up an email notification system for travelers.
- Send confirmation emails for new bookings and cancellations.
- Notify travelers of any changes to their booked launches (delays, aborts, etc.).

### 4.3 As a VIP traveler, I want to receive exclusive notifications about new launches.

- Implement a system to identify VIP travelers (those who have booked at least two trips).
- Create a separate notification queue for VIP travelers.
- Send early notifications about new launches to VIP travelers.

### 4.4 As an IT employee, I want to view the status of the notification queue to ensure proper system operation.

- Create a dashboard for monitoring the notification queue.
- Display information such as number of pending notifications, successful sends, and failed attempts.
- Implement filtering and sorting options for the queue.

### 4.5 As an IT employee, I want to change the status of notifications from pending to sent or deleted to manage the notification system effectively.

- Implement functionality to manually update the status of notifications.
- Provide options to mark notifications as sent or delete them from the queue.
- Implement proper access controls to ensure only authorized employees can make these changes.

---

## 5. Data Synchronization

Manages the synchronization of data between different databases in the system to ensure consistency across all platforms.

### 5.1 As a system, I want to record the origin of each data change for accurate synchronization.

- Implement a system to track the source of each data change (e.g., which service or user action initiated the change).
- Store this information along with the change details in the synchronization queue.

### 5.2 As an IT employee, I want to initiate synchronization processes between databases.

- Create an interface for IT employees to initiate manual synchronization processes.
- Implement safeguards to prevent conflicts during synchronization.
- Provide options to synchronize specific data sets or all data.

### 5.3 As an IT employee, I want to monitor the status of data synchronization processes.

- Develop a dashboard to display ongoing and completed synchronization processes.
- Show information such as start time, completion percentage, and any errors encountered.
- Implement alerts for failed synchronization attempts.

---

## 6. System Monitoring

Provides comprehensive logging and monitoring capabilities to ensure smooth operation of the entire system.

### 6.1 As a system, I want to save logs of all activities to maintain a record of what has happened.

- Implement a robust logging system that captures all significant system events.
- Include relevant details such as timestamp, event type, and associated user/process.
- Ensure logs are stored securely and are easily searchable.

### 6.2 As an IT employee, I want to view system logs to monitor system behavior.

- Create a user interface for IT employees to view and analyze system logs.
- Implement filtering and search functionality to easily find relevant log entries.
- Provide options to export logs for further analysis.

### 6.3 As an IT employee, I want to check the status of the notification service.

- Develop a dashboard specifically for monitoring the notification service.
- Display metrics such as service
