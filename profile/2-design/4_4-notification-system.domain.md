# 🚀 AstroBookings: 📝 Notification System Domain

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

- `📇 OperationsDB`: Stores notification queue and user communication preferences.

### 👽 External Services

- `👽 EmailSvc`: For sending notifications.

## Component Interfaces

```mermaid
graph TD
    subgraph WebApplications[ ]
        AuthWeb(0 - AuthWeb)
        SystemWeb(4 - SystemWeb)
    end

    subgraph APIServices[ ]
        SystemAPI[0 - SystemAPI]
        NotifyAPI[4 - NotifyAPI]
    end

    subgraph Databases[ ]
        OperationsDB[(1 - OperationsDB)]
    end

    subgraph ExternalServices[ ]
        EmailSvc[1 - EmailSvc]
    end

    %% Web to Web connections
    SystemWeb <-.-> AuthWeb

    %% Web to API connections
    SystemWeb --> NotifyAPI

    %% API to API connections
    NotifyAPI --> SystemAPI

    %% API to Database connections
    NotifyAPI --> OperationsDB

    %% API to External Service connections
    NotifyAPI --> EmailSvc

    %% Style
    classDef web fill:#FF9999,stroke:#333,stroke-width:2px;
    classDef api fill:#C1E1C1,stroke:#333,stroke-width:2px;
    classDef db fill:#ADD8E6,stroke:#333,stroke-width:2px;
    classDef ext fill:#E6E6FA,stroke:#333,stroke-width:2px;
    class SystemWeb web;
    class NotifyAPI api;
    class OperationsDB db;
```

This diagram illustrates the interfaces between the components involved in the Notification System domain:

1. SystemWeb interacts with NotifyAPI for notification management.
2. NotifyAPI interacts with OperationsDB for storing and retrieving notification data.
3. NotifyAPI connects to the external EmailSvc for sending email notifications.

## Related Entities

1. `Notification`:

   - Represents messages sent to system users about various events.
   - Contains fields such as id, recipient_email, subject, message, timestamp, status.

> Other related entities include `Agency` or `Traveler`, and `Launch` , `Booking` or `Invoice`, which are not directly involved in the notification system but are relevant for sending notifications to the respective users.

2. `User`:

   - Represents system users as a generalization for agencies or travelers
   - Contains fields such as id, email, name, role.

3. `Launch`, `Booking`, or `Invoice`:

   - Relevant entities related to the events for which notifications are sent.
   - Provide context for the notifications being sent.

4. `Template`:

   - Contains predefined message templates for notifications.
   - Includes fields such as id, name, subject, message.

### Entity Relationship Diagram

```mermaid
erDiagram
   User {
        string id PK
        string email
        string password_hash
        string name
        enum role "traveler, agency, finance, it"
    }

    Traveler {
        string user_id PK,FK
        string contact_phone
        string contact_email
    }

    Agency {
        string user_id PK,FK
        string contact_email
    }

    Launch {
        string id PK
        string agency_id FK
        datetime date
        string destination
        enum status "scheduled, confirmed, launched, delayed, aborted"
    }

    Booking {
        string id PK
        string traveler_id FK
        string launch_id FK
        int number_of_seats
        decimal total_price
        enum status "pending, confirmed, canceled"
    }

    Invoice {
        string id PK
        string number
        string agency_id FK
        string launch_id FK
        decimal amount
        datetime issued_at
        enum status "pending, paid, failed"
    }

     Notification {
        string id PK
        string user_id FK
        string template_id FK
        string subject
        string message
        json data
        datetime created_at
        datetime updated_at
        enum status "pending, read, sent, failed"
    }

    Template {
        string id PK
        enum event_name "launch_scheduled, launch_confirmed, launch_launched, launch_delayed, launch_aborted, booking_confirmed, booking_canceled, invoice_issued"
        string subject
        string message
    }

   User ||--o{ Notification : "can receive"
   Template ||--o{ Notification : "can be used in"
```

This ERD shows the following relationships:

- A `User` can have multiple `Notification` messages.
- A `Template` can be used in multiple `Notification` messages.

> [!NOTE]
>
> > In order to fill the subject and message fields of the `Notification` entity, we need to use the several entities involved in the booking and launch process, but not directly related to the `Notification` entity itself.

---

## [🚀 AstroBookings](https://github.com/AstroBookings)
