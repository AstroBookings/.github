# AstroBookings Use Cases

## Actors

- `Supplier`: Space tourism companies that offer rocket launches
- `Customer`: Travelers who book seats on rocket launches
- `VIP Customer`: Customers who have booked at least two trips
- `Financial Employee`: AstroBookings staff managing financial operations
- `IT Employee`: AstroBookings staff managing IT operations
- `System`: The AstroBookings platform

## Use Cases

1. **Manage Rockets**: Suppliers can add and manage their rockets
2. **Schedule Launch**: Suppliers can create launch offers
3. **View Launch Status**: Suppliers can view booking status and passenger lists
4. **Browse Launches**: Customers can view available launches
5. **Book Launch**: Customers can book seats on launches
6. **Cancel Booking**: Customers can cancel their bookings
7. **Manage VIP Status**: System tracks and updates customer VIP status
8. **Process Payments**: System handles payments for bookings
9. **Issue Refunds**: Financial Employees process refunds for cancellations
10. **Manage Notifications**: IT Employees manage the notification system
11. **Generate Invoices**: System generates invoices for bookings and launches
12. **Manage Financial Records**: Financial Employees oversee financial transactions
13. **Update Launch Status**: Suppliers can update launch status (delay, abort)

## Use Cases Details

### 1. Manage Rockets

- **Actors**: `Supplier`, `System`
- **Description**: Suppliers can add and manage their rocket inventory
- **Preconditions**: Supplier is authenticated and authorized
- **Normal flow**:
  1. `Supplier` accesses the rocket management interface
  2. `Supplier` enters rocket details (capacity, destination range)
  3. `System` validates and stores the information
- **Postconditions**: New rocket is added to the supplier's inventory

### 2. Schedule Launch

- **Actors**: `Supplier`, `System`, `VIP Customer`
- **Description**: Suppliers can create new launch offers
- **Preconditions**: Supplier is authenticated and has registered rockets
- **Normal flow**:
  1. `Supplier` selects a rocket from their inventory
  2. `Supplier` enters launch details (date, spaceport, price per seat)
  3. `System` validates the information
  4. `System` creates the launch offer
  5. `System` notifies `VIP Customer` about the new launch
- **Postconditions**: New launch is scheduled and available for booking

### 3. View Launch Status

- **Actors**: `Supplier`, `System`
- **Description**: Suppliers can view booking status and passenger lists for their launches
- **Preconditions**: Supplier is authenticated and has scheduled launches
- **Normal flow**:
  1. `Supplier` selects a scheduled launch
  2. `System` displays booking status, passenger list, and revenue information
- **Postconditions**: Supplier is informed about the launch status

### 4. Browse Launches

- **Actors**: `Customer`, `System`
- **Description**: Customers can view available launches
- **Preconditions**: None
- **Normal flow**:
  1. `Customer` accesses the launch browsing interface
  2. `System` displays a list of available launches with details
- **Postconditions**: Customer is informed about available launches

### 5. Book Launch

- **Actors**: `Customer`, `System`
- **Description**: Customers can book seats on available launches
- **Preconditions**: Customer is authenticated and launch has available seats
- **Normal flow**:
  1. `Customer` selects a launch and number of seats (up to 4, or 6 for VIPs)
  2. `Customer` provides passenger details (name, email, phone, age)
  3. `System` validates the information
  4. `System` processes the booking and payment
  5. `System` sends confirmation to the customer
- **Postconditions**: Seats are booked and customer is charged

### 6. Cancel Booking

- **Actors**: `Customer`, `System`
- **Description**: Customers can cancel their bookings
- **Preconditions**: Customer has an active booking
- **Normal flow**:
  1. `Customer` selects a booking to cancel
  2. `System` calculates the refund amount based on cancellation policy
  3. `Customer` confirms the cancellation
  4. `System` processes the cancellation and initiates refund
- **Postconditions**: Booking is cancelled and refund is processed if applicable

### 7. Manage VIP Status

- **Actors**: `System`
- **Description**: System tracks and updates customer VIP status
- **Preconditions**: Customer has completed bookings
- **Normal flow**:
  1. `System` tracks the number of completed trips for each customer
  2. `System` updates customer status to VIP after two completed trips
- **Postconditions**: Customer VIP status is updated

### 8. Process Payments

- **Actors**: `System`, `Customer`
- **Description**: System handles payments for bookings
- **Preconditions**: Customer has selected seats to book
- **Normal flow**:
  1. `System` calculates the total cost based on seat price and number of seats
  2. `Customer` provides payment information
  3. `System` processes the payment
  4. `System` confirms the successful transaction
- **Postconditions**: Payment is processed and booking is confirmed

### 9. Issue Refunds

- **Actors**: `Financial Employee`, `System`, `Customer`
- **Description**: Financial Employees process refunds for cancellations
- **Preconditions**: A booking has been cancelled
- **Normal flow**:
  1. `System` calculates the refund amount based on cancellation policy
  2. `Financial Employee` reviews and approves the refund
  3. `System` processes the refund to the customer's payment method
  4. `System` notifies the `Customer` about the processed refund
- **Postconditions**: Refund is processed and customer is notified

### 10. Manage Notifications

- **Actors**: `IT Employee`, `System`
- **Description**: IT Employees manage the notification system
- **Preconditions**: IT Employee is authenticated and authorized
- **Normal flow**:
  1. `IT Employee` accesses the notification management interface
  2. `System` displays pending notifications and system status
  3. `IT Employee` can view, edit, or trigger notifications
- **Postconditions**: Notifications are managed and system is updated

### 11. Generate Invoices

- **Actors**: `System`, `Customer`, `Supplier`
- **Description**: System generates invoices for bookings and launches
- **Preconditions**: A booking is made or a launch is completed
- **Normal flow**:
  1. `System` generates an invoice with a unique number
  2. `System` includes all relevant details (booking/launch info, amounts, dates)
  3. `System` sends the invoice to the respective `Customer` or `Supplier`
- **Postconditions**: Invoice is generated and sent to the relevant party

### 12. Manage Financial Records

- **Actors**: `Financial Employee`, `System`
- **Description**: Financial Employees oversee financial transactions
- **Preconditions**: Financial Employee is authenticated and authorized
- **Normal flow**:
  1. `Financial Employee` accesses the financial management interface
  2. `System` displays financial records, including bookings, launches, payments, and refunds
  3. `Financial Employee` can review, update, or generate reports on financial data
- **Postconditions**: Financial records are managed and up-to-date

### 13. Update Launch Status

- **Actors**: `Supplier`, `System`, `Customer`
- **Description**: Suppliers can update launch status (delay, abort)
- **Preconditions**: Supplier is authenticated and has scheduled launches
- **Normal flow**:
  1. `Supplier` selects a launch to update
  2. `Supplier` changes the launch status (delay or abort)
  3. `System` updates the launch information
  4. `System` notifies affected `Customer`s about the change
- **Postconditions**: Launch status is updated and customers are notified
