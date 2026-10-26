# Репозиторий { #repository }

!!! warning line end "В разработке"

## Проблема Spring Data JPA 3.5.1+ { #problem-spring-data-jpa-351 }

### Регрессия Spring Data JPA 3.5.1+ при работе с конвертируемыми свойствами сущностей { #spring-data-jpa-351-regression-with-converted-entity-properties }

Описание проблемы

Начиная с **Spring Data JPA 3.5.1**, запросы, использующие **пользовательские типы Hibernate** (например, объекты-значения, похожие на справочники), могут перестать работать, когда Spring Data переписывает JPQL-запросы в **проекции на основе конструктора**.

В результате методы репозитория, возвращающие **конкретный пользовательский тип**, могут завершаться ошибкой во время выполнения.

---

Пример

Класс сущности

```java
@Setter
@Getter
@Entity
@Table(name = "TEST_ENTITY")
@SuperBuilder(toBuilder = true)
public class TestEntity extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    @Column(name = "TEST_DICTIONARY")
    private TestCustomDictionary testDictionary;

    @Column(name = "TEST_SIMPLE_FIELD")
    private String testSimpleField;
}
```

---

Пользовательский тип (поле-справочник)

```java
public final class TestCustomDictionary implements Dictionary {

    public static final TestCustomDictionary VALUE1 = new TestCustomDictionary("VALUE1");
    public static final TestCustomDictionary VALUE2 = new TestCustomDictionary("VALUE2");
    public static final TestCustomDictionary VALUE3 = new TestCustomDictionary("VALUE3");
    public static final TestCustomDictionary VALUE4 = new TestCustomDictionary("VALUE4");

    @Serial
    private static final long serialVersionUID = 0L;

    private final String key;

    public TestCustomDictionary(String key) {
        this.key = key;
    }
}
```

---

Репозиторий с неработающим запросом

```java
@Repository
public interface TestEntityRepository
        extends JpaRepository<TestEntity, Long>,
                JpaSpecificationExecutor<TestEntity> {

    // ✅ WORKS — returns interface type
    // JPQL: SELECT c.testDictionary FROM TestEntity c
    @Query("""
        SELECT c.testDictionary
        FROM TestEntity c
    """)
    Set<Dictionary> workedMethod();

    // ❌ BROKEN — returns concrete custom type
    // Rewritten by Spring Data into constructor-based projection
    // SELECT new TestCustomDictionary(c.testDictionary) FROM TestEntity c
    @Query("""
        SELECT testDictionary
        FROM TestEntity
    """)
    Set<TestCustomDictionary> brokenMethod();
}
```

---

Ошибка во время выполнения

Второй метод завершается со следующим исключением:

```text
org.springframework.dao.InvalidDataAccessApiUsageException:
org.hibernate.query.sqm.UnknownPathException:
Could not interpret attribute 'key' of basic-valued path
'org.demo.entity.TestEntity(40).testDictionary'
```

---

Обходные решения

Обходное решение 1: возвращать тип интерфейса (рекомендуется)

Для значений, подобных `DictionaryField`, лучше возвращать **тип интерфейса**, а не конкретную реализацию.

```java
@Repository
public interface TestEntityRepository
        extends JpaRepository<TestEntity, Long>,
                JpaSpecificationExecutor<TestEntity> {

    @Query("""
        SELECT c.testDictionary
        FROM TestEntity c
    """)
    Set<Dictionary> findAllTestDictionaries();
}
```

✅ Это позволяет избежать проекций на основе конструктора и работает корректно.

---

Обходное решение 2: использовать `EntityManager` напрямую

Обойдите переписывание запросов Spring Data и выполните JPQL вручную:

```java
String jpql =
    "SELECT DISTINCT c.testDictionary " +
    "FROM TestEntity c " +
    "WHERE c.testDictionary IN :dictionaries";

TypedQuery<TestCustomDictionary> query =
    entityManager.createQuery(jpql, TestCustomDictionary.class);

List<TestCustomDictionary> dictionaries = List.of(
    TestCustomDictionary.VALUE1,
    TestCustomDictionary.VALUE4
);

query.setParameter("dictionaries", dictionaries);

List<TestCustomDictionary> resultList = query.getResultList();
```

---

Обходное решение 3: отслеживать официальный issue

Актуальный статус, исправления и изменения на уровне фреймворка см.:

* **Issue Spring Data JPA**:
  `spring-projects/spring-data-jpa/issues/3929`

---

Разрешение конфликтующих зависимостей

Если несколько библиотек приносят конфликтующие **транзитивные зависимости**, явно управляйте версиями с помощью механизма управления зависимостями вашего инструмента сборки.

Пример для Maven

Используйте **dependencyManagement**, чтобы зафиксировать версии и предотвратить неожиданное поведение.

---

Устранение конфликтов сериализации Jackson

Симптом

Ошибки вида:

```text
Conflicting property-based creators:
already had explicit creator...
```

Решение

* Удалите `@ConstructorProperties` с конструкторов, не предназначенных для JSON-десериализации.
* При использовании **Lombok** отключите использование в JSON через аннотации конструктора:

```java
@AllArgsConstructor(onConstructor_ = @JsonIgnore)
```

⚠️ Будьте осторожны: этот подход может конфликтовать с использованием **maven-doc-plugins**.

### Spring Data JPA 3.5.1: проблема с пользовательскими типами Hibernate { #spring-data-jpa-351-custom-hibernate-types-issue }

Начиная с **Spring Data JPA 3.5.1**, поддержка пользовательских типов Hibernate в запросах нарушена, когда Spring Data переписывает запросы в **проекции на основе конструктора**.

В результате запросы, возвращающие **конкретные пользовательские типы**, могут завершаться ошибкой, тогда как проекции на основе интерфейсов продолжают работать.


---
Обходное решение 1: возвращать тип интерфейса

**Рекомендуется для `DictionaryField`**

Spring Data может безопасно переписывать запросы, если возвращаемый тип — **интерфейс**.

```java
@Repository
public interface TestEntityRepository
        extends JpaRepository<TestEntity, Long>,
                JpaSpecificationExecutor<TestEntity> {

    // ✅ WORKS – returns interface type
    // Rewritten to: SELECT c.testDictionary FROM TestEntity c
    @Query("""
        SELECT c.testDictionary
        FROM TestEntity c
    """)
    Set<Dictionary> workedMethod();

    // ❌ BROKEN – returns concrete custom type
    // Rewritten to:
    // SELECT new org.demo.entity.dictionary.TestCustomDictionary(c.testDictionary)
    // FROM TestEntity c
    @Query("""
        SELECT c.testDictionary
        FROM TestEntity c
    """)
    Set<TestCustomDictionary> brokenMethod();
}
````

**Почему это работает:**
Spring Data не применяет проекции на основе конструктора при возврате интерфейса.

---

Обходное решение 2: использовать `EntityManager` напрямую

Обойдите переписывание запросов Spring Data и выполните JPQL вручную через `EntityManager`.

```java
String jpql =
    "SELECT DISTINCT c.testDictionary " +
    "FROM TestEntity c " +
    "WHERE c.testDictionary IN :dictionaries";

TypedQuery<TestCustomDictionary> query =
    entityManager.createQuery(jpql, TestCustomDictionary.class);

List<TestCustomDictionary> dictionaries = List.of(
    TestCustomDictionary.VALUE1,
    TestCustomDictionary.VALUE4
);

query.setParameter("dictionaries", dictionaries);

List<TestCustomDictionary> resultList = query.getResultList();
```

**Когда использовать:**
Если возврат конкретного пользовательского типа обязателен и его нельзя заменить интерфейсом.

---

Обходное решение 3: отслеживать официальный issue

Актуальный статус, обсуждения и возможные исправления см. в официальном issue Spring Data JPA:

* [https://github.com/spring-projects/spring-data-jpa/issues/3929](https://github.com/spring-projects/spring-data-jpa/issues/3929)

