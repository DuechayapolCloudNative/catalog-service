# Welcome to catalog-service repository
This repository contains the application code and Docker file of the application. This is taken from the labs that were done throughout the course of the module, with GitHub Actions script omitted in favour for Jenkins.

## Pre-Requsites
The following programs are required to run and configure this application:
* Spring Boot - for running the application locally
* Java JDK 21 - used for the building process and running the application
* Docker - for building the image of the application as well as running the container of the application

## Setting Up
The application is built via Gradle:
```
./gradlew build
```

The application's JAR can then be turned into a Docker image via its Dockerfile:
```
docker build -t catalog-service .
```

A Docker can then be ran via its own container:
```
docker run -d \
  --name catalog-service \
  --net catalog-network \
  -p 9001:9001 \
  catalog-service
```

The application can be accessed via the 9001 port of localhost: ```localhost:9001```