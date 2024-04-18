# Connecting an existing microservices 
In this example, we're considering the scenario where we need to integrate with an existing microservice responsible for data operations.

## Architecture existing microservice
Let's outline the inputs our microservice accepts:

## How does it look?

![microservice_swagger.png](microservice_swagger.png)


## Developing a straightforward interaction with the existing microservice architecture.

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·

**Step1**  Create mapping entity through which data will be sent to the microservice

??? Example

    ```java
    --8<--
    {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800OutServiceDTO.java
    --8<--
    ```

**Step 2** Create **DAO** extends **AbstractAnySourceBaseDAO** implements **AnySourceBaseDAO**
 
For our service:        
Page size:        
        `String page = bc.getParameters().getParameter("_page");`

Limit:        
        `String limit = bc.getParameters().getParameter("_limit");`

Sorting:        
        `queryParameters.getParameters().entrySet().stream().filter(f->f.getKey().contains("sort")).toList();`

Filter:
        `queryParameters.getParameters().entrySet().stream().filter(f->f.getKey().contains("contains")).toList();`

??? Example    
     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/existingmicroservices/MyEntity3800Dao.java
     --8<--
     ```
 

**Step3**  Create **DTO** extends **DataResponseDTO**

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/microservice/existingmicroservices/MyExample3800DTO.java
    --8<--
    ```

**Step4** Create **MetaBuilder** extends **AnySourceFieldMetaBuilder**

??? Example   
     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/existingmicroservices/MyExample3800Meta.java
     --8<--
     ```

**Step5** Create **Service** extends **AnySourceVersionAwareResponseService**

??? Example
     ```java
     --8<--
     {{ external_links.github_raw }}/microservice/existingmicroservices/MyExample3800Service.java
     --8<--
     ```

**Step6** Create **PlatformController** implements **EnumBcIdentifier**

??? Example
    ```java
    --8<--
     {{ external_links.github_raw }}/microservice/existingmicroservices/PlatformMyExample3800Controller.java
    --8<--
    ```
 