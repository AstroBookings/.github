# AstroBookings: Operations Schema

This schema describes the relational `📇 OperationsDB` of the AstroBookings platform.

## Entities

```mermaid
erDiagram

    Traveler {
        string user_id PK,FK
        string contact_phone
        string emergency_contact
        json travel_preferences
    }

    Agency {
        string user_id PK,FK
        string name
        string description
        string tax_id
        string address
        string contact_info
    }

    Rocket {
        string id PK
        string agency_id FK
        string name
        int capacity
        enum range
    }

    Launch {
        string id PK
        string agency_id FK
        string rocket_id FK
        datetime launch_on
        string destination
        decimal price_per_seat
        enum status
    }

    Booking {
        string id PK
        string traveler_id FK
        string launch_id FK
        int number_of_seats
        decimal total_price
        datetime booked_at
        enum status
    }

    Invoice {
        string id PK
        string agency_id FK
        string launch_id FK
        decimal amount
        string legal_number
        datetime issued_on
        enum status
    }

    Payment {
        string id PK
        string invoice_id FK
        decimal amount
        datetime paid_on
        enum status
    }

    Notification {
        string id PK
        string template_id FK
        string agency_id FK
        string launch_id FK
        string traveler_id FK
        string booking_id FK
        string invoice_id FK
        string recipient_email
        string subject
        string message
        datetime timestamp
        enum status
    }

    Template {
        string id PK
        string name
        string subject
        string message
    }

    Agency ||--|{ Rocket : owns
    Agency ||--|{ Launch : schedules
    Agency ||--o{ Invoice : "is billed by"
    Agency o|--o{ Notification : receives
    Rocket ||--o{ Launch : "is used in"
    Launch ||--o{ Booking : has
    Launch ||--o| Invoice : generates
    Launch o|--|{ Notification : triggers
    Booking o|--|{ Notification : triggers
    Traveler ||--o{ Booking : makes
    Traveler o|--o{ Notification : receives
    Invoice ||--o{ Payment : "is paid by"
    Invoice o|--|| Notification : triggers
    Template ||--o{ Notification : "is used in"

```

## PostgreSQL Tables and Schemas

### Travelers Table

```sql
CREATE TABLE IF NOT EXISTS travelers (
  user_id TEXT PRIMARY KEY,
  contact_phone TEXT,
  emergency_contact TEXT,
  travel_preferences JSON
);
```

### Agencies Table

```sql
DROP TABLE IF EXISTS agencies CASCADE;
CREATE TABLE IF NOT EXISTS agencies (
  user_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  tax_id TEXT NOT NULL,
  address TEXT NOT NULL,
  contact_info TEXT
);
```

### Rockets Table

```sql
DROP TABLE IF EXISTS rockets CASCADE;
CREATE TABLE IF NOT EXISTS rockets (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id TEXT NOT NULL REFERENCES agencies(user_id),
  name TEXT NOT NULL,
  capacity INT DEFAULT 8,
  range TEXT CHECK (range IN ('low-earth-orbit', 'geostationary', 'interplanetary'))
);
```

### Launches Table

```sql
DROP TABLE IF EXISTS launches CASCADE;
CREATE TABLE IF NOT EXISTS launches (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id TEXT NOT NULL REFERENCES agencies(user_id),
  rocket_id TEXT NOT NULL REFERENCES rockets(id),
  launch_on DATE NOT NULL,
  destination TEXT NOT NULL,
  price_per_seat NUMERIC NOT NULL,
  status TEXT CHECK (status IN ('scheduled', 'launched', 'aborted'))
);
```

### Bookings Table

```sql
DROP TABLE IF EXISTS bookings CASCADE;
CREATE TABLE bookings (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  traveler_id TEXT NOT NULL REFERENCES travelers(user_id),
  launch_id TEXT NOT NULL REFERENCES launches(id),
  number_of_seats INT DEFAULT 1,
  booked_at TIMESTAMP DEFAULT NOW(),
  status TEXT CHECK (status IN('reserved', 'cancelled', 'launched', 'aborted'))
);
```

### Invoices Table

```sql
DROP TABLE IF EXISTS invoices CASCADE;
CREATE TABLE invoices (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id TEXT REFERENCES agencies(user_id),
  launch_id TEXT REFERENCES launches(id),
  amount NUMERIC NOT NULL,
  legal_number TEXT NOT NULL,
  issued_on DATE DEFAULT NOW(),
  status TEXT CHECK (status IN ('pending', 'paid', 'cancelled'))
);
```

### Payments Table

```sql
DROP TABLE IF EXISTS payments CASCADE;
CREATE TABLE payments (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_id TEXT NOT NULL REFERENCES invoices(id),
  amount NUMERIC,
  paid_on DATE DEFAULT NOW(),
  status TEXT CHECK (status IN ('paid', 'failed'))
);
```

### Notifications Table

```sql
DROP TABLE IF EXISTS notifications CASCADE;
CREATE TABLE notifications (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  template_id TEXT NOT NULL REFERENCES templates(id),
  agency_id TEXT REFERENCES agencies(user_id),
  launch_id TEXT REFERENCES launches(id),
  traveler_id TEXT REFERENCES travelers(user_id),
  booking_id TEXT REFERENCES bookings(id),
  invoice_id TEXT REFERENCES invoices(id),
  recipient_email TEXT NOT NULL,
  subject TEXT NOT NULL,
  message TEXT NOT NULL,
  timestamp TIMESTAMP DEFAULT NOW(),
  status TEXT CHECK (status IN ('pending', 'read', 'sent', 'failed'))
);

```

### Templates Table

```sql
DROP TABLE IF EXISTS templates CASCADE;
CREATE TABLE templates (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  subject TEXT NOT NULL,
  message TEXT NOT NULL
);
```
