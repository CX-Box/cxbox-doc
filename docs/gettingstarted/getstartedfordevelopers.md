# Getting started    
This tutorial serves as an introduction to the fundamentals, guiding you through the creation of standard elements essential for initiating your project promptly.
 
## What You Need
* About 15 minutes
 
## :octicons-download-16: Step 1  Clone repository

    git clone git@github.com:CX-Box/cxbox-demo.git

## :material-download-circle: Step 2  Download plugin
[download Intellij Plugin](https://document.cxbox.org/plugin/plugininstalling)

## :material-check-underline: Step 3 Add new field to an existing screen
Choose datasource:

* [Postgres](/gettingstarted/postgres/getstartedfordeveloperspostgres.md)
* [Microservices](/gettingstarted/microservice/getstartedfordevelopersmicroservice.md)

## :material-play: Step 4 To deploy an application

CXBOX requires a database, in this example, it utilizes PostgreSQL.

* install dependencies and build back-end and front-end
    ```
    mvn clean install -PUI
    ```
* start environment
    ```
    docker-compose up -d    
    ```
* run application
    ```
    press green button in Application.java
    ```

 
 
   