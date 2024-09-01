# REQ112703

This section contains information about the enhanced CI / CD process created for this assignment using GitHub Actions.

## Instructions and information for Question 1
To run the repos locally, run `docker compose up` command from root directory.  The Dockerfile includes both starting the environment and running the unit tests.  The more detail explanation about the entire stack process being started are included from the original readme definition in the `Sample API` section below.

The technical file changes are included in 
[Changelog for Question1](changelog_question1.md)

## Instructions and information for Question 2
The CI / CD process is automatically triggered when there is code update or checkin to the master branch of the repository.  The workflow process and status can be found from the following link:

[GitHub Actions Workflow](https://github.com/ldominic-hy/req112703/actions)

The workflow build a package ready for deployment and uploaded into GitHub container registry (ghcr.io).  Please refer to the following link on created packages:

[Docker package images](https://github.com/ldominic-hy/req112703/pkgs/container/req112703)

To download the packages in docker, please run the command similar to the following:

`docker pull ghcr.io/ldominic-hy/req112703:sha256-808b033a9054e28bcab1d37a1d0c2f09d4d8220c8132dd0dd9d6f4f3bf307c43.sig`

Note that the version would be different after each build.  You should always refer to the `Docker package images` link above for the latest built version.

The technical file changes are included in 
[Changelog for Question2](changelog_question2.md)


## Instructions and information for Question 3

Answer to Question 3 has been included as a pdf format in this repos root directory with the link below:

[REQ112703-Question3.pdf](REQ112703-Question3.pdf)


Any other unchanged information can be referred to the original readme of the `Sample API` below.

# Sample API

This is a sample api. 

## Technology Used
- [x] [Python](https://www.python.org)
- [x] [FastAPI](https://fastapi.tiangolo.com)
- [x] [SQLAlchemy](https://www.sqlalchemy.org)
- [x] [Poetry](https://python-poetry.org)
- [x] [Flyway](https://www.red-gate.com/products/flyway/community/)
- [x] [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

### Environment variables

The following environment variables are expected:

- ORIGINS: comma separated list of [allowed origins](https://fastapi.tiangolo.com/tutorial/cors/).
- POSTGRES_SERVER: URL of db server
- POSTGRES_USER
- POSTGRES_PASSWORD
- POSTGRES_DB: postgres DB name

### DB adaptor

The [psycopg2](https://www.psycopg.org) adaptor is used. Note the [installation requirements](https://www.psycopg.org/docs/install.html) for the psycopg2 package. The [sample-api dependencies](pyproject.toml) use the psycopg2 package and not the psycopg2-binary package.
    
## Local Development

### Running locally

- Run `docker compose up` command from root directory to start the entire stack. The following will be started: 
  - Postgres server 
  - Flyway - it setups the postgres tables and inserts some dev data.
  - sample-api server
- Environment variables are defined in the docker-compose.yml
- The `sample-api` folder is volume mounted, so any changes to the code will be reflected in the container 
- The API's documentation is available at [http://localhost:3003/docs](http://localhost:3003/docs).


### Unit tests

- Run `docker compose --profile test up` command to run the unit tests from the root directory. This will run the above services as well as the unit tests.
- The folder is volume mounted, so any changes to the code will be reflected in the container and run the unit tests again.


## The API

This is a simple API. It is not production ready. 

The API is based on the table schema defined in [V1.0.0__init.sql](db/migrations/V1.0.0__init.sql) file. Note the foreign key constraint if you want to try the endpoints out.

The [http://localhost:3003/docs](http://localhost:3003/docs) page lists the available endpoints.