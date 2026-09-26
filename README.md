# Practice Spring Boot App

A minimal runnable Spring Boot application with a `GET /hello` endpoint.

## Run

From this directory:

```bash
mvn spring-boot:run
```

Then open <http://localhost:8080/hello> or run:

```bash
curl http://localhost:8080/hello
```

The response is:

```text
Hello Pradip
```

To build an executable jar:

```bash
mvn package
java -jar target/practice-0.0.1-SNAPSHOT.jar
```

## Continuous integration

GitHub Actions builds the JAR and Docker image on every push and pull request.
The workflow is in `.github/workflows/build.yml`.
