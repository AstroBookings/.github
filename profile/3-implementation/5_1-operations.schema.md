# AstroBookings: Operations Schema

This schema describes the relational `📇 OperationsDB` of the AstroBookings platform.

## Entities

```mermaid
erDiagram

    Traveler {
        int user_id PK,FK
        string contact_phone
        string emergency_contact
        json travel_preferences
    }

    Agency {
        int user_id PK,FK
        string name
        string description
        string tax_id
        string address
        string contact_info
    }

    Rocket {
        int id PK
        int agency_id FK
        string name
        int capacity
        enum range
    }

    Launch {
        int id PK
        int agency_id FK
        int rocket_id FK
        datetime launch_on
        string destination
        decimal price_per_seat
        enum status
    }

    Booking {
        int id PK
        int traveler_id FK
        int launch_id FK
        int number_of_seats
        decimal total_price
        datetime booked_at
        enum status
    }

    Invoice {
        int id PK
        int agency_id FK
        int launch_id FK
        decimal amount
        string legal_number
        datetime issued_on
        enum status
    }

    Payment {
        int id PK
        int invoice_id FK
        decimal amount
        datetime paid_on
        enum status
    }

    Agency ||--|{ Rocket : owns
    Agency ||--|{ Launch : schedules
    Agency ||--o{ Invoice : "is billed by"
    Rocket ||--o{ Launch : "is used in"
    Launch ||--o{ Booking : has
    Launch ||--o| Invoice : generates
    Traveler ||--o{ Booking : makes
    Invoice ||--o{ Payment : "is paid by"
```

## PostgreSQL Tables and Schemas

### Travelers Table

This schema describes the relational `📇 OperationsDB` of the AstroBookings platform.

### Travelers Table

```sql
CREATE TABLE IF NOT EXISTS travelers (
  user_id BIGINT PRIMARY KEY,
  contact_phone TEXT,
  emergency_contact TEXT,
  travel_preferences JSON
);
```

### Agencies Table

```sql
CREATE TABLE IF NOT EXISTS agencies (
  user_id BIGINT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  tax_id TEXT NOT NULL,
  address TEXT NOT NULL,
  contact_info TEXT
);
```

### Rockets Table

```sql
CREATE TABLE IF NOT EXISTS rockets (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  agency_id BIGINT NOT NULL REFERENCES agencies(user_id),
  name TEXT NOT NULL,
  capacity INT DEFAULT 8,
  range TEXT CHECK (range IN ('low-earth-orbit', 'geostationary', 'interplanetary'))
);
```

### Launches Table

```sql
CREATE TABLE IF NOT EXISTS launches (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  agency_id BIGINT NOT NULL REFERENCES agencies(user_id),
  rocket_id BIGINT NOT NULL REFERENCES rockets(id),
  launch_on DATE NOT NULL,
  destination TEXT NOT NULL,
  price_per_seat NUMERIC NOT NULL,
  status TEXT CHECK (status IN ('scheduled', 'launched', 'aborted'))
);
```

### Bookings Table

```sql
CREATE TABLE bookings (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  traveler_id BIGINT NOT NULL REFERENCES travelers(user_id),
  launch_id BIGINT NOT NULL REFERENCES launches(id),
  number_of_seats INT DEFAULT 1,
  booked_at TIMESTAMP DEFAULT NOW(),
  status TEXT CHECK (status IN('reserved', 'cancelled', 'launched', 'aborted'))
);
```

### Invoices Table

```sql
CREATE TABLE invoices (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  agency_id BIGINT REFERENCES agencies(user_id),
  launch_id BIGINT REFERENCES launches(id),
  amount NUMERIC NOT NULL,
  legal_number TEXT NOT NULL,
  issued_on DATE DEFAULT NOW(),
  status TEXT CHECK (status IN ('pending', 'paid', 'cancelled'))
);
```

### Payments Table

```sql
CREATE TABLE payments (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  invoice_id BIGINT NOT NULL REFERENCES invoices(id),
  amount NUMERIC,
  paid_on DATE,
  status TEXT CHECK (status IN ('paid', 'failed'))
);
```
