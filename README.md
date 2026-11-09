# Citizen Service Portal (Spring Boot 4.1.2 + MySQL)

Upgraded from Spring Boot 2.1.1 / Java 8 / PostgreSQL+MySQL mix to the latest
Spring Boot **4.1.2**. The project now uses **MySQL only**.

## Requirements
* **JDK 17 or newer** (JDK 21 recommended). A full JDK is needed - not just a JRE - because JSP pages are compiled at runtime.
* **MySQL 8.0+** (the dump uses the `utf8mb4_0900_ai_ci` collation)
* Maven 3.9+ (or just use the included `mvnw` / `mvnw.cmd`, or your IDE's Maven)

## 1. Create the database
```
mysql -u root -p < database/00_create_database.sql
mysql -u root -p citizen_service < database/project_db.sql
```
(or create a schema named `citizen_service` in MySQL Workbench and import `database/project_db.sql`)

## 2. Set your MySQL login
Open `src/main/resources/application.properties` and change `spring.datasource.username`
/ `spring.datasource.password` (default: `root` / `user`), **or** set environment variables
`DB_USERNAME`, `DB_PASSWORD` (and optionally `DB_URL`).

## 3. Run
```
./mvnw spring-boot:run          (Windows: mvnw.cmd spring-boot:run)
```
or build and run the WAR:
```
./mvnw clean package
java -jar target/citizenservice-1.0.0.war
```
Open http://localhost:8080

In IntelliJ / Eclipse / STS: import as an existing **Maven** project and run `CitizenserviceApplication`.

## What changed
| Area | Before | Now |
|---|---|---|
| Spring Boot | 2.1.1 | 4.1.2 (Spring Framework 7, Spring Security 7, Hibernate 7) |
| Java | 8 | 17+ |
| Database | MySQL + PostgreSQL driver, `schema="public"` on entities | MySQL only (`mysql-connector-j`) |
| Packages | `javax.*` | `jakarta.*` |
| Connection pool / datasource | hand-written DBCP2 `DataSourceConfig` | Spring Boot auto-config + HikariCP (`spring.datasource.*`) |
| Security config | `WebSecurityConfigurerAdapter` | `SecurityFilterChain` bean |
| Page layouts | Apache Tiles (no Jakarta version exists) | `LayoutViewResolver` + `<jsp:include>` (same `site.xxx` view names) |
| JSTL | `javax` JSTL, `http://java.sun.com/jsp/jstl/*` | Jakarta JSTL, `jakarta.tags.*` |
| Mail | `javax.mail` 1.4/1.5 | Jakarta Mail via `spring-boot-starter-mail` |
| Removed (unused) | c3p0, DBCP2, httpclient, commons-lang3, Spring Cloud/Admin BOMs, devtools, PostgreSQL | |
| Small fixes | JPQL `deleted=null`, `getOne()`, error pages always showing 404, "enable user" saving the text `(NULL)`, missing-user NPE at login | `IS NULL`, `findById`, correct status mapping, saves real NULL, `UsernameNotFoundException` |

## Notes
* Security rules are kept the same as the original (only `/dashBoard.htm` is role-restricted). Consider restricting the admin / authority URLs by role.
* `MSG91.KEY` (application.properties) and the Gmail credentials in `MailServiceUtil` are hard-coded in the original project - replace them with your own and keep them out of source control.
