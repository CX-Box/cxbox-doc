# Руководство по миграции CXBOX на Spring Boot 3.5.15 { #cxbox-migration-guide-to-spring-boot-3515 }
* [Руководство по миграции на Spring Boot 3.5](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-3.5-Release-Notes)
* [Руководство по миграции на Hibernate 6.5](https://docs.hibernate.org/orm/6.5/migration-guide/)
* [Руководство по миграции на Hibernate 6.6](https://docs.hibernate.org/orm/6.6/migration-guide/)
* [Pull Request в CXBOX core](https://github.com/CX-Box/cxbox/pull/133/changes)

После обновления до CXBOX 4.0.0-M25 убедитесь, что вся основная функциональность приложения работает корректно, обратив особое внимание на:

* операции с базой данных
* маппинг сущностей
* поведение Hibernate ORM
* спецификации Criteria API
* генерацию пользовательских ID

В разделах ниже описаны необходимые изменения и объяснено, что изменилось в модулях ядра.

## Что изменилось { #what-changes }

### **Изменения поведения `cast` в Criteria API** { #criteria-api-cast-behavior-changes }

!!! info
    Ошибки компиляции не будет — проблема проявится только во время выполнения, при выполнении запроса

Это изменение затрагивает только пользовательские провайдеры (то есть **extends AbstractClassifyDataProvider**).

Если вы используете наши стандартные провайдеры, изменения не требуются.

В Hibernate изменилось поведение операций `cast` в Criteria API.

Прежний подход больше не подходит для генерации SQL `CAST`.

```java 
fieldPath.as(Class.class)
```

Пример:

=== "После"
    ```java
    return ((JpaExpression<?>) fieldPath).cast(LocalTime.class);
    ```
=== "До"
    ```java 
    return fieldPath.as(LocalTime.class);
    ```

Если в ваших пользовательских провайдерах используются конструкции вида `.as(`, их нужно заменить на `.cast(...)` через `JpaExpression`.

Это гарантирует, что Hibernate сформирует корректное SQL-выражение `CAST` и сохранит ожидаемое поведение запроса.

[см. пример в cxbox-core](https://github.com/CX-Box/cxbox/pull/133/changes#diff-e9e8d790c82fd1231482b15eb921e4fa387513eadc3150d052335256627d276a)

[Справка](https://docs.hibernate.org/orm/6.6/migration-guide/#criteria-query)
 
### Изменения в поведении генератора последовательностей { #changes-in-sequence-generator-behavior }

Если вы используете наш стандартный `BaseEntity`, который опирается на `@ExtSequenceId` и основан на `@IdGeneratorType(ExtSequenceStyleGenerator.class)`, это изменение вас **не** затрагивает.

Однако если вы используете `@IdGeneratorType(CustomSequenceStyleGenerator.class)`, можно столкнуться с проблемой Hibernate, связанной с вручную назначенными идентификаторами, которая приводит к `OptimisticLockException` при сохранении сущности.

Подробнее см.: [OptimisticLockException when manually setting the ID for the entity](https://discourse.hibernate.org/t/optimisticlockexception-when-manually-setting-the-id-for-the-entity/10975)

Если у вас есть собственная реализация `@IdGeneratorType`, наследующая `SequenceStyleGenerator`, нужно явно разрешить вручную назначенные идентификаторы, переопределив следующий метод:

```java
@Override
public boolean allowAssignedIdentifiers() {
    return true;
}
```

Без этого переопределения Hibernate может считать вручную назначенные идентификаторы конфликтующими со сгенерированными значениями и выбрасывать `OptimisticLockException`.

[см. пример в cxbox-core](https://github.com/CX-Box/cxbox/pull/133/changes#diff-534ee1e0f4d817fa96e0c343c8d0ee5ea07acc2ec4aa2611f65fd9a34951857d)

[Справка](https://docs.hibernate.org/orm/6.6/javadocs/org/hibernate/id/Assigned.html)

### **Изменения в валидации аннотаций Hibernate** { #changes-in-hibernate-annotation-validation }

Если вы используете наш стандартный `BaseEntity`, изменения не требуются.

В новых версиях Hibernate изменился механизм валидации аннотаций.

Раньше в нашем `BaseEntity` использовалась аннотация `@PropagateAnnotations` для автоматического распространения `@DiscriminatorOptions(insert = false)` на дочерние сущности.

В обновлённой валидации Hibernate появилась дополнительная проверка согласованности для `@DiscriminatorOptions`: теперь эта аннотация допустима, только если целевая сущность явно задаёт аннотации маппинга наследования, например:

* `@DiscriminatorColumn`
* `@Inheritance`

Из-за этого безусловное распространение `@DiscriminatorOptions` на все дочерние сущности стало вызывать ошибки валидации для сущностей, не участвующих в маппинге наследования.

Чтобы исправить это поведение, логика распространения была обновлена:

`@DiscriminatorOptions(insert = false)` теперь распространяется на дочернюю сущность, **только если** она содержит хотя бы одну из следующих аннотаций:

* `@DiscriminatorColumn`
* `@Inheritance`

[см. пример в cxbox-core](https://github.com/CX-Box/cxbox/pull/133/changes#diff-fc735952222c0d84f766a96110b970ded0612bf3509a93707085ca372b6754aa)