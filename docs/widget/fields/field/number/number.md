# Number

`Number` is a component for numbers editing. It can be used for editing and displaying numbers
Restricts input to numbers.

## Basics
### How does it look?

=== "List widget"
    ![img_list.png](img_list.png)
=== "Info widget"
    ![img_info.png](img_info.png)
=== "Form widget"
    ![img_form.png](img_form.png)


### How to add?
Long or Double 
??? Example
    **Step1** Add field **Long** to corresponding **DataResponseDTO**.

    ```java
    public class NumberDTO extends DataResponseDTO {
    
        @SearchParameter(name = "customField", provider = BigDecimalValueProvider.class)
        private Long customField;
    
        public NumberDTO(NumberEntity entity) {
            this.customField = entity.getCustomField();
        }
    }
    ```

    **Step2** Add field **Long** to corresponding **BaseEntity**.

    ```java
    public class NumberEntity extends BaseEntity {
   
        @Column
        private Long customField;
    }
    ```
    === "List widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "NumberList",
          "title": "List title",
          "type": "List",
          "bc": "myBcNumber",,
          "fields": [
            {
              "title": "custom Field",
              "key": "customField",
              "type": "number"
            }
          ],
          "options": {
            "actionGroups": {
            }
          }
        }
        ```
    === "Info widget"
        **Step3** Add to **_.widget.json_**.
        
        ```json
        {
          "name": "NumberInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myBcNumber",,
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "number"
            }
          ],
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customField",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                  ]
                }
              ]
            }
          }
        }
        ```

    === "Form widget"

        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "NumberForm",
          "title": "Form title",
          "type": "Form",
          "bc": "myBcNumber",,
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "number"
            }
          ],
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customField",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                  ]
                }
              ]
            }
          }
        }
        ```

## Placeholder
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

    public class NumberMeta extends FieldMetaBuilder<NumberDTO> {
    
      @Override
      public void buildRowDependentMeta(RowDependentFieldsMeta<NumberDTO> fields, InnerBcDescription bcDescription,
        Long id, Long parentId) {
        fields.setPlaceholder(NumberDTO_.customField, "1456"));
      }
    ```
    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**

## Color
`Color` allows you to specify a field color. It can be calculated based on business logic of application

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
        
    
        **Step 1**   Add `custom field` for color to corresponding **DataResponseDTO**. 
    
        ```java
        public class NumberDTO extends DataResponseDTO {
        
            @SearchParameter(name = "customField", provider = BigDecimalValueProvider.class)
            private Long customField;
            private String customFieldColor;
        
            public NumberDTO(NumberEntity entity) {
                this.customField = entity.getCustomField();
                this.customFieldColor = "#eda6a6";
            }
        ```
        === "List widget"   
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            {
              "name": "NumberList",
              "title": "List title",
              "type": "List",
              "bc": "myBcNumber",,
              "fields": [
                {
                  "title": "custom Field",
                  "key": "customField",
                  "type": "number",
                  "bgColorKey": "customFieldColor"
                }
              ],
              "options": {
                "actionGroups": {
                }
              }
            }
            ```
        === "Info widget"
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            {
              "name": "NumberInfo",
              "title": "Info title",
              "type": "Info",
              "bc": "myBcNumber",,
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "number",
                  "bgColorKey": "customFieldColor"
                }
              ],
              "options": {
                "layout": {
                  "rows": [
                    {
                      "cols": [
                        {
                          "fieldKey": "customField",
                          "span": 12
                        }
                      ]
                    },
                    {
                      "cols": [
                      ]
                    }
                  ]
                }
              }
            }       
            ```
        === "Form widget"
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            {
              "name": "NumberForm",
              "title": "Form title",
              "type": "Form",
              "bc": "myBcNumber",,
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "number",
                  "bgColorKey": "customFieldColor"
                }
              ],
              "options": {
                "layout": {
                  "rows": [
                    {
                      "cols": [
                        {
                          "fieldKey": "customField",
                          "span": 12
                        }
                      ]
                    },
                    {
                      "cols": [
                      ]
                    }
                  ]
                }
              }
            }
            ```
    === "Constant color"
        === "List widget" 
            Add **"bgColor"** :  `custom color`  to .widget.json.
            ```json
            {
              "name": "NumberList",
              "title": "List title",
              "type": "List",
              "bc": "myBcNumber",,
              "fields": [
                {
                  "title": "custom Field",
                  "key": "customField",
                  "type": "number",
                  "bgColor": "#eda6a6"
                }
              ],
              "options": {
                "actionGroups": {
                }
              }
            }
            ```

        === "Info widget"
            Add **"bgColor"** :  `custom color`  to .widget.json.
            ```json
           {
              "name": "NumberInfo",
              "title": "Info title",
              "type": "Info",
              "bc": "myBcNumber",,
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "number",
                  "bgColor": "#eda6a6"
                }
              ],
              "options": {
                "layout": {
                  "rows": [
                    {
                      "cols": [
                        {
                          "fieldKey": "customField",
                          "span": 12
                        }
                      ]
                    },
                    {
                      "cols": [
                      ]
                    }
                  ]
                }
              }
            }
            ```

        === "Form widget"
            Add **"bgColor"** :  `custom color`  to .widget.json.  
            ```json
            {
              "name": "NumberForm",
              "title": "Form title",
              "type": "Form",
              "bc": "myBcNumber",,
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "number",
                  "bgColor": "#eda6a6"
                }
              ],
              "options": {
                "layout": {
                  "rows": [
                    {
                      "cols": [
                        {
                          "fieldKey": "customField",
                          "span": 12
                        }
                      ]
                    },
                    {
                      "cols": [
                      ]
                    }
                  ]
                }
              }
            }
            ```
## Readonly/Editable
`Readonly/Editable` indicates whether the field can be edited or not. It can be calculated based on business logic of application

### How does it look?
=== "Editable List widget"
    ![img_edit_list.png](img_edit_list.png)
=== "Editable Info widget"
    _not applicable_
=== "Editable Form widget"
    ![img_edit_form.png](img_edit_form.png)


### How to add?
??? Example
    === "Editable" 
        **Step1** Add mapping DTO->entity to corresponding **VersionAwareResponseService**.
            ```java
            protected ActionResultDTO<NumberDTO> doUpdateEntity(NumberEntity entity, NumberDTO data, BusinessComponent bc) {
                if (data.isFieldChanged(NumberDTO_.customField)) {
                    entity.setCustomField(data.getCustomField());
                }
            return new ActionResultDTO<>(entityToDto(bc, entity));
            ```

        **Step2** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    
        ```java
        public class NumberMeta extends FieldMetaBuilder<NumberDTO> {
            public void buildRowDependentMeta(RowDependentFieldsMeta<NumberDTO> fields, InnerBcDescription bcDescription, Long id, Long parentId) {
                fields.setEnabled(NumberDTO_.customField);
            }
        }
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
        public class NumberMeta extends FieldMetaBuilder<NumberDTO> {
            public void buildRowDependentMeta(RowDependentFieldsMeta<NumberDTO> fields, InnerBcDescription bcDescription, Long id, Long parentId) {
            }
        }
        ```
    
        **Option 2** `Not recommended.` Property fields.setDisabled() overrides the enable field if you use after property fields.setEnabled.
        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**
## Filtration
`Filtering` allows you to search data based on criteria.Search by range current day . 
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
        **Step 1** Add **@SearchParameter** to corresponding **DataResponseDTO**. (Advanced customization [SearchParameter](/advancedCustomization_filtration)

        ```java
        public class NumberDTO extends DataResponseDTO {
        
            @SearchParameter(name = "customField", provider = BigDecimalValueProvider.class)
            private Long customField;
        
            public NumberDTO(NumberEntity entity) {
                this.customField = entity.getCustomField();
            }
        }
        ```
        **Step 2**  Add **fields.enableFilter** to corresponding **FieldMetaBuilder**.

        ```java 
        public class NumberFiltrationMeta extends FieldMetaBuilder<NumberFiltrationDTO>  {
        
            public void buildIndependentMeta(FieldsMeta<NumberFiltrationDTO> fields, InnerBcDescription bcDescription, Long parentId) {
                fields.enableFilter(NumberFiltrationDTO_.customField);
            }
        
        }
        ```

    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

## Drilldown
`DrillDown` allows you to navigate to another view by simply tapping on it. Target view and other drill-down parts can be calculated based on business logic of application

Also, it optionally allows you to filter data on target view before it will be opened `see more` [DrillDown](/features/element/drillDown/drillDown)


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

    `Step 1` Add [fields.setDrilldown](/features/element/drillDown/drillDown) to corresponding **FieldMetaBuilder**.
    ```java
    public class NumberMeta extends FieldMetaBuilder<NumberDTO> {
    
        @Override
        public void buildRowDependentMeta(RowDependentFieldsMeta<NumberDTO> fields, InnerBcDescription bcDescription,
                                          Long id, Long parentId) {
            fields.setDrilldown(
                    NumberDTO_.customField,
                    DrillDownType.INNER,
                    "/screen/Number/view/Numberinfo/" + PlatformNumberController.myBcNumber + "/" + id
            );
    ```
    === "List widget"
        `Step 2` For visual add **"drillDown": "true"**  to .widget.json.
        ```json
        {
          "name": "NumberList",
          "title": "List title",
          "type": "List",
          "bc": "myBcNumber",
          "fields": [
            {
              "title": "custom Field",
              "key": "customField",
              "type": "number",
              "drillDown": "true"
            }
          ],
          "options": {
            "actionGroups": {
            }
          }
        }
        ```


        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. see more [Drilldown](/advancedCustomization/element/drillDown/drillDown) 
 
    === "Info widget"

        `Step 2` For visual add **"drillDown": "true"**  to .widget.json.

        ```json
        {
          "name": "NumberInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myBcNumber",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "number",
              "drillDown": "true"
            }
          ],
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customField",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                  ]
                }
              ]
            }
          }
        }
        ```
        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. see more [Drilldown](/advancedCustomization/element/drillDown/drillDown) 
 
    === "Form widget"
        _not applicable_
[Advanced customization](/advancedCustomization/element/drillDown/drillDown)

## Validation
`Validation` allows you to check any business rules for user-entered value. There are two types of validation:

1) Exception: Displays a message to notify users about technical or business errors.

2) Confirm: Presents a dialog with an optional message, requiring user confirmation or cancellation before proceeding.

### How does it look?
=== "List widget"
    === "BusinessException"
        ![img_business_error](img_business_error.png)
    === "RuntimeException"
        ![img_runtime_error](img_runtime_error.png)
    === "Confirm"
        ![confirm_form](confirm_form.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    === "BusinessException"
        ![img_business_error](img_business_error.png)
    === "RuntimeException"
        ![img_runtime_error](img_runtime_error.png)
    === "Confirm"
        ![confirm_form](confirm_form.png)

### How to add?
??? Example
    === "BusinessException"
        `BusinessException` describes an error  within a business process.

        Add **BusinessException** to corresponding **VersionAwareResponseService**.

        ```java
        public class NumberService extends VersionAwareResponseService<NumberDTO, Number> {
 
            @Override
            protected ActionResultDTO<NumberDTO> doUpdateEntity(NumberEntity entity, NumberDTO data, BusinessComponent bc) {
                if (data.isFieldChanged(NumberDTO_.customField)) {
                    entity.setCustomField(data.getCustomField());
                    if (data.getCustomField() < 20000) {
                        throw new BusinessException().addPopup("The field 'customField' cannot be less than 20 000.");
                    }
                }
                return new ActionResultDTO<>(entityToDto(bc, entity));
            }              
        ```
        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**
    === "RuntimeException"

        `RuntimeException` describes an error  within a business process.
        
        Add **RuntimeException** to corresponding **VersionAwareResponseService**.
        
        ```java
            @Override
            protected ActionResultDTO<NumberDTO> doUpdateEntity(NumberEntity entity, NumberDTO data, BusinessComponent bc) {
                if (data.isFieldChanged(NumberDTO_.customField)) {
                    entity.setCustomField(data.getCustomField());
                   try {
                       //call custom function
                   }
                   catch(Exception e){
                        throw new RuntimeException("An unexpected error has occurred.");
                    }
                }
                return new ActionResultDTO<>(entityToDto(bc, entity));
            }
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
     
            public class NumberService extends VersionAwareResponseService<NumberDTO, Number> {

                @Override
                public Actions<NumberDTO> getActions() {
                    return Actions.<NumberDTO>builder()
                    .newAction()
                    .action("save", "save")
                    .withPreAction(PreAction.confirm("You want to save the value 'customField'?"))
                    .add()
                    .build();
                }
            }
        ```
        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**
    === "Javax static"
        Add javax.validation to corresponding **DataResponseDTO**.
        ```java
     
            public class MyExampleDTO extends DataResponseDTO {
                    @DecimalMin(value = "100000.00", message = "The field 'customField' cannot be less than 100 000.00.")
                    private Long customField;
            }
        ```

        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**
## Sorting
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
        Enabled on default.
    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

## Required
`Required` allows you to denote, that this field must have a value provided. By default, `Number` is 0.
But can use `nullable`. see more `Additional properties-nullable`

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

    public class MyExampleMeta extends FieldMetaBuilder<MyExample> {
    
      @Override
      public void buildRowDependentMeta(RowDependentFieldsMeta<MyExample> fields, InnerBcDescription bcDescription,
        Long id, Long parentId) {
        fields.setEnabled(MyExample_.customField);
        fields.setRequired(MyExample_.customField);
      }
    ```
    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**

## Additional properties
`digits`

### How does it look?
=== "List widget"
    ![img_digits_list.png](img_digits_list.png)
=== "Info widget"
    ![img_digits_info.png](img_digits_info.png)
=== "Form widget"
    ![img_digits_form.png](img_digits_form.png)

### How to add?
??? Example
    === "List widget"
        Add **digits** to **_.widget.json_**.
        ```json
        {
          "name": "NumberForm",
          "title": "Form title",
          "type": "Form",
          "bc": "myBcNumber",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "number",
              "digits": 2
            }
          ],
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customField",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                  ]
                }
              ]
            }
          }
        }
        ```  
    === "Info widget"
        Add **digits** to **_.widget.json_**.
        ```json
         {
          "name": "NumberInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myBcNumber",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "number",
              "digits": 2
            }
          ],
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customField",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                  ]
                }
              ]
            }
          }
        }
        ```
    === "Form widget"
        Add **digits** to **_.widget.json_**.
        ```json
        {
          "name": "NumberList",
          "title": "List title",
          "type": "List",
          "bc": "myBcNumber",
          "fields": [
            {
              "title": "custom Field",
              "key": "customField",
              "type": "number",
              "digits": 2
            }
          ],
          "options": {
            "actionGroups": {
            }
          }
        }
        ```

`nullable`
### How does it look?
=== "List widget"
    ![img_nullable_list.png](img_nullable_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![img_nullable_form.png](img_nullable_form.png)

### How to add?
??? Example
    === "List widget"
        Add **nullable** to **_.widget.json_**.
        ```json
        {
          "name": "MyExampleList",
          "title": "List title",
          "type": "List",
          "bc": "myExampleBc",
          "fields": [
            {
              "title": "Custom Field",
              "key": "customField",
              "type": "number",
              "nullable": true
            }
          ],
          "options": {
            "actionGroups": {
            }
          }
        } 
        ```  

    === "Info widget"
        _not applicable_  

    === "Form widget"
        Add **nullable** to **_.widget.json_**.
        ```json
        {
          "bc": "myExampleBc",
          "fields": [
            {
              "label": "Custom Field",
              "key": "customField",
              "type": "number",
              "nullable": true
            }
          ],
          "name": "MyExampleForm",
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customField",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                  ]
                }
              ]
            }
          },
          "title": "Form title",
          "type": "Form"
        }
        ```


