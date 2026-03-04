# Project Architecture: ThingsBoard Flutter App

The project follows a **Modular Clean Architecture** pattern, emphasizing separation of concerns, testability, and scalability.

## 1. Architectural Layers
The codebase is structured into three primary layers, following Clean Architecture principles:

- **Domain Layer (`domain/`)**: Contains the business logic, entities, and repository interfaces. This layer is independent of any other layers or external libraries.
- **Data Layer (`data/`)**: Implements the repository interfaces defined in the domain layer. It handles data retrieval from external sources (REST API via `thingsboard_client`, local storage via `Hive`).
- **Presentation Layer (`presentation/`)**: Contains the UI logic, including BLoCs/Cubits, pages, and widgets.

## 2. Feature-First (Modular) Structure
The application is divided into independent features (modules) located in `lib/modules/`. Each module encapsulates its own data, domain, and presentation logic. Common modules include:
- `alarm`
- `device`
- `asset`
- `profile`
- `dashboard`

## 3. Key Technologies & Patterns

### State Management
- **BLoC/Cubit**: The primary state management for complex feature logic.
- **Riverpod**: Used for global dependency management and hooks-based state.
- **Signals**: Integrated for reactive primitives and high-performance UI updates.
- **Flutter Hooks**: Utilized for managing local widget state and lifecycle.

### Dependency Injection (DI)
- **GetIt**: Acts as a **Service Locator** for registering and retrieving services, use cases, and repositories. Central configuration is in `lib/locator.dart`.

### Routing
- **GoRouter**: A declarative routing package for Flutter that handles deep linking and navigation state.

### Data Persistence
- **Hive**: A lightweight and fast key-value database used for local storage.

### Communication
- **Event Bus**: Used for decoupled communication between different parts of the app.
- **ThingsBoard Client**: The official SDK for interacting with the ThingsBoard IoT platform backend.

## 4. Directory Structure Summary
- `lib/core/`: Shared business logic, base use cases, and global entities.
- `lib/modules/`: Feature-specific code grouped by module name.
- `lib/utils/`: Common utilities, services, and helper functions.
- `lib/widgets/`: Reusable UI components shared across the entire app.
- `lib/config/`: App-wide configurations (routes, themes, constants).
