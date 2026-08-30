# Web Development Coursework

Two early web projects: a multi-page restaurant site built with HTML/CSS/JavaScript and a PHP/MySQL library application with authentication, search, and reservations.

## Toscana restaurant website

`ToscanaWebsite/` is a visual, multi-page site for an Italian restaurant. It includes home/about content, opening hours, contact and location pages, events, photo galleries, several menu sections, and a large collection of food, drink, venue, and social-media imagery. The project demonstrates page navigation, shared CSS styling, layouts, image-heavy content, and small JavaScript interactions.

## Library website

`LibraryWebsite/` is a server-rendered PHP application backed by a MySQL database. Users can log in, view a home dashboard, search books by title, author, or category, reserve available books, see their reservations, remove reservations, add new users, and log out.

`CreateAndPopulateDatabase.sql` defines and seeds users, categories, books, and reservations with primary/foreign-key relationships. PHP sessions retain the active user, while the reservation pages coordinate changes between the `Books` and `Reservations` tables.

## Technologies and concepts

- HTML5, CSS, JavaScript, navigation, forms, and image-driven layouts.
- PHP sessions and server-rendered pages.
- MySQL schema design, joins, search queries, inserts, updates, and deletes.
- Connecting a web interface to relational data and a simple user workflow.

## Running it today

The Toscana site can be opened as static files, although some paths and old markup may need browser-friendly cleanup. The library application expects a local MySQL database named `book` populated with `CreateAndPopulateDatabase.sql`.

The PHP code uses the removed `mysql_*` extension and stores historical sample passwords in plain text. It will not run on current PHP unchanged; migrate it to PDO/MySQLi, prepared statements, password hashing, and current session/security practices before deployment.
