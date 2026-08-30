# Rich Web Application Coursework

A progression of front-end labs and assignments covering HTML/CSS, JavaScript, jQuery, AngularJS, web APIs, and the original Firebase/AngularFire platform. The largest project is **Favorite Cars**, a single-page application for researching vehicles and sharing favourites and reviews.

## Favorite Cars application

`FavoriteCarsAssignment/` combines AngularJS routing with Firebase authentication and data storage. Users can register with email/password or sign in through Google or GitHub, maintain a profile, search vehicle makes/models/years through the Edmunds APIs, and inspect a selected style's specifications, price, equipment, ratings, and photographs.

Authenticated users can save cars to a personal favourites list and post reviews. Firebase stores profiles, favourites, and per-car reviews; listeners update reviews in real time. The UI uses AngularJS controllers and services, Bootstrap, jQuery, AngularFire, and Gravatar-based profile images. Firebase Hosting configuration is included.

## Other work in the repository

- `Assignment1/` — a responsive personal portfolio built with HTML, CSS, JavaScript, and image assets, with HTML/CSS validation evidence.
- `Firebase/` — experiments with Firebase Hosting, AngularFire, registration, login, route views, and authenticated application state.
- `Lab4` and `Tutorial` — DOM/JavaScript and Wikipedia-layout exercises.
- `Lab5` — JavaScript, jQuery, animation, events, and loading text from a file.
- `Lab6` — AngularJS controllers, routing, partial views, student examples, and a contact-list application.
- `Lab7` — consuming REST/web-service data and rendering related results, plus demo assets.

## Running it today

These applications use retired Firebase 2.x APIs, AngularJS, and an Edmunds API key embedded in historical client code. The external services and endpoints may no longer operate. To revive Favorite Cars, replace the Firebase and Edmunds integrations, remove historical credentials, migrate authentication, and update the AngularJS application or rewrite it using a supported framework.

## Security note

API keys and Firebase URLs were historically shipped in browser code, as was common in course examples. They should be considered expired and must not be reused.
