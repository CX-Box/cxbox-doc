# DateTime
`DateTime`  is a component for date with time editing. It can be used for editing and displaying dates with time.
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
    **Step1** Add field **LocalDateTime** to corresponding **DataResponseDTO**.

    ```java
    public class DateTimeDTO extends DataResponseDTO {
        @SearchParameter(name = "customField", provider = DateTimeValueProvider.class)   
        private LocalDateTime customField;
    
        public DateTimeDTO(DateTimeEntity entity) {
            this.customField = entity.getCustomField();
        }
    }
    ```
    **Step2** Add field **LocalDateTime** to corresponding **BaseEntity**.

    ```java
    public class DateTimeEntity extends BaseEntity {
    
        private LocalDateTime customField;
    
    }
    ```
    === "List widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "DateTimeList",
          "title": "List title",
          "type": "List",
          "bc": "myBcDateTime",
          "fields": [
            {
              "title": "custom Field",
              "key": "customField",
              "type": "dateTime"
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
          "name": "DateTimeInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myBcDateTime",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "dateTime"
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
          "name": "DateTimeForm",
          "title": "Form title",
          "type": "Form",
          "bc": "myBcDateTime",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "dateTime"
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
    
    public class InputMeta extends FieldMetaBuilder<DateTimeDTO> {
    
      @Override
      public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeDTO> fields, InnerBcDescription bcDescription,
        Long id, Long parentId) {
        fields.setPlaceholder(DateTimeDTO_.customField,  LocalDateTime.now().toString());
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
        
    
        **Step 1**   Add `custom field` for color to corresponding **DataResponseDTO**. 
    
        ```java
        public class DateTimeDTO extends DataResponseDTO {
        
                  private LocalDateTime customField;    
                  private String customFieldColor;
                
                  public DateTimeDTO(DateTimeEntity entity) {
                    this.customField = entity.getCustomField();
                    this.customFieldColor = "#eda6a6";
                  }        
                }
        ```
        === "List widget"   
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            {
              "name": "DateTimeList",
              "title": "List title",
              "type": "List",
              "bc": "myBcDateTime",
              "fields": [
                {
                  "title": "custom Field",
                  "key": "customField",
                  "type": "dateTime",
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
              "name": "DateTimeInfo",
              "title": "Info title",
              "type": "Info",
              "bc": "myBcDateTime",
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "dateTime",
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
            Add **"bgColor"** :  `custom color`  to .widget.json.
            ```json
            {
              "name": "DateTimerList",
              "title": "List title",
              "type": "List",
              "bc": "DateTimer",
              "fields": [
                {
                  "title": "custom Field",
                  "key": "customField",
                  "type": "dateTime",
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
              "name": "DateTimerInfo",
              "title": "Info title",
              "type": "Info",
              "bc": "DateTimer",
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "dateTime",
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
            
            public class DateTimeService extends VersionAwareResponseService<DateTimeDTO, DateTime> {
     
                @Override
                protected ActionResultDTO<DateTimeDTO> doUpdateEntity(DateTimeEntity entity, DateTimeDTO data, BusinessComponent bc) {
                    if (data.isFieldChanged(DateTimeDTO_.customField)) {
                        entity.setCustomField(data.getCustomField());
                    }
                    return new ActionResultDTO<>(entityToDto(bc, entity));
                }
          
            ```
        **Step2** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    
        ```java
        public class DateTimeMeta extends FieldMetaBuilder<DateTimeDTO> {
          @Override
          public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeDTO> fields, InnerBcDescription bcDescription,
                                            Long id, Long parentId) {
            fields.setEnabled(DateTimeDTO_.customField);
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
        public class DateTimeMeta extends FieldMetaBuilder<DateTimeDTO> {
          @Override
          public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeDTO> fields, InnerBcDescription bcDescription,
                                            Long id, Long parentId) {
        
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
        public class DateTimeDTO extends DataResponseDTO {
        
          @SearchParameter(name = "customField", provider = DateTimeValueProvider.class) 
          private LocalDateTime customField;
        ```

        **Step 2**  Add **fields.enableFilter** to corresponding **FieldMetaBuilder**.

        ```java
 
        public class DateTimeMeta extends FieldMetaBuilder<DateTimeDTO> {
        
          @Override
            public void buildIndependentMeta(FieldsMeta<DateTimeDTO> fields, InnerBcDescription bcDescription, Long parentId) {
             fields.enableFilter(DateTimeDTO_.customField);
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
    public class DateTimeMeta extends FieldMetaBuilder<DateTimeDTO> {
 
        @Override
        public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeDTO> fields, InnerBcDescription bcDescription,
                                          Long id, Long parentId) {
              fields.setDrilldown(
                    DateTimeDTO_.customField,
                    DrillDownType.INNER,
                    "/screen/DateTime/view/DateTimeinfo/" + PlatformDateTimeController.myBcDateTime + "/" + id
            );
    ```
    === "List widget"
        `Step 2` For visual add **"drillDown": "true"**  to .widget.json.
            ```json
            {
              "name": "DateTimeList",
              "title": "List title",
              "type": "List",
              "bc": "myBcDateTime",
              "fields": [
                {
                  "title": "custom Field",
                  "key": "customField",
                  "type": "dateTime",
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
          "name": "DateTimeInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myBcDateTime",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "dateTime",
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
            @Override
            protected ActionResultDTO<DateTimeDTO> doUpdateEntity(DateTimeEntity entity, DateTimeDTO data, BusinessComponent bc) {
            if (data.isFieldChanged(DateTimeDTO_.customField)) {
                entity.setCustomField(data.getCustomField());
                LocalDate sysdate = LocalDate.now();
                if (sysdate.compareTo(data.getCustomField().toLocalDate()) > 0) {
                    throw new BusinessException().addPopup("The field 'customField' cannot be less than the current date");
                }
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

        `RuntimeException` describes an error  within a business process.
        
        Add **RuntimeException** to corresponding **VersionAwareResponseService**.
        
        ```java
        @Override
        protected ActionResultDTO<DateTimeDTO> doUpdateEntity(DateTimeEntity entity, DateTimeDTO data, BusinessComponent bc) {
            if (data.isFieldChanged(DateTimeDTO_.customField)) {
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
            public Actions<DateTimeValidationDTO> getActions() {
                return Actions.<DateTimeValidationDTO>builder()
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
    Enabled on default.
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
    public class DateTimeMeta extends FieldMetaBuilder<DateTimeDTO> {
    
      @Override
      public void buildRowDependentMeta(RowDependentFieldsMeta<DateTimeDTO> fields, InnerBcDescription bcDescription,
        Long id, Long parentId) {
        fields.setEnabled(DateTimeDTO_.customField);
        fields.setRequired(DateTimeDTO_.customField);
      }
    ```
    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**
