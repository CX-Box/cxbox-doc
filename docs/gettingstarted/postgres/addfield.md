# Add new field to an existing screen

## **Step1** Create **entity**

Create **entity** extends **BaseEntity**

??? Example

    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/postgres/document/MyEntity4000.java
    --8<--
    ```

## **Step 2** Create **DTO**

Create **DTO** extends **DataResponseDTO**
??? Example

    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/postgres/document/MyExample4000DTO.java
    --8<--
    ```

 
## **Step3** Create **MetaBuilder**

Create **MetaBuilder** extends **FieldMetaBuilder**

??? Example   
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/postgres/document/MyExample4000Meta.java
    --8<--
    ```
## **Step4** Create **Service**

Create **Service** extends **VersionAwareResponseService**

??? Example
     ```java
     --8<--
     {{ external_links.github_raw }}/getstarted/postgres/document/MyExample4000Service.java
     --8<--
     ```        
### **Step5** Create **Controller**

Create **Controller** implements **EnumBcIdentifier**

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/postgres/document/PlatformMyExample4000Controller.java
    --8<--
    ```

### **Step6** Create **widget.json**  

??? Example
    ```json
    --8<--
    {{ external_links.github_raw }}/getstarted/postgres/document/MyExample4000Form.widget.json
    --8<--
    ```

### **Step7** Create **view.json**

??? Example

    ```json
    --8<--
    {{ external_links.github_raw }}/getstarted/postgres/document/myexample4002form.view.json
    --8<--
    ```

### **Step8** Add view on **screen.json**

??? Example

    ```java
    --8<--
    {{ external_links.github_raw }}/getstarted/postgres/example/myexample4002.screen.json
    --8<--
    ```

### **Step9** Add field to corresponding **widget.json**

#### Step9.1 Add field to widget

   ![stp1.png](stp1.png)     

#### Step9.2 Add field to entity, DTO

   ![stp2.png](stp2.png)   

#### Step9.3 Add field to layout

   ![stp3.png](stp3.png)

#### Example
   ![addField.gif](addField.gif)  