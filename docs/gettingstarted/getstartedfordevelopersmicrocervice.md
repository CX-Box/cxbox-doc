# Getting started    
This tutorial serves as an introduction to the fundamentals, guiding you through the creation of standard elements essential for initiating your project promptly.
 
## What You Need
* About 15 minutes
 
## Getting started  
1) Clone repository

    `git clone git@github.com:CX-Box/cxbox-demo.git`
как добавить на  существующий экран  новвые все остальнле напрюмую из базы сх бокс с помощью плагины
или из внешнией источников микросервисов

2) Choose database(Postgres,Oracle) or microcervice 
 
2.1) [Postgres](features/element/database/postgres/postgresbd)

2.2) [Oracle](/features/element/database/oracle/oraclebd)

 3) see [Started for developing on cxbox](#StartedForDevelopingOnCxbox)

##  <a id="StartedForDevelopingOnCxbox">Started for developing on cxbox</a>
Добавить 2 гет старта 
=== "database"
    ### **Step1** Create **entity**

    Create **entity** extends **BaseEntity**

    ??? Example
    
        ```java
        --8<--
        {{ external_links.github_raw }}/input/basic/InputBasic.java
        --8<--
        ```
    
    ### **Step 2** Create **DTO**
    
    Create **DTO** extends **DataResponseDTO**
    ??? Example
    
        ```java
        --8<--
        {{ external_links.github_raw }}/input/basic/InputBasicDTO.java
        --8<--
        ```

     
    ### **Step3** Create **MetaBuilder**
    
    Create **MetaBuilder** extends **FieldMetaBuilder**
    
    ??? Example   
         ```java
         --8<--
         {{ external_links.github_raw }}/input/basic/InputBasicMeta.java
         --8<--
         ```
    ### **Step4** Create **Service**

    Create **Service** extends **VersionAwareResponseService**
    
    ??? Example
         ```java
         --8<--
         {{ external_links.github_raw }}/input/basic/InputBasicMeta.java
         --8<--
         ```        
    Override methods:
    
    * **Create** : method doCreateEntity
    
    ??? Example
        ```java
        --8<--
            {{ external_links.github_raw }}/input/basic/InputBasicService.java:doCreateEntity
        --8<--
        ```
    * **Deletion**: method delete
    
    ??? Example
         ```java
         --8<-
         {{ external_links.github_raw }}/input/basic/InputBasicService.java
         --8<--
         ```
    * **Update of existing entries**:  method update
    
    ??? Example
         ```java
         --8<--
         {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java:update
         --8<--
         ```
    * **Getting all data**: method getList
    
        Page size:  
    
        ```java
        String page = bc.getParameters().getParameter("_page");
        ```   
         
        Limit: 
        ```java
        String limit = bc.getParameters().getParameter("_limit");
        ```
      
        Sorting for field CustomField:
        ```java
            List<String> sortCustomField = getSortFieldName(queryParameters, "customField");
            Optional<String> sort = sortCustomField.isEmpty() ? Optional.empty() : Optional.of(sortCustomField.get(0));
        ```    
        
        Filter for field CustomField:
        ```java
         List<String> filterCustomField = getFilterFieldName(queryParameters, "customField", "contains");
         Optional<String> filter = filterCustomField.isEmpty() ? Optional.empty() : Optional.of(filterCustomField.get(0));
        ```  
    
    ??? Example
         ```java
         --8<--
         {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java:getList
         --8<--
         ```
    
    * **Getting data by ID**:  method getByIdIgnoringFirstLevelCache
    
    ??? Example
         ```java
         --8<--
         {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java:getByIdIgnoringFirstLevelCache
         --8<--
         ```
 
    ### **Step5** Create **Controller**
    
    Create **Controller** implements **EnumBcIdentifier**
    
    ??? Example
        ```java
        --8<--
         {{ external_links.github_raw }}/microservice/existingmicroservices/PlatformMyExample3800Controller.java
        --8<--
        ```
    
    ### **Step6** Create **widget.json**  
    
    ??? Example
    
        ```java
        --8<--
        {{ external_links.github_raw }}/microservice/existingmicroservices/MyExample3800List.widget.json
        --8<--
        ```
    ### **Step7** Create **view.json**
    
    ??? Example
    
        ```java
        --8<--
        {{ external_links.github_raw }}/microservice/existingmicroservices/myexample3800list.view.json
        --8<--
        ```
    
    ### **Step8** Create **screen.json**
    
    ??? Example
    
        ```java
        --8<--
        {{ external_links.github_raw }}/microservice/existingmicroservices/myexample3800.screen.json
        --8<--
        ```
=== "microcervices"
    see more [Microcervice](/features/element/microservices/microservices)