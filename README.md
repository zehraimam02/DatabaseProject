# Housing Society Management System (HSMS)

## Overview
The Housing Society Management System (HSMS) is a comprehensive database-driven application designed to streamline the operations and administration of housing societies. The system efficiently manages resources, tracks data, and automates routine tasks, making it an essential tool for property and community management.

## Features
1. **Efficient Resource Management:**
   - Tracks houses, streets, zones, shopping centers, parks, and community centers.
   - Updates house/shop counts automatically using triggers.

2. **User-Friendly Admin Panel:**
   - Built with Flutter for intuitive navigation and seamless CRUD operations.
   - Centralized control for managing housing society resources.

3. **Automated Processes:**
   - Maintenance charge calculations with fine tracking for overdue payments.
   - Visitor logs at gates with validation for entry/exit times.
   - Automated updates to bridge tables for zone-level amenities.

4. **Data Integrity and Security:**
   - Oracle database with triggers and stored procedures ensuring consistency.
   - Normalized relational schema (3NF) to minimize redundancy and maintain data accuracy.

## Technologies Used
- **Frontend:** Flutter for cross-platform app development.
- **Backend:** Node.js with Express for API handling.
- **Database:** Oracle Database for robust transaction management and advanced SQL features.

## Application Flow
1. **Homepage:**
   - Admin selects the entity to manage (e.g., Houses, Streets, Zones).

2. **Entity Management:**
   - Options include: Insert New, Update, View All, and Delete.
   - Entity-specific features include automated tracking and statistical displays.

3. **Key Features by Entity:**
   - **Houses:** Tracks ownership, updates counts by street/zone.
   - **Streets:** Categorized as residential, commercial, or main.
   - **Zones:** Manages relationships with parks, shopping centers, and community centers.
   - **Shopping Centers:** Tracks shop counts and shop ownership.
   - **Maintenance Charges:** Calculates fines for overdue payments using stored procedures.
   - **Visitor Logs:** Ensures data validation for gate entries and exits.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/hsms.git
   ```
2. Navigate to the project directory:
   ```bash
   cd hsms
   ```
3. Install dependencies for the backend:
   ```bash
   npm install
   ```
4. Set up the Oracle database with the provided schema and triggers.
5. Run the backend server:
   ```bash
   node server.js
   ```
6. Launch the Flutter application:
   ```bash
   flutter run
   ```

## Usage
- Log in as the admin to access the dashboard.
- Navigate through the options to manage entities like houses, streets, and zones.
- View and update visitor logs, maintenance charges, and shop/house statistics.

## SQL Features
- **Triggers:** Automatic updates for house/shop counts and visitor logs.
- **Stored Procedures:** Batch generation of maintenance charges and fine calculation.
- **Constraints:** Ensures data integrity for house/shop ownership and gate logs.

## Contributors
- **Zainab Rehman:** Frontend development, database integration, and documentation.
- **Zehra Imam:** Backend development, database integration, and documentation.


