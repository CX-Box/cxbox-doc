# CXBOX Migration Guide to Spring Boot 3.5.15
* [Spring Boot 3.5 Migration Guide](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-3.5-Release-Notes)
* [Hibernate 6.5 Migration Guide](https://docs.hibernate.org/orm/6.5/migration-guide/)
* [Hibernate 6.6 Migration Guide](https://docs.hibernate.org/orm/6.6/migration-guide/)
* [CXBOX core Pull Request](https://github.com/CX-Box/cxbox/pull/133/changes)

After upgrading to CXBOX 4.0.0-M25, verify that all core application functionality works correctly, with special attention to:

* database operations
* entity mappings
* Hibernate ORM behavior
* Criteria API specifications
* custom ID generation

The sections below highlight the required adjustments and explain what has changed in the core modules.

## What changes 

### **Сriteria API `cast` Behavior Changes**

!!! info
    You will not get a compile-time error — the issue will only become apparent at runtime when the request is executed

This change affects only custom providers (i.e. **extends AbstractClassifyDataProvider**).

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

[see example cxbox-core](https://github.com/CX-Box/cxbox/pull/133/changes#diff-e9e8d790c82fd1231482b15eb921e4fa387513eadc3150d052335256627d276a)

[Reference](https://docs.hibernate.org/orm/6.6/migration-guide/#criteria-query)
 
### Changes in Sequence Generator Behavior

If you are using our standard `BaseEntity`, which relies on `@ExtSequenceId` and is based on `@IdGeneratorType(ExtSequenceStyleGenerator.class)`, this change does **not** affect you.

However, if you are using `@IdGeneratorType(CustomSequenceStyleGenerator.class)`, you may encounter a Hibernate issue related to manually assigned identifiers, which can result in an `OptimisticLockException` during entity persistence.

For more details, see: [OptimisticLockException when manually setting the ID for the entity](https://discourse.hibernate.org/t/optimisticlockexception-when-manually-setting-the-id-for-the-entity/10975)

If you have your own custom `@IdGeneratorType` implementation extending `SequenceStyleGenerator`, you must explicitly allow manually assigned identifiers by overriding the following method:

```java
@Override
public boolean allowAssignedIdentifiers() {
    return true;
}
```

Without this override, Hibernate may treat manually assigned identifiers as conflicting with generated values and throw an `OptimisticLockException`.

[see example cxbox-core](https://github.com/CX-Box/cxbox/pull/133/changes#diff-534ee1e0f4d817fa96e0c343c8d0ee5ea07acc2ec4aa2611f65fd9a34951857d)

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

[see example cxbox-core](https://github.com/CX-Box/cxbox/pull/133/changes#diff-fc735952222c0d84f766a96110b970ded0612bf3509a93707085ca372b6754aa)