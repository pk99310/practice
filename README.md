# Hello World Spring Boot App

A minimal runnable Spring Boot application that returns `Hello World!`.

## Run

From this directory:

```bash
mvn spring-boot:run
```

Then open <http://localhost:8080/> or run:

```bash
curl http://localhost:8080/
```

The response is:

```text
Hello World!
```

To build an executable jar:

```bash
mvn package
java -jar target/hello-world-0.0.1-SNAPSHOT.jar
```
