# Сервис { #service }

!!! warning line end "В разработке"

## Основы { #basics }
### VersionAwareResponseService

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/InputBasic){:target="_blank"} ·

VersionAwareResponseService используется для прямого вывода данных из таблицы,
когда количество выводимых строк совпадает с количеством записей в таблице.
Этот сервис не выполняет сложной агрегации данных.
Однако если нужно выводить данные из представления (view) БД, все необходимые преобразования данных можно выполнить в самом представлении.
??? Example "Пример"
      ```java
      --8<--
      {{ external_links.github_raw_doc }}/fields/input/basic/InputBasicService.java
      --8<--
      ```
#### doUpdateEntity
!!! tips "Совет"
      Этот метод не должен выполнять действий с побочными эффектами, так как ядро вызывает его несколько раз.
      Любые вызовы внешних сервисов, изменяющие данные или выполняющие действия, должны обрабатываться в invoker кнопки.

### AnySourceVersionAwareResponseService
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·

AnySourceVersionAwareResponseService позволяет отображать данные из любого источника: внешних источников данных и агрегированных данных из баз данных.
Для прямого вывода данных из базы данных рекомендуется использовать VersionAwareResponseService.

??? Example "Пример"

     ```java
     --8<--
     {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyExample3800Service.java
     --8<--
     ```

#### doUpdateEntity
!!! tips "Совет"
      Этот метод не должен выполнять действий с побочными эффектами, так как ядро вызывает его несколько раз. Добавлять действия можно только в текущую транзакцию.
      Любые вызовы внешних сервисов, изменяющие данные или выполняющие действия, должны обрабатываться в invoker кнопки.
