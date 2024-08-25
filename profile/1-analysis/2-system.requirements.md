# AstroBookings: Domain Requirements

> Timestamp: 2024-08-19 14:00:00 UTC

AstroBookings systems are designed to be developed, deployed, and maintained in a modular fashion. To do so, we will use an architecture, with separate components for web applications, API services, databases, and external services.

This approach allows for better scalability, maintainability, and flexibility in the system. The project is divided into seven main domains, each with specific requirements that cater to different user roles and system functionalities.

## Data storage

Operational data (launches, bookings, invoices and notifications) will be stored in a **relational** database, while user profiles, authentication data, system logs, and synchronization operations will be stored in a **document** database.

A cache database will provide quick data access for the public website and traveler portal.

For implementing the databases, we will use `Postgres` for the relational database and `MongoDB` for the document database.

## API Services

In order to facilitate communication between the various components of the system, we will develop a set of API services. These services will handle authentication, authorization, system-wide operations, booking management, and notifications.

Services will be designed to be stateless, allowing for easy scaling and fault tolerance. They will communicate using **RESTful APIs** and will be secured using industry-standard encryption and authentication mechanisms.

For implementing the API services, we will use `NestJS`, a modern Node.js framework that provides a robust set of tools for building scalable and maintainable server-side applications.

## Web Applications

There will be a suite of web applications targeting different user roles and functionalities. These applications will provide **user interfaces** for authentication, agency management, booking management, financial operations, system monitoring, and data synchronization.

Web applications will be built using `Angular`, a popular front-end framework that provides a rich set of tools for building responsive and interactive web applications.

---

## [🚀 AstroBookings](https://github.com/AstroBookings)
