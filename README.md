# Nova Pharmacy Database Management System

## Overview
Nova Pharmacy is a comprehensive database management system designed to handle pharmacy operations, including inventory management, prescription tracking, contracts with pharmaceutical companies, and patient-doctor relationships.

## Database Structure
The system is built around these key entities:
- **Pharmacy**: Stores pharmacy information (name, address, phone)
- **Pharmaceutical Companies**: Manages drug manufacturers
- **Drugs**: Records drug details with formulas
- **Doctors**: Tracks healthcare providers and their specialties
- **Patients**: Manages patient information and their primary physicians
- **Prescriptions**: Links patients to doctors and prescribed medications
- **Contracts**: Handles agreements between pharmacies and pharmaceutical companies
- **Supervisors**: Manages contract supervision

## ERD and Schema
The database schema is documented in the Entity Relationship Diagram and Relational Mapping files.

## Features

### Data Management
All CRUD operations are available through the `managedb` package:
- Add, update, and delete entities for all tables
- Manage relationships between entities

### Reporting Procedures
- `report_patient_prescriptions.sql`: Generate prescription reports for patients within a date range
- `print_prescription_details.sql`: Display prescription details for a patient on a specific date
- `print_pharmacy_stock.sql`: List all drugs available at a pharmacy with pricing
- `print_patients_for_doctor.sql`: Show all patients assigned to a specific doctor
- `print_contract_details.sql`: Display contract details between pharmacies and pharmaceutical companies
- `get_pharma_drug_details.sql`: List drugs manufactured by a pharmaceutical company

## Installation

1. Run the schema creation scripts in the `schemas` directory to set up the database tables
2. Install the package specification and body from `packages`
3. Install the reporting procedures from `procedures`

## Contributors

- Aryan Dalmia
- Pratyush Nair
- Riddhi Chatterjee
- Saket Goyal

