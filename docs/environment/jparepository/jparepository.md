# Repository

!!! warning line end "Work in progress"

## Problem Spring Data JPA 3.5.1+

### Spring Data JPA 3.5.1+ Regression with Converted Entity Properties

Problem Description

Starting with **Spring Data JPA 3.5.1**, queries involving **Hibernate custom types** (for example, dictionary-like value objects) may break when Spring Data rewrites JPQL queries into **constructor-based projections**.

As a result, repository methods that return a **concrete custom type** may fail at runtime.

---

Example

Entity Class

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

Custom Type (Dictionary Field)

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

Repository with Broken Query

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

Runtime Error

The second method fails with the following exception:

```text
org.springframework.dao.InvalidDataAccessApiUsageException:
org.hibernate.query.sqm.UnknownPathException:
Could not interpret attribute 'key' of basic-valued path
'org.demo.entity.TestEntity(40).testDictionary'
```

---

Workarounds

Workaround 1: Return Interface Type (Recommended)

For `DictionaryField`-like values, prefer returning the **interface type** instead of a concrete implementation.

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

✅ This avoids constructor-based projections and works correctly.

---

Workaround 2: Use `EntityManager` Directly

Bypass Spring Data query rewriting and execute JPQL manually:

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

Workaround 3: Track the Official Issue

For the latest status, fixes, or framework-level changes, see:

* **Spring Data JPA issue**:
  `spring-projects/spring-data-jpa/issues/3929`

---

Resolve Conflicting Dependencies

If multiple libraries introduce conflicting **transitive dependencies**, explicitly control versions using your build tool’s dependency management.

Maven example

Use **dependencyManagement** to lock versions and prevent unexpected behavior.

---

Fix Jackson Serialization Conflicts

Symptom

Errors similar to:

```text
Conflicting property-based creators:
already had explicit creator...
```

Solution

* Remove `@ConstructorProperties` from constructors not intended for JSON deserialization.
* When using **Lombok**, suppress JSON usage via constructor annotations:

```java
@AllArgsConstructor(onConstructor_ = @JsonIgnore)
```

⚠️ Be careful: this approach may conflict with **maven-doc-plugins** usage.

### Spring Data JPA 3.5.1: Custom Hibernate Types Issue

Starting with **Spring Data JPA 3.5.1**, support for custom Hibernate types in queries is broken when Spring Data rewrites queries into **constructor-based projections**.

As a result, queries that return **concrete custom types** may fail, while interface-based projections continue to work.


---
Workaround 1: Return an Interface Type  

**Recommended for `DictionaryField`s**

Spring Data can safely rewrite queries when the return type is an **interface**.

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

**Why this works:**
Spring Data does not apply constructor-based projections when returning an interface.

---

Workaround 2: Use `EntityManager` Directly

Bypass Spring Data query rewriting and execute JPQL manually via `EntityManager`.

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

**When to use:**
If returning a concrete custom type is mandatory and cannot be replaced with an interface.

---

Workaround 3: Track the Official Issue

For the latest status, discussions, and potential fixes, see the official Spring Data JPA issue:

* [https://github.com/spring-projects/spring-data-jpa/issues/3929](https://github.com/spring-projects/spring-data-jpa/issues/3929)

