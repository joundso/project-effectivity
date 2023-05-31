# Project effectivity

Simple webapp to determine if an order was profitable or not by protocolling and analyzing income, outcome and time spent

## Background - What is expected to be done?

App for recording time spent and expenses for orders on the one hand and revenues on the other. The aim of the app is to clearly show what the profit margin or loss was on an order. For this purpose, each employee should be able to book his time on an order. Each employee should have an hourly rate stored. The planned sales price is also stored in the order. The further the sum of all time spent and expenses is from the bottom of the sales price, the more profitable the order was.

## TL;DR

The pathway to this project setup:

1. Think of the DB design and set it up using the 'ERD Tool' from `pgadmin`
   1. Spin up the deplyoment: `cd docker; docker-compose -f postgres-pgadmin_docker-compose.yaml up -d`
   2. Access [localhost:5050](http://localhost:5050)
   3. Set up a password (e.g. `admin`)
   4. Set up the connection to the postgres service which was also set up in the previous docker-compose
      1. Host name/address `postgres`
      2. Port `5432`
      3. Username as POSTGRES_USER, by default: `postgres`
      4. Password as POSTGRES_PASSWORD, by default `changeme`
   5. 


## Further readings and thanks

- `pgadmin` and postgres docker-compose was adapted from @khezen (<https://github.com/khezen/compose-postgres>).
