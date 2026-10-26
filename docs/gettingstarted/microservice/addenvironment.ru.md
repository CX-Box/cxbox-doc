# Создание **DAO**, **DTO**, **Service**, **Controller** { #create-dao-dto-service-controller }

## **Шаг 1** Создайте DTO для интеграции с микросервисом { #step1-create-dto-for-integrating-with-microservice }

Создайте DTO для интеграции с микросервисами, через который данные будут отправляться в микросервис

??? Example "Пример"

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/MyEntity4001OutServiceDTO.java
    --8<--
    ```

## **Шаг 2** Создайте **DAO** { #step-2-create-dao }

Создайте **DAO**, наследующий **AbstractAnySourceBaseDAO** и реализующий **AnySourceBaseDAO**

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/MyEntity4003Dao.java
    --8<--
    ```

Переопределите методы:

* **Создание** : метод create

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/MyEntity4003Dao.java:create
    --8<--
    ```
* **Удаление**: метод delete

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/MyEntity4003Dao.java:delete
    --8<--
    ```
* **Обновление существующих записей**:  метод update

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/MyEntity4003Dao.java:update
    --8<--
    ```
* **Получение всех данных**: метод getList

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/MyEntity4003Dao.java:getList
    --8<--
    ```

* **Получение данных по ID**:  метод getByIdIgnoringFirstLevelCache

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/MyEntity4003Dao.java:getByIdIgnoringFirstLevelCache
    --8<--
    ```

## **Шаг 3** Создайте **DTO** { #step-3-create-dto }

Создайте **DTO**, наследующий **DataResponseDTO**

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/MyExample4003DTO.java
    --8<--
    ```

## **Шаг 4** Создайте **MetaBuilder** { #step4-create-metabuilder }

Создайте **MetaBuilder**, наследующий **AnySourceFieldMetaBuilder**

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/MyExample4003Meta.java
    --8<--
    ```

## **Шаг 5** Создайте **Service** { #step5-create-service }

Создайте **Service**, наследующий **AnySourceVersionAwareResponseService**

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/MyExample4003Service.java
    --8<--
    ```

## **Шаг 6** Создайте **Controller** { #step6-create-controller }

Создайте **Controller**, реализующий **EnumBcIdentifier**

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/document/PlatformMyExample4003Controller.java
    --8<--
    ```