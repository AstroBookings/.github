# 🚀 AstroBookings: 📝 Authentication Domain

> Timestamp: 2024-08-20 21:30:00 UTC

The **Authentication domain in AstroBookings** ensures secure access management for travelers, agencies, and employees in a high-stakes space travel platform. It addresses the challenges of unauthorized access prevention and secure session management across diverse user roles.

Our solution implements `JSON Web Tokens` (JWT) for stateless authentication, providing secure registration, login processes, and role-based access control. This approach enhances system scalability and security while offering a seamless user experience.

The API service will be responsible for generate and validate those tokens, while the web application will handle user interactions.

All other web applications will redirect anonymous users to the AuthWeb service to handle the authentication process, and receive a JWT token to access the system.

All other API services will use the SystemAPI service to validate the user's token received in the request, and allow or deny access to the requested resource.

## User Stories

### 0.1 As a visitor, I want to register an account, so that I can access the system.

- Provide a registration form with fields for email, password, name, and role (agency, traveler, or employee).
- Validate email uniqueness in the system.
- Encrypt the password before storing it.
- Generate a confirmation email for the new account.
- Create a new user account with appropriate permissions based on the selected role.

### 0.2 As a user, I want to log in to the system, so that I can access my account.

- Provide a login form with fields for email and password.
- Validate the provided credentials against stored user information.
- Implement rate limiting to prevent brute force attacks.
- Create a session for the authenticated user.
- Redirect to the appropriate dashboard based on the user's role.

### 0.3 As a user, I want to log out of the system to ensure the security of my account.

- Provide a logout option in the user interface.
- Invalidate the current user session.
- Clear any client-side stored authentication data.
- Redirect to the login page or public homepage after logout.

### 0.4 As the system, I need to generate a JWT for a validated user to maintain their session securely.

- Generate a JSON Web Token (JWT) upon successful user authentication.
- Include relevant user information in the JWT payload (e.g., user ID, role, permissions).
- Set an appropriate expiration time for the JWT.
- Sign the JWT with a secure secret key.

### 0.5 As the system, I need to validate a JWT and identify the user to ensure secure access to protected resources.

- Implement middleware to check JWT validity for protected routes.
- Verify the JWT signature using the secret key.
- Check the JWT expiration time.
- Extract user information from the JWT payload.
- Attach the user information to the request for use in protected routes.

## Affected Components

### 🌐 Web Applications

- `🌐 AuthWeb`: Primary interface for user authentication and registration, returning tokens.

### 🧑‍💼 API Services

- `🧑‍💼 SystemAPI`: Central service for handling authentication and authorization logic.

### 📇 Databases

- `📇 SystemDB`: Stores user authentication data.

### Component Interfaces

```mermaid
graph TD
    subgraph Web Applications[" "]
        AuthWeb(0 - AuthWeb)
    end

    subgraph API Services[" "]
        SystemAPI[0 - SystemAPI]
    end

    subgraph Databases[" "]
        SystemDB[(0 - SystemDB)]
    end

    %% Web to API connections
    AuthWeb --> SystemAPI

    %% API to Database connection
    SystemDB[(0 - SystemDB)]

    %% Style
    classDef web fill:#FF9999,stroke:#333,stroke-width:2px;
    classDef api fill:#C1E1C1,stroke:#333,stroke-width:2px;
    classDef db fill:#ADD8E6,stroke:#333,stroke-width:2px;
    class AuthWeb web;
    class SystemAPI api;
    class SystemDB db;
```

This diagram illustrates the interfaces between the components involved in the Authentication domain:

1. The AuthWeb communicates with the SystemAPI for authentication and authorization purposes.
2. The SystemAPI is the central service handling all authentication logic and requests.
3. The SystemAPI interacts with the SystemDB to store and retrieve user data, authentication records, and logs.

## Related Entities

1. `User`:

   - Represents the base entity for all system users.
   - Contains fields such as id, email, password_hash, name, and role.

> Not directly related to the authentication domain but relevant for user management.

1. `Traveler`:

   - Specialization of User entity for clients booking space travels.
   - Inherits from User and may contain additional fields specific to travelers.

2. `Agency`:

   - Specialization of User entity for space agencies offering launches.
   - Inherits from User and may contain additional fields specific to agencies.

### Entity-Relationship Diagram

```mermaid
erDiagram
    User {
        int id PK
        string email
        string password_hash
        string name
        enum role
    }

    Traveler {
        int user_id PK,FK
    }

    Agency {
        int user_id PK,FK
    }

    User ||--o| Traveler : "is a"
    User ||--o| Agency : "is a"

```

This diagram ERD shows the following relationships:

1. `User` is the base entity that can be specialized into `Traveler` or `Agency` (relationship "is a").
2. A`Traveler` must be a `User`.
3. An `Agency` must be a `User`.

---

## [🚀 AstroBookings](https://github.com/AstroBookings)
