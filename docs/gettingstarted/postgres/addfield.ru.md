# Добавление нового поля на существующий экран { #add-new-field-to-an-existing-screen }

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
### **Шаг 5** Создайте **Controller** { #step5-create-controller }

Создайте **Controller**, реализующий **EnumBcIdentifier**

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/document/PlatformMyExample4000Controller.java
    --8<--
    ```

### **Шаг 6** Создайте **widget.json** { #step6-create-widgetjson }

??? Example "Пример"
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/example/MyExample4002Form.widget.json
    --8<--
    ```

### **Шаг 7** Создайте **view.json** { #step7-create-viewjson }

??? Example "Пример"

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/example/myexample4002form.view.json
    --8<--
    ```

### **Шаг 8** Добавьте view в **screen.json** { #step8-add-view-on-screenjson }

??? Example "Пример"

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/postgres/example/myexample4002.screen.json
    --8<--
    ```

### **Шаг 9** Добавьте поле в соответствующий **widget.json** { #step9-add-field-to-corresponding-widgetjson }

#### Шаг 9.1 Добавьте поле в виджет { #step91-add-field-to-widget }

   ![stp1.png](stp1.png)     

#### Шаг 9.2 Добавьте поле в entity, DTO { #step92-add-field-to-entity-dto }

   ![stp2.png](stp2.png)   

#### Шаг 9.3 Добавьте поле в layout { #step93-add-field-to-layout }

   ![stp3.png](stp3.png)

#### Пример { #example }
![addinputfield.gif](addinputfield.gif)