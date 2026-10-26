# Meta builder

!!! warning line end "В разработке"
 
## Основы { #basics }
### FieldMetaBuilder
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/InputBasic){:target="_blank"} ·

??? Example "Пример"
 
    **Meta** наследует **FieldMetaBuilder**

      ```java
      --8<--
      {{ external_links.github_raw_doc }}/fields/input/basic/InputBasicMeta.java
      --8<--
      ```
### AnySourceFieldMetaBuilder

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·

??? Example "Пример"

    **Meta** наследует **AnySourceFieldMetaBuilder**

     ```java
     --8<--
     {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyExample3800Meta.java
     --8<--
     ```
Для настройки свойств в интерфейсах можно использовать следующие варианты:

* buildRowDependentMeta

* buildIndependentMeta
 

В целом настройка свойств в интерфейсах позволяет адаптировать пользовательский опыт и добавить приложению функциональности и гибкости.

### buildRowDependentMeta

`buildRowDependentMeta` формирует метаданные для одной записи. Он вызывается с `id` записи, поэтому свойства полей могут зависеть от данных записи.

Используйте `RowDependentFieldsMeta` для установки свойств полей, например `setEnabled`, `setRequired`, [setHidden](/ru/environment/meta/buildrowdependentmeta/sethidden/sethidden/).

```java
--8<--
{{ external_links.github_raw_doc }}/fields/input/basic/InputBasicMeta.java:buildRowDependentMeta
--8<--
```
