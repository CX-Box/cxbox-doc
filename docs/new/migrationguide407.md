# Breaking Changes. CXBOX Migration Guide to Spring Boot 4.0.7
* [Spring Boot 4.0 Migration Guide](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-4.0-Migration-Guide)
* [Hibernate 7.0 Migration Guide](https://docs.hibernate.org/orm/7.0/migration-guide/)
* [Hibernate 7.1 Migration Guide](https://docs.hibernate.org/orm/7.1/migration-guide/)
* [Hibernate 7.2 Migration Guide](https://docs.hibernate.org/orm/7.2/migration-guide/)
* [CXBOX CORE Pull Request](https://github.com/CX-Box/cxbox/pull/134)
* [CXBOX DEMO Pull Request](https://github.com/CX-Box/cxbox/pull/134)

Before starting the migration, we strongly recommend reviewing all dependency changes and verifying compatibility with your current project configuration. 
Some changes require manual updates in application settings, dependency management, and custom entity implementations.

The sections below highlight the required adjustments and explain what has changed in the core modules.
 
## What changes

### Dependency on Jackson2
We use **Jackson2**.Migration to **Jackson 3** has **not** been performed yet and is planned after upgrading to Spring Boot 4.3+.

**It is necessary to override all places where a dependency on Jackson2 is used.**

Add jackson2 to application.yml. 

```yaml
spring:
http:
converters:
preferred-json-mapper: jackson2
```

`spring-boot-starter-web`

=== "After"
    ```xml
      <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
      <exclusions>
        <exclusion>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-starter-jackson</artifactId>
        </exclusion>
      </exclusions>
    </dependency>
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-jackson2</artifactId>
    </dependency>
    ```
=== "Before"
    ```xml
        <dependency>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
    ```


`spring-boot-starter-websocket`

=== "After"
    ```xml
      <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
      <exclusions>
        <exclusion>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-starter-jackson</artifactId>
        </exclusion>
      </exclusions>
    </dependency>
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-jackson2</artifactId>
    </dependency>
    ```
=== "Before"
    ```xml
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-websocket</artifactId>
    </dependency>
    ```

`org.springdoc`

=== "After"
    ```xml
        <dependency>
          <groupId>org.springdoc</groupId>
          <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
          <version>${springdoc-openapi-starter-webmvc-ui.version}</version>
          <exclusions>
            <exclusion>
              <groupId>org.springframework.boot</groupId>
              <artifactId>spring-boot-jackson</artifactId>
            </exclusion>
          </exclusions>
        </dependency>
    ```
=== "Before"
    ```xml
        <dependency>
          <groupId>org.springdoc</groupId>
          <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
          <version>${springdoc-openapi-starter-webmvc-ui.version}</version>
        </dependency>
    ```
### Dependency on postgres 
The minimum supported PostgreSQL version is determined by Hibernate limitations.[Minimum Database Version 13.0](https://docs.hibernate.org/orm/7.2/dialect/#_supported_dialects).

We use dependency on postgres:14.0.

### Updated  to core module `JpaDao`
If you use our standard `JpaDao`, `BaseDao`, `SpringData` etc. no changes are required.
If you use `EntityManager` directly -  deprecated  methods were replaced:

| Old Method | New Method  |
| ---------- | ----------- |
| `get()`    | `find()`    |
| `save()`   | `persist()` |
| `delete()` | `remove()`  |


**find()**
=== "After"
    ```java
    getSupportedEntityManager(clazz.getName()).unwrap(Session.class).find(clazz, id);
    ```
=== "Before"
    ```java
    getSupportedEntityManager(clazz.getName()).unwrap(Session.class).get(clazz, id);
    ```

**persist()**
=== "After"
    ```java
    getSupportedEntityManager(Hibernate.getClass(entity).getName()).unwrap(Session.class).save(entity);
    ```
=== "Before"
    ```java
    getSupportedEntityManager(Hibernate.getClass(entity).getName()).unwrap(Session.class).persist(entity);
    ```

**remove()**
=== "After"
    ```java
    getSupportedEntityManager(clazz.getName()).unwrap(Session.class).delete(o);
    ```
=== "Before"
    ```java
    getSupportedEntityManager(clazz.getName()).unwrap(Session.class).remove(o);
    ```

[see example cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-9b8295d2e3746d13dbf5db34172c204cf3d9cab7266bdcfdcc20299d3073f610)

### @GenericGenerator was removed from core 

If you use our standard `BaseEntity`, no changes are required.

In Hibernate 7, the standard `@GenericGenerator` works incorrectly and is marked for removal.
New use  `@ExtSequenceGenerator`

Example:

=== "After"
    ``` java
        @ExtSequenceGenerator(
        parameters = {
        @Parameter(name = SequenceStyleGenerator.SEQUENCE_PARAM, value = "app_seq"),
        @Parameter(name = INCREMENT_PARAM, value = "1")
        }
        )
        public abstract class BaseEntity extends AbstractEntity implements Serializable {
        
            @Id
            @ExtSequenceId
            @JdbcTypeCode(SqlTypes.NUMERIC)
            @Column()
            protected Long id;
    ```
=== "Before"
    ```java
        public abstract class BaseEntity extends AbstractEntity implements Serializable {

        @Id
        @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "extSequenceGenerator")
        @GenericGenerator(
                name = "extSequenceGenerator",
                type = org.cxbox.model.core.hbn.ExtSequenceStyleGenerator.class,
                parameters = {
                        @Parameter(name = SequenceStyleGenerator.SEQUENCE_PARAM, value = "app_seq"),
                        @Parameter(name = INCREMENT_PARAM, value = "1"),
                }
        )
        @JdbcTypeCode(SqlTypes.NUMERIC)
        @Column()
        protected Long id;
    ```

[see example cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-5eb3792a0e14dcc6f28e02071be6248eead214b6aa75fd0d0a2df4e0b7d97e04)

[References](https://discourse.hibernate.org/t/hibernate-7-sequence-generator-broken/12155)
 
### `hibernate-jpamodelgen` was removed from core

`hibernate-jpamodelgen` has been replaced with `hibernate-processor`

=== "After"
    ```xml
        <dependency>
          <groupId>org.hibernate.orm</groupId>
          <artifactId>hibernate-processor</artifactId>
        </dependency>
    ```
=== "Before"
    ```xml
        <dependency>
          <groupId>org.hibernate.orm</groupId>
          <artifactId>hibernate-jpamodelgen</artifactId>
        </dependency>
    ```

[see example cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-9905460951c915aa721f69dd8d2762df8c19deb4f812bc47b0e1d6e720d07d9f)

### New dependency `org.junit.platform:junit-platform-launcher` to core module
A new dependency has been added to the core module: `org.junit.platform:junit-platform-launcher` for autotests.

[see example cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-9905460951c915aa721f69dd8d2762df8c19deb4f812bc47b0e1d6e720d07d9f)

### New dependency `spring-cache` to core module
A new dependency has been added to the core module: `spring-cache` for cache.

[see example cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-9905460951c915aa721f69dd8d2762df8c19deb4f812bc47b0e1d6e720d07d9f)
