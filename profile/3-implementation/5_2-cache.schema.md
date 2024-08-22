# AstroBookings: Cache Schema

This schema describes the documental `📇 CacheDB` of the AstroBookings platform.

## Entities

```mermaid
erDiagram

    LaunchCache {
        int id PK
        datetime launch_on
        string destination
        decimal price_per_seat
        enum status
        int available_seats
        agency:{
            int id FK
            string name
        }
        rocket: {
            int id PK
            string name
            int capacity
            enum range
        }
    }

    BookingCache {
        int id PK
        int traveler_id FK
        int launch_id FK
        int number_of_seats
        decimal total_price
        datetime booked_at
        enum status
        traveler:{
            int user_id FK
            string contact_phone
            string emergency_contact
            json travel_preferences
        }
    }
```

## MongoDB Collections and Schemas

### Launches Cache Collection

```js
db.createCollection("launches_cache", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "launch_on",
        "destination",
        "price_per_seat",
        "status",
        "available_seats",
        "agency",
        "rocket",
      ],
      properties: {
        launch_on: {
          bsonType: "date",
          description: "must be a date and is required",
        },
        destination: {
          bsonType: "string",
          description: "must be a string and is required",
        },
        price_per_seat: {
          bsonType: "decimal",
          description: "must be a decimal and is required",
        },
        status: {
          enum: ["scheduled", "completed", "cancelled"],
          description: "can only be one of the enum values and is required",
        },
        available_seats: {
          bsonType: "int",
          description: "must be an integer and is required",
        },
        agency: {
          bsonType: "object",
          required: ["id", "name"],
          properties: {
            id: {
              bsonType: "int",
              description: "must be an integer and is required",
            },
            name: {
              bsonType: "string",
              description: "must be a string and is required",
            },
          },
        },
        rocket: {
          bsonType: "object",
          required: ["id", "name", "capacity", "range"],
          properties: {
            id: {
              bsonType: "int",
              description: "must be an integer and is required",
            },
            name: {
              bsonType: "string",
              description: "must be a string and is required",
            },
            capacity: {
              bsonType: "int",
              description: "must be an integer and is required",
            },
            range: {
              enum: ["short", "medium", "long"],
              description: "can only be one of the enum values and is required",
            },
          },
        },
      },
    },
  },
});
```

### Bookings Cache Collection

```js
db.createCollection("bookings_cache", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "traveler_id",
        "launch_id",
        "number_of_seats",
        "total_price",
        "status",
        "traveler",
      ],
      properties: {
        traveler_id: {
          bsonType: "int",
          description: "must be an integer and is required",
        },
        launch_id: {
          bsonType: "int",
          description: "must be an integer and is required",
        },
        number_of_seats: {
          bsonType: "int",
          description: "must be an integer and is required",
        },
        total_price: {
          bsonType: "decimal",
          description: "must be a decimal and is required",
        },
        status: {
          enum: ["booked", "cancelled"],
          description: "can only be one of the enum values and is required",
        },
        traveler: {
          bsonType: "object",
          required: [
            "user_id",
            "contact_phone",
            "emergency_contact",
            "travel_preferences",
          ],
          properties: {
            user_id: {
              bsonType: "int",
              description: "must be an integer and is required",
            },
            contact_phone: {
              bsonType: "string",
              description: "must be a string and is required",
            },
            emergency_contact: {
              bsonType: "string",
              description: "must be a string and is required",
            },
            travel_preferences: {
              bsonType: "object",
              description: "must be an object and is required",
            },
          },
        },
      },
    },
  },
});
```
