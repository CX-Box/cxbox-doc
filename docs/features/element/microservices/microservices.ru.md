# Микросервисы { #microservices }

В нашей системе выполняются пять основных типов операций:

* Получение данных по ID: эта операция получает конкретные записи данных из микросервиса по их уникальному идентификатору (ID). Это позволяет получать отдельные записи по мере необходимости.

* Получение всех данных: эта операция получает все доступные данные из микросервиса.

* Удаление: удаление существующих записей. Обычно это взаимодействие с микросервисом для удаления конкретных записей.

* Обновление существующих записей: внесение изменений путём отправки данных в микросервис для обработки и хранения.

* Создание: создание новых записей путём отправки данных в микросервис для обработки и хранения.


## Основы { #basics }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/microservice){:target="_blank"}

Создание сущностей для микросервисов во многом похоже на создание сущностей для доступа к базе данных, за несколькими заметными исключениями.

1) Вместо создания entity создаётся сущность-маппинг, через которую данные будут отправляться в микросервис.

2) Вместо FieldMetaBuilder используется AnySourceFieldMetaBuilder.

3) Вместо VersionAwareResponseService используется AnySourceVersionAwareResponseService.

4) Создаётся сервис, наследующий AbstractAnySourceBaseDAO и реализующий AnySourceBaseDAO

??? Example "Пример"
    - **Шаг 1.1** Создайте сущность-маппинг, через которую данные будут отправляться в микросервис
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyEntity3800OutServiceDTO.java
        --8<--
        ```
    - **Шаг 1.2** Создайте **DAO**, наследующий **AbstractAnySourceBaseDAO** и реализующий **AnySourceBaseDAO**
        Переопределите методы:

          * **Получение данных по ID**:  метод [getByIdIgnoringFirstLevelCache](#getByIdIgnoringFirstLevelCache)

          * **Получение всех данных**: метод [getList](#getList)

          * **Удаление**: метод [delete](#delete)

          * **Обновление существующих записей**:  метод [update](#update)

          * **Создание** : метод  [create](#create)

           ```java
           --8<--
           {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyEntity3800Dao.java
           --8<--
           ```
      - **Шаг 1.3** Создайте **DTO**, наследующий **DataResponseDTO**
          Создание полей в DTO с нужными свойствами, например фильтрацией, описано в статье
          [типы полей](/ru/widget/fields/fieldtypes/)

          ```java
          --8<--
          {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyExample3800DTO.java
          --8<--
          ```
      - **Шаг 1.4** Создайте **MetaBuilder**, наследующий **AnySourceFieldMetaBuilder**
    
           подробнее см. [Meta builder](/ru/environment/meta/metabuilder)
        
           ```java
           --8<--
           {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyExample3800Meta.java
           --8<--
           ```
      - **Шаг 1.5** Создайте **Service**, наследующий **AnySourceVersionAwareResponseService**
    
           ```java
           --8<--
           {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyExample3800Service.java
           --8<--
           ```
    
      - **Шаг 1.6** Создайте **PlatformController**, реализующий **EnumBcIdentifier**
    
           ```java
           --8<--
           {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/PlatformMyExample3800Controller.java
           --8<--
           ```

### <a id="MethodsM">Методы</a>
####  <a id="getByIdIgnoringFirstLevelCache">Получение данных по ID (getByIdIgnoringFirstLevelCache)</a>

!!! tips "Совет"
    В этом примере рассматривается сценарий, когда сервис получает данные только по ID.

??? Example "Пример"

    **Шаг 1** Метод `getByIdIgnoringFirstLevelCache` принимает на вход BusinessComponent.

    При вызове сервиса обязательно нужно передать в качестве параметра Id записи, для которой будут возвращены данные.

        Long Id  = bc.getIdAsLong().

    Пример получения данных через REST:

     ```java
     --8<--
     {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyEntity3800Dao.java:getByIdIgnoringFirstLevelCache
     --8<--
     ```

#### <a id="getList">Получение всех данных (getList)</a>

Этот метод учитывает дополнительные особенности, такие как фильтрация, сортировка, ограничение количества записей и номера страниц.

* Размер страницы: количество элементов или записей, отображаемых на одной странице интерфейса или возвращаемых в одном ответе API. Используется в системах пагинации для управления тем, сколько данных загружается или отображается за раз.

* Лимит: максимальное количество элементов или записей, которые сервис может вернуть или обработать. Это способ не перегружать систему слишком большим объёмом данных за раз.

* Фильтр: позволяет задавать критерии фильтрации получаемых или обрабатываемых данных. Фильтры могут основываться на различных атрибутах или свойствах данных, позволяя сузить результаты до элементов, удовлетворяющих определённым условиям.

* Сортировка: задаёт порядок, в котором представлены результаты. Данные можно сортировать по определённым атрибутам, например по алфавиту, по числовому значению, по дате и т. д. Обычно сортировка выполняется по возрастанию или по убыванию.

Сочетание этих параметров позволяет управлять поведением сервиса и настраивать его под свои задачи, обеспечивая эффективное получение и обработку данных.

??? Example "Пример"

    Метод `getList` принимает на вход BusinessComponent.

    **Шаг 1** Размер страницы.

    ```java
    String page = bc.getParameters().getParameter("_page");
    ```   

    **Шаг 2** Лимит.

    ```java
    String limit = bc.getParameters().getParameter("_limit");
    ```  

    **Шаг 3** Сортировка.

    Если в приложении нет сортировки, соответствующий параметр будет отсутствовать.

    ```java
    queryParameters.getParameters().entrySet().stream().filter(f->f.getKey().contains("sort")).toList();
    ```  

    В ключе map передаётся направление сортировки: 'desc' — по убыванию, 'asc' — по возрастанию

    Например, ключ map = `_sort.0.desc`

    В значении map передаётся имя фильтруемого поля, указанное в соответствующем "key" поля в соответствующем файле widget.json

    Например, значение map = `customField`

    **Шаг 4** Фильтр.

    Если в приложении нет фильтрации, соответствующий параметр будет отсутствовать.
  
    В этом примере показано, как выбрать условия фильтрации для поля типа String. Полная информация обо всех полях, доступных для фильтрации, приведена в статье [SearchOperation для фильтрации](/ru/widget/fields/filtersearchoperation/).
    
        queryParameters.getParameters().entrySet().stream().filter(f->f.getKey().contains("contains")).toList();

    В ключе map передаётся тип фильтрации. Соответствие стандартной фильтрации и стандартных типов полей можно посмотреть [здесь](/ru/widget/fields/filtersearchoperation/) .

    Например, ключ map = `customField.contains`

    В значении map передаются критерии фильтрации для отбора конкретных данных.

    Например, значение map = `Test data`
 
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyEntity3800Dao.java:getList
    --8<--
    ```
#### <a id="delete">Удаление</a>

!!! tips "Совет"
    В этом примере рассматривается сценарий, когда сервис получает данные только по ID.

??? Example "Пример"

    **Шаг 1** Метод `delete` принимает на вход BusinessComponent.

    При вызове сервиса обязательно нужно передать в качестве параметра Id записи.

        Long Id  = bc.getIdAsLong().

    Пример получения данных через REST:

     ```java
     --8<--
     {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyEntity3800Dao.java:delete
     --8<--
     ```

#### <a id="update">Обновление</a>

!!! tips "Совет"
    В этом примере рассматривается сценарий, когда сервис получает данные только по ID.

??? Example "Пример"

    **Шаг 1** Метод `update` принимает на вход BusinessComponent.

    При вызове сервиса обязательно нужно передать в качестве параметра Id записи.

        Long Id  = bc.getIdAsLong().

    Пример получения данных через REST:

     ```java
     --8<--
     {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyEntity3800Dao.java:update
     --8<--
     ```

#### <a id="create">Создание</a>

!!! tips "Совет"
    В этом примере рассматривается сценарий, когда сервис получает данные только по ID.

??? Example "Пример"

    **Шаг 1** Метод `create` принимает на вход BusinessComponent.

    При вызове сервиса обязательно нужно передать в качестве параметра Id записи.

        Long Id  = bc.getIdAsLong().

    Пример получения данных через REST:

     ```java
     --8<--
     {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyEntity3800Dao.java:create
     --8<--
     ```
