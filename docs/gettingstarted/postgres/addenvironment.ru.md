# Подготовка окружения { #create-environment }
## **Шаг 1** Создайте **entity** { #step1-create-entity }

Создайте **entity**, наследующую **BaseEntity**

??? Example "Пример"

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/document/MyEntity4000.java
    --8<--
    ```

## **Шаг 2** Создайте **DTO** { #step-2-create-dto }

Создайте **DTO**, наследующий **DataResponseDTO**
??? Example "Пример"

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/document/MyExample4000DTO.java
    --8<--
    ```

 
## **Шаг 3** Создайте **MetaBuilder** { #step3-create-metabuilder }

Создайте **MetaBuilder**, наследующий **FieldMetaBuilder**

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/document/MyExample4000Meta.java
    --8<--
    ```
## **Шаг 4** Создайте **Service** { #step4-create-service }

Создайте **Service**, наследующий **VersionAwareResponseService**

??? Example "Пример"
     ```java
     --8<--
     {{ external_links.github_raw_doc }}/getstarted/postgres/document/MyExample4000Service.java
     --8<--
     ```        
## **Шаг 5** Создайте **Controller** { #step5-create-controller }

Создайте **Controller**, реализующий **EnumBcIdentifier**

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/document/PlatformMyExample4000Controller.java
    --8<--
    ```