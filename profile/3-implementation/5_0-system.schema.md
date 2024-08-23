# AstroBookings: System Schema

This schema describes the documental `📇 SystemDB` of the AstroBookings platform.

## Entities

```mermaid
erDiagram
    User {
        int id PK
        string email UK
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

    EntryLog {
        int id PK
        string entity_type
        int entity_id FK
        int user_id FK
        datetime timestamp
        string level
        string message
        json data
    }

    JobQueue {
        int id PK
        string job_type
        string entity_type
        int entity_id
        datetime created_at
        datetime executed_at
        json data
        enum status
    }

    User ||--o{ Notification : "can receive"
    User ||--o{ EntryLog : "can create"
    User ||--o{ JobQueue : "can create"

```

## MongoDB Collections and Schemas

### Users Collection

```js
db.getCollection("users").drop();
db.createCollection("users", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["id", "email", "password_hash", "name", "role"],
      properties: {
        id: {
          bsonType: "string",
          description: "must be an string and is required",
        },
        email: {
          bsonType: "string",
          description: "must be a string and is required",
        },
        password_hash: {
          bsonType: "string",
          description: "must be a string and is required",
        },
        name: {
          bsonType: "string",
          description: "must be a string and is required",
        },
        role: {
          enum: ["admin", "agency", "traveler"],
          description: "must be one of the enum values and is required",
        },
      },
    },
  },
});
db.users.createIndex({ id: 1 }, { unique: true });
db.users.createIndex({ email: 1 }, { unique: true });
```

### Notifications Collection

```js
db.getCollection("notifications").drop();
db.createCollection("notifications", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["id", "userId", "message", "timestamp", "status"],
      properties: {
        id: {
          bsonType: "string",
          description: "must be an string and is required",
        },
        userId: {
          bsonType: "int",
          description: "must be an integer and is required",
        },
        message: {
          bsonType: "string",
          description: "must be a string and is required",
        },
        timestamp: {
          bsonType: "date",
          description: "must be a date and is required",
        },
        status: {
          enum: ["unread", "read", "sent"],
          description: "must be one of the enum values and is required",
        },
      },
    },
  },
});
db.notifications.createIndex({ id: 1 }, { unique: true });
```

### EntryLogs Collection

```js
db.getCollection("entry_log").drop();
db.createCollection("entry_log", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["id", "level", "message", "timestamp"],
      properties: {
        id: {
          bsonType: "string",
          description: "must be an string and is required",
        },
        entityType: {
          bsonType: "string",
          description: "must be a string",
        },
        entity_id: {
          bsonType: "int",
          description: "must be an integer",
        },
        user_id: {
          bsonType: "int",
          description: "must be an integer",
        },
        level: {
          enum: ["info", "warning", "error"],
          description: "must be one of the enum values and is required",
        },
        message: {
          bsonType: "string",
          description: "must be a string ",
        },
        timestamp: {
          bsonType: "date",
          description: "must be a date and is required",
        },
        data: {
          bsonType: "string",
          description: "must be a string",
        },
      },
    },
  },
});
db.entry_log.createIndex({ id: 1 }, { unique: true });
db.entry_log.createIndex({ level: 1 });
```

### JobsQueue Collection

```js
db.getCollection("job_queue").drop();
db.createCollection("job_queue", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "id",
        "job_type",
        "entity_type",
        "entity_id",
        "status",
        "created_at",
        "executed_at",
        "data",
      ],
      properties: {
        id: {
          bsonType: "string",
          description: "must be an string and is required",
        },
        job_type: {
          bsonType: "string",
          description: "must be a string and is required",
        },
        entity_type: {
          bsonType: "string",
          description: "must be a string and is required",
        },
        entity_id: {
          bsonType: "int",
          description: "must be an integer and is required",
        },
        status: {
          enum: ["pending", "completed", "failed"],
          description: "must be one of the enum values and is required",
        },
        created_at: {
          bsonType: "date",
          description: "must be a date and is required",
        },
        executed_at: {
          bsonType: "date",
          description: "must be a date and is required",
        },
        data: {
          bsonType: "object",
          description: "must be an object and is required",
        },
      },
    },
  },
});
db.job_queue.createIndex({ id: 1 }, { unique: true });
db.job_queue.createIndex({ status: 1 });
```
