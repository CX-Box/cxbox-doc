# Create environment
## **Step1** Create **entity**

Create **entity** extends **BaseEntity**

??? Example

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/document/MyEntity4000.java
    --8<--
    ```

## **Step 2** Create **DTO**

Create **DTO** extends **DataResponseDTO**
??? Example

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/document/MyExample4000DTO.java
    --8<--
    ```

 
## **Step3** Create **MetaBuilder**

Create **MetaBuilder** extends **FieldMetaBuilder**

??? Example   
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/document/MyExample4000Meta.java
    --8<--
    ```
## **Step4** Create **Service**

Create **Service** extends **VersionAwareResponseService**

??? Example
     ```java
     --8<--
     {{ external_links.github_raw_doc }}/getstarted/postgres/document/MyExample4000Service.java
     --8<--
     ```        
## **Step5** Create **Controller**

Create **Controller** implements **EnumBcIdentifier**

??? Example
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/document/PlatformMyExample4000Controller.java
    --8<--
    ```