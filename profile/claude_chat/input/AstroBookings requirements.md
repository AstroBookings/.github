# AstroBookings requirements

AstroBookings is a fictitious **space tourism** company that wants a platform for _rocket launch suppliers_ to offer tickets to book by _travel customers_.

They need to a solution for the operational needs of their financial and IT employees and also give access to suppliers and customers to use the platform.

They need something reliable and future-proof that allows us to offer our customers trips out-of-this-world.

## Functional

We work with several companies that make space trips on their passenger rockets. We call them _suppliers_.

Travelers can book seats on these rockets for offered launches through our platform. We call them _customers_.

**Suppliers** needs a web site to showcase their rockets and scheduled launches.
Each rocket has a limited capacity of passengers and destination range. It can be Low Earth Orbit, the ISS, Moon or even Mars.

Then, they can create launch offers with a price per seat.

The launch will take place from a spaceport in a specific date beyond one year. Launches may be delayed or aborted due to weather conditions, technical issues, or other reasons. Launches can be aborted 3 months before if 80% of the seats are not filled.

They want to be informed by email of the status of bookings and cancellations. They also want to see this information on the web, with the list of passengers and the amount of money collected for each launch.

Customers can see the available launches and book seats. They can cancel their bookings and receive refunds according to the conditions of the launch offer. They can also see the status of their bookings and the amount of money they have paid for each launch.
They also must be informed of the launch incidents and receive invoices and refunds according to the conditions of contracting services.

We need a landing page where we can showcase the next rocket launches with seats available so customers can book reservations in a _first-come, first-served_ way.

Any customer can book up to four seats, but VIPs can take two more. What is a VIP? Well, they are customers who have already booked two trips with us.

For every passenger booked, we need to know their name, email, phone number, and more importantly, their age must be between 18 and 65. Suppliers should be able to see this information for each booking.

Our financial employees must be able to see the status of bookings and launches to issue invoices and refunds to customers and suppliers.They are also responsible for controlling payments status for each invoice and the amount of money collected for each launch.

The IT employees must be able to manage the notifications system, to check if there are pending emails to send to customers and suppliers.

When any supplier scheduled a new launch, we want to inform our VIP customers by email, giving them a link to launch booking page where they could reserve their trips.

Every launch should have a web friendly URL that can be shared on social media inluding the rocket name, the spaceport, destination and the date of the launch.

Customers can cancel their bookings and will be refunded a portion of their money if they do so well in advance.

Of course we also want to notify our clients of any issue on the launch status.

We will charge our customers for each booking made through our platform, based on the price per seat of the launch and the number of passengers booked. We will generate and send an invoice for each booking made by a customer.

When the launch takes place, we send a document (pro-forma invoice) to the supplier with the amount collected so that they can issue us the corresponding invoice and the fees for using our platform. The supplier will use this document to issue the invoice to us.

We will charge our suppliers a fee for using our platform on each launch. The fee will be 1% of the total cost of the launch. After 2 successful launches, we will reduce the fee to 0.8%. We will generate and send an pro-forma invoice for each successful launch to a supplier.

Each invoice must have a legal date and an amount and has a payment and refund status that can be updated by our employees.

Each invoice must be related with a booking (when issued to a customer) or a launch (when is a pro-forma issued to a supplier) and must hace a recipient (customer or us) and a issuer (us or the supplier).

Each invoice must have a unique number that can be used to identify it.

Each invoice can have payments records that can be updated by our employees.

Each invoice should be sent by email to the recipient.

Customers and suppliers should provide a payment method (credit card or bank account right now) with the corresponding number.

If a customer cancels the booking, we and the supplier will refund a portion of the money in certain situations. The amount will be 90% of the total cost if the cancellation is made 1 year before the launch, and 70% if it is made 3 months before. After that, the customer will not be refunded and seats will be considered sold due to the preparation time of the launch.

A launch offer will be canceled if 20% of the seats are not filled 3 months before the launch date. In this case, we will refund the money to customers and charge the supplier with 1000USD for each booking sold for the operative costs.

## Technical

Here is a not exhaust list of requirements for our system.

### Development

Our technology stack is based on Node servers and Postgres and Mongo databases.

Would like to have web applications made with latest Angular versions and API services with Nest.js.

We use a managed git repository where we can have a trace of the evolution of the code and the history of functional evolutionary changes.

We want to have a model of the domain that represents the entities and their relationships; regardless of being a relational or non-relational database.

We want to have a system diagram (in ASCII art) that shows the different deployable modules and how they communicate with each other.

Write clean code with comments and documentation that can be understood by any developer.

### Testing

The code must be supported by tests.

We want to have unit tests with Jest for the business logic at front and back end.

We want to have integration tests with Cypress for the API services.

We want to have end-to-end tests with Cypress for the web applications.

### Deployment

Code that passes the tests should be ready for automatic transition to production.

### Scalability

The system should allow being run on different concurrent processes to scale as much as the level of operations need it.

Customer operations should be separated from supplier or employee operations to allow the system to scale independently.

Use an admin API for managing the relational data in the Postgres database used by suppliers and employees portals.

Use an simple API for accessing a MongoDB database where read the information and write the changes for the customers web application.

Use also a dedicated API with a MongoDB database to store core system info like user credentials, synchronization messages, and log entries with a simple web app for IT operators to check them.

Write a job scheduler that uses former data to send emails to suppliers and customers, and to conciliate relational and NoSQL databases of any change.

### Security

Anonymous access should be allowed to visitors and bots of the customer web app. They should be able to see the launches with available seats.

Any supplier, customer or employee must be an authenticated user to access the system.

Any user must have a role to access the system.

Users are identified by their email and password.

### Reliability

The system should generate proper logs to trace its behavior. It should perform a fast startup and shutdown process to increase our uptime percentage.
