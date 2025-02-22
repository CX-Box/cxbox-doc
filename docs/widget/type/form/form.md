# Form
 
`Form` widget is a component for data viewing and editing. Usually it shows multiple fields. Also, it can show available actions.
## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3000/view/myexample3000form){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/base/onefield){:target="_blank"}
### How does it look?
![formwidget.png](formwidget.png)

###  <a id="Howtoaddbacis">How to add?</a>
??? Example
    
    **Step1** Create file **_.widget.json_**. with  type = **"Form"**
    Add existing field to a form widget. see more [Fields](#fields)

    ```json
       --8<--
       {{ external_links.github_raw_doc }}/widgets/form/base/onefield/MyExample3000Form.widget.json
       --8<--
    ```

    **Step2** Add widget to corresponding ****_.view.json_** **.

    ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/base/onefield/myexample3000form.view.json
        --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3000){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/base/onefield){:target="_blank"}

## <a id="Title">Title</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3003){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/title){:target="_blank"}

### Title Basic
`Title` for widget - (optional)

![formwidgetinf.png](formwidgetinf.png)    

There are types of:

* `constant title`: shows constant text.
* `constant title empty`: if you want to visually connect widgets by  them to be placed one under another
* `calculated title`: shows value provided in hidden text field, e.g. it can be calculated based on business logic of application
 
#### How does it look?
=== "Constant title"
    ![consttitle.png](consttitle.png)
=== "Constant title empty"
    ![empytitle.png](empytitle.png)
=== "Calculated title"
    ![calctitle.png](calctitle.png)
#### How to add?
??? Example
    === "Constant title"
        **Step1** Add name for **title** to **_.widget.json_**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/title/MyExample3003Form.widget.json
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3003){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/title){:target="_blank"}

    === "Constant title empty"
        **Step1** Delete parameter **title** to **_.widget.json_**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/title/MyExample3003EmptyTitleForm.widget.json
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3003/view/myexample3003formemtytitle){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/title/myexample3003formemtytitle.view.json){:target="_blank"}

    === "Calculated title"
        <!--родитель??-->
        **Step1** Add ${customField} for **title** to **_.widget.json_**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/title/MyExample3003FormCustomTitle.widget.json
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3003/view/myexample3003customtitleform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/title/MyExample3003FormCustomTitle.widget.json){:target="_blank"}


### Title Color
`Title Color` allows you to specify a color for a title. It can be constant or calculated.
 
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3025/view/myexample3025constcolor){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/colortitle){:target="_blank"}

* `Constant color*` is a fixed color that doesn't change. It remains the same regardless of any factors in the application.

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3025/view/myexample3025){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/colortitle){:target="_blank"}

* `Calculated color` can be used to change a title color dynamically. It changes depending on business logic or data in the application.

!!! info
    Title colorization is **applicable** to the following [fields](/widget/fields/fieldtypes/): date, dateTime, dateTimeWithSeconds, number, money, percent, time, input, text, dictionary, radio, checkbox, multivalue, multivalueHover.


##### How does it look?
![colorwidget.png](colorwidget.png)

##### How to add?
 
??? Example
    === "Calculated color"

        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/colortitle/MyExample3026DTO.java:colorDTO
        --8<--
        ```   
 
        **Step 2** Add **"bgColorKey"** :  `custom field for color` and  to .widget.json.

        Add in `title` field with `${customField}` 

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/colortitle/MyExample3026dynamic.widget.json
        --8<--
        ```     

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3025/view/myexample3025constcolor){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/colortitle){:target="_blank"}

    === "Constant color"
 
        Add **"bgColor"** :  `HEX color`  to .widget.json.

        Add in `title` field with `${customField}` 

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/colortitle/MyExample3026const.widget.json
        --8<--
        ```
        
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3025/view/myexample3025){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/colortitle){:target="_blank"}


## <a id="Showcondition">Show condition</a> 
see more [showCondition](/widget/type/property/showcondition/showcondition)

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3000){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/base/onefield){:target="_blank"}

* `no show condition - recommended`: widget always visible

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3005/view/myexample3005showcondform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/showcondition/bycurrententity){:target="_blank"}

* `show condition by current entity`: condition can include boolean expression depending on current entity fields. Field updates will trigger condition recalculation only on save or if field is force active

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3005/view/myexample3007showcondform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/showcondition/byparententity){:target="_blank"}

* `show condition by parent entity`: condition can include boolean expression depending on parent entity. Parent field updates will trigger condition recalculation only on save or if field is force active shown on same view

!!! tips
    It is recommended not to use `Show condition` when possible, because wide usage of this feature makes application hard to support.


#### <a id="howdoesitlook">How does it look?</a>
=== "no show condition"
    ![formwidget.png](formwidget.png)
=== "show condition by current entity"
    ![show_cond_current.gif](show_cond_current.gif)
=== "show condition by parent entity"
    ![show_cond.gif](show_cond.gif)

### <a id="howtoadd">How to add?</a>
??? Example

    === "no show condition"
        see [Basic](#Howtoaddbacis)
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3000){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/base/onefield){:target="_blank"}

    === "show condition by current entity"
        **Step1** Add **showCondition** to **_.widget.json_**. see more [showCondition](/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/showcondition/bycurrententity/MyExample30052Form.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3005/view/myexample3005showcondform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/showcondition/bycurrententity){:target="_blank"}

    === "show condition by parent entity"
        **Step1** Add **showCondition** to **_.widget.json_**. see more [showCondition](/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/showcondition/byparententity/child/MyExample3006Form.widget.json
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3005/view/myexample3007showcondform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/showcondition/byparententity){:target="_blank"}

## <a id="bc">Business component</a>
This specifies the business component (BC) to which this form belongs.
A business component represents a specific part of a system that handles a particular business logic or data.

see more  [Business component](/environment/businesscomponent/businesscomponent/)

## <a id="fields">Fields</a>
Fields Configuration. The fields array defines the individual fields present within the form.

```json
{
    "label": "Custom Field",
    "key": "customField",
    "type": "input"
}
```

* **"label"**

Description:  Field Title.

Type: String(optional).

* **"key"**

Description: Name field to corresponding DataResponseDTO.

Type: String(required).

* **"type"**

Description: [Field types](/widget/fields/fieldtypes/)

Type: String(required).

### How to add?
??? Example

    === "With plugin(recommended)"
        **Step 1** Download plugin
            [download Intellij Plugin](https://plugins.jetbrains.com/plugin/195-tesler-helper)
    
        **Step 2** Add existing field to an existing form widget
            ![addfield.gif](addfield.gif)

    === "Example of writing code"
        Add field to **_.widget.json_**.

        ```json
           --8<--
           {{ external_links.github_raw_doc }}/widgets/form/base/onefield/MyExample3000Form.widget.json
           --8<--
        ```
        
see more  [Fields](/widget/fields/fieldtypes/)
## <a id="option">Options</a>
The options object provides layout details for the widget.
 
### <a id="Fieldslayout">Options layout</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3004){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/fieldslayoute){:target="_blank"}

Defines the structure of the widget using rows and columns.

* `single column layout - recommended`: shows each field on new row. Each field can have width from 1 to 24.

!!! tips
    Use single column layout when fields are frequently hidden or rearranged. This avoids layout issues and ensures the best user experience.

* `multi column layout`: shows fields in grid. Grid can contain any number of rows. Each row can contain any number of fields, until sum of fields widths in row is less than 24. Each field can have width from 1 to 24.
* `empty`: only title and actions are shown. Usually used when standard buttons position needs to be changed (for example we want to show buttons under widget). One can hide buttons on widget with data. Create separate widget only with buttons and place it anywhere on view

!!! tips
    It is recommended to use `single column` layout when possible, because dynamic fields hiding (add link) always works correctly in this case.

!!! info
    The line has a size of 24 span, if you define fields on one line with a field width sum exceeding 24 span in total,that field and any subsequent fields will be moved to a new line . This means that each line will accommodate fields until the total width reaches 24 span, and any excess width will continue on the next line.

For example, you have three fields with widths of 12, 8, and 10 characters, respectively. In this case, the first field and two field will fit completely on the first line as it is within the 24-character limit. However, the thirt field's width contributes to the totat.It has finally become more 24. As a result, the third field will be moved to the next line.


#### How does it look?
=== "Single column layout - recommended"
    ![singlecolumlayout.png](singlecolumlayout.png)
=== "Multi column layout"
    ![multicolumnbutton.png](multicolumnbutton.png)
=== "Empty only buttons"
    ![emptyonlybutton.png](emptyonlybutton.png)
#### How to add?
??? Example
    === "Single column layout - recommended"

        **Step1** Create **"options": {"layout": {}}**.

        **Step2** Add fields to **"options": {"layout": {}}**

        Forming rows:

        * Open `cols` : "cols": [
        * Add All fields(customField,customField2,customField3) with span from 1 to 24.
        * Close `cols` : ]

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/fieldslayoute/MyExample3004Form.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3004){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/fieldslayoute/MyExample3004Form.widget.json){:target="_blank"}

    === "Multi column layout"
        **Step1** Create **"options": {"layout": {}}**.

        **Step2** Add fields to **"options": {"layout": {}}**.

        Forming row1 : 

        * Open `cols` : "cols": [ 
        * Add all feild : customField,customField2,customField3
        * Check sum span <= 24: customField (span = 12),customField2 = 6, customField3 = 6 : sum 24)
        * Close `cols` : ]

        Forming a row2 : 

        * Open 'cols' : "cols": [ 
        * Add All filed(customField4)
        * Check sum span <= 24 (customField4 span = 12 : sum 12)
        * Close 'cols' : ]
 
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/title/MyExample3003EmptyTitleForm.widget.json
        --8<--
        ```
        
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3004/view/myexample3004multicolumnform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/fieldslayoute/MyExample3004MultiColumnForm.widget.json){:target="_blank"}

    === "Empty only buttons"
        **Step1** Create **"options": {"layout": {}}**.

        Button "Create" - On default

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/fieldslayoute/MyExample3004EmptyOnlyButtonsForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3004/view/myexample3004emptyonlybuttonsform){:target="_blank"} ·
        [:fontawesome-brands-gith
 
## Standard Actions
`Actions` show available actions as separate buttons see more [Actions](/features/element/actions/actions).

**Standard Actions**:

* [`Create`](#standart_create): Action to initialize the process of creating a new record 
* [`Delete`](#standart_delete): Remove an existing record
* [`Edit`](#standart_edit): Users to update or correct information
* [`Save`](#standart_save): Action to store the data entered or modified 
* [`Cancel-create`](#standart_cancel_create): Action to abort the creation of a new record, discarding any input without saving


#### **<a id="standart_create">Create</a>**
`Create` button enables you to create a new value by clicking the `Add` button.  

!!! tips
    We advise against creating entries in the form widget.

There are two methods to create a record:

1. [Basic](#createinline): You can add data using a standard button create without leaving your current view.

2. [With view](#withview): You can create a record by navigating to a view.

##### <a id="createinline">Basic</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3300){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/create/basic){:target="_blank"}

###### How does it look?
![form_create_basic.gif](form_create_basic.gif)

###### How to add?
??? Example

    **Step1** Add button `create` to corresponding **VersionAwareResponseService**. 
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/create/basic/MyExample3300Service.java:getActions
    --8<--
    ```
     **Step2** Add button `create` to corresponding **.widget.json**. 
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/create/basic/MyExample3300Form.widget.json
    --8<--
    ```
     **Step3** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/create/basic/MyExample3300Meta.java:buildRowDependentMeta
    --8<--
    ```
 
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3300){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/create/basic){:target="_blank"}

##### <a id="withview">With view</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3302){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/create/withview){:target="_blank"}

With `Create with view`, clicking the "Add" button opens a separate view that displays only the data entry form. After completing the form and saving, the system returns to the form of entities with the new row added.
###### How does it look?
![form_create_with_view.gif](form_create_with_view.gif)

###### How to add?
??? Example

    **Step1** Add button `create` to corresponding **VersionAwareResponseService**. 
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/create/withview/MyExample3302Service.java:getActions
    --8<--
    ```
    **Step2** Add **PostAction.drillDown** to method **doCreateEntity** to corresponding **VersionAwareResponseService**. 
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/create/withview/MyExample3302Service.java:doCreateEntity
    --8<--
    ```
    **Step4** Add button `create` to corresponding **.widget.json**.
  
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/create/withview/MyExample3302Form.widget.json
    --8<--
    ```  

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3302){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/create/withview){:target="_blank"}

#### **<a id="standart_delete">Delete</a>**
`Delete` remove an existing record. 
 
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3180){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/delete){:target="_blank"}

###### How does it look?
![actiondelete.gif](actiondelete.gif)

###### How to add?
??? Example
 
    **Step1** Add action *delete* to corresponding **VersionAwareResponseService**. 

    By default, the access button is available when a record exist.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/delete/MyExample3180Service.java:getActions
    --8<--
    ``` 
 
    **Step2** Add button ot group button to corresponding **.widget.json**.
   
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/delete/MyExample3180Form.widget.json
    --8<--
    ```
    
    For to implement a custom handler for deleting an entity, you must override `deleteEntity` method to corresponding **VersionAwareResponseService**.

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3180){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/delete){:target="_blank"}

### **<a id="standart_edit">Edit</a>**
`Edit` enables you to change the field value.

There are two methods to edit a record:

1. [Basic](#basic): You can edit data in your current widget.

2. [With view](#withview): You can edit a record by navigating to a view.

##### <a id="editline">Base edit </a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3301){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/edit/basic){:target="_blank"}


`Edit Inline` implies inline-edit. Click twice on the value you want to change.
###### How does it look?
![form_edit_basic.gif](form_edit_basic.gif)

###### How to add?
??? Example

    **Step1** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/edit/basic/MyExample3301Meta.java:buildRowDependentMeta
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3301){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/edit/basic){:target="_blank"}

##### <a id="editwithview">With view</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3303){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/edit/withview){:target="_blank"}

With `Edit with view`, you can edit the entity from a separate view that displays only the data entry form. Click on the "Edit" option.

###### How does it look?
![form_edit_with_view.gif](form_edit_with_view.gif)

###### How to add?
??? Example

    **Step1** Add action *edit* to corresponding **VersionAwareResponseService**. 
    
    Add **PostAction.drillDown** to method *edit*

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/edit/withview/MyExample3303Service.java:getActions
    --8<--
    ``` 
    **Step2** Add button ot group button to corresponding **.widget.json**.
   
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/edit/withview/MyExample3303Form.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3303){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/edit/withview){:target="_blank"}

###  **<a id="standart_save">Save</a>**
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3181){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/save){:target="_blank"}

`Save` to store the data entered or modified. see [information on autosave](/features/element/autosave/autosave)
 
###### How does it look?
![actionsave.gif](actionsave.gif)

###### How to add?
??? Example

    **Step1** Add action *save* to corresponding **VersionAwareResponseService**. 

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/save/MyExample3181Service.java:getActions
    --8<--
    ```  
    **Step2** Add button ot group button to corresponding **.widget.json**.
   
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/form/actions/save/MyExample3181Form.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3181){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/save){:target="_blank"}
    
### **<a id="standart_cancel_create">Cancel-create</a>**
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3182){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/cancelcreate){:target="_blank"}

`Cancel-create` abort the creation of a new record, discarding any input without saving

###### How does it look?
![actioncancel.gif](actioncancel.gif)
 
###### How to add?
??? Example
    === "Basic"

        **Step1** Add standart action *cancelCreate* to corresponding **VersionAwareResponseService**. 
        The interface displays "cancelCreate" as the default option.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/actions/cancelcreate/basic/MyExample3182Service.java:getActions
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3182){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/cancelcreate){:target="_blank"}

    === "With postAction"
        **Step1** Add action *cancel* to corresponding **VersionAwareResponseService** with postAction. 
    
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/actions/cancelcreate/postaction/MyExample3187Service.java:getActions
        --8<--
        ```

        **Step2** Add button ot group button to corresponding **.widget.json**.
       
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/actions/cancelcreate/postaction/MyExample3187FormCreate.widget.json
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3182){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/cancelcreate){:target="_blank"}

    === "Method onCancel"
        !!! info
            Only for **Inner** Business Component see more [Business Component](/environment/businesscomponent/businesscomponent/)

        **Step1** Add standart action *cancelCreate* to corresponding **VersionAwareResponseService**. 
    
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/actions/cancelcreate/oncancel/MyExample3186Service.java:getActions
        --8<--
        ``` 
        **Step2** Add method *onCancel* to corresponding **VersionAwareResponseService**. 
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/actions/cancelcreate/oncancel/MyExample3186Service.java:onCancel
        --8<--
        ``` 
        **Step3** Add button ot group button to corresponding **.widget.json**.
       
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/form/actions/cancelcreate/oncancel/MyExample3186FormCreate.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3182){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/actions/cancelcreate){:target="_blank"}


 