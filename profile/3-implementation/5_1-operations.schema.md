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
        string description
        string contact_info
        string legal_name
        string tax_id
        string legal_address
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
        datetime date
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
        enum status
    }

    Invoice {
        int id PK
        string number
        int agency_id FK
        int launch_id FK
        decimal amount
        enum status
        datetime date
    }

    Payment {
        int id PK
        int invoice_id FK
        decimal amount
        datetime date
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
    string description
    string contact_info
    string legal_name
    string tax_id
    string legal_address
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
    datetime date
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
    enum status
  }

  Invoice {
    int id PK
    string number
    int agency_id FK
    int launch_id FK
    decimal amount
    enum status
    datetime date
  }

  Payment {
    int id PK
    int invoice_id FK
    decimal amount
    datetime date
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

```sql
CREATE TABLE travelers (
  user_id BIGINT PRIMARY KEY,
  contact_phone TEXT,
  emergency_contact TEXT,
  travel_preferences json
);
```

### Agencies Table

```sql
CREATE TABLE agencies (
  user_id BIGINT PRIMARY KEY,
  description TEXT,
  contact_info TEXT,
  legal_name TEXT,
  tax_id TEXT,
  legal_address TEXT
);
```

### Rockets Table

```sql
CREATE TABLE rockets (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  agency_id BIGINT REFERENCES agencies(user_id),
  name TEXT,
  capacity INT,
  rocket_range ENUM('low-earth-orbit', 'geostationary', 'interplanetary')
);
```

### Launches Table

```sql
CREATE TABLE launches (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  agency_id BIGINT REFERENCES agencies(user_id),
  rocket_id BIGINT REFERENCES rockets(id),
  launch_date TIMESTAMPTZ,
  destination TEXT,
  price_per_seat NUMERIC,
  launch_status ENUM('scheduled', 'launched', 'aborted')
);
```

### Bookings Table

```sql
CREATE TABLE bookings (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  traveler_id BIGINT REFERENCES travelers(user_id),
  launch_id BIGINT REFERENCES launches(id),
  number_of_seats INT,
  total_price NUMERIC,
  booking_status ENUM('reserved', 'cancelled', 'launched', 'aborted')
);
```

### Invoices Table

```sql
CREATE TABLE invoices (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  invoice_number TEXT,
  agency_id BIGINT REFERENCES agencies(user_id),
  launch_id BIGINT REFERENCES launches(id),
  amount NUMERIC,
  status ENUM('pending', 'paid', 'cancelled'),
  invoice_date TIMESTAMPTZ,
);
```

### Payments Table

```sql
CREATE TABLE payments (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  invoice_id BIGINT REFERENCES invoices(id),
  amount NUMERIC,
  payment_date TIMESTAMPTZ,
  payment_status ENUM('paid', 'failed')
);
```
