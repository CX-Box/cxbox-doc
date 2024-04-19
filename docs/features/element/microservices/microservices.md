# Microservices 

Within our system, five main types of operations occur:

* Getting data by ID: This operation involves retrieving specific data entries from the microservice based on their unique identifier (ID). This allows for the retrieval of individual records as needed.

* Getting all data: This operation involves retrieving all available data from the microservice.

* Deletion: Deleting existing records. This typically involves interacting with the microservice to remove specific records.

* Update of existing entries: This refers to making changes by sending data to the microservice for processing and storage.

* Creation: This involves creating new records by sending data to the microservice for processing and storage.


## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/microservice){:target="_blank"}

When creating entities for microservices, the process is largely similar to creating entities for database access, with a few notable exceptions.

1) Instead of creating an entity, we establish a mapping entity through which data will be sent to the microservice.

2) Instead of using FieldMetaBuilder, we utilize AnySourceFieldMetaBuilder._

3) Instead of using VersionAwareResponseService, we utilize AnySourceVersionAwareResponseService.

4) Create extends AbstractAnySourceBaseDAO  implements AnySourceBaseDAO service

??? Example
    - **Step1.1** Create mapping entity through which data will be sent to the microservice 
        ```java
        --8<--
        {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800OutServiceDTO.java
        --8<--
        ```
    - **Step1.2** Create **DAO** extends **AbstractAnySourceBaseDAO** implements **AnySourceBaseDAO**
        Override methods:  

          * **Getting data by ID**:  method [getByIdIgnoringFirstLevelCache](#getByIdIgnoringFirstLevelCache)

          * **Getting all data**: method [getList](#getList)

          * **Deletion**: method [delete](#delete)

          * **Update of existing entries**:  method [update](#update)

          * **Create** : method  [create](#create)

           ```java
           --8<--
           {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java
           --8<--
           ```
      - **Step1.3** Create **DTO** extends **DataResponseDTO**
          Creating fields in DTO with the necessary properties, such as, for example,filtering is described in the article
          [field types](/widget/fields/fieldtypes/) 

          ```java
          --8<--
          {{ external_links.github_raw }}/microservice/existingmicroservices/MyExample3800DTO.java
          --8<--
          ```
      - **Step1.4** Create **MetaBuilder** extends **AnySourceFieldMetaBuilder**
    
           see more [Meta builder](/repository/meta/metabuilder)
        
           ```java
           --8<--
           {{ external_links.github_raw }}/microservice/existingmicroservices/MyExample3800Meta.java
           --8<--
           ```
      - **Step1.5** Create **Service** extends **AnySourceVersionAwareResponseService**
    
           ```java
           --8<--
           {{ external_links.github_raw }}/microservice/existingmicroservices/MyExample3800Service.java
           --8<--
           ```
    
      - **Step1.6** Create **PlatformController** implements **EnumBcIdentifier**
    
           ```java
           --8<--
           {{ external_links.github_raw }}/microservice/existingmicroservices/PlatformMyExample3800Controller.java
           --8<--
           ```

### <a id="MethodsM">Methods</a>
####  <a id="getByIdIgnoringFirstLevelCache">Getting data by ID (getByIdIgnoringFirstLevelCache)</a>

!!! tip
    In this example, we're addressing the scenario where the service obtaining data only by ID.
    If your service relies solely on natural keys for data retrieval, you may find the following article helpful.

??? Example

    **Step1** Method `getByIdIgnoringFirstLevelCache` takes a BusinessComponent as input.

    When calling the service, it's essential to provide the Id  record as a parameter for which data will be returned.

        Long Id  = bc.getIdAsLong().

    Example of fetching data using REST:

     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java:getByIdIgnoringFirstLevelCache
     --8<--
     ```

#### <a id="getList">Getting data all (getList)</a>

This method incorporates additional peculiaritys such as filtering, sorting, record limits, and page numbers.

* Page size: This parameter  refers to the number of items or records displayed on a single page of a user interface or returned in a single response from an API. It's  used in pagination systems to control how much data is fetched or displayed at once.

* Limit: This parameter sets a maximum limit on the number of items or records that can be returned or processed by the service. It's a way to prevent overloading the system with too much data at once.

* Filter: This parameter allows users to specify criteria for filtering the data they want to retrieve or process. Filters could be based on various attributes or properties of the data, allowing users to narrow down their results to only the items that meet specific conditions.

* Sorting: This parameter would involve specifying the order in which the results are presented. Might want to sort data based on certain attributes, such as alphabetical order, numerical order, date, etc. Sorting can typically be done in ascending or descending order.

Combining these parameters allows users to control and customize the behavior of the service according to their needs, enabling efficient data retrieval and processing.

??? Example

    Method `getList` takes a BusinessComponent as input.

    **Step1** Page size.

    ```java
    String page = bc.getParameters().getParameter("_page");
    ```   

    **Step2** Limit.

    ```java
    String limit = bc.getParameters().getParameter("_limit");
    ```  

    **Step3** Sorting. 

    If the application lacks a sorting feature, it implies that the parameter associated with sorting would be absent.

    ```java
    queryParameters.getParameters().entrySet().stream().filter(f->f.getKey().contains("sort")).toList();
    ```  

    In the map key, receive the sorting direction: 'desc' for descending or 'asc' for ascending

    For example, map key = `_sort.0.desc`

    In the map value, obtain the name of the filtered field specified in to corresponding field "key" to corresponding file widget.json

    For example, map value = `customField` 

    **Step4** Filter.

    If the application lacks a filtration feature, it implies that the parameter associated with filtration would be absent.
  
    This example demonstrates how to select filtering conditions for a field with the String type. For comprehensive information on all fields available for filtering, please refer to the article
    
        queryParameters.getParameters().entrySet().stream().filter(f->f.getKey().contains("contains")).toList();

    In the map key, receive the filtration type. Can observe the relationship between standard filtering and standard field types [here](/widget/fields/filtersearchoperation/) .

    For example, map key = `customField.contains`

    In the map value, obtain the filtering criteria for selecting specific data.

    For example, map value = `Test data`
 
    ```java
    --8<--
    {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java:getList
    --8<--
    ```
#### <a id="delete">Delete</a>

!!! tip
    In this example, we're addressing the scenario where the service obtaining data only by ID.
    If your service relies solely on natural keys for data retrieval, you may find the following article helpful.

??? Example

    **Step1** Method `delete` takes a BusinessComponent as input.

    When calling the service, it's essential to provide the Id record as a parameter for which data will be returned.

        Long Id  = bc.getIdAsLong().

    Example of fetching data using REST:

     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java:delete
     --8<--
     ```

#### <a id="update">Update</a>

!!! tip
    In this example, we're addressing the scenario where the service obtaining data only by ID.
    If your service relies solely on natural keys for data retrieval, you may find the following article helpful.

??? Example

    **Step1** Method `update` takes a BusinessComponent as input.

    When calling the service, it's essential to provide theId  record as a parameter for which data will be returned.

        Long Id  = bc.getIdAsLong().

    Example of fetching data using REST:

     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java:update
     --8<--
     ```

#### <a id="create">Create</a>

!!! tip
    In this example, we're addressing the scenario where the service obtaining data only by ID.
    If your service relies solely on natural keys for data retrieval, you may find the following article helpful.

??? Example

    **Step1** Method `create` takes a BusinessComponent as input.

    When calling the service, it's essential to provide the Id record as a parameter for which data will be returned.

        Long Id  = bc.getIdAsLong().

    Example of fetching data using REST:

     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java:create
     --8<--
     ```
