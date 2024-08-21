# AstroBookings: Notification System Domain

> Timestamp: 2024-08-21 13:00:00 UTC

The Notification System domain in AstroBookings manages communication with users about bookings, launches, and other events. It ensures that agencies, travelers, and employees receive timely and relevant information.

## User Stories

### 4.1 As an agency, I want to receive email notifications about my launches so that I can stay informed about their status, bookings, and cancellations.

- Implement email notifications for agencies regarding launch status updates.
- Send notifications about new bookings and cancellations for their launches.
- Include relevant details such as launch date, number of seats booked/cancelled.

### 4.2 As a traveler, I want to receive email notifications about my bookings so that I can stay informed about cancellations, delays, or aborts of my booked launches.

- Set up email notifications for travelers regarding their bookings.
- Send notifications about any changes to their booked launches (delays, aborts, etc.).
- Include essential information like updated launch times, refund details (if applicable).

### 4.3 As a VIP traveler, I want to receive exclusive notifications about new launches so that I can book early.

- Implement a system to identify VIP travelers.
- Create a separate notification process for VIP travelers.
- Send early notifications about new launches to VIP travelers.

### 4.4 As an IT employee, I want to view the status of the notification queue so that I can ensure proper system operation.

- Create a dashboard for monitoring the notification queue.
- Display information such as number of pending notifications, successful sends, and failed attempts.
- Implement filtering and sorting options for the queue.

### 4.5 As an IT employee, I want to change the status of notifications so that I can manage the notification system effectively.

- Implement functionality to manually update the status of notifications.
- Provide options to mark notifications as sent or deleted.
- Implement proper access controls for these actions.

## Affected Components

### 🌐 Web Applications

- `🌐 SystemWeb`: Administrative interface for AstroBookings employees.

### 🧑‍💼 API Services

- `🧑‍💼 NotifyAPI`: Handles email notifications.

### 📇 Databases

- `📇 SystemDB`: Stores notification queue and user communication preferences.

### 👽 External Services

- `👽 EmailSvc`: For sending notifications.

## Component Interfaces

```mermaid
graph TD
    subgraph Web Applications
        AuthWeb(0 - AuthWeb)
        SystemWeb(4 - SystemWeb)
    end

    subgraph API Services
        SystemAPI[0 - SystemAPI]
        NotifyAPI[4 - NotifyAPI]
    end

    subgraph Databases
        SystemDB[(0 - SystemDB)]
    end

    subgraph External Services
        EmailSvc[1 - EmailSvc]
    end

    %% Web to Web connections
    SystemWeb <-.-> AuthWeb

    %% Web to API connections
    SystemWeb --> NotifyAPI

    %% API to Database connections
    NotifyAPI --> SystemDB

    %% API to External Service connections
    NotifyAPI --> EmailSvc

    %% Style
    classDef web fill:#FF9999,stroke:#333,stroke-width:2px;
    classDef api fill:#C1E1C1,stroke:#333,stroke-width:2px;
    classDef db fill:#ADD8E6,stroke:#333,stroke-width:2px;
    classDef ext fill:#E6E6FA,stroke:#333,stroke-width:2px;
    class SystemWeb web;
    class NotifyAPI api;
    class SystemDB db;
```

This diagram illustrates the interfaces between the components involved in the Notification System domain:

1. SystemWeb interacts with NotifyAPI for notification management.
2. NotifyAPI interacts with SystemDB for storing and retrieving notification data.
3. NotifyAPI connects to the external EmailSvc for sending email notifications.

## Related Entities

1. `User`:

   - Represents system users such as agencies, travelers, and employees.
   - Contains fields such as id, email, password_hash, name, role.

2. `Notification`:

   - Represents messages sent to system users about various events.
   - Contains fields such as id, user_id, message, timestamp, status.

### Entity Relationship Diagram

```mermaid
erDiagram
    User {
        int id PK
        string email
        string password_hash
        string name
        enum role
    }

    Notification {
        int id PK
        int user_id FK
        string message
        datetime timestamp
        enum status
    }
```

This ERD shows the following relationships:

- A `User` can have multiple `Notification` messages.

---

## [🚀 AstroBookings](https://github.com/AstroBookings)
