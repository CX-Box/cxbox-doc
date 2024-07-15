# Percent

`Percent` is a component for percent editing. It can be used for editing and displaying percentages

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample1){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/basic){:target="_blank"}
### How does it look?

=== "List widget"
    ![img_list.png](img_list.png)
=== "Info widget"
    ![img_info.png](img_info.png)
=== "Form widget"
    ![img_form.png](img_form.png)


### How to add?

??? Example
    One will usually use Long, Double or BigDecimal java types in DTO and Entity for storing this field type.

    Next example shows Long usage:

    **Step1** Add **Long** field  to corresponding **BaseEntity**. 

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/percent/basic/MyEntity1.java
    --8<--
    ```

    **Step2** Add **Long** field  to corresponding **DataResponseDTO**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/percent/basic/MyExample1DTO.java
    --8<--
    ```

    === "List widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/basic/MyExample1List.widget.json
        --8<--
        ```
    === "Info widget"
        **Step3** Add to **_.widget.json_**.
        
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/basic/MyExample1Info.widget.json
        --8<--
        ```

    === "Form widget"

        **Step3** Add to **_.widget.json_**.

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/basic/MyExample1Form.widget.json
        --8<--
        ```
    **Option2** Add **Double** field  to corresponding **DataResponseDTO** in Step1.

## Placeholder
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample7){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/placeholder){:target="_blank"}

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
    {{ external_links.github_raw_doc }}/fields/percent/placeholder/MyExample7Meta.java:buildRowDependentMeta
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
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample73){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/color){:target="_blank"}

`Constant color`:
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/colorconst){:target="_blank"}

### How does it look?
=== "List widget"
    ![img_color_list.png](img_color_list.png)
=== "Info widget"
    ![img_color_info.png](img_color_info.png)
=== "Form widget"
    ![img_color_form.png](img_color_form.png)


### How to add?
??? Example
    === "Calculated color"
        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/color/MyExample73DTO.java
        --8<--
        ```    
        
        === "List widget"   
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/percent/color/MyExample73List.widget.json
            --8<--
            ```   

        === "Info widget"
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/percent/color/MyExample73Info.widget.json
            --8<--
            ```  

        === "Form widget"
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/percent/color/MyExample73Form.widget.json
            --8<--
            ```  
    === "Constant color"
        === "List widget" 
            Add **"bgColor"** :  `HEX color`  to .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/percent/colorconst/MyExample3List.widget.json
            --8<--
            ```
        === "Info widget"
            Add **"bgColor"** :  `HEX color`  to .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/percent/colorconst/MyExample3Info.widget.json
            --8<--
            ```
        === "Form widget"
            Add **"bgColor"** :  `HEX color`  to .widget.json.  
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/percent/colorconst/MyExample3Form.widget.json
            --8<--
            ```
## Readonly/Editable
`Readonly/Editable` indicates whether the field can be edited or not. It can be calculated based on business logic of application

`Editable`
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample1){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/basic){:target="_blank"}

`Readonly`
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/ro){:target="_blank"}


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
        {{ external_links.github_raw_doc }}/fields/percent/basic/MyExample1Service.java:doUpdateEntity
        --8<--
        ```   
        **Step2** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/basic/MyExample1Meta.java:buildRowDependentMeta
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
        {{ external_links.github_raw_doc }}/fields/percent/ro/MyExample4Meta.java:buildRowDependentMeta
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
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/filtration){:target="_blank"}

`Filtering` allows you to search data based on criteria. Search uses equals (=) operator. 
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
        {{ external_links.github_raw_doc }}/fields/percent/filtration/MyExample6DTO.java
        --8<--
        ```   

        **Step 2**  Add **fields.enableFilter** to corresponding **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/filtration/MyExample6Meta.java:buildIndependentMeta
        --8<--
        ```   

    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

## Drilldown
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/drilldown){:target="_blank"}

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
    {{ external_links.github_raw_doc }}/fields/percent/drilldown/MyExample5Meta.java:buildRowDependentMeta
    --8<--
    ```   
    === "List widget"
        `Step 2` Add **"drillDown": "true"**  to .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/drilldown/MyExample5List.widget.json
        --8<--
        ```   
        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. See more [Drilldown](/advancedCustomization/element/drilldown/drilldown) 
 
    === "Info widget"

        `Step 2` Add **"drillDown": "true"**  to .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/drilldown/MyExample5Info.widget.json
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
   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample10){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/validationbusinessex){:target="_blank"}

   `Runtime Exception`:
   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample12){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/validationruntimeex){:target="_blank"}
   
2) Confirm: Presents a dialog with an optional message, requiring user confirmation or cancellation before proceeding.

   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample11){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/validationconfirm){:target="_blank"}

3) Field level validation: shows error next to all fields, that validation failed for

   `Option 1`:
   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample292){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/validationannotation){:target="_blank"}

   `Option 2`:
   [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample328){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/validationdynamic){:target="_blank"}


### How does it look?
=== "List widget"
    === "BusinessException"
        ![img_business_error](img_business_error.png)
    === "RuntimeException"
        ![img_runtime_error](img_runtime_error.png)
    === "Confirm"
        ![confirm_form](confirm_form.png)
    === "Field level validation"
        ![img_javax_stat_form](img_javax_stat_form.png)
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
        {{ external_links.github_raw_doc }}/fields/percent/validationbusinessex/MyExample10Service.java:doUpdateEntity
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
        {{ external_links.github_raw_doc }}/fields/percent/validationruntimeex/MyExample12Service.java:doUpdateEntity
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
        {{ external_links.github_raw_doc }}/fields/percent/validationconfirm/MyExample11Service.java:getActions
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
            Use if:

            Requires a simple fields check (javax validation)

            Add javax.validation to corresponding **DataResponseDTO**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/percent/validationannotation/MyExample292DTO.java
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
            {{ external_links.github_raw_doc }}/fields/percent/validationdynamic/MyExample328Service.java:validateFields
            --8<--
            ```   
            `Step 2` Add сustom method for check to corresponding **VersionAwareResponseService**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/percent/validationdynamic/MyExample328Service.java:doUpdateEntity
            --8<--
            ```   
 
## Sorting
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample9){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/sorting){:target="_blank"}

`Sorting` allows you to sort data in ascending or descending order.

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
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample8){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/required){:target="_blank"}

`Required` allows you to denote, that this field must have a value provided. 
By default, UI sets `Percent` value to 0 when user deletes it and `nullable` is not set or equals to false. See more [[Additional properties-nullable]](#nullable)

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
    {{ external_links.github_raw_doc }}/fields/percent/required/MyExample8Meta.java:buildRowDependentMeta
    --8<--
    ```   
    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**

## Additional properties
### <a id="digits">digits</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample310){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/additionalproperties/digits){:target="_blank"}

Property denotes number of digits after the decimal point. Additionally, UI will not show digits after comma if property is not set
#### How does it look?
=== "List widget"
    ![img_digits_list.png](img_digits_list.png)
=== "Info widget"
    ![img_digits_info.png](img_digits_info.png)
=== "Form widget"
    ![img_digits_form.png](img_digits_form.png)

#### How to add?
??? Example
    === "List widget"
        Add **digits** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/additionalproperties/digits/MyExample310List.widget.json
        --8<--
        ```
    === "Info widget"
        Add **digits** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/additionalproperties/digits/MyExample310Info.widget.json
        --8<--
        ```
    === "Form widget"
        Add **digits** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/additionalproperties/digits/MyExample310Form.widget.json
        --8<--
        ```

### <a id="nullable">nullable</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample58){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/percent/additionalproperties/nullable){:target="_blank"}

By default, UI sets `Percent` value to 0 when user deletes it. If `nullable` equals to true, then UI keeps empty value as usual
#### How does it look?
=== "List widget"
    ![img_nullable_list.png](img_nullable_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![img_nullable_form.png](img_nullable_form.png)

#### How to add?
??? Example
    === "List widget"
        Add **nullable** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/additionalproperties/nullable/MyExample58List.widget.json
        --8<--
        ```   
    === "Info widget"
        _not applicable_  

    === "Form widget"
        Add **nullable** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/percent/additionalproperties/nullable/MyExample58Form.widget.json
        --8<--
        ```  


