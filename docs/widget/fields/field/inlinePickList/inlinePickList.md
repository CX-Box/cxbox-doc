# InlinePickList

`InlinePickList` is component similar to [Picklist](/widget/fields/field/pickList/pickList), but uses drop-down instead of popup for value selection

## Basics
### How does it look?

=== "List widget"
    ![img_list.gif](img_list.gif)
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![img_form.gif](img_form.gif)


### How to add?
```java
--8<--
https://raw.githubusercontent.com/CX-Box/cxbox-doc-code-samples/main/src/main/java/io/demo/documentation/picklist/validationbusinessex/MyExample114Service.java:documentation
--8<--
```

```json
--8<--
https://raw.githubusercontent.com/CX-Box/cxbox-doc-code-samples/main/src/main/java/io/demo/documentation/picklist/validationbusinessex/MyExample114List.widget.json
--8<--
```
??? Example
    - **Step 1. Popup**

        In the following example, **MyEntity** entity has a **OneToOne/ManyToOne** reference to the **MyEntityPick** entity. Link is made by id, e.g. **MyEntity.customFieldId** = **MyEntityPick.id**. Also, is this example we will use one `additional field` **MyEntityPick.customField**, that will be shown on MyEntity widget

        +  **Step 1.1** Add **String** `additional field` to corresponding **DataResponseDTO**.
           ```java
           public class MyEntityPickDTO extends DataResponseDTO {
           
               @SearchParameter(name = "customField")
               private String customField;
           
               public MyEntityPickDTO(MyEntityPickEntity entity) {
               this.customField = entity.getCustomField();
               }
           }
           ```

        +  **Step 1.2** Add **String** `additional field`  to corresponding **BaseEntity**.
           ```java
           public class MyEntityPickEntity extends BaseEntity {
           
               private String customField;
           }
           ```

        +  **Step 1.3**  Create Popup List **_.widget.json_**.
           ```json
           {
             "title": "myEntityPickListPopup title",
             "name": "myEntityPickListPopup",
             "type": "PickListPopup",
             "bc": "myEntityPickListPopup",
             "fields": [
               {
                 "title": "id",
                 "key": "id",
                 "type": "text"
               },
               {
                 "title": "Custom Field",
                 "key": "customField",
                 "type": "text"
               }
             ]
           }
           ```
        +  **Step 1.4** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
            ```java
        
            public class MyExamplePickMeta extends FieldMetaBuilder<MyEntityPickDTO> {
        
            @Override
            public void buildRowDependentMeta(RowDependentFieldsMeta<MyEntityPickDTO> fields, InnerBcDescription bcDescription,
                                              Long id, Long parentId) {
                fields.setEnabled(MyEntityPickDTO_.id);
                fields.setEnabled(MyEntityPickDTO_.customField);
            }
            ```
        
    -   **Step 2** Add **Popup** to **_.view.json_**.
        ```json
        {
          "name": "myexampleform",
          "title": "My Example Form",
          "template": "DashboardView",
          "url": "/screen/myexample/view/myexampleform",
          "widgets": [
            {
              "widgetName": "myEntityPickListPopup",
              "position": 0,
              "gridWidth": 24
            },
            {
              "widgetName": "SecondLevelMenu",
              "position": 10,
              "gridWidth": 24
            },
            {
              "widgetName": "MyExampleForm",
              "position": 20,
              "gridWidth": 24
            }
          ],
          "rolesAllowed": [
            "CXBOX_USER"
          ]
        }
        ```

    -   **Step3** Add two **String** fields (for id and for `additional field`) to corresponding **DataResponseDTO**.
        ```java
        public class MyExampleDTO extends DataResponseDTO {
        
        @SearchParameter(name = "customFieldEntity.customField")
        private String customField;
    
        @SearchParameter(name = "customFieldEntity.id", provider = LongValueProvider.class)
        private Long customFieldId;
    
        public MyExampleDTO(MyEntity entity) {
            this.customFieldId = Optional.ofNullable(entity.getCustomFieldEntity())
                    .map(BaseEntity::getId)
                    .orElse(null);
            this.customField = Optional.ofNullable(entity.getCustomFieldEntity())
                    .map(e -> e.getCustomField())
                    .orElse(null);
        }
        }
        ```

    -   **Step4** Add **MyEntityPick** field to corresponding **BaseEntity**.
        ```java
        public class MyEntity extends BaseEntity {
    
            @JoinColumn(name = "CUSTOM_FIELD_ID")
            @ManyToOne
            private MyEntityPick customFieldEntity;
        }
        ```

    === "List widget"
        **Step5** Add popupBcName and pickMap to **_.widget.json_**.
        `pickMap` - maping for field Picklist to MyEntity

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
              "type": "inline-pickList",
              "popupBcName": "myEntityPickListPopup",
              "pickMap": {
                "customFieldId": "id",
                "customField": "customField"
              }
            }
          ]
        }        
        ```

    === "Info widget"
        **Step5** Add popupBcName and pickMap to **_.widget.json_**.
        `pickMap` - maping for field Picklist to MyEntity

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
              "type": "inline-pickList",
              "popupBcName": "myEntityPickListPopup",
              "pickMap": {
                "customFieldId": "id",
                "customField": "customField"
              }
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

        **Step5** Add popupBcName and pickMap to **_.widget.json_**.
        `pickMap` - maping for field Picklist to MyEntity

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
              "type": "inline-pickList",
              "popupBcName": "myEntityPickListPopup",
              "pickMap": {
                "customFieldId": "id",
                "customField": "customField"
              }
            }
          ]
        }
        ```

## Placeholder
**_not applicable_**

## Color
`Color` allows you to specify a field color. It can be calculated based on business logic of application

### How does it look?
=== "List widget"
    ![img_color_list.png](img_color_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_


### How to add?
??? Example
    === "Calculated color"


        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null. 
    
        ```java
        public class MyExampleDTO extends DataResponseDTO {
        
            @SearchParameter(name = "customFieldEntity.customField")
            private String customField;

            @SearchParameter(name = "customFieldEntity.id", provider = LongValueProvider.class)
            private Long customFieldId;

            private String customFieldColor;

            public MyExampleDTO(MyEntity entity) {
                this.customFieldId = Optional.ofNullable(entity.getCustomFieldEntity())
                        .map(BaseEntity::getId)
                        .orElse(null);
                this.customField = Optional.ofNullable(entity.getCustomFieldEntity())
                        .map(MyEntityPick::getCustomField)
                        .orElse(null);
                this.customFieldColor = "#eda6a6";
        }

        ```
        === "List widget"   
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
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
                  "type": "inline-pickList",
                  "popupBcName": "myEntityPickListPopup",
                  "pickMap": {
                    "customFieldId": "id",
                    "customField": "customField"
                  },
                  "bgColorKey": "customFieldColor"
                }
              ]
            }
            ```
        === "Info widget"
            _not applicable_
        === "Form widget"
            _not applicable_

    === "Constant color"
        === "List widget" 
            Add **"bgColor"** :  `HEX color`  to .widget.json.
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
                  "type": "inline-pickList",
                  "popupBcName": "myEntityPickListPopup",
                  "pickMap": {
                    "customFieldId": "id",
                    "customField": "customField"
                  },
                  "bgColor": "#eda6a6"
                }
              ]
            } 
            ```

        === "Info widget"
            _not applicable_
        === "Form widget"
            _not applicable_
## Readonly/Editable
`Readonly/Editable` indicates whether the field can be edited or not. It can be calculated based on business logic of application

### How does it look?
=== "Editable"
    === "List widget"
        ![img_list.gif](img_list.gif)
    === "Info widget"
        _not applicable_
    === "Form widget"
        ![img_form.gif](img_form.gif)
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
            protected ActionResultDTO<MyExampleDTO> doUpdateEntity(MyEntity entity, MyExampleDTO data, BusinessComponent bc) {
                if (data.isFieldChanged(MyExampleDTO_.customField)) {
                    entity.setCustomFieldEntity(data.getCustomFieldId() != null
                    ? entityManager.getReference(MyEntityPick.class, data.getCustomFieldId())
                    : null);
                }
            return new ActionResultDTO<>(entityToDto(bc, entity));
            ```

        **Step2** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    
        ```java
        public class MyExampleMeta extends FieldMetaBuilder<MyExampleDTO> {
    
        @Override
        public void buildRowDependentMeta(RowDependentFieldsMeta<MyExampleDTO> fields, InnerBcDescription bcDescription,
                                          Long id, Long parentId) {
          fields.setEnabled(MyExampleDTO_.customField);
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
        public class MyExampleMeta extends FieldMetaBuilder<MyExampleDTO> {
            public void buildRowDependentMeta(RowDependentFieldsMeta<MyExampleDTO> fields, InnerBcDescription bcDescription, Long id, Long parentId) {
            }
        }
        ```
    
        **Option 2** `Not recommended.` Property fields.setDisabled() overrides the enabled field if you use after property fields.setEnabled.
        === "List widget"
            **Works for List.**
        === "Info widget"
            **Works for Info.**
        === "Form widget"
            **Works for Form.**
## Filtration
`Filtering` allows you to search data based on criteria.
For `InlinePickList field` filtering is case-insensitive and retrieves records containing the specified value at any position (similar to SQL ```Like %value%``` ).
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
            @SearchParameter(name = "customFieldEntity.customField")
            private String customField;
        
            @SearchParameter(name = "customFieldEntity.id", provider = LongValueProvider.class)
            private Long customFieldId;
        
            public MyExampleDTO(MyEntity entity) {
                
                this.customFieldId = Optional.ofNullable(entity.getCustomFieldEntity())
                        .map(e -> e.getId())
                        .orElse(null);
                this.customField = Optional.ofNullable(entity.getCustomFieldEntity())
                        .map(e -> e.getCustomField())
                        .orElse(null);
            }
        }
        ```

        **Step 2**  Add **fields.enableFilter** to corresponding **FieldMetaBuilder**.

        ```java 
        public class MyExampleMeta extends FieldMetaBuilder<MyExampleDTO>  {
        
            public void buildIndependentMeta(FieldsMeta<MyExampleDTO> fields, InnerBcDescription bcDescription, Long parentId) {
                fields.enableFilter(MyExampleDTO_.customField);
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
    public class MyExampleMeta extends FieldMetaBuilder<MyExampleDTO> {
    
        @Override
        public void buildRowDependentMeta(RowDependentFieldsMeta<MyExampleDTO> fields, InnerBcDescription bcDescription,
                                          Long id, Long parentId) {
            fields.setDrilldown(
                    MyExampleDTO_.customField,
                    DrillDownType.INNER,
                    "/screen/myexample/view/myexampleinfo/" + PlatformMyExampleController.myExampleBc + "/" + id
            );
    ```

    === "List widget"

        `Step 2` Add **"drillDown": "true"**  to .widget.json.

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
              "type": "inline-pickList"
              "popupBcName": "myEntityPickListPopup",
              "pickMap": {
                "customFieldId": "id",
                "customField": "customField"
              },
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
          "name": "MyExampleInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myExampleBc",
          "fields": [
            {
              "label": "Custom Field",
              "key": "customField",
              "type": "inline-pickList"
              "popupBcName": "myEntityPickListPopup",
              "pickMap": {
                "customField": "customField",
                "customFieldId": "id"
              },
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
        public class MyExampleService extends VersionAwareResponseService<MyExampleDTO, MyEntity> {
 
            @Override
            protected ActionResultDTO<MyExampleDTO> doUpdateEntity(MyEntity entity, MyExampleDTO data, BusinessComponent bc) {
                if (data.isFieldChanged(MyExampleDTO_.customFieldId)) {
                    entity.setCustomFieldEntity(data.getCustomFieldId() != null
                            ? entityManager.getReference(MyEntityPick.class, data.getCustomFieldId())
                            : null);
                    if (StringUtils.isNotEmpty(data.getCustomField())
                            && !String.valueOf(data.getCustomField()).matches("[A-Za-z]+")
                    ) {
                        throw new BusinessException().addPopup("The field 'customField' can contain only letters.");
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
            protected ActionResultDTO<MyExampleDTO> doUpdateEntity(MyEntity entity, MyExampleDTO data, BusinessComponent bc) {
                if (data.isFieldChanged(MyExampleDTO_.customFieldId)) {
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
     
            public class MyExampleService extends VersionAwareResponseService<MyExampleDTO, MyEntity> {

                @Override
                public Actions<MyExampleDTO> getActions() {
                    return Actions.<MyExampleDTO>builder()
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
    === "Field level validation"
        === "Option 1"
            Add javax.validation to corresponding **DataResponseDTO**.

            Use if:

            Requires a simple fields check (javax validation)
            ```java
         
                public class MyExampleDTO extends DataResponseDTO {
                    @NotNull(message = "Custom message about required field")
                    private String customField;
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
                if (String.valueOf(dto.getCustomField()).matches("[A-Za-z]+")) {
                    entity.addField(MyExampleDTO_.customField.getName(), errorMessage("The field 'customField' can contain only letters."));
                }
                if (String.valueOf(dto.getCustomFieldAdditional()).matches("[A-Za-z]+"))  {
                    entity.addField(MyExampleDTO_.customFieldAdditional.getName(), errorMessage("The field 'customFieldAdditional' can contain only letters."));
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
                      "type": "inline-pickList",
                      "popupBcName": "myEntityPickListPopup",
                      "pickMap": {
                        "customFieldId": "id",
                        "customField": "customField"
                      }
                    },
                    {
                      "title": "Custom Field Additional",
                      "key": "customFieldAdditional",
                      "type": "inline-pickList",
                      "popupBcName": "myEntityPickListPopup",
                      "pickMap": {
                        "customFieldId": "id",
                        "customFieldAdditional": "customFieldAdditional"
                      }
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
                      "type": "inline-pickList",
                      "popupBcName": "myEntityPickListPopup",
                      "pickMap": {
                        "customFieldId": "id",
                        "customField": "customField"
                      }
                    },
                    {
                      "label": "Custom Field Additional",
                      "key": "customFieldAdditional",
                      "type": "inline-pickList",
                      "popupBcName": "myEntityPickListPopup",
                      "pickMap": {
                        "customFieldId": "id",
                        "customFieldAdditional": "customFieldAdditional"
                      }
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
**_not applicable_**

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



