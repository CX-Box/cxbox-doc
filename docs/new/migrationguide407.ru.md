# Критические изменения. Руководство по миграции CXBOX на Spring Boot 4.0.7 { #breaking-changes-cxbox-migration-guide-to-spring-boot-407 }
* [Руководство по миграции на Spring Boot 4.0](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-4.0-Migration-Guide)
* [Руководство по миграции на Hibernate 7.0](https://docs.hibernate.org/orm/7.0/migration-guide/)
* [Руководство по миграции на Hibernate 7.1](https://docs.hibernate.org/orm/7.1/migration-guide/)
* [Руководство по миграции на Hibernate 7.2](https://docs.hibernate.org/orm/7.2/migration-guide/)
* [Pull Request в CXBOX CORE](https://github.com/CX-Box/cxbox/pull/134)
* [Pull Request в CXBOX DEMO](https://github.com/CX-Box/cxbox/pull/134)

Перед началом миграции настоятельно рекомендуем изучить все изменения зависимостей и проверить совместимость с текущей конфигурацией проекта.
Некоторые изменения требуют ручного обновления настроек приложения, управления зависимостями и пользовательских реализаций сущностей.

В разделах ниже описаны необходимые изменения и объяснено, что изменилось в модулях ядра.
 
## Что изменилось { #what-changes }

### Зависимость от Jackson2 { #dependency-on-jackson2 }
Мы используем **Jackson2**. Миграция на **Jackson 3** ещё **не** выполнена и запланирована после перехода на Spring Boot 4.3+.

**Необходимо переопределить все места, где используется зависимость от Jackson2.**

Добавьте jackson2 в application.yml.

```yaml
spring:
http:
converters:
preferred-json-mapper: jackson2
```

`spring-boot-starter-web`

=== "После"
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
=== "До"
    ```xml
        <dependency>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
    ```


`spring-boot-starter-websocket`

=== "После"
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
=== "До"
    ```xml
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-websocket</artifactId>
    </dependency>
    ```

`org.springdoc`

=== "После"
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
=== "До"
    ```xml
        <dependency>
          <groupId>org.springdoc</groupId>
          <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
          <version>${springdoc-openapi-starter-webmvc-ui.version}</version>
        </dependency>
    ```
### Зависимость от postgres { #dependency-on-postgres }
Минимальная поддерживаемая версия PostgreSQL определяется ограничениями Hibernate. [Minimum Database Version 13.0](https://docs.hibernate.org/orm/7.2/dialect/#_supported_dialects).

Мы используем зависимость postgres:14.0.

### Обновления модуля ядра `JpaDao` { #updated-to-core-module-jpadao }

Если вы используете наши стандартные `JpaDao`, `BaseDao`, `SpringData` и т. д., изменения не требуются.

??? Example "Пример"

    **persist()**    
    === "После"
        ```java
        public <T> T save(Object entity) {
            getSupportedEntityManager(Hibernate.getClass(entity).getName()).unwrap(Session.class).persist(entity);
            return (T) entity;
        }
        ```
    === "До"
        ```java
        public <T> T save(Object entity) {
            return (T) getSupportedEntityManager(Hibernate.getClass(entity).getName()).unwrap(Session.class).save(entity);
        }
        ```
    **find()**
    === "После"
        ```java
        public <T extends BaseEntity> T findById(Class<T> clazz, Long id) {
            return getSupportedEntityManager(clazz.getName()).unwrap(Session.class).find(clazz, id);
        }
        ```
    === "До"
        ```java
        public <T extends BaseEntity> T findById(Class<T> clazz, Long id) {
                return getSupportedEntityManager(clazz.getName()).unwrap(Session.class).get(clazz, id);
        }
        ```
 
    **remove()**
    === "После"
        ```java
            public <T extends BaseEntity> T delete(Class<T> clazz, Long id) {
            T o = findById(clazz, id);
            if (o != null) {
                getSupportedEntityManager(clazz.getName()).unwrap(Session.class).remove(o);
            } else {
                throw new EntityNotFoundException();
            }
            return o;
            }
        ```
    === "До"
        ```java
            public <T extends BaseEntity> T delete(Class<T> clazz, Long id) {
            T o = findById(clazz, id);
            if (o != null) {
                getSupportedEntityManager(clazz.getName()).unwrap(Session.class).delete(o);
            } else {
                throw new EntityNotFoundException();
            }	
            return o;
            }
        ```

 
Если вы используете `EntityManager` напрямую — устаревшие методы были заменены:
 

| Старый метод | Новый метод |
| ---------- | ----------- |
| `get()`    | `find()`    |
| `save()`   | `persist()` |
| `delete()` | `remove()`  |

Учтите, что поведение метода **persist** изменилось:

`persist` возвращает сохранённую **сущность**, а **save** возвращал **ID сущности**.

??? Example "Пример"

    **persist()**
    === "После"
        ```java
            void persist(Object object);
        ```
    === "До"
        ```java
            Object save(Object object);
        ```
 
    **find()**
    === "После"
        ```java
        <T> T find(Class<T> entityType, Object id);
        ```
    === "До"
        ```java
        <T> T get(Class<T> entityType, Object id);
        ```
      
    **remove()**
    === "После"
        ```java
	        void remove(Object object);
        ```
    === "До"
        ```java
       	    void delete(Object object);
        ```

[см. пример в cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-9b8295d2e3746d13dbf5db34172c204cf3d9cab7266bdcfdcc20299d3073f610)

### @GenericGenerator удалён из ядра { #genericgenerator-was-removed-from-core }

Если вы используете наш стандартный `BaseEntity`, изменения не требуются.

В Hibernate 7 стандартный `@GenericGenerator` работает некорректно и помечен к удалению.
Теперь используйте `@ExtSequenceGenerator`

Пример:

=== "После"
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
=== "До"
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

[см. пример в cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-5eb3792a0e14dcc6f28e02071be6248eead214b6aa75fd0d0a2df4e0b7d97e04)

[Справка](https://discourse.hibernate.org/t/hibernate-7-sequence-generator-broken/12155)
 
### `hibernate-jpamodelgen` удалён из ядра { #hibernate-jpamodelgen-was-removed-from-core }

`hibernate-jpamodelgen` заменён на `hibernate-processor`

=== "После"
    ```xml
        <dependency>
          <groupId>org.hibernate.orm</groupId>
          <artifactId>hibernate-processor</artifactId>
        </dependency>
    ```
=== "До"
    ```xml
        <dependency>
          <groupId>org.hibernate.orm</groupId>
          <artifactId>hibernate-jpamodelgen</artifactId>
        </dependency>
    ```

[см. пример в cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-9905460951c915aa721f69dd8d2762df8c19deb4f812bc47b0e1d6e720d07d9f)

### Новая зависимость `org.junit.platform:junit-platform-launcher` в модуле ядра { #new-dependency-orgjunitplatformjunit-platform-launcher-to-core-module }
В модуль ядра добавлена новая зависимость `org.junit.platform:junit-platform-launcher` для автотестов.

[см. пример в cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-9905460951c915aa721f69dd8d2762df8c19deb4f812bc47b0e1d6e720d07d9f)

### Новая зависимость `spring-cache` в модуле ядра { #new-dependency-spring-cache-to-core-module }
В модуль ядра добавлена новая зависимость `spring-cache` для кеширования.

[см. пример в cxbox-core](https://github.com/CX-Box/cxbox/pull/135/changes#diff-9905460951c915aa721f69dd8d2762df8c19deb4f812bc47b0e1d6e720d07d9f)
