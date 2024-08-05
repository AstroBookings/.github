# Use Cases and User Stories

## Actors

- Supplier
- Customer
- VIP Customer
- Financial Employee
- IT Employee
- Anonymous Visitor

## Use Cases

### Schedule Launch

- **Actors**: `Supplier`
- **Description**: Supplier schedules a new rocket launch
- **Preconditions**: Supplier is authenticated and authorized
- **Normal flow**:

  1. Supplier enters rocket details (capacity, destination range)
  2. Supplier enters launch details (date, spaceport, price per seat)
  3. System validates the information
  4. System creates the launch offer
  5. System notifies VIP customers about the new launch

**Postconditions**: New launch is scheduled and available for booking

### Book Launch

**Actors**: `Customer`, `VIP Customer`
**Description**: Customer books seats for a launch
**Preconditions**: Customer is authenticated and authorized
**Normal flow**:

1. Customer selects a launch
2. Customer specifies number of seats (up to 4, or 6 for VIP)
3. Customer enters passenger details (name, email, phone, age)
4. System validates the information
5. System processes the booking
6. System generates and sends an invoice

**Postconditions**: Seats are booked, and invoice is sent to the customer

### Cancel Booking

**Actors**: `Customer`, `VIP Customer`
**Description**: Customer cancels a booking
**Preconditions**: Customer has an existing booking
**Normal flow**:

1. Customer selects a booking to cancel
2. System calculates refund amount based on cancellation time
3. System processes the cancellation
4. System issues a refund if applicable

**Postconditions**: Booking is cancelled, and refund is processed if applicable

### Manage Invoices

**Actors**: `Financial Employee`
**Description**: Financial employee manages invoices and payments
**Preconditions**: Employee is authenticated and authorized
**Normal flow**:

1. Employee views list of invoices
2. Employee updates payment status for invoices
3. Employee processes refunds for cancellations

**Postconditions**: Invoice and payment statuses are updated

### Manage Notifications

**Actors**: `IT Employee`
**Description**: IT employee manages the notification system
**Preconditions**: Employee is authenticated and authorized
**Normal flow**:

1. Employee checks pending notifications
2. Employee resolves any issues with email sending
3. Employee monitors notification logs

**Postconditions**: Notifications are sent and system is functioning correctly

## User Stories

### Supplier Launch Management

As a `supplier`, I want to create launch offers, so that I can sell seats on my rockets.

**Acceptance criteria**:

1. Can enter rocket details including capacity and destination range
2. Can schedule launches with date, spaceport, and price per seat
3. Receive email notifications about booking status
4. Can view list of passengers and money collected for each launch

### Customer Booking

As a `customer`, I want to book seats on available launches, so that I can travel to space.

**Acceptance criteria**:

1. Can view available launches
2. Can book up to 4 seats (6 for VIP customers)
3. Can enter passenger details for each seat
4. Receive booking confirmation and invoice via email
5. Can view booking status and payment information

### Financial Management

As a `financial employee`, I want to manage bookings and launches, so that I can handle invoices and refunds.

**Acceptance criteria**:

1. Can view status of all bookings and launches
2. Can issue invoices to customers
3. Can process refunds for cancellations
4. Can update payment status for invoices
5. Can generate pro-forma invoices for suppliers

### IT System Management

As an `IT employee`, I want to manage the notification system, so that all users receive timely updates.

**Acceptance criteria**:

1. Can view pending notifications
2. Can troubleshoot email sending issues
3. Can monitor notification logs
4. Can manage user roles and access

### Anonymous Launch Browsing

As an `anonymous visitor`, I want to view upcoming launches, so that I can plan my space travel.

**Acceptance criteria**:

1. Can access the landing page without authentication
2. Can view list of upcoming launches with available seats
3. Can see launch details including rocket, destination, date, and price
