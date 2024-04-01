# Connecting an existing microservices 

In this example, we're considering the scenario where we need to integrate with an existing microservice responsible for data operations.

Within our system, four main types of operations occur:

* Creation: This involves creating new records by sending data to the microservice for processing and storage.

* Deletion: Deleting existing records or data entries from the system. This typically involves interacting with the microservice to remove specific records.

* Getting all data: This operation involves retrieving all available data from the microservice.

* Getting data by ID: This operation involves retrieving specific data entries from the microservice based on their unique identifier (ID). This allows for the retrieval of individual records as needed.

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/microservice){:target="_blank"}

When creating entities for microservices, the process is largely similar to creating entities for database access, with a few notable exceptions.

1) Instead of creating an entity, we establish a mapping entity through which data will be sent to the microservice.

2) Instead of using FieldMetaBuilder, we utilize AnySourceFieldMetaBuilder.

3) Instead of using VersionAwareResponseService, we utilize AnySourceVersionAwareResponseService.

4) Create extends AbstractAnySourceBaseDAO  implements AnySourceBaseDAO service

??? Example

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·

    - **Step1.1** Create **DTO** extends **DataResponseDTO**
        ```java
        --8<--
        {{ external_links.github_raw }}/microservice/MyExample3800DTO.java
        --8<--
        ```
    - **Step1.2** Create mapping entity through which data will be sent to the microservice 
        ```java
        --8<--
        {{ external_links.github_raw }}/microservice/MyEntity3800OutServiceDTO.java
        --8<--
        ```
    - **Step1.3** Create **MetaBuilder** extends **AnySourceFieldMetaBuilder**
    
         see more [Meta builder](/repository/meta/metabuilder)
        
         ```java
         --8<--
         {{ external_links.github_raw }}/microservice/MyExample3800DTO.java
         --8<--
         ```
    - **Step1.4** Create **Service** extends **AnySourceVersionAwareResponseService**
    
         ```java
         --8<--
         {{ external_links.github_raw }}/microservice/MyExample3800DTO.java
         --8<--
         ```
    
    - **Step1.5** Create **PlatformController** implements **EnumBcIdentifier**
    
         ```java
         --8<--
         {{ external_links.github_raw }}/microservice/PlatformMyExample3800Controller.java
         --8<--
         ```
    - **Step1.6** Create **DAO** extends **AbstractAnySourceBaseDAO** implements **AnySourceBaseDAO**
    
         ```java
         --8<--
         {{ external_links.github_raw }}/microservice/MyEntity3800Dao.java
         --8<--
         ```

###  Getting data by ID (getByIdIgnoringFirstLevelCache)

!!! tip
    In this example, we're addressing the scenario where the service obtaining data only by ID.
    If your service relies solely on natural keys for data retrieval, you may find the following article helpful.

??? Example

    **Step1** Method getByIdIgnoringFirstLevelCache takes a BusinessComponent as input.
    When calling the service, it's essential to provide theId  record as a parameter for which data will be returned .
    Get the Id  = bc.getIdAsLong(). Example of fetching data using REST:

    ```java
     --8<--
     {{ external_links.github_raw }}/microservice/MyEntity3800Dao.java:getByIdIgnoringFirstLevelCache
     --8<--
     ```
###  Getting data all (getList)

This method incorporates additional peculiaritys such as filtering, sorting, record limits, and page numbers.

??? Example

    **Step1** Get page numbers.Method getList takes a BusinessComponent as input.
        Get the page:
        String page = bc.getParameters().getParameter("_page");

    **Step2** Get page limit. Method getList takes a BusinessComponent as input.
        Get the record limit:
        String limit = bc.getParameters().getParameter("_limit");

    **Step3** Get page filtering.Method getList takes a BusinessComponent as input.
        Get the page:
        String page = bc.getParameters().getParameter("_page");
        queryParameters.getParameters().entrySet().stream().filter(f->f.getKey().contains("contains")).toList();

    ```java
     --8<--
     {{ external_links.github_raw }}/microservice/MyEntity3800Dao.java:getByIdIgnoringFirstLevelCache
     --8<--
     ```
 