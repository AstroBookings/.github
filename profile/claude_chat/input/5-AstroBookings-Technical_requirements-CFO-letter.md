Hello, my name is Bill Jobs and I am the Chief Technology Officer of Astro Bookings.

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

Any supplier, customer or department employee must be authenticated to access the system.

Any user must be identified by an email and a password and have an specific role.

### Reliability

The system should generate proper logs to trace its behavior. It should perform a fast startup and shutdown process to increase our uptime percentage.

Notifications will be sent with an external service, we must have a log of the status of the notification.

Operational data should be stored in a relational database.

Informational and operational customer data should be stored in a non-relational database.

We need a job scheduler that sends emails to suppliers and customers, and conciliates relational and NoSQL databases of any change.

System logs and user credentials should be also stored in a non-relational database.

The It department should have a web application to check the status of the system and the logs.

That is all for now. In case of doubt try to adhere to the _twelve-factor app methodology_, and ask me any other questions that are left behind.

> Bill Jobs, Astro Bookings C.T.O.
