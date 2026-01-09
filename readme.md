# ReqResKarateProject

## Summary
A sample API test project using Karate (BDD). Tests live in the `demo` module, executed via Maven with JUnit 5 runners. HTML reports are generated under `target/karate-reports`.

## Project structure
- demo/
  - pom.xml
  - src/test/java/
    - examples/users/users.feature
    - examples/students/students.feature
    - examples/users/UsersRunner.java
    - examples/students/StudentsRunner.java
    - examples/ExamplesTest.java
  - target/karate-reports/ (HTML and JSON reports)
  - target/test-classes/karate-config.js

## Prerequisites & technologies
- Java (JDK 17 recommended)
- Maven
- Karate (1.x)
- JUnit 5

## Installation
1. Clone the repository.
2. Change into the demo module:
   ```bash
   cd demo
   ```
3. Verify Java and Maven:
   ```bash
   java -version
   mvn -v
   ```

## How to run
- Run all tests:
  ```bash
  mvn clean test
  ```
- Run a specific JUnit test (example parallel runner):
  ```bash
  mvn clean -Dtest=examples.ExamplesTest#testParallel test
  ```
- Run tests by tag (Karate tag):
  ```bash
  mvn clean test -Dkarate.options="--tags @api_test_users"
  ```
  Example tags in repository:
  - `@api_test_users` — examples/users/users.feature
  - `@api_test_students` — examples/students/students.feature

## Reporting
- After test execution, view HTML reports:
  - Summary: `demo/target/karate-reports/karate-summary.html`
  - Per-feature reports: `demo/target/karate-reports/<feature>.html`
- JSON artifacts:
  - `demo/target/karate-reports/karate-summary-json.txt`
  - `demo/target/karate-reports/<feature>.karate-json.txt`
