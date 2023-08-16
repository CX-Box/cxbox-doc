# DateTimeWithSeconds
`DateTimeWithSeconds` is a component for date with time editing. It can be used for editing and displaying dates with time and with seconds.

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
    **Step1** Add field **LocalDateTimeWithSeconds** to corresponding **DataResponseDTO**.

    ```java
    public class DateTimeWithSecondsDTO extends DataResponseDTO {
        @SearchParameter(name = "customField", provider = DateTimeValueProvider.class)   
        private LocalDateTime customField;
    
        public DateTimeWithSecondsDTO(DateTimeWithSecondsEntity entity) {
            this.customField = entity.getCustomField();
        }
    }
    ```
    **Step2** Add field **LocalDateTimeWithSeconds** to corresponding **BaseEntity**.

    ```java
    public class DateTimeWithSecondsEntity extends BaseEntity {
    
        private LocalDateTime customField;
    
    }
    ```
    === "List widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "DateTimeWithSecondsList",
          "title": "List title",
          "type": "List",
          "bc": "myBcDateTimeWithSeconds",
          "fields": [
            {
              "title": "custom Field",
              "key": "customField",
              "type": "dateTimeWithSeconds"
            }
          ]
        }
        ```
    === "Info widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "DateTimeWithSecondsInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myBcDateTimeWithSeconds",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "dateTimeWithSeconds"
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
          "name": "DateTimeWithSecondsForm",
          "title": "Form title",
          "type": "Form",
          "bc": "myBcDateTimeWithSeconds",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "dateTimeWithSeconds"
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
`Placeholder` allows you to provide a concise hint, guiding users on the expected value. This hint is displayed before any user input. It can be calculated based on business logic of application.
### How does it look?
=== "List widget"
    ![img_plchldr_list.png](img_plchldr_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![form_label.png](img_plchldr_form.png)

### How to add?
??? Example

    Add **fields.setPlaceholder** to corresponding **FieldMetaBuilder**.
    
    ```java
    
    public class InputMeta extends FieldMetaBuilder<DateTimeWithSecondsDTO> {
    
      @Override
      public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeWithSecondsDTO> fields, InnerBcDescription bcDescription,
        Long id, Long parentId) {
        fields.setPlaceholder(DateTimeWithSecondsDTO_.customField,  LocalDateTime.now().toString());
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
    _not applicable_


### How to add?
??? Example
    === "Calculated color"
        
    
        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null. 
    
        ```java
        public class DateTimeWithSecondsDTO extends DataResponseDTO {
        
                  private LocalDateTime customField;    
                  private String customFieldColor;
                
                  public DateTimeWithSecondsDTO(DateTimeWithSecondsEntity entity) {
                    this.customField = entity.getCustomField();
                    this.customFieldColor = "#eda6a6";
                  }        
                }
        ```
        === "List widget"   
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            {
              "name": "DateTimeWithSecondsList",
              "title": "List title",
              "type": "List",
              "bc": "myBcDateTimeWithSeconds",
              "fields": [
                {
                  "title": "custom Field",
                  "key": "customField",
                  "type": "dateTimeWithSeconds",
                  "bgColorKey": "customFieldColor"
                }
              ]
            }
            ```
        === "Info widget"
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            {
              "name": "DateTimeWithSecondsInfo",
              "title": "Info title",
              "type": "Info",
              "bc": "myBcDateTimeWithSeconds",
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "dateTimeWithSeconds",
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
            _not applicable_   

    === "Constant color"
        === "List widget" 
            Add **"bgColor"** :  `HEX color`  to .widget.json.
            ```json
            {
              "name": "DateTimeWithSecondsrList",
              "title": "List title",
              "type": "List",
              "bc": "DateTimeWithSecondsr",
              "fields": [
                {
                  "title": "custom Field",
                  "key": "customField",
                  "type": "dateTimeWithSeconds",
                  "bgColor": "#eda6a6"
                }
              ]
            }
            ```

        === "Info widget"
            Add **"bgColor"** :  `HEX color`  to .widget.json.
            ```json
            {
              "name": "DateTimeWithSecondsrInfo",
              "title": "Info title",
              "type": "Info",
              "bc": "DateTimeWithSecondsr",
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "dateTimeWithSeconds",
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
           _not applicable_    


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
            
            public class DateTimeWithSecondsService extends VersionAwareResponseService<DateTimeWithSecondsDTO, DateTimeWithSeconds> {
     
                @Override
                protected ActionResultDTO<DateTimeWithSecondsDTO> doUpdateEntity(DateTimeWithSecondsEntity entity, DateTimeWithSecondsDTO data, BusinessComponent bc) {
                    if (data.isFieldChanged(DateTimeWithSecondsDTO_.customField)) {
                        entity.setCustomField(data.getCustomField());
                    }
                    return new ActionResultDTO<>(entityToDto(bc, entity));
                }
          
            ```
        **Step2** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    
        ```java
        public class DateTimeWithSecondsMeta extends FieldMetaBuilder<DateTimeWithSecondsDTO> {
          @Override
          public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeWithSecondsDTO> fields, InnerBcDescription bcDescription,
                                            Long id, Long parentId) {
            fields.setEnabled(DateTimeWithSecondsDTO_.customField);
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
        public class DateTimeWithSecondsMeta extends FieldMetaBuilder<DateTimeWithSecondsDTO> {
          @Override
          public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeWithSecondsDTO> fields, InnerBcDescription bcDescription,
                                            Long id, Long parentId) {
        
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
`Filtering` allows you to search data based on criteria. Search is carried out between 00:00:00 and 23:59:59.
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
        **Step 1** Add **@SearchParameter** to corresponding **DataResponseDTO**. (Advanced customization [SearchParameter](/advancedCustomization_filtration))

        ```java
        public class DateTimeWithSecondsDTO extends DataResponseDTO {
        
          @SearchParameter(name = "customField", provider = DateTimeValueProvider.class) 
          private LocalDateTime customField;
        ```

        **Step 2**  Add **fields.enableFilter** to corresponding **FieldMetaBuilder**.

        ```java
 
        public class DateTimeWithSecondsMeta extends FieldMetaBuilder<DateTimeWithSecondsDTO> {
        
          @Override
            public void buildIndependentMeta(FieldsMeta<DateTimeWithSecondsDTO> fields, InnerBcDescription bcDescription, Long parentId) {
             fields.enableFilter(DateTimeWithSecondsDTO_.customField);
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
    public class DateTimeWithSecondsMeta extends FieldMetaBuilder<DateTimeWithSecondsDTO> {
 
        @Override
        public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeWithSecondsDTO> fields, InnerBcDescription bcDescription,
                                          Long id, Long parentId) {
              fields.setDrilldown(
                    DateTimeWithSecondsDTO_.customField,
                    DrillDownType.INNER,
                    "/screen/DateTimeWithSeconds/view/dateTimeWithSecondsinfo/" + PlatformDateTimeWithSecondsController.myBcDateTimeWithSeconds + "/" + id
            );
    ```
    === "List widget"
        `Step 2` Add **"drillDown": "true"**  to .widget.json.
            ```json
            {
              "name": "DateTimeWithSecondsList",
              "title": "List title",
              "type": "List",
              "bc": "myBcDateTimeWithSeconds",
              "fields": [
                {
                  "title": "custom Field",
                  "key": "customField",
                  "type": "dateTimeWithSeconds",
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
          "name": "DateTimeWithSecondsInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myBcDateTimeWithSeconds",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "dateTimeWithSeconds",
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
            @Override
            protected ActionResultDTO<DateTimeWithSecondsDTO> doUpdateEntity(DateTimeWithSecondsEntity entity, DateTimeWithSecondsDTO data, BusinessComponent bc) {
            if (data.isFieldChanged(DateTimeWithSecondsDTO_.customField)) {
                LocalDate sysdate = LocalDate.now();
                if (sysdate.compareTo(data.getCustomField().toLocalDate()) > 0) {
                    throw new BusinessException().addPopup("The field 'customField' cannot be less than the current date");
                }
                entity.setCustomField(data.getCustomField());
            }
            return new ActionResultDTO<>(entityToDto(bc, entity));          
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
        protected ActionResultDTO<DateTimeWithSecondsDTO> doUpdateEntity(DateTimeWithSecondsEntity entity, DateTimeWithSecondsDTO data, BusinessComponent bc) {
            if (data.isFieldChanged(DateTimeWithSecondsDTO_.customField)) {
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
        Add [PreAction.confirm](/advancedCustomization/element/confirm/confirm) to corresponding **VersionAwareResponseService**.
        ```java
            @Override
            public Actions<DateTimeWithSecondsValidationDTO> getActions() {
                return Actions.<DateTimeWithSecondsValidationDTO>builder()
                        .newAction()
                        .action("save", "save")
                        .withPreAction(PreAction.confirm("You want to save the value 'customField'?"))
                        .add()
                        .build();
            }
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

            ```java
         
                public class MyExampleDTO extends DataResponseDTO {
                    @Future(message = "The field 'customField' cannot be less than the current date")
                    private LocalDateTime customField;
                }
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
            private void validate(BusinessComponent bc, MyExampleDTO dto) {
                BusinessError.Entity entity = new BusinessError.Entity(bc);
                LocalDate sysdate = LocalDate.now();
                if (sysdate.compareTo(dto.getCustomField()) > 0) {
                    entity.addField(MyExampleDTO_.customField.getName(), errorMessage("The field 'customField' cannot be less than the current date"));
                }
                if (sysdate.compareTo(dto.getCustomFieldAdditional()) > 0) {
                    entity.addField(MyExampleDTO_.customFieldAdditional.getName(), errorMessage("The field 'customFieldAdditional' cannot be less than the current date"));
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
                      "type": "dateTimeWithSeconds"
                    },
                    {
                      "title": "Custom Field Additional",
                      "key": "customFieldAdditional",
                      "type": "dateTimeWithSeconds"
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
                **_not applicable_**
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
                      "type": "dateTimeWithSeconds"
                    },
                    {
                      "label": "Custom Field Additional",
                      "key": "customFieldAdditional",
                      "type": "dateTimeWithSeconds"
                    }
                  ],
                  "options": {
                    "actionGroups": {
                      "include": [
                        "check"
                      ]
                    },
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
    ![sort_list](sort_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_
### How to add?
=== "List widget"
    Enabled by default.
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_

## Required
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
    public class DateTimeWithSecondsMeta extends FieldMetaBuilder<DateTimeWithSecondsDTO> {
    
      @Override
      public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeWithSecondsDTO> fields, InnerBcDescription bcDescription,
        Long id, Long parentId) {
        fields.setEnabled(DateTimeWithSecondsDTO_.customField);
        fields.setRequired(DateTimeWithSecondsDTO_.customField);
      }
    ```
    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**
