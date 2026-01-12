# FAQ

## Did Hibernate custom types break starting with Spring Data JPA 3.5.1, requiring query rewrites to constructor-based projections?
Spring Data JPA 3.5.1+ Regression with Converted Entity Properties

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

## Why are browser Back, Forward, and Refresh buttons not  supported, and how can this affect saving changes?

The standard browser navigation buttons (**Back**, **Forward**, **Refresh**) are **not fully supported** by the application.

When using these buttons, the browser may restore a cached page state that does not match the actual application state. This can lead to **unexpected behavior**, including:

* Loss of unsaved changes
* Display of outdated data
* Inconsistent UI state after navigation or reload

Because of this, **you should not rely on the default browser buttons** for navigation or page refresh within the application.

---
Recommendations

* Always save changes explicitly using application controls before navigating away.
* Use in-application navigation elements instead of browser buttons.


---
Current Status

Custom application-level **Back**, **Forward**, and **Refresh** buttons are currently **in progress** and will provide predictable and safe navigation once implemented.
