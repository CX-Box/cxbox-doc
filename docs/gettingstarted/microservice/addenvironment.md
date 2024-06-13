# Create environment
## **Step1** Create DTO for integrating with microservice

Create DTO for integrating with microservices through which data will be sent to the microservice

??? Example

    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/MyEntity4001OutServiceDTO.java
    --8<--
    ```

## **Step 2** Create **DAO**

Create **DAO** extends **AbstractAnySourceBaseDAO** implements **AnySourceBaseDAO**

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/MyEntity4003Dao.java
    --8<--
    ```

Override methods:

* **Create** : method create

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/MyEntity4003Dao.java:create
    --8<--
    ```
* **Deletion**: method delete

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/MyEntity4003Dao.java:delete
    --8<--
    ```
* **Update of existing entries**:  method update

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/MyEntity4003Dao.java:update
    --8<--
    ```
* **Getting all data**: method getList

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/MyEntity4003Dao.java:getList
    --8<--
    ```

* **Getting data by ID**:  method getByIdIgnoringFirstLevelCache

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/MyEntity4003Dao.java:getByIdIgnoringFirstLevelCache
    --8<--
    ```

## **Step 3** Create **DTO**

Create **DTO** extends **DataResponseDTO**

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/MyExample4003DTO.java
    --8<--
    ```

## **Step4** Create **MetaBuilder**

Create **MetaBuilder** extends **AnySourceFieldMetaBuilder**

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/MyExample4003Meta.java
    --8<--
    ```

## **Step5** Create **Service**

Create **Service** extends **AnySourceVersionAwareResponseService**

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/MyExample4003Service.java
    --8<--
    ```

## **Step6** Create **Controller**

Create **Controller** implements **EnumBcIdentifier**

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/microservice/document/PlatformMyExample4003Controller.java
    --8<--
    ```