# 🚀 AstroBookings: 🧑‍🔬 Domain Requirements

> Timestamp: 2024-08-19 14:00:00 UTC

🚀 **AstroBookings** is a comprehensive platform connecting space agencies with travelers for commercial space flights. It manages rocket launches, bookings, payments, and communications, ensuring a seamless experience for agencies and travelers while maintaining robust backend operations and monitoring.

## Overview

### Domains

0. [Authentication](#0-authentication): Manages user registration, login, and access control for agencies, travelers, and employees.
1. [Agency Management](#1-agency-management): Handles agency profiles, rockets, and launch management.
2. [Booking Management](#2-booking-management): Manages traveler bookings, seat reservations, cancellations, and the public-facing website for showcasing launches.
3. [Financial Operations](#3-financial-operations): Handles invoicing, payments, and financial reporting.
4. [Notification System](#4-notification-system): Manages communication with users about bookings, launches, and other events.
5. [Data Synchronization](#5-data-synchronization): Allows IT employees to manage and initiate synchronization processes between databases.
6. [System Monitoring](#6-system-monitoring): Provides logging and system status monitoring for IT operations.

### Roles

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

## [🧑‍🔬 Detailed requirements for each domain](./1_1-domain-details.requirements.md)

---

## [🚀 AstroBookings](https://github.com/AstroBookings)
