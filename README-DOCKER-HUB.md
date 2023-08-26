# Axelor Open Suite

This image uses as base bitnami/tomcat and the specific Axelor version in its tag. (So Axelor v7.1.2 -> Image tag version v7.1.2)

Use the usual Docker commands to run it. But you need a PostgreSQL database to get it run.

Besides that, I have a docker-compose file in its repo: https://github.com/pmoscode-helm/axelor-open-suite-docker

You just need to execute `task local:start-postgres` to start the DB and `task local:start-axelor` to start the app. But you need [Taskfile](https://taskfile.dev/) first.

The [docker-compose.yaml](https://github.com/pmoscode-helm/axelor-open-suite-docker/blob/main/docker-compose.yaml) uses only some configuration options.
To get all possible values, see here: https://docs.axelor.com/adk/6.1/dev-guide/application/config.html
