# Database Coursework

Two projects that approach data storage from different directions: a binary-file employee database written in C and a relational pet-shop database designed in Oracle SQL.

## Employee database in C

`EmployeeDatabaseInC/` implements a menu-driven record store backed by `employee.dat`. An employee record contains an employee number, name, address, department code, and duration. The program can add records, list active employees, mark records as deleted, prevent duplicate employee numbers, and compact the file to reclaim deleted slots.

A header stored at the beginning of the binary file tracks total and deleted records. Deletion is logical—the first byte of a record is marked with `*`—and new records reuse deleted positions before extending the file. Compaction copies active records through a temporary file.

## Peter Pets database

`PeterPetsDatabaseSQL/` is a group database-design project for a pet shop. The Oracle SQL scripts create and populate a connected schema for staff, customers, orders, suppliers, stock, species, care instructions, special orders, housing, treatment, and daily checks. The work demonstrates primary and foreign keys, constraints, joins, subqueries, aggregation, updates, and reporting queries. `ERDCopy.docx` preserves the entity-relationship design.

## What I practised

- Fixed-size binary records, file offsets, logical deletion, and compaction in C.
- Relational modelling, referential integrity, validation constraints, and sample-data design.
- Translating business rules into a normalized schema and useful SQL queries.

## Running the projects

Compile `EmployeeDatabase.c` with a C compiler that supports the older functions used by the source. Run `Create&PopulateDB.sql` and then `SomeQueries.sql` in a compatible Oracle database. Both projects are historical coursework and may need minor modernization for current compilers or database versions.
