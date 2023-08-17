# Form

`Form` widget is a component for data viewing and editing. Usually it shows multiple fields. Also, it can show available actions.

!!! danger

    This page is a Draft. Wait till page will be completed before using it
## Basics
### How does it look?

=== "Form widget"
    ![form.png](img_form.png)


### How to add?
??? Example
    **Step1** Add **String** field  to corresponding **DataResponseDTO**.

    ```java
    public class MyExampleDTO extends DataResponseDTO {
    
        @SearchParameter(name = "customField")
        private String customField;
    
        public MyExampleDTO(MyEntity entity) {
        this.customField = entity.getCustomField();
        }
    }
    ```
    **Step2** Add **String** field  to corresponding **BaseEntity**.

    ```java
    public class MyEntity extends BaseEntity {
    
        private String customField;
    }
    ```
    === "List widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "MyExampleInfo",
          "title": "Info Title",
          "type": "Info",
          "bc": "myExampleBc",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "text"
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
        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "MyExampleList",
          "title": "List Title",
          "type": "List",
          "bc": "myExampleBc",
          "fields": [
            {
              "title": "custom Field",
              "key": "customField",
              "type": "text"
            }
          ]
        }
        ```

    === "Form widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "MyExampleForm",
          "title": "Form Title",
          "type": "Form",
          "bc": "myExampleBc",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField", 
              "type": "text"
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
## Main visual parts
Title, fields block in grid, actions block
### How does it look?
=== "Main visual parts"
* original picture
* picture with red squares on main elements

## Title
* `constant title`: shows constant text. can be empty
* `calculated title`: shows value provided in hidden text field, e.g. it can be calculated based on business logic of application
### How does it look?
=== "constant title empty"
    ![form_label.png](img_plchldr_form.png)
=== "constant title filled"
    ![form_label.png](img_plchldr_form.png)
=== "calculated title"
    ![form_label.png](img_plchldr_form.png)
### How to add?
??? Example

    Add **fields.setPlaceholder** to corresponding **FieldMetaBuilder**.
    
    ```java
    
    public class MyExampleMeta extends FieldMetaBuilder<MyExampleDTO> {
    
      @Override
      public void buildRowDependentMeta(RowDependentFieldsMeta<MyExampleDTO> fields, InnerBcDescription bcDescription,
        Long id, Long parentId) {
        fields.setPlaceholder(MyExampleDTO_.customField, "placeholder text");
      }
    ```
## Fields layout
* `single column layout - recommended`: shows each field on new row. Each field can have width from 1 to 24.
* `multi column layout`: shows fields in grid. Grid can contain any number of rows. Each row can contain any number of fields, until sum of fields widths in row is less than 24. Each field can have width from 1 to 24.
* `empty`: only title and actions are shown. Usually used when standard buttons position needs to be changed (for example we want to show buttons under widget). One can hide buttons on widget with data. Create separate widget only with buttons and place it anywhere on view

!!! tip
    It is recommended to use `single column` layout when possible, because dynamic fields hiding (add link) always works correctly in this case.
 
### How does it look?
=== "single column layout - recommended"
    ![img_color_info.png](img_color_info.png)
    _2 rows 1 field on each. add img_
=== "multi column layout"
    ![img_color_info.png](img_color_info.png)
    _1st row 1 field 24. 2nd row 1 field 12 1 field 12. 3rd row 1 field 4, 1 field 8. add img_
=== "empty only buttons"
    ![img_color_info.png](img_color_info.png)
    _только кнопки_
### How to add?
??? Example
    === "single column layout - recommended)"
    === "multi column layout"

## Show condition
* `no show condition - recommended`: widget always visible
* `show condition by current entity`: condition can include boolean expression depending on current entity fields. Field updates will trigger condition recalculation only on save or if field is force active
* `show condition by parent entity`: condition can include boolean expression depending on parent entity. Parent field updates will trigger condition recalculation only on save or if field is force active shown on same view
!!! tip
    It is recommended not to use `Show condition` when possible, because wide usage of this feature makes application hard to support.

### How does it look?
=== "no show condition"
    ![img_edit_form.png](img_edit_form.png)
=== "show condition by current entity"
    TODO>>add gif
=== "show condition by parent entity"
    TODO>>add gif

### How to add?
??? Example
    === "no show condition"
    === "show condition by current entity"
    === "show condition by parent entity"
## Actions
`Actions` show available actions as separate buttons

### How does it look?
=== "actions"
##### How to add?
??? Example

### Standard actions
#### create
##### How does it look?
=== "Form widget"
##### How to add?
??? Example

#### cancel-create
##### How does it look?
=== "Form widget"
##### How to add?
??? Example

#### save
##### How does it look?
=== "Form widget"
##### How to add?
??? Example

#### delete
##### How does it look?
=== "Form widget"
##### How to add?
??? Example

#### copy
##### How does it look?
=== "Form widget"
##### How to add?
??? Example


### Custom actions
any custom business logic
#### features
* text - (can be empty string) static 
* icon - (optional) static
* availability condition (optional)
* preAction - (optional) CONFIRMATION,INFORMATION,ERROR,CUSTOM
* invoker - (required). can change data. can additionally return
* postAction - (optional) REFRESH_BC, DOWNLOAD_FILE, DOWNLOAD_FILE_BY_URL, OPEN_PICK_LIST, DRILL_DOWN, DELAYED_REFRESH_BC, SHOW_MESSAGE, POST_DELETE
* fields validation results
* business and other exceptions
* scope - (required) bc, record
* AutoSaveBefore (optional)
### How does it look?
=== "text"
    === "empty"
    === "filled"
=== "icon"
    === "only icon"
    === "icon and text"
=== "availability"
    === "false"
    === "true"
=== "preAction"
    === "CONFIRMATION"
    === "INFORMATION"
    === "ERROR"
=== "postAction"
    === "DRILL_DOWN"
    === "DOWNLOAD_FILE"
    === "SHOW_MESSAGE"
    === "REFRESH_BC"
    === "...Deprecated"
        === "DOWNLOAD_FILE_BY_URL"
        === "OPEN_PICK_LIST"
        === "DELAYED_REFRESH_BC"
        === "POST_DELETE"
=== "scope bc"
    === "bc"
    === "record"

## Actions groups
`Actions groups` group subset of available actions into a single button with drop down
##### How does it look?
=== "Form widget"
##### How to add?
??? Example