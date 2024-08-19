# Domains and teams

## 0. Auth Users (auth-users)

### Requirements

1. Allow the user to register.
2. Allow the user to log in.
3. Generate a token for the user to authenticate.
4. Validate the token to authenticate the user.

## 1. Suppliers

### Requirements

1. Register with tax information for invoicing.
2. Add rockets with capacity and range.
3. View launch status and financial information for all rockets.
4. Schedule a launch on a rocket with a date and price.
5. View passengers and financial information for a launch.
6. Delay or abort a launch, for an specific reason.

## 2. Customers

### Requirements

1. View launches with available seats.
2. Register as a customer with tax information for invoicing.
3. Book seats on a launch for several passengers.
4. Add age and contact information for each passenger.
5. View launch status and financial information for a booking.
6. Cancel a booking, for an specific reason

## 3. Financial

### Requirements

1. Generate invoices to customers for having booked seats on a launch.
2. Generate invoices to suppliers for using platforms and services after launching (abort or success).
3. Generate refund invoice to customers for refunds after an aborted launch.
4. Add invoices received from suppliers for successful launches.
5. Set invoices as paid.
6. View financial information for a launch.

## 4. Operations

### Requirements

1. View logs for all operations.
2. Synchronize launch status on customers database.
3. Synchronize booking status on suppliers database.
