# AstroBookings: Authentication API

> This document describes the implementation details for the `0. Authentication` domain of the AstroBookings project at the `🧑‍💼 SystemAPI` level.

## Features and scenarios

### 0.1 Register an account

```gherkin
Feature: User Registration
  As a visitor, I want to register an account, so that I can access the system.


  Scenario: Register a new user
    Given the API is available
    When the user sends a POST request to "/api/authentication/register" with the following data:
      | name     | email                | password    | role     |
      | "John Doe" | "johndoe@example.com" | "password123" | "traveler" |
    Then the response should have a status code of 201
    And the response should contain a field "token" with a JWT value
    And the response should contain a field "user" with the user information
    And the "user" should not contain a field "password"

  Scenario: Register with an existing email
    Given the API is available
    When the user sends a POST request to "/api/authentication/register" with the following data:
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
    When the user sends a POST request to "/api/authentication/login" with the following data:
      | email                | password    |
      | "John Doe" | "password123" |
    Then the response should have a status code of 200
    And the response should contain a field "token" with a JWT value
    And the response should contain a field "user" with the user information

  Scenario: Log in with incorrect password
    Given the API is available
    When the user sends a POST request to "/api/authentication/login" with the following data:
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
    When the user sends a POST request to "/api/authentication/logout"
    Then the response should have a status code of 204

  Scenario: Log out without authentication
    Given the API is available
    And the user is not authenticated
    When the user sends a POST request to "/api/authentication/logout"
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
    When the user sends a GET request to "/api/authentication/token"
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
    When the user sends a GET request to "/api/authentication/validation"
    Then the response should have a status code of 200
    And the response should contain a field "user" with the user information

  Scenario: Validate an invalid or expired JWT
    Given the API is available
    And the user is authenticated
    And the user has an invalid JWT
    When the user sends a GET request to "/api/authentication/validation"
    Then the response should have a status code of 401
    And the response should contain an error message "Invalid token"
```

## NestJs Implementation

### Project 🧑‍💼 SystemAPI setup

The `Authentication` domain is part of the `SystemAPI` project, which is a NestJs application using TypeORM to access MongoDB.

To create the project, run the following command:

```shell
npm i -g @nestjs/cli
nest new SystemAPI
npm i @nestjs/mapped-types class-validator class-transformer
npm i -s @mikro-orm/core @mikro-orm/nestjs @mikro-orm/mongodb mongodb
npm i @nestjs/jwt @nestjs/passport passport passport-jwt
npm i snowyflake
```

Core artifacts and and shared module.

```shell
nest g filter core/all-exceptions --flat --no-spec
nest g middleware core/logger --flat --no-spec

nest g module shared
nest g service shared/hash-service --flat
nest g service shared/id-service --flat
nest g service shared/token-service --flat
```

### API Authentication Endpoints

The following endpoints are available for the `Authentication` domain:

- `POST /api/authentication/register`: Register a new user.
- `POST /api/authentication/login`: Log in to the system.
- `POST /api/authentication/logout`: Log out of the system.
- `GET /api/authentication/token`: Generate a JWT for a validated user.
- `GET /api/authentication/validation`: Validate a JWT and identify the user.

So for the implementation of the `Authentication` domain, we need to create a module, a controller, a service, and a set of DTOs.

```shell
nest g module api/authentication
nest g controller api/authentication
nest g service api/authentication
```

## Data Model for DTOs

Those are the required DTOs for the API with `NestJs Validation` and `class-validator`:

```shell
nest g class api/authentication/models/register.dto --flat --no-spec
nest g class api/authentication/models/login.dto --flat --no-spec
nest g class api/authentication/models/token.type --flat --no-spec
nest g class api/authentication/models/user.type --flat --no-spec
nest g class api/authentication/models/valid-token.type --flat --no-spec
nest g class api/authentication/models/user-token.type --flat --no-spec
```

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

export type User = {
  id: string;
  name: string;
  email: string;
  role: Role;
};

export type UserToken = {
  user: User;
  token: string;
};

export type TokenPayload = {
  sub: string;
  iat: number;
  exp: number;
};

export type UserTokenPayload = {
  user: User;
  tokenPayload: TokenPayload;
};
```

## Data Model for Entities

Those are the required entities for the API with `TypeORM` interacting with the **MongoDB** database `📇 SystemDB`:

### User Entity

- Represents the base entity for all system users.
- Contains fields such as id, email, password_hash, name, and role.

```shell
nest g class authentication/models/user.entity --flat --no-spec
```

```typescript
/**
 * User entity
 * @description Entity for read/write on users collection
 */
@Entity({ collection: "users" })
export class UserEntity {
  /**
   * MongoDB Primary key
   */
  @PrimaryKey()
  _id: string;

  /**
   * Unique id for a user, to be used as a reference
   */
  @Property()
  id: string;

  @Property()
  name: string;

  @Property({ unique: true })
  email: string;

  @Property({ fieldName: "password_hash" })
  passwordHash: string;

  @Property({ type: "text" })
  role: Role;
}

/**
 * User entity data type
 * @description Without the MongoDB primary key
 */
export type UserEntityData = Omit<UserEntity, "_id">;
```
