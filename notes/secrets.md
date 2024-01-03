# Secrets

## backend java api

requires: 
- username for postgres database
- password for postgres database

reason: to manipulate customer table

location: src/main/resources/application.yaml

## terraform code

requires:
- AWS access_key
- AWS secret_key

reason: to access AWS CLI

location: TBD

---

requires: 
- username for postgres database
- password for postgres database

reason: to create postgres username and password

location: TBD