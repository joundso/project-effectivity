# Project effectivity

The goal: Simple webapp to determine if an order was profitable or not by protocolling and analyzing income, outcome and time spent.

⚠️ This is work in progress and not yet working. ⚠️

## Background - What is expected to be done?

App for recording time spent and expenses for orders on the one hand and revenues on the other. The aim of the app is to clearly show what the profit margin or loss was on an order. For this purpose, each employee should be able to book his time on an order. Each employee should have an hourly rate stored. The planned sales price is also stored in the order. The further the sum of all time spent and expenses is from the bottom of the sales price, the more profitable the order was.

## How to get it run

1. Make sure youe have [Docker](https://docs.docker.com/get-docker/) (inkl. docker-compose) and [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) installed
2. Clone this repo & spin up the container:

    ```bash
    git clone https://github.com/joundso/project-effectivity.git
    bash ./start.sh
    ```

3. Access the included components:
   1. The *pgAdmin* database inspection frontend is running under [localhost:5050](http://localhost:5050/)
      1. Set up a password (e.g. `admin`)
      2. Set up the connection to the postgres service which was also set up in the previous docker-compose (the following vars ca be changed in [postgres.env](./docker/postgres.env)):
         1. Host name/address: `postgres`
         2. Port: `5432`
         3. Username: `postgres`
         4. Password: `changeme`
   2. The *Budibase* toolkit for low-/no-code building the app is available under [localhost:10000](http://localhost:10000/)

## TL;DR

### pgAdmin

- UI is available here: [localhost:5050](http://localhost:5050/)
- To access the `ERD tool` to design the database scheme:
  1. Connect to the database within pgAdmin (click e.g. on the database `budibase` on the left: *Servers* --> *postgres* --> *Databases* --> *budibase*)
  2. At the top menu bar, select *Tools* --> *ERD tool*
  3. The empty ERD tool opens. Press *CTRL* + *O* (or click *Load Project*) in the top left corner of the new ERD tool window
  4. Navigate to the path `/home/mount/` and open the file [`pgadmin_db_schema.json`](./data/db/pgadmin_db_schema.json)

### Budibase

- To compress app files for the budibase import:

    ```bash
    cd ./data/budibase/
    tar -zcvf ../app.tar.gz *
    ```

## Further readings and thanks

- `pgadmin` and postgres docker-compose was adapted from @khezen (<https://github.com/khezen/compose-postgres>).
