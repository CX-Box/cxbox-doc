# Connecting an existing microservices 
In this example, we're considering the scenario where we need to integrate with an existing microservice responsible for data operations.

## Architecture existing microservice
Microservice use REST.

Let's outline the inputs our microservice accepts:

1) **Get a particular record** : entity + "/{id}"  `.../api/v1/myentity3900/1` 

2) **Get all record** :  entity + "/"  

**Required parameters**:

* Page size: "_page="  

* Limit:  "&_limit="     
  
**Non-Required parameters**:

* Sorting:  "&_sort=" + `field name for sorting`+ "&_order=" + `sorting direction`

    (`.../api/v1/myentity3900?_page=1&_limit=5&_sort=created&_order=desc`)

* Filter:  "&_filter.field." + `field name for filtering`+"."+`operator` + "=" + `value for filtering`
    (`.../api/v1/myentity3900?_page=1&_limit=5&_filter.field.customField.contains=test`)


## Developing a straightforward interaction with the existing microservice architecture.

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·

**Step1**  Create mapping entity through which data will be sent to the microservice

??? Example

    ```java
    --8<--
    {{ external_links.github_raw }}/microservice/MyEntity3800OutServiceDTO.java
    --8<--
    ```

**Step 2** Create **DAO** extends **AbstractAnySourceBaseDAO** implements **AnySourceBaseDAO**

Instructions on how to work correctly with each method can be found here: [Methods](/features/element/microservices/microservices#MethodsM)
 
??? Example    
     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/MyEntity3800Dao.java
     --8<--
     ```
 

**Step3**  Create **DTO** extends **DataResponseDTO**

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/microservice/MyExample3800DTO.java
    --8<--
    ```

**Step4** Create **MetaBuilder** extends **AnySourceFieldMetaBuilder**

??? Example   
     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/MyExample3800Meta.java
     --8<--
     ```

**Step5** Create **Service** extends **AnySourceVersionAwareResponseService**

??? Example
     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/MyExample3800Service.java
     --8<--
     ```

**Step6** Create **PlatformController** implements **EnumBcIdentifier**

??? Example
    ```java
    --8<--
     {{ external_links.github_raw }}/microservice/PlatformMyExample3800Controller.java
    --8<--
    ```
 