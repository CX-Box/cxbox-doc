# Input

`Field Input` is a component for text editing. It can be used for editing and displaying single line text.
## Basics
### How does it look?

=== "List widget"
    ![table.png](table.png)
=== "Info widget"
    ![info.png](info.png)
=== "Form widget"
    ![form.png](form.png)


### How to add?
??? Example
    === "List widget"
        Add to **_.widget.json_**.

        ```json
        {
          "name": "InputInfo",
          "title": "Info Title",
          "type": "Info",
          "bc": "input",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "input"
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
        Add to **_.widget.json_**.

        ```json
        {
          "name": "InputList",
          "title": "List Title",
          "type": "List",
          "bc": "input",
          "fields": [
            {
              "title": "custom Field",
              "key": "customField",
              "type": "input"
            }
          ],
          "options": {
            "actionGroups": {
            }
          }
        }
        ```

    === "Form widget"
        Add to **_.widget.json_**.

        ```json
        {
          "name": "InputForm",
          "title": "Form Title",
          "type": "Form",
          "bc": "input",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField", 
              "type": "input"
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
`The placeholder` specifies a short hint that describes the expected value of an input field. The hint is displayed in the input field before the user enters a value.
### How does it look?
=== "List widget"
    _not applicable_
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![form_label.png](img_plchldr_form.png)
### How to add?
??? Example
    === "List widget"
        _not applicable_
    === "Info widget"
        _not applicable_
    === "Form widget"
        Add **fields.setPlaceholder** to corresponding **FieldMetaBuilder**.

        ```java
        @Service
        public class InputMeta extends FieldMetaBuilder<InputDTO> {
        
          @Override
          public void buildRowDependentMeta(RowDependentFieldsMeta<InputDTO> fields, InnerBcDescription bcDescription,
            Long id, Long parentId) {
            fields.setPlaceholder(InputDTO_.customField, "placeholder text");
          }
        ```
## Color
`Color`  is an element of user interface that lets an user to specify a field color. 
It can be calculated.
 
### How does it look?
=== "List widget"
    ![img_1.png](img_1.png)

=== "Info widget"
    ![img_2.png](img_2.png)

=== "Form widget"
    _not applicable_


### How to add?
??? Example
    === "List widget"
        === "Calculated color"
            It can be calculated.

            **Step 1**   Add `custom field` for color to corresponding **DataResponseDTO**.                    
            ```java
            public class InputDTO extends DataResponseDTO {
            
                      private String customField;    
                      private String customFieldColor;
                    
                      public InputDTO(Input entity) {
                        this.customField = entity.getCustomField();
                        this.customFieldColor = "#eda6a6";
                      }        
                    }
            ```
    
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            {
              "name": "InputInfo",
              "title": "Info Title",
              "type": "Info",
              "bc": "input",
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "input",
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
            Add **"bgColor"** :  `custom color`  to .widget.json.
            ```json
            {
              "name": "InputInfo",
              "title": "Info Title",
              "type": "Info",
              "bc": "input",
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "input",
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

    === "Info widget"
        === "Calculated color"
            It can be calculated.

            **Step 1**   Add `custom field` for color to corresponding **DataResponseDTO**.                    
            ```java
            public class InputDTO extends DataResponseDTO {
    
              private String customField;    
              private String customFieldColor;
            
              public InputDTO(Input entity) {
                this.customField = entity.getCustomField();
                this.customFieldColor = "#eda6a6";
              }        
            }
            ```
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
            ```json
            {
              "name": "InputInfo",
              "title": "Info Title",
              "type": "Info",
              "bc": "input",
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "input",
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
            Add **"bgColor"** :  `custom color`  to .widget.json.
            ```json
            {
              "name": "InputInfo",
              "title": "Info Title",
              "type": "Info",
              "bc": "input",
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "input",
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
`Readonly/Editable` indicates that the field can be edited or not.It can be calculated.

### How to add?
??? Example
    === "List widget"
        === "Editable"

            Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.

            ```java
            public class InputMeta extends FieldMetaBuilder<InputDTO> {
              @Override
              public void buildRowDependentMeta(RowDependentFieldsMeta<InputDTO> fields, InnerBcDescription bcDescription,
                                                Long id, Long parentId) {
                fields.setEnabled(
                  InputDTO_.customField
                );
              }
            }
            ```

        === "Readonly"

            **Option 1** Enabled by default.

            ```java
            public class InputMeta extends FieldMetaBuilder<InputDTO> {
              @Override
              public void buildRowDependentMeta(RowDependentFieldsMeta<InputDTO> fields, InnerBcDescription bcDescription,
                                                Long id, Long parentId) {

              }
            }
            ```

            **Option 2** `Not recommended.` Property fields.setDisabled() overrides the enable field if you use after property fields.setEnabled.

    === "Info widget"
        _not applicable_
    === "Form widget"
        === "Editable"
        
            Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.

            ```java
            public class InputMeta extends FieldMetaBuilder<InputDTO> {
              @Override
              public void buildRowDependentMeta(RowDependentFieldsMeta<InputDTO> fields, InnerBcDescription bcDescription,
                                                Long id, Long parentId) {
                fields.setEnabled(
                  InputDTO_.customField
                );
              }
            }
            ```

        === "Readonly"

           **Option 1** Enabled by default.

            ```java
            public class InputMeta extends FieldMetaBuilder<InputDTO> {
              @Override
              public void buildRowDependentMeta(RowDependentFieldsMeta<InputDTO> fields, InnerBcDescription bcDescription,
                                                Long id, Long parentId) {

              }
            }
            ```
            **Option 2**
            `Not recommended.` Property fields.setDisabled() overrides the enable field if you use after property fields.setEnabled.

## Filtration
`Filtration` is used to filter data according to specified criteria.
It retrieves all records where the value contains "value from filter" at any position(e.g. %Like%). Filtration function is not case-sensitive.
### How does it look?
=== "List widget"
    ![img_filtr_table.png](img_filtr_table.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_

### How to add?
??? Example
    === "List widget"
        **Step 1** Add **@SearchParameter** to corresponding **DataResponseDTO**. (Advanced customization [SearchParameter](/advancedCustomization/element/searchParameter/searchParameter)

        ```java
        public class InputDTO extends DataResponseDTO {
        
          @SearchParameter(name = "customField")
          private String customField;
        ```

        **Step 2**  Add **fields.enableFilter** to corresponding **FieldMetaBuilder**.

        ```java
        @Service
        public class InputMeta extends FieldMetaBuilder<InputDTO> {
        
          @Override
          public void buildIndependentMeta(FieldsMeta<InputDTO> fields, InnerBcDescription bcDescription, Long parentId) {
            fields.enableFilter(InputDTO_.customField);
          }
        
        }
        ```

    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

## Drilldown
`DrillDown` lets the user to navigate to another view by tapping it.

`see more` [DrillDown](/features/element/drillDown/drillDown)

### How does it look?
=== "List widget"
    ![img_link_table](img_link_table.png)
=== "Info widget"
    ![img_link_info](img_link_info.png)
=== "Form widget"
    Сlick on clip ![clip](clip.png)

    ![img_link_form](img_link_form.png)
### How to add?
??? Example
    === "List widget"
        **Option 1**

        `Step 1` For visual add **"drillDown": "true"**  to .widget.json.
            ```json
            {
              "name": "InputList",
              "title": "List Title",
              "type": "List",
              "bc": "input",
              "fields": [
                {
                  "title": "custom Field",
                  "key": "customField",
                  "type": "input",
                  "drillDown": "true"
                }
              ],
              "options": {
                "actionGroups": {
                }
              }
            }
            ```

        `Step 2` Add [fields.setDrilldown](/features/element/drillDown/drillDown) to corresponding **FieldMetaBuilder**.
            ```java
            public class InputMeta extends FieldMetaBuilder<InputDTO> {
            
              @Override
              public void buildRowDependentMeta(RowDependentFieldsMeta<InputDTO> fields, InnerBcDescription bcDescription,
                Long id, Long parentId) {
               
                fields.setDrilldown(
                  InputDTO_.customField,
                  DrillDownType.INNER,
                  "/screen/input/view/inputinfo/" + PlatformInputController.Input + "/" + id
                );
              }            
            }
            ```

        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. see more [Drilldown](/advancedCustomization/element/drillDown/drillDown) 
 
    === "Info widget"

        **Option 1**

        `Step 1` For visual add **"drillDown": "true"**  to .widget.json.
        
        ```json
        {
          "name": "InputInfo",
          "title": "Info Title",
          "type": "Info",
          "bc": "input",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "input",
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
        `Step 2`Add [fields.setDrilldown](/features/element/drillDown/drillDown) to corresponding **FieldMetaBuilder**. 

        ```java
        public class InputMeta extends FieldMetaBuilder<InputDTO> {
        
          @Override
          public void buildRowDependentMeta(RowDependentFieldsMeta<InputDTO> fields, InnerBcDescription bcDescription,
            Long id, Long parentId) {
           
            fields.setDrilldown(
              InputDTO_.customField,
              DrillDownType.INNER,
                  "/screen/input/view/inputinfo/" + PlatformInputController.Input + "/" + id
            );
          }            
        }
        ```
        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. see more [Drilldown](/advancedCustomization/element/drillDown/drillDown) 
 
    === "Form widget"

        **Option 1**

        `Step 1` For visual add **"drillDown": "true"**  to .widget.json.
            ```json
            {
              "name": "InputForm",
              "title": "Form Title",
              "type": "Form",
              "bc": "input",
              "fields": [
                {
                  "label": "custom Field",
                  "key": "customField",
                  "type": "input",
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
        `Step 2` Add [fields.setDrilldown](/features/element/drillDown/drillDown) to corresponding **FieldMetaBuilder**.       
            ```java
            public class InputMeta extends FieldMetaBuilder<InputDTO> {
            
              @Override
              public void buildRowDependentMeta(RowDependentFieldsMeta<InputDTO> fields, InnerBcDescription bcDescription,
                Long id, Long parentId) {
               
                fields.setDrilldown(
                  InputDTO_.customField,
                  DrillDownType.INNER,
                  "/screen/Input/view/Inputinfo/" + TeslerInputController.Input + "/" + id
                );
              }            
            }
            ```
        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. see more [Drilldown](/advancedCustomization/element/drillDown/drillDown) 

[Advanced customization](/advancedCustomization/element/drillDown/drillDown)
## Validation
`Validation` is designed to check values entered into visual components.
Validation can be of two types:

1) Exception is message about technical or business errors.

2) Confirm  is designed to display a dialog with an optional message, and to wait until the user either confirms or cancels the dialog.
### How does it look?
=== "List widget"
    === "Exception"
        ![img_ex_list](img_ex_list.png)

    === "Confirm"
        ![img_confirm_form](img_confirm_form.png)
=== "Info widget"
    _not applicable_ 
=== "Form widget"
    === "Exception"
        ![img_ex_list](img_ex_list.png)
    === "Confirm"
        ![img_confirm_form](img_confirm_form.png)

### How to add?
??? Example
    === "List widget"
        === "Exception"
    
        === "Confirm"
            Add [PreAction.confirm](/advancedCustomization/element/confirm/confirm) to corresponding **VersionAwareResponseService**.
            ```java
                @Service
                public class InputService extends VersionAwareResponseService<InputDTO, Input> {

                    @Override
                    public Actions<InputDTO> getActions() {
                        return Actions.<InputDTO>builder()
                        .newAction()
                        .action("save", "save")
                        .withPreAction(PreAction.confirm("You want to save the value 'customField'?"))
                        .add()
                        .build();
                    }
                }
            ```
    === "Info widget"
        _not applicable_ 
    === "Form widget"
        === "Exception"
    
        === "Confirm"
            Add [PreAction.confirm](/advancedCustomization/element/confirm/confirm) to corresponding **VersionAwareResponseService**.
            ```java
                @Service
                public class InputService extends VersionAwareResponseService<InputDTO, Input> {

                    @Override
                    public Actions<InputDTO> getActions() {
                        return Actions.<InputDTO>builder()
                        .newAction()
                        .action("save", "save")
                        .withPreAction(PreAction.confirm("You want to save the value 'customField'?"))
                        .add()
                        .build();
                    }
                }
            ```
## Sorting
`Sorting` function allows to sort in ascending or descending order. 
The records in descending order by default. It orders by value numbers, then by alphabet.

### How does it look?
=== "List widget"
    ![img_sort_list](img_sort_list.png)
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
