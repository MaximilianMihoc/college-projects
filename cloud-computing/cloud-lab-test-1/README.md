# Google App Engine Cloud Lab Test

A small Java servlet created for a cloud-computing lab test and deployed using the original Google App Engine Java runtime.

## What it does

`CloudLabtestServlet` accepts four query parameters—`A`, `B`, `C`, and `D`—and calculates `(A - B) * (C - D)`.

If parameters are absent, incomplete, or invalid, the servlet falls back to default values configured in `WEB-INF/web.xml` and explains which fallback was used in the plain-text response. The landing page links to the servlet endpoint.

## Technologies and concepts

- Java `HttpServlet` and servlet configuration.
- Google App Engine's legacy Java application descriptor.
- Request-parameter parsing, input validation, and configured defaults.
- DataNucleus/JPA and JDO configuration generated for App Engine, although this servlet does not persist data.

## Project layout

- `CloudLabtest/src/.../CloudLabtestServlet.java` — request handling and calculation.
- `CloudLabtest/war/index.html` — landing page.
- `CloudLabtest/war/WEB-INF/` — servlet routes and App Engine deployment settings.
- `CloudLabtest/src/META-INF/` — legacy persistence configuration.

## Running it today

This project targets the first-generation App Engine Java tooling and has no Maven or Gradle build. Recreating it requires a compatible legacy App Engine SDK or porting the servlet to a modern Jakarta Servlet project. The original application identifier was `ieditmihocmaximilianlabtest1`.
