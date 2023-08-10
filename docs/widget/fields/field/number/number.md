# Number

`Number` is a component for numbers editing. It is used to input and present numbers and automatically restricts user input to numeric values only.

## Basics
### How does it look?

=== "List widget"
    ![img_list.png](img_list.png)
=== "Info widget"
    ![img_info.png](img_info.png)
=== "Form widget"
    ![img_form.png](img_form.png)


### How to add?
??? Example
    One will usually use  **Long**,  **Double** or  **BigDecimal** java types in DTO and Entity for storing this field type. 

    Next example shows  **Long ** usage:

    **Step1** Add **Long** field to corresponding **DataResponseDTO**.

    ```java
    public class NumberDTO extends DataResponseDTO {
    
        @SearchParameter(name = "customField", provider = BigDecimalValueProvider.class)
        private Long customField;
    
        public NumberDTO(NumberEntity entity) {
            this.customField = entity.getCustomField();
        }
    }
    ```

    **Step2** Add **Long** field to corresponding **BaseEntity**.

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
              "title": "Custom Field",
              "key": "customField",
              "type": "number"
            }
          ]
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
              "label": "Custom Field",
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
              "label": "Custom Field",
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
        fields.setPlaceholder(NumberDTO_.customField, "123456"));
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
        
    
        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null. The field can contain a HEX color or be null. 
    
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
              ]
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
                    }
                  ]
                }
              }
            }
            ```
    === "Constant color"
        === "List widget" 
            Add **"bgColor"** :  `HEX color`  to .widget.json.
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
              ]
            }
            ```
        === "Info widget"
            Add **"bgColor"** :  `HEX color`  to .widget.json.
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
                    }
                  ]
                }
              }
            }
            ```

        === "Form widget"
            Add **"bgColor"** :  `HEX color`  to .widget.json.  
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
                    }
                  ]
                }
              }
            }
            ```
## Readonly/Editable
`Readonly/Editable` indicates whether the field can be edited or not. It can be calculated based on business logic of application

### How does it look?
=== "Editable"
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
            **Works for Info.**
        === "Form widget"
            **Works for Form.**
## Filtration
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
        **Step 1** Add **@SearchParameter** to corresponding **DataResponseDTO**. (Advanced customization [SearchParameter](/advancedCustomization_filtration)))

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
        `Step 2` Add **"drillDown": "true"**  to .widget.json.
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
          ]
        }
        ```


        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. See more [Drilldown](/advancedCustomization/element/drillDown/drillDown) 
 
    === "Info widget"

        `Step 2` Add **"drillDown": "true"**  to .widget.json.

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
                }
              ]
            }
          }
        }
        ```
        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. See more [Drilldown](/advancedCustomization/element/drillDown/drillDown) 
 
    === "Form widget"
        _not applicable_
[Advanced customization](/advancedCustomization/element/drillDown/drillDown)

## Validation
`Validation` allows you to check any business rules for user-entered value. There are two types of validation:

1) Exception: Displays a message to notify users about technical or business errors.

2) Confirm: Presents a dialog with an optional message, requiring user confirmation or cancellation before proceeding.

3) Field level validation: shows error next to all fields, that validation failed for

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

        `RuntimeException` describes technical error  within a business process.
        
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
            **_Fields cannot be changed on this widget type, so "Confirm" is not applicable for field validation_**
        === "Form widget"
            **Works for Form.**
    === "Field level validation"
        === "Option 1"
            Use if:

            Requires a simple fields check (javax validation)

            Add javax.validation to corresponding **DataResponseDTO**.
            ```java
         
                public class MyExampleDTO extends DataResponseDTO {
                        @Min(value = 100000, message = "The field 'customField' cannot be less than 100 000.")
                        private Long customField;
                }
            ```
        
        === "Option 2"
            Create сustom service for business logic check.

            Use if:

            Business logic check required for fields

            `Step 1`  Create сustom method for check.
            ```java
            private void validate(BusinessComponent bc, MyExampleDTO dto) {
                BusinessError.Entity entity = new BusinessError.Entity(bc);
                if (dto.getCustomField() < 100000)  {
                    entity.addField(MyExample2337DTO_.customField.getName(), errorMessage("The field 'customField' cannot be less than 100 000."));
                }
                if  (dto.getCustomField() < 100000)  {
                    entity.addField(MyExample2337DTO_.customFieldAdditional.getName(), errorMessage("The field 'customField' cannot be less than 100 000."));
                }
                if (entity.getFields().size() > 0) {
                    throw new BusinessException().setEntity(entity);
                }
            }
            ```
            `Step 2` Add new Action to corresponding **VersionAwareResponseService**.
            ```java
        
              public Actions<MyExampleDTO> getActions() {
                return Actions.<MyExampleDTO>builder()
                        .newAction()
                        .action("save", "save")
                        .add()
                        .action("check", "Check")
                        .invoker((bc, dto) -> {
                            validate(bc, dto);
                            return new ActionResultDTO<>();
                        })
                        .add()
                        .build();
            }
            ```
            === "List widget"
                Add custom action check to **_.widget.json_**.
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
                      "type": "number"
                    },
                    {
                      "title": "Custom Field Additional",
                      "key": "customFieldAdditional",
                      "type": "number"
                    }
                  ],
                  "options": {
                    "actionGroups": {
                      "include": [
                        "check"
                      ]
                    }
                  }
                }
                ```               
            === "Info widget"
                ```json
                {
                  "name": "MyExampleInfo",
                  "title": "Info title",
                  "type": "Info",
                  "bc": "myExampleBc",
                  "fields": [
                    {
                      "label": "Custom Field",
                      "key": "customField",
                      "type": "number"
                    },
                    {
                      "label": "Custom Field Additional",
                      "key": "customFieldAdditional",
                      "type": "number"
                    }
                  ],
                  "options": {
                    "layout": {
                      "rows": [
                        {
                          "cols": [
                            {
                              "fieldKey": "customFieldAdditional",
                              "span": 12
                            }
                          ]
                        },
                        {
                          "cols": [
                            {
                              "fieldKey": "customField",
                              "span": 12
                            }
                          ]
                        }
                      ]
                    }
                  }
                }
                ```   
            === "Form widget"
                ```json
                {
                  "name": "MyExampleForm",
                  "title": "Form title",
                  "type": "Form",
                  "bc": "myExampleBc",
                  "fields": [
                    {
                      "label": "Custom Field",
                      "key": "customField",
                      "type": "number"
                    },
                    {
                      "label": "Custom Field Additional",
                      "key": "customFieldAdditional",
                      "type": "number"
                    }
                  ],
                  "options": {
                    "layout": {
                      "rows": [
                        {
                          "cols": [
                            {
                              "fieldKey": "customFieldAdditional",
                              "span": 12
                            }
                          ]
                        },
                        {
                          "cols": [
                            {
                              "fieldKey": "customField",
                              "span": 12
                            }
                          ]
                        }
                      ]
                    }
                  }
                }
                ```
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
        Enabled by default.
    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

## Required
`Required` allows you to denote, that this field must have a value provided. By default, UI sets `Number` value to 0 when user deletes it and `nullable` is not set or equals to false. See more [[Additional properties-nullable]](#nullable)

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

    public class MyExampleMeta extends FieldMetaBuilder<MyExampleDTO> {
    
      @Override
      public void buildRowDependentMeta(RowDependentFieldsMeta<MyExampleDTO> fields, InnerBcDescription bcDescription,
        Long id, Long parentId) {
        fields.setEnabled(MyExampleDTO_.customField);
        fields.setRequired(MyExampleDTO_.customField);
      }
    ```
    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**

## Additional properties
### <a id="digits">digits</a>
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
          ]
        }
        ```

### <a id="nullable">nullable</a>
By default, UI sets `Number` value to 0 when user deletes it. If `nullable` equals to true, then UI keeps empty value as usual
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
          ]
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
                }
              ]
            }
          },
          "title": "Form title",
          "type": "Form"
        }
        ```


