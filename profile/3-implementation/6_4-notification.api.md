# AstroBookings: Notification API

> This document describes the implementation details for the `4. Notification` domain of the AstroBookings project at the `🧑‍💼 SystemAPI` level.

## Features and scenarios

### 4.1 Send launch-related notifications to agencies

```gherkin
Feature: Send launch-related notifications to agencies
  As an agency, I want to receive notifications about launch-related events, so that I can stay informed about the status of my launches.

  Scenario: Send a notification about a launch status change
    Given the API is available
    When the system sends a POST request to "/api/notification/" with the following data:
      | event |  data |
      | "newBooking" |  { launch_id: 1, booking_id: 1 } |
    Then the response should have a status code of 200
    And the notification data to be sent to the agency
        | recipient_email | subject | message |
        | "agency@example.com" | "New booking for launch" | "You have a new booking for launch 1" |
```

## NestJs Implementation

### Project 🧑‍💼 NotifyAPI setup

The `Notification` domain is part of the `NotifyAPI` project, which is a NestJs application using TypeORM to access Postgres.

To create the project, run the following command:

```shell
npm i -g @nestjs/cli
nest new NotifyAPI
cd notify-api
npm i @nestjs/mapped-types class-validator class-transformer
npm i @mikro-orm/core @mikro-orm/nestjs @mikro-orm/postgresql
npm i @nestjs/jwt @nestjs/passport passport passport-jwt
npm i snowyflake
```

Core artifacts and and shared module.

> Will be part of a library in the future

```shell
nest g filter core/all-exceptions --flat --no-spec
nest g middleware core/logger --flat --no-spec

nest g module shared
nest g service shared/id --flat
```

### API Notification Endpoints

The following endpoints are available for the `Notification` domain:

- `POST /api/notification/event`: Save a notification event

```shell
nest g module api/notification
nest g controller api/notification
nest g module api/notification/services/notification-services --flat
nest g service api/notification/services/notification --flat
```

## Data Model for DTOs

Those are the required DTOs for the API with `NestJs Validation` and `class-validator`:

```shell
nest g class api/notification/models/event.dto --flat --no-spec
nest g class api/notification/models/notification.type --flat --no-spec
```

```typescript
import { IsNotEmpty, IsObject, IsString } from "class-validator";
export class EventDto {
  @IsString()
  @IsNotEmpty()
  event: string;

  @IsObject()
  data: Record<string, any>;
}

export type Notification = {
  id: string;
  recipient_email: string;
  subject: string;
  message: string;
};

/**
 * Notification status enum
 */
export type NotificationStatus = "pending" | "sent" | "failed";
```

## Data Model for Entities

Those are the required entities for the API with `TypeORM` interacting with the **Postgres** database `📇 OperationsDB`:

### Notification Entity

- Represents messages sent to system users about various events

```shell
nest g class api/notification/services/notification.entity --flat --no-spec
nest g class api/notification/services/template.entity --flat --no-spec
```

```typescript
import { Entity, PrimaryKey, Property, Enum } from "@mikro-orm/core";

/**
 * Notification entity
 * @description Entity for read/write on notifications table
 */
@Entity({ tableName: "notifications" })
export class NotificationEntity {
  /**
   * Primary key
   */
  @PrimaryKey()
  id!: string;

  @ManyToOne(() => TemplateEntity)
  template!: TemplateEntity;

  // ? Should be simplified to foreign keys?

  @ManyToOne(() => AgencyEntity)
  agency!: AgencyEntity;

  @ManyToOne(() => LaunchEntity)
  launch!: LaunchEntity;

  @ManyToOne(() => TravelerEntity)
  traveler!: TravelerEntity;

  @ManyToOne(() => BookingEntity)
  booking!: BookingEntity;

  @ManyToOne(() => InvoiceEntity)
  invoice!: InvoiceEntity;

  /**
   * Recipient's email address
   */
  @Property()
  recipientEmail!: string;

  /**
   * Notification subject
   */
  @Property()
  subject!: string;

  /**
   * Notification message content
   */
  @Property({ type: "text" })
  message!: string;

  /**
   * Timestamp of the notification
   */
  @Property()
  timestamp!: Date;

  /**
   * Status of the notification
   */
  @Property({ type: "text" })
  status!: NotificationStatus;
}

/**
 * Notification entity data type
 * @description Type definition for the Notification entity
 */
export type NotificationEntityData = Omit<NotificationEntity, "id">;

@Entity({ tableName: "templates" })
export class TemplateEntity {
  @PrimaryKey()
  id!: string;

  @Property()
  name!: string;

  @Property()
  subject!: string;

  @Property()
  message!: string;

  @OneToMany(() => NotificationEntity, (notification) => notification.template)
  notifications!: NotificationEntity[];
}

export type TemplateEntityData = Omit<TemplateEntity, "id">;
```
