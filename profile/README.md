# 🚀 Astro Bookings

> Sample project for teaching full-stack development with modern technology and proven best practices.

### Company mission

**🚀 AstroBookings** is a fictitious space tourism company that wants a platform for rocket _agencies_ to offer _bookings_ for their launches to _travelers_ who want to fly into space.

## 📡 The Project

Create a solution for financial and IT employees, and also give access to agencies and travelers in order to manage their launches, bookings and financial operations.

- [**0. 📋 Read the Project Briefing**](./0-project.briefing.md)
- [_Or go to the implementation_](#-the-implementation)

#### Received Requirements

- [General requirements from the CEO](./0-requirements/1-AstroBookings-General_requirements-CEO-letter.md)
- [Operational requirements from the COO](./0-requirements/2-AstroBookings-Operational_requirements-COO-letter.md)
- [Marketing requirements from the CMO](./0-requirements/3-AstroBookings-Marqueting_requirements-CMO-letter.md)
- [Financial requirements from the CFO](./0-requirements/4-AstroBookings-Financial_requirements-CFO-letter.md)
- [Technical requirements from the CTO](./0-requirements/5-AstroBookings-Technical_requirements-CTO-letter.md)

### 🧑‍🔬 Analysis

- [1. Domain Requirements](./1-analysis/1-domain.requirements.md)
- [2. System Requirements](./1-analysis/2-system.requirements.md)

## 🛰️ The Solution

The solution is a set of web applications made with `Angular` that consume several REST APIs made with `NestJS`. Data is stored in `Postgres` and `MongoDB` databases.

### 📝 Design

- [1. System Architecture](./2-design/2-system.architecture.md)
- [2. Data Model](./2-design/3-model.erd.md)

#### Domain specifics

- [0. Authentication](./2-design/4_0-authentication.domain.md)
- [1. Agencies](./2-design/4_1-agency-management.domain.md)
- [2. Bookings](./2-design/4_2-booking-management.domain.md)
- [3. Financial](./2-design/4_3-financial-operations.domain.md)
- [4. Notifications](./2-design/4_4-notification-system.domain.md)
- [5. Data Synchronization](./2-design/4_5-data-synchronization.domain.md)
- [6. Monitoring](./2-design/4_6-system-monitoring.domain.md)

## 🧑‍💻 The Implementation

### 📇 DataBase schemas

- [1. **SystemDB** schema](./3-implementation/5_0-system.schema.md)
- [2. **OperationsDB** schema](./3-implementation/5_1-operations.schema.md)
- [3. **CacheDB** schema](./3-implementation/5_2-cache.schema.md)

### 🧑‍💼 API Service repositories

- [0. **System API**](https://github.com/AstroBookings/system_api)
- [4. **Notify API**](https://github.com/AstroBookings/notify_api)

---

[![Astro Bookings](./AstroBookings.png)](https://github.com/astrobookings)

<!-- ## [📚 Project wiki](https://github.com/AstroBookings/.github/wiki)

Documentation relative to the project (requirements, design, coding guides, user manual...) -->

---

## 👨‍🚀 About

I am Alberto Basalo, a seasoned (**LII** years old, almost from the Roman numerals era 🏛️) advisor, consultor and instructor for programmers.

I am focused on coding best practices, testing, and software architecture, with a special bias for the `TypeScript` ecosystem.

I am glad to take you with me, hope I can help you to _develop your dream trip._

> [!NOTE]
>
> > _[Alberto Basalo](https://github.com/albertobasalo)_ >> _Elevating Code Quality._
