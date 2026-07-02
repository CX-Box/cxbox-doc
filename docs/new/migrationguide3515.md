# CXBOX Migration Guide to Spring Boot 3.5.15
* [Spring Boot 3.5 Migration Guide](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-3.5-Release-Notes)
* [Hibernate 6.5 Migration Guide](https://docs.hibernate.org/orm/6.5/migration-guide/)
* [Hibernate 6.6 Migration Guide](https://docs.hibernate.org/orm/6.6/migration-guide/)
* [CXBOX core MR](https://github.com/CX-Box/cxbox/pull/133/changes)

After upgrading to CXBOX 4.0.0-M25, verify that all core application functionality works correctly, with special attention to:

* database operations
* entity mappings
* Hibernate ORM behavior
* Criteria API specifications
* custom ID generation

The sections below highlight the required adjustments and explain what has changed in the core modules.

## What changes 
### **Сriteria API `cast` Behavior Changes**

This change affects only custom providers  **extends AbstractClassifyDataProvider**.

If you use our standard providers, no changes are required.

Hibernate has changed the behavior of `cast` operations in the Criteria API.

The previous approach using is no longer valid for SQL `CAST` generation.

```java 
fieldPath.as(Class.class)
```

Example:

=== "After"
    ```java
    return ((JpaExpression<?>) fieldPath).cast(LocalTime.class);
    ```
=== "Before"
    ```java 
    return fieldPath.as(LocalTime.class);
    ```

If your custom providers use constructions like `.as(`, they must be replaced with `.cast(...)` via `JpaExpression`.

This ensures that Hibernate generates the correct SQL `CAST` expression and preserves the expected query behavior.

[Reference](https://docs.hibernate.org/orm/6.6/migration-guide/#criteria-query)

### **Changes in Sequence Generator Behavior**

If your project uses a custom sequence generator based on `@ExtSequenceGenerator`,
you may encounter the following Hibernate issue: [OptimisticLockException when manually setting the ID for the entity](https://discourse.hibernate.org/t/optimisticlockexception-when-manually-setting-the-id-for-the-entity/10975)

If you are using our default generator based on `SequenceStyleGenerator`, this issue does **not** affect you.

Example of the supported generator configuration:

```java
@ExtSequenceGenerator(
    parameters = {
        @Parameter(name = SequenceStyleGenerator.SEQUENCE_PARAM, value = "META_SEQ"),
        @Parameter(name = INITIAL_PARAM, value = "1"),
        @Parameter(name = INCREMENT_PARAM, value = "100"),
        @Parameter(name = OPT_PARAM, value = "pooled-lo")
    }
)
```

However, if you use your own **custom generator** that extends `SequenceStyleGenerator`, you need to explicitly allow manually assigned identifiers by overriding the following method:

```java
@Override
public boolean allowAssignedIdentifiers() {
    return true;
}
```

Without this override, Hibernate may treat manually assigned IDs as conflicting with generated identifiers and throw an `OptimisticLockException`.

[References](https://docs.hibernate.org/orm/6.6/javadocs/org/hibernate/id/Assigned.html)

### **Changes in Hibernate Annotation Validation**

If you use our standard `BaseEntity`, no changes are required.

In newer Hibernate versions, the annotation validation mechanism has changed.

Previously, in our `BaseEntity`, we used the `@PropagateAnnotations` annotation to automatically propagate `@DiscriminatorOptions(insert = false)` to child entities.

With the updated Hibernate validation, an additional consistency check was introduced for `@DiscriminatorOptions`: this annotation is now only valid if the target entity explicitly defines inheritance mapping annotations such as:

* `@DiscriminatorColumn`
* `@Inheritance`

Because of this, propagating `@DiscriminatorOptions` unconditionally to all child entities started causing validation errors for entities that do not participate in inheritance mapping.

To fix this behavior, the propagation logic was updated:

`@DiscriminatorOptions(insert = false)` is now propagated to a child entity **only if** that entity contains at least one of the following annotations:

* `@DiscriminatorColumn`
* `@Inheritance`
 