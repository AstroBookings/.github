Hello, my name is Bill Jobs, and I am the Chief Technology Officer of Astro Bookings.

Here is a not exhaustive list of requirements for our system.

## Development

Our technology stack is based on Node servers and `Postgres` and `Mongo` databases.

We want web applications with the latest `Angular` versions and API services with Nest.js.

We want to have a model of the domain that represents the entities and their relationships, regardless of whether they are relational or non-relational databases.

We want a system diagram (in mermaid syntax) showing the different deployable components and how they communicate.

Write clean code with comments and documentation that any developer can understand.

### Testing

The code must be supported by tests.

We want to have unit tests with `Jest` for the business logic at the front and back end.

We want to have integration tests with `Cypress` for the API services.

We want to have end-to-end tests with `Cypress` for the web applications.

## Deployment

The code that passes the tests should be ready for automatic transition to production.

### Scalability

The system must allow different concurrent processes to run to scale as much as the level of operations requires. In addition, there will be several development teams in parallel. Therefore, we need multiple applications and API services that can be deployed independently.

There will be a single relational database, with all the relevant information for offer, reservation and invoicing operations.

The data for the sales service and application must also be stored in MongoDB, so that it is very fast to read offers and write reservations.

We need a work queue system where services note changes that need to be synchronized between both databases.

## Security

Visitors and bots of the selling web app should be allowed anonymous access. They must be able to see the launches with available seats.

We need a user authentication system based on email and password. It will be used by agencies, travelers, and employees apps and services.

We want that system completely separated from the operational one. So we want a web app, an API service just for user authentication.

The Auth app should be responsible for registering and validating the users' credentials.

The auth service should be responsible validation and persistence of the user credentials.

Data should be sabed in a documental database called core.

Any agency, traveler, or employee must be able to log in to the system with their email and password and have its profile information stored in the main relational database.

### Reliability

The system should generate proper logs to trace its behavior. For security and speed reasons, we want to store the logs in the Core MongoDB database.

The system should call a notification service that sends emails to travelers and agencies when they book or cancel a reservation.

The IT department should have a web application to check the status of the notifications service and the full system logs.

That is all for now. In case of doubt try to adhere to the _twelve-factor app methodology_, and ask me any other questions that are left behind.

> Bill Jobs, Astro Bookings C.T.O.
