# Postgres

backend java api currently uses a H2 in-memory database

questions:
- RDS vs kubernetes database
- use AWS secret manager to automatically manage secret or manage all secrets with one central tool
- get elastic ip or pass hostname into backend java api config yaml?
- setup backups as a stretch goal
- what outputs are required by other terraform modules when they are created

requirements:
- VPC
- subnet
- security group, to allow ingress on 5432

## exposed endpoints

- health
- info 
- prometheus

## terraform database module

variables
- db_name: defaults to "main"
- db_username: to create postgres RDS database user, don't use "user" or "admin" as they are reserved words in postgres
- db_password: to create postgres RDS database password, has minimum requirements
- db_subnets: list of subnets to create RDS database in, public / private, dedicated subnet?, availiability zone?

outputs

## SQL commands files

creates customer table

    CREATE TABLE customer (
        id SERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        age INT NOT NULL
    );

adds unique constraint to profile_image_id, the id used to create unique customer images for each customer entry

    ALTER TABLE customer
    ADD COLUMN profile_image_id VARCHAR(36);

    ALTER TABLE customer
    ADD CONSTRAINT profile_image_id_unique UNIQUE (profile_image_id);

## yaml config files

the backend java API uses yaml config files to connect to a database.  
currently this is a H2 in-memory database.  
this is a sample yaml config file for a postgres database.  
need to replace:
- URL: URL of postgres database
- USERNAME: username of database user, don't use "user" or "admin" as they are reserved words in postgres
- PASSWORD: password of database user


        server:
        port: 8080
        error:
            include-message: always

        cors:
        allowed-origins: "*"
        allowed-methods: "*"
        allowed-headers: "*"
        exposed-headers: "*"

        management:
        endpoints:
            web:
            exposure:
                include: "health,info,prometheus"

        spring:
        datasource:
            url: jdbc:postgresql://URL:5432/customer
            username: USERNAME
            password: PASSWORD
        jpa:
            hibernate:
            ddl-auto: validate
            properties:
            hibernate:
                dialect: org.hibernate.dialect.PostgreSQLDialect
                format_sql: true
            show-sql: false