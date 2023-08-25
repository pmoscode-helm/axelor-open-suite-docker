# Axelor Open Suite - Docker image

Open source ERP and BPM platform. (Docker image)

## How to use

This Docker image is meant to be used with PostgreSQL.
So for that, there are some tasks that utilize docker-compose to startup Axelor and a PostgreSQL server.

To use them, you need to install [Taskfile](https://taskfile.dev/installation/) first.

Then you can execute and it will show the logs from PostgreSQL:

```bash
task dev:start-postgres
```

Use another terminal to call:

```bash
task dev:start-axelor
```

The Axelor logs are also show. But it takes some time to start up Axelor. 

When you're done, execute 
```bash
task dev:stop-axelor
task dev:stop-postgres
task dev:remove-volumes # If you want to remove the volumes also
```

If it fails to remove some, check the names with `docker volume list`

If you want to run in inside Kubernetes, check this out: 

## Configuration

The [docker-compose.yaml](docker-compose.yaml) uses only some configuration options.
To get all possible values, see here: https://docs.axelor.com/adk/6.1/dev-guide/application/config.html

These volumes are used to mount:

- Axelor data: /opt/data
- Tomcat data: /bitnami/tomcat/webapps

You should mount them, so that Axelor hasn't to be redeployed every time the container starts.
