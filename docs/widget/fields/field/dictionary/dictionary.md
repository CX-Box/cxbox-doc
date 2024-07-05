# Dictionary

`Dictionary` is a component that allows to select single value from dropdown.

!!! tips
    Use for dictionaries or slowly-growing entities, e.g. no more than 1000 values (all values are loaded in memory). Otherwise, use [inlinePickList](/widget/fields/field/inlinePickList/inlinePickList)

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample70){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/basic){:target="_blank"}
### How does it look?

=== "List widget"
    ![img_list.gif](img_list.gif)
=== "Info widget"
    ![img_info.png](img_info.png)
=== "Form widget"
    ![img_form.gif](img_form.gif)


### How to add?
??? Example
    === "Enum"

        - **Step1** Create Enum. Best practice: storing enum name in the Database and using a separate field for displayed UI values
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/basic/enums/CustomFieldEnum.java
            --8<--
            ```
        - **Step2** Add  **Enum** field to corresponding **BaseEntity**.
    
        ```java
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/basic/MyEntity70.java
            --8<--
        ```
   
        - **Step3** Add  **Enum** field to corresponding **DataResponseDTO**.
    
        ```java
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/basic/MyExample70DTO.java
            --8<--
        ```

        - **Step4** Add **fields.setEnumValues** to corresponding **FieldMetaBuilder**.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/basic/MyExample70Meta.java:buildRowDependentMeta
        --8<--
        ```


        === "List widget"
            - **Step5** Add to **_.widget.json_**.

            ```json
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/basic/MyExample70List.widget.json
            --8<--
            ```
        
        === "Info widget"
            - **Step5** Add to **_.widget.json_**.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/basic/MyExample70Info.widget.json
            --8<--
            ```
    
        === "Form widget"
    
            - **Step5** Add to **_.widget.json_**.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/basic/MyExample70Form.widget.json
            --8<--
            ```  

    === "LOV"

        - **Step 1. LOV** Create LOV

            +  **Step 1.1** Add type LOV to **CXBOX-DICTIONARY_TYPE.csv**.
 
                ```csv
                ID;TYPE;TYPE_DESC
                200;REGIONS;Regions
                ```
            +  **Step 1.2** Add description and value LOV to **CXBOX-DICTIONARY_ITEM.csv**.

                ```csv
                "300";200;"REGIONS";"MOSCOW";"Moscow";true;0;null
                "301";200;"REGIONS";"SAINT PETERBURG";"St. Petersburg";true;1;null
                "302";200;"REGIONS";"KOSTROMA";"Kostroma";true;2;null
                "303";200;"REGIONS";"SYKTYVKAR";"Syktyvkar";true;3;null
                ```
            +  **Step 1.3** Add corresponding launguage to database change management **DICTIONARY_ITEM_TR**.
            
                  ```xml
                  <changeSet id="ADD LANGUAGE DICTIONARY_ITEM_TR" author="initial">
                    <sql>
                      insert into DICTIONARY_ITEM_TR (ID, LANGUAGE, VALUE)
                      select ID, 'en' as LANGUAGE, VALUE as VALUE
                      from DICTIONARY_ITEM;
                    </sql>
                    <sql>
                      insert into DICTIONARY_ITEM_TR (ID, LANGUAGE, VALUE)
                      select ID, 'ru' as LANGUAGE, VALUE as VALUE
                      from DICTIONARY_ITEM;
                    </sql>
                  </changeSet>
                  ```
            +  **Step 1.4** Add in project AdministeredDictionary
    
                ```java
                --8<--
                {{ external_links.github_raw_doc }}/dictionary/dictionarylov/AdministeredDictionary.java
                --8<--
                ```
            +  **Step 1.5**  Add in project AdministeredDictionaryType
    
                ```java
                @Getter
                @RequiredArgsConstructor
                public enum AdministeredDictionaryType implements Serializable, IDictionaryType {
                
                    @Override
                    public LOV lookupName(String val) {
                        return dictionary().lookupName(val, this);
                    }
                
                    @Override
                    public String lookupValue(LOV lov) {
                        return dictionary().lookupValue(lov, this);
                    }
                
                    @Override
                    public String getName() {
                        return name();
                    }
                
                    public boolean containsKey(String key) {
                        return dictionary().containsKey(key, this);
                    }
                
                }
                ```
            + **Step 1.6**  Add  **LOV** (REGIONS) in AdministeredDictionaryType
                ```java
                @Getter
                @RequiredArgsConstructor
                public enum AdministeredDictionaryType implements Serializable, IDictionaryType {
                
                    REGIONS;
    
                    @Override
                    public LOV lookupName(String val) {
                        return dictionary().lookupName(val, this);
                    }
                
                    @Override
                    public String lookupValue(LOV lov) {
                        return dictionary().lookupValue(lov, this);
                    }
                
                    @Override
                    public String getName() {
                        return name();
                    }
                
                    public boolean containsKey(String key) {
                        return dictionary().containsKey(key, this);
                    }
                
                }
                ```

        - **Step2**  Add  **LOV** field to corresponding **BaseEntity**. 
    
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/dictionarylov/MyEntity350.java
        --8<--
        ```
    
        - **Step3**Add  **String** field to corresponding **DataResponseDTO**.
    
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/dictionarylov/MyExample350DTO.java
        --8<--
        ```

        - **Step4** Add **fields.setDictionaryTypeWithAllValues** to corresponding **FieldMetaBuilder**.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/dictionarylov/MyExample350Meta.java:buildRowDependentMeta
        --8<--
        ```
    
        === "List widget"
            - **Step5** Add to **_.widget.json_**.

            ```json
                --8<--
                {{ external_links.github_raw_doc }}/dictionary/dictionarylov/MyExample350Info.widget.json
                --8<--
            ```
        
        === "Info widget"
            - **Step5** Add to **_.widget.json_**.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/dictionarylov/MyExample350Info.widget.json
            --8<--
            ```
    
        === "Form widget"
    
            - **Step5** Add to **_.widget.json_**.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/dictionarylov/MyExample350Form.widget.json
            --8<--
            ```  

## Placeholder
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample88){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/placeholder){:target="_blank"}

`Placeholder` allows you to provide a concise hint, guiding users on the expected value. This hint is displayed before any user input. It can be calculated based on business logic of application
### How does it look?
=== "List widget"
    ![img_plchldr_list.png](img_plchldr_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![img_plchldr_form.png](img_plchldr_form.png)
### How to add?
??? Example
    Add **fields.setPlaceholder** to corresponding **FieldMetaBuilder**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/dictionary/placeholder/MyExample88Meta.java:buildRowDependentMeta
    --8<--
    ```  
    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**


## Color
`Color` allows you to specify a field color. It can be calculated based on business logic of application

`Calculated color`:
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample71){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/color){:target="_blank"}

`Constant color`:
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample84){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/colorconst){:target="_blank"}

### How does it look?
=== "List widget"
    ![img_color_list.png](img_color_list.png)
=== "Info widget"
    ![img_color_info.png](img_color_info.png)
=== "Form widget"
    _not applicable_


### How to add?
??? Example
    === "Calculated color"
   
        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null. 
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/color/MyExample71DTO.java
        --8<--
        ```    
 
        === "List widget"   
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/color/MyExample71List.widget.json
            --8<--
            ```
        === "Info widget"
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/color/MyExample71Info.widget.json
            --8<--
            ```
        === "Form widget"
            _not applicable_
    === "Constant color"
        === "List widget" 
            Add **"bgColor"** :  `HEX color`  to .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/colorconst/MyExample84List.widget.json
            --8<--
            ```
        === "Info widget"

            Add **"bgColor"** :  `HEX color`  to .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/colorconst/MyExample84Info.widget.json
            --8<--
            ```

        === "Form widget"
            _not applicable_

## Readonly/Editable
`Readonly/Editable` indicates whether the field can be edited or not. It can be calculated based on business logic of application

`Editable`
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample70){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/basic){:target="_blank"}

`Readonly`
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample85){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/ro){:target="_blank"}


### How does it look?
=== "Readonly"
    === "List widget"
        ![img_edit_list.png](img_edit_list.png)
    === "Info widget"
        _not applicable_
    === "Form widget"
        ![img_edit_form.png](img_edit_form.png)
=== "Readonly"
    === "List widget"
        ![img_ro_list.png](img_ro_list.png)
    === "Info widget"
        ![img_ro_info.png](img_ro_info.png)
    === "Form widget"
        ![img_ro_form.png](img_ro_form.png)


### How to add?
??? Example
    === "Editable"
        **Step1** Add mapping DTO->entity to corresponding **VersionAwareResponseService**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/basic/MyExample70Service.java:doUpdateEntity
        --8<--
        ```

        **Step2** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/basic/MyExample70Meta.java:buildRowDependentMeta
        --8<--
        ```
        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**
   
    === "Readonly"
    
        **Option 1** Enabled by default.
    
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/ro/MyExample85Meta.java:buildRowDependentMeta
        --8<--
        ```
    
        **Option 2** `Not recommended.` Property fields.setDisabled() overrides the enabled field if you use after property fields.setEnabled.
        === "List widget"
            **Works for List.**
        === "Info widget"
            **Works for Info.**
        === "Form widget"
            **Works for Form.**
## Filtering
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample87){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/filtration){:target="_blank"}

`Filtering` allows you to search data based on criteria. Search uses `in` operator.
### How does it look?
=== "List widget"
    ![img_filtr_list.png](img_filtr_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_

### How to add?
??? Example
    === "List widget"
        **Step 1** Add **@SearchParameter** to corresponding **DataResponseDTO**. (Advanced customization [SearchParameter](/advancedCustomization/element/searchparameter/searchparameter))
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/filtration/MyExample87DTO.java
        --8<--
        ```

        **Step 2**  Add **fields.enableFilter** to corresponding **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/filtration/MyExample87Meta.java:buildIndependentMeta
        --8<--
        ```

    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

## Drilldown
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample86){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/drilldown){:target="_blank"}

`DrillDown` allows you to navigate to another view by simply tapping on it. Target view and other drill-down parts can be calculated based on business logic of application

Also, it optionally allows you to filter data on target view before it will be opened `see more` [DrillDown](/features/element/drilldown/drilldown)


### How does it look?
=== "List widget"
    ![img_drilldown_list](img_drilldown_list.png)
=== "Info widget"
    ![img_drilldown_info](img_drilldown_info.png)
=== "Form widget"
    _not applicable_

### How to add?
??? Example

    **Option 1**

    `Step 1` Add [fields.setDrilldown](/features/element/drilldown/drilldown) to corresponding **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/dictionary/drilldown/MyExample86Meta.java:buildRowDependentMeta
    --8<--
    ```
    === "List widget"
        `Step 2` Add **"drillDown": "true"**  to .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/drilldown/MyExample86List.widget.json
        --8<--
        ```
    
        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. See more [Drilldown](/advancedCustomization/element/drilldown/drilldown) 
 
    === "Info widget"

        `Step 2` Add **"drillDown": "true"**  to .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/drilldown/MyExample86Info.widget.json
        --8<--
        ```
        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. See more [Drilldown](/advancedCustomization/element/drilldown/drilldown) 
 
    === "Form widget"
        _not applicable_
[Advanced customization](/advancedCustomization/element/drilldown/drilldown)

## Validation
`Validation` allows you to check any business rules for user-entered value. There are types of validation:

1) Exception:Displays a message to notify users about technical or business errors.

   `Business Exception`:
   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample91){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/validationbusinessex){:target="_blank"}

   `Runtime Exception`:
   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample93){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/validationruntimeex){:target="_blank"}
   
2) Confirm: Presents a dialog with an optional message, requiring user confirmation or cancellation before proceeding.

   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample92){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/validationconfirm){:target="_blank"}

3) Field level validation: shows error next to all fields, that validation failed for

   `Option 1`:
   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample293){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/validationannotation){:target="_blank"}

   `Option 2`:
   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample323){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/validationdynamic){:target="_blank"}


### How does it look?
=== "List widget"
    === "BusinessException"
        ![img_business_error](img_business_error.png)
    === "RuntimeException"
        ![img_runtime_error](img_runtime_error.png)
    === "Confirm"
        ![confirm_form](confirm_form.png)
    === "Field level validation"
        ![img_javax_stat_list](img_javax_stat_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    === "BusinessException"
        ![img_business_error](img_business_error.png)
    === "RuntimeException"
        ![img_runtime_error](img_runtime_error.png)
    === "Confirm"
        ![confirm_form](confirm_form.png)
    === "Field level validation"
        ![img_javax_stat_form](img_javax_stat_form.png)


### How to add?
??? Example
    === "BusinessException"
        `BusinessException` describes an error  within a business process.
        
        Add **BusinessException** to corresponding **VersionAwareResponseService**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/validationbusinessex/MyExample91Service.java:doUpdateEntity
        --8<--
        ```

        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**
    === "RuntimeException"

        `RuntimeException` describes technical error  within a business process.
        
        Add **RuntimeException** to corresponding **VersionAwareResponseService**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/validationruntimeex/MyExample93Service.java:doUpdateEntity
        --8<--
        ```       
     
        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**
    === "Confirm"
        Add [PreAction.confirm](/advancedCustomization_validation) to corresponding **VersionAwareResponseService**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/dictionary/validationconfirm/MyExample92Service.java:getActions
        --8<--
        ```
        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**

    === "Field level validation"
        === "Option 1"
            Add javax.validation to corresponding **DataResponseDTO**.

            Use if:

            Requires a simple fields check (javax validation)
            Add javax.validation to corresponding **DataResponseDTO**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/validationannotation/MyExample293DTO.java
            --8<--
            ```
    
            === "List widget"
                **Works for List.**
            === "Info widget"
                **_not applicable_**
            === "Form widget"
                **Works for Form.**

        === "Option 2"
            Create сustom service for business logic check.
            
            Use if:
            
            Business logic check required for fields
            
            `Step 1`  Create сustom method for check.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/validationdynamic/MyExample323Service.java:validateFields
            --8<--
            ```
            
            `Step 2` Add сustom method for check to corresponding **VersionAwareResponseService**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/dictionary/validationdynamic/MyExample323Service.java:doUpdateEntity
            --8<--
            ```

## Sorting
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample90){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/sorting){:target="_blank"}

`Sorting` allows you to sort data in ascending or descending order.
Sort by key value.

### How does it look?
=== "List widget"
    ![img_sort_list](img_sort_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_
### How to add?
??? Example
    === "List widget"
        Enabled by default.
    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

## Required
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample89){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/dictionary/required){:target="_blank"}

`Required` allows you to denote, that this field must have a value provided.

### How does it look?
=== "List widget"
    ![img_req_list.png](img_req_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![img_req_form.png](img_req_form.png)
### How to add?
??? Example
    Add **fields.setRequired** to corresponding **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/dictionary/required/MyExample89Meta.java:buildRowDependentMeta
    --8<--
    ```

    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**
