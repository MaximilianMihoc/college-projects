# PictureBox — Cloud Computing CA2

PictureBox is a role-based photo-sharing web application built for a cloud-computing assignment on the original Google App Engine Java platform.

## What it does

- Uses Google Accounts for sign-in and separates visitors into guest, registered-member, and administrator experiences.
- Lets users register an application profile and upload images with descriptions.
- Stores image files in App Engine Blobstore and metadata in Datastore.
- Supports public and private uploads. Members can view their own uploads plus the public gallery; guests can browse public images; administrators can review all uploads.
- Serves stored images by Blobstore key and allows permitted images and metadata to be deleted.

## Architecture

Java servlets handle routing and application logic (`PictureBoxServlet`, `Register`, `Member`, `Guest`, `Admin`, `Upload`, `ViewUpload`, `Serve`, and `Delete`). JSP pages render the three role-specific dashboards. Datastore entities represent registered users and upload metadata, while Blobstore contains the image data.

The `Documents/` directory preserves the original design document, developer guide, and separate user guides for administrators, members, and guests. Generated Javadoc is available under `PictureBox/doc/`.

## Technologies

- Java Servlets and JSP.
- Google App Engine Users, Datastore, and Blobstore APIs.
- DataNucleus/JPA/JDO configuration.
- HTML and CSS.

## Running it today

The application targets a retired generation of App Engine APIs and has no modern build definition. It is best treated as an architectural record. A revival would require replacing the Users and Blobstore integrations, migrating Datastore access, and moving the servlet/JSP application to a supported Java runtime. The original application identifier was `ieditmihocmaximilianpicturebox`.

## Security note

The historical code contains hard-coded administrator email addresses and old role checks. They are retained to preserve the assignment, not as a recommended security design.
