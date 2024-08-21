# AstroBookings: Authentication API

> This document describes the implementation details for the `0. Authentication` domain of the AstroBookings project at the `🧑‍💼 SystemAPI` level.

## Features and scenarios

### 0.1 Register an account

```gherkin
Feature: User Registration
  As a visitor, I want to register an account, so that I can access the system.


  Scenario: Register a new user
    Given the API is available
    When the user sends a POST request to "/api/register" with the following data:
      | name     | email                | password    | role     |
      | "John Doe" | "johndoe@example.com" | "password123" | "traveler" |
    Then the response should have a status code of 201
    And the response should contain a field "token" with a JWT value
    And the response should contain a field "user" with the user information
    And the "user" should not contain a field "password"

  Scenario: Register with an existing email
    Given the API is available
    When the user sends a POST request to "/api/register" with the following data:
      | name     | email                | password    | role     |
      | "John Doe" | "johndoe@example.com" | "password123" | "traveler" |
    Then the response should have a status code of 409
    And the response should contain an error message "Email already in use"
```

### 0.2 Log in to the system

```gherkin
Feature: User Login
  As a registered user, I want to log in to the system, so that I can access my account.

  Scenario: Log in with correct credentials
    Given the API is available
    When the user sends a POST request to "/api/login" with the following data:
      | email                | password    |
      | "John Doe" | "password123" |
    Then the response should have a status code of 200
    And the response should contain a field "token" with a JWT value
    And the response should contain a field "user" with the user information

  Scenario: Log in with incorrect password
    Given the API is available
    When the user sends a POST request to "/api/login" with the following data:
      | email                | password    |
      | "John Doe" | "wrongpassword" |
    Then the response should have a status code of 401
    And the response should contain an error message "Invalid credentials"
```

### 0.3 Log out of the system

```gherkin
Feature: User Logout
  As a logged-in user, I want to log out of the system to ensure the security of my account.

  Scenario: Log out of the system
    Given the API is available
    And the user is authenticated
    When the user sends a POST request to "/api/logout"
    Then the response should have a status code of 204

  Scenario: Log out without authentication
    Given the API is available
    And the user is not authenticated
    When the user sends a POST request to "/api/logout"
    Then the response should have a status code of 401
    And the response should contain an error message "Unauthorized"
```

### 0.4 Generate a JWT for a validated user

```gherkin
Feature: JWT Generation
  As the system, I need to generate a JWT for a validated user to maintain their session securely.

  Scenario: Generate a JWT for a validated user
    Given the API is available
    And the user is authenticated
    When the user sends a GET request to "/api/token"
    Then the response should have a status code of 200
    And the response should contain a field "token" with a JWT value
```

### 0.5 Validate a JWT and identify the user

```gherkin
Feature: JWT Validation
  As the system, I need to validate a JWT and identify the user to ensure secure access to protected resources.

  Scenario: Validate a JWT and identify the user
    Given the API is available
    And the user is authenticated
    And the user has a valid JWT
    When the user sends a GET request to "/api/validation"
    Then the response should have a status code of 200
    And the response should contain a field "user" with the user information

  Scenario: Validate an expired JWT
    Given the API is available
    And the user is authenticated
    And the user has an expired JWT
    When the user sends a GET request to "/api/validation"
    Then the response should have a status code of 401
    And the response should contain an error message "Token expired"

  Scenario: Validate an invalid JWT
    Given the API is available
    And the user is authenticated
    And the user has an invalid JWT
    When the user sends a GET request to "/api/validation"
    Then the response should have a status code of 401
    And the response should contain an error message "Invalid token"
```

## API Endpoints

The following endpoints are available for the `Authentication` domain:

- `POST /api/register`: Register a new user.
- `POST /api/login`: Log in to the system.
- `POST /api/logout`: Log out of the system.
- `GET /api/token`: Generate a JWT for a validated user.
- `GET /api/validation`: Validate a JWT and identify the user.

## Data Model for DTOs

Those are the required DTOs for the API with `NestJs Validation` and `class-validator`:

```typescript
import {
  IsEmail,
  IsNotEmpty,
  IsString,
  MinLength,
  IsEnum,
} from "class-validator";

export type Role = "traveler" | "agency" | "financial" | "it";

export class RegisterDto {
  @IsString()
  @IsNotEmpty()
  name: string;

  @IsEmail()
  email: string;

  @IsString()
  @MinLength(6)
  password: string;

  @IsString()
  @IsEnum(["traveler", "agency", "financial", "it"])
  role: Role;
}

export class LoginDto {
  @IsEmail()
  email: string;

  @IsString()
  @MinLength(6)
  password: string;
}

export class TokenDto {
  token: string;
}

export class UserDto {
  id: number;
  name: string;
  email: string;
  role: Role;
}

export class ErrorDto {
  message: string;
}

export class UserTokenDto {
  user: UserDto;
  token: string;
}
```

## Data Model for Entities

Those are the required entities for the API with `TypeORM` interacting with the **MongoDB** database `📇 SystemDB`:

### User Entity

- Represents the base entity for all system users.
- Contains fields such as id, email, password_hash, name, and role.

```typescript
import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("users")
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  email: string;

  @Column({ name: "password_hash" })
  passwordHash: string;

  @Column({
    type: "enum",
    enum: ["traveler", "agency", "financial", "it"],
  })
  role: Role;
}
```