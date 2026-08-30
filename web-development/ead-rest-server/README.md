# Authors and Books REST API

A team-built PHP REST service for managing authors, books, and users. It was created for an Enterprise Application Development assignment using Slim, a hand-built MVC/DAO architecture, PDO, and MySQL.

## API capabilities

- CRUD endpoints for `/authors`, `/books`, and `/users`, with optional numeric resource IDs.
- Relationship endpoints for an author's books and a book's authors.
- Search endpoints for authors and books.
- Header-based user authentication before protected operations.
- JSON request bodies and response negotiation for JSON, XML, or CSV output.
- HTTP status codes and structured messages for validation, creation, updates, deletion, missing content, and bad requests.

## Architecture

`app/index.php` defines Slim routes and maps each request into model, controller, and view components. Controllers interpret HTTP methods and request bodies. Models perform validation and coordinate data access. DAO classes contain the SQL for authors, books, users, and their relationships. `pdoDbManager` wraps prepared statements and connection management. The view serializes the model response into the requested representation.

`app/TDD/` contains validation tests and a bundled SimpleTest framework, reflecting the assignment's test-driven-development component.

## Technologies and concepts

PHP, Slim, PDO/MySQL, RESTful routing, MVC, DAO separation, prepared statements, content negotiation, authentication, input validation, and SimpleTest.

## Running it today

The project targets an old PHP/Slim stack and expects dependencies and a MySQL schema that are not packaged as a modern Composer application. To revive it, configure the database values in `app/conf/config.inc.php`, provide the expected Slim installation and schema, and update deprecated PHP behaviour. Treat the historical authentication mechanism as coursework rather than a production security design.
