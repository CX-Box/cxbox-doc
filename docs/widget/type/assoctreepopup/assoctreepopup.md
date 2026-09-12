# AssocTreePopup

`AssocTreePopup` widget is a popup component designed to the selection of multiple values.
## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3330){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/base){:target="_blank"}
### How does it look?
=== "Assoc widget field"
    === "List"
        ![assoc_list.png](assoc_list.png)
    === "Info"
        _not applicable_
    === "Form"
        ![assoc_form.png](assoc_form.png)
=== "Assoc widget button"
    === "List"
        ![assoc_list_button.png](assoc_list_button.png)
    === "Info"
        _not applicable_
    === "Form"
        _not applicable_

!!! info

    The button-based association differs from the MultiValue field association in the following way:
    
    Previously selected records are not shown.
    
    Records selected by the user in the opened association are also not displayed as selected chips.
    
    This behavior occurs because the button-based association is not directly tied. Instead, it is designed to add records to a table.
    
    Recommendation
    If you plan to use a button-based association, you must add filtering to the opened association in order to exclude records that have already been selected and added to the table.

**Value selection:**

=== "Assoc widget field "
    ![choose_assoc.png](choose_assoc.png)
=== "Assoc widget button"
    ![choose_button.png](choose_button.png)



**Opening the widget:**

=== "Assoc widget field "
    ![choose_assoc.png](choose_assoc.png)
=== "Assoc widget button"
    ![up_assoc.png](up_assoc.png)

###  <a id="Howtoaddbacis">How to add?</a>
??? Example
    === "Assoc widget field"
        === "List"
            **Step1** Add field with type **multivalueTree** see more [Fields](#fields)

            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/assoctree/base/MyExample3330List.widget.json
            --8<--
            ```
       
            **Step2** Add widget to corresponding ****_.view.json_** **.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/assoctree/base/myexample3330list.view.json
            --8<--
        === "Info"
            _not applicable_

        === "Form"
            **Step1** Add field with type **multivalueTree** see more [Fields](#fields)

            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/assoctree/base/MyExample3330Form.widget.json
            --8<--
            ```
       
            **Step2** Add widget to corresponding ****_.view.json_** **.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/assoctree/base/myexample3330form.view.json
            --8<--
            ```
    === "Assoc widget button"
        === "List"
            **Step1** Add button `associate` to corresponding **VersionAwareResponseService**. 
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/assoctree/base/MyExample3330Service.java:getActions
            --8<--
            ```
            **Step2** Add method `doAssociate` to corresponding **VersionAwareResponseService**. 

            `associate`

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/assoctree/base/MyExample3330Service.java:doAssociate
            --8<--
            ```
            method `addNewRecords`
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/assoctree/base/MyExample3330Service.java:addNewRecords
            --8<--
            ```

            **Step3** Create file **_.widget.json_** with type = **"assoc"** and name = parent bc + "Assoc"

            Add existing field to assoc widget. see more [Fields](#fields)

            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/assoctree/base/myexample3330Assoc.widget.json
            --8<--
            ```
            **Step4** Add a dependency on parent BC for Assoc BC for to corresponding **EnumBcIdentifier**
        
             ```java
             --8<--
             {{ external_links.github_raw_doc }}/widgets/assoctree/base/CxboxMyExample3330Controller.java
             --8<--
             ```

             **Step5** Add assoc widget to corresponding ****_.view.json_** **.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/assoctree/base/myexample3330list.view.json
            --8<--
            ```
 
        === "Info"
              _not applicable_

        === "Form"
              _not applicable_


## <a id="Title">Title</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3336){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/title){:target="_blank"}

### Title Basic
`Title` for widget (optional)

There are types of:

* `constant title`: shows constant text.
* `constant title empty`: if you want to visually connect widgets by  them to be placed one under another

#### How does it look?
=== "Constant title"
    ![consttitle.png](consttitle.png)
=== "Constant title empty"
    ![empytitle.png](empytitle.png)

#### How to add?
!!! info
    The popup is a tree: the business component of the popup must return `parentId` (filterable, `null` for the roots) and `isLeaf`, both declared as **hidden** fields of the popup widget. The tree settings are described in [options.tree](/widget/type/tree/tree/#optionstree).

??? Example
    === "Constant title"
        **Step1** Add name for **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/assoctree/title/myEntity3336MultiPickAssocTreePopup.widget.json
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3336){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/title){:target="_blank"}

    === "Constant title empty"
    
        **Step1** Delete parameter **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/assoctree/title/myEntity3336MultiPickAssocEmptyListPopup.widget.json
        --8<--
        ```
    
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3336/view/myexample3336emptytitle){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/title){:target="_blank"}
    

### Title Color
`Title Color` allows you to specify a color for a title. It can be constant or calculated.

**Constant color**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3329/view/myexample3329formcolorconst){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/colortitle){:target="_blank"}

*Constant color* is a fixed color that doesn't change. It remains the same regardless of any factors in the application.

**Calculated color**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3329/view/myexample3329form){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/colortitle){:target="_blank"}

*Calculated color* can be used to change a title color dynamically. It changes depending on business logic or data in the application.

!!! info
    Title colorization is **applicable** to the following [fields](/widget/fields/fieldtypes/): date, dateTime, dateTimeWithSeconds, number, money, percent, time, input, text, dictionary, radio, checkbox, multivalueTree, multivalueHover.

##### How does it look?
![colorwidget.png](colorwidget.png)

##### How to add?
??? Example
    === "Calculated color"

        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/assoctree/colortitle/color/MyEntity3332MultiPickDTO.java
        --8<--
        ```  
 
        **Step 2** Add **"bgColorKey"** :  `custom field for color` and  to .widget.json.

        Add in `title` field with `${customField}` 

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/assoctree/colortitle/color/myEntity3332MultiPickAssocTreePopup.widget.json
        --8<--
        ``` 

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3329/view/myexample3332color){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/colortitle/color){:target="_blank"}

    === "Constant color"
 
        Add **"bgColor"** :  `HEX color`  to .widget.json.

        Add in `title` field with `${customField}` 

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/assoctree/colortitle/colorconst/myEntity3332MultiPickAssocTreePopup0.widget.json
        --8<--
        ```
 
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3329/view/myexample3332colorconst){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/colortitle/colorconst){:target="_blank"}
 
## <a id="bc">Business component</a>
This specifies the business component (BC) to which this form belongs.
A business component represents a specific part of a system that handles a particular business logic or data.

see more  [Business component](/environment/businesscomponent/businesscomponent/)

## <a id="Showcondition">Show condition</a>
  

## <a id="fields">Fields</a>
Fields Configuration. The fields array defines the individual fields present within the form.

```json
{
    "title": "Custom Field",
    "key": "customField",
    "type": "input"
}
```

* **"title"**

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
            [download Intellij Plugin](https://document.cxbox.org/plugin/plugininstalling)
    
        **Step 2** Add existing field to an existing form widget
            ![addfield.gif](addfield.gif)
    === "Example of writing code"
        Add field to **_.widget.json_**.

          ```json
             --8<--
             {{ external_links.github_raw_doc }}/widgets/assoctree/base/myEntity3330MultiAssocTreePopup.widget.json
             --8<--
          ```

## <a id="Fieldslayout">Options layout</a>
**options.layout** - no use in this type.

## Actions
`Actions` show available actions as separate buttons see more [Actions](/features/element/actions/actions).

**Standard Actions**:

* [`Create`](#standart_create): Action to initialize the process of creating a new record
* [`Delete`](#standart_delete): Remove an existing record
* [`Edit`](#standart_edit): Users to update or correct information
* [`Save`](#standart_save): Action to store the data entered or modified
* [`Cancel-create`](#standart_cancel_create): Action to abort the creation of a new record, discarding any input without saving

As for assoc widget, there are several actions.
#### Create
`Create` button enables you to create a new value by clicking the `Add` button. This action can be performed in three different ways, feel free to choose any, depending on your logic of application:

There are three methods to create a record:

* [Inline](#createinline): You can add a line directly.

!!! info
    Pagination won't function until the page is refreshed after adding records.

* [Inline-form](#withwidget): You can add data using a form widget without leaving your current view.

* [With view](#withview): not applicable.

##### <a id="createinline">Inline</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331/view/myexample3331inlinecreate){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/create){:target="_blank"}

With `Line Addition`, a new empty row is immediately added to the top of the assoc widget when the "Add" button is clicked. This is a quick way to add rows without needing to input data beforehand.
###### How does it look?
![assoc_create_inline.png](assoc_create_inline.png)

###### How to add?
??? Example

    **Step1** Add button `create` to corresponding **VersionAwareResponseService**. 
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/MyEntity3331MultiMultivalueService.java:getActions
    --8<--
    ```
 
    **Step2** Add button `create` to corresponding **.widget.json**. 
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/create/myEntity3331MultiAssocTreePopupCreateAssocTreePopup.widget.json
    --8<--
    ```

    **Step3** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}}/widgets/assoc/actions/MyEntity3054MultiMultivalueMeta.java:buildRowDependentMeta
    --8<--
    ``` 
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/create){:target="_blank"}

##### <a id="withwidget">Inline-form</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331/view/myexample3331create){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/create){:target="_blank"}

`Create with widget` opens an additional widget when the "Add" button is clicked. The form will appear on the same screen, allowing you to view both the assoc of entities and the form for adding a new row.
After filling the information in and clicking "Save", the new row is added to the assoc.
###### How does it look?
![assoc_create_with_widget.png](assoc_create_with_widget.png)

###### How to add?
??? Example

    **Step1** Add button `create` to corresponding **VersionAwareResponseService**. 
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/MyEntity3331MultiMultivalueService.java:getActions
    --8<--
    ```
    **Step2** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}}/widgets/assoc/actions/MyEntity3054MultiMultivalueMeta.java:buildRowDependentMeta
    --8<--
    ```
     **Step3** Create widget.json with type `Form` that appears when you click a button
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/myEntity3331MultiFormForPopup.widget.json
    --8<--
    ```
 
     **Step4** Add widget.json with type `Form` to corresponding **.view.json**. 
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/create/myexample3331inlinecreate.view.json
    --8<--
    ```

     **Step5** Add button `create` and widget with type `Form` to corresponding **.widget.json**.
       
    `options`.`create`: Name widget that appears when you click a button
        
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/create/myEntity3331MultiAssocTreePopup.widget.json
    --8<--
    ```
 
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/create){:target="_blank"}

##### <a id="withview">With view</a>
_not applicable_


#### **<a id="standart_delete">Delete</a>**
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331/view/myexample3331delete){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/delete){:target="_blank"}

`Delete` remove an existing record.

!!! tips
    Please note that the row you are attempting to delete may be referenced by another part of the system or a parent entity. To ensure clarity, you should handle this exception and provide a explanation to the user.

###### How does it look?
![actiondelete.png](actiondelete.png)

###### How to add?
??? Example

    **Step1** Add action *delete* to corresponding **VersionAwareResponseService**. 

    By default, the access button is available when a record exist.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/MyExample3331Service.java:getActions
    --8<--
    ```  
 
    **Step2** Add button ot group button to corresponding **.widget.json**.
   
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/save/myEntity3331MultiAssocSaveListPopup.widget.json
    --8<--
    ``` 
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331/view/myexample3331delete){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/delete){:target="_blank"}

#### Edit
`Edit` enables you to change the field value. Just like with `Create` button, there are three ways of implementing this Action.

There are three methods to create a record:

* [Inline edit](#editline): You can edit a line directly.

* [Inline-form](#editwithwidget): You can edit data using a form widget without leaving your current view.

* [With view](#editwithview): not applicable

##### <a id="editline">Inline edit </a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331/view/myexample3331edit){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/edit){:target="_blank"}


`Edit Inline` implies inline-edit. Click twice on the value you want to change.
###### How does it look?
![assoc_edit_basic.png](assoc_edit_basic.png)

###### How to add?
??? Example

    **Step1** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/MyExample3331Meta.java:buildRowDependentMeta
    --8<--
    ```
 
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331/view/myexample3331edit){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/edit){:target="_blank"}

##### <a id="editwithwidger">Inline-form</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331/view/myexample3331editinlineform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/edit){:target="_blank"}

`Edit with widget` opens an additional widget when clicking on the Edit option from a three-dot menu.

###### How does it look?
![assoc_edit_with_widget.png](assoc_edit_with_widget.png)

###### How to add?
??? Example

    **Step1** Add button `edit` to corresponding **VersionAwareResponseService**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/MyExample3331Service.java:getActions
    --8<--
    ```

    **Step2** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/MyExample3331Meta.java:buildRowDependentMeta
    --8<--
    ```
 
    **Step2**  Create widget.json with type `Form` that appears when you click a button
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/edit/MyExample3331FormEdit.widget.json
    --8<--
    ```
 
     **Step4** Add widget.json with type `Form` to corresponding **.view.json**. 
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/edit/myexample3331editinlineform.view.json
    --8<--
    ```

     **Step5** Add button `edit` and widget with type `Form` to corresponding **.widget.json**.
       
    `options`.`edit`: Name widget that appears when you click a button
        
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/assoctree/actions/edit/MyExample3331Edit.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3331/view/myexample3331editinlineform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/assoctree/actions/edit){:target="_blank"}

##### <a id="editwithview">With view</a>
not applicable

### Additional properties
#### Customization of displayed columns
not applicable
#### Filtration
##### Basic
see more  [Fields](/widget/type/property/filtration/filtration/)
#### FullTextSearch
`FullTextSearch` - when the user types in the full text search input area, then widget filters the rows that match the search query.
see [FullTextSearch](/widget/type/property/filtration/filtration/#by-fulltextsearch)
##### Personal filter group
not applicable
##### Filter group
not applicable
#### Pagination
`Pagination` is the process of dividing content into separate, discrete pages, making it easier to navigate and consume large amounts of information.
see [Pagination](/widget/type/property/pagination/pagination)

#### Export to Excel
not applicable

#### <a id="lazyload">Lazy load</a>
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/pagination){:target="_blank"}

Every node keeps **its own pagination state**, so the records of one node are loaded page by page independently of the neighbouring nodes.

!!! info
    Instead of the "next page" arrow the tree shows the `More` button in the last row of a node.

    The page size selector `availableLimitsList` is placed in the gear menu of the widget.

###### How does it look?
![lazyload.png](lazyload.png)

###### How to add?
??? Example
    Add in **options** parameter **pagination** to corresponding **.widget.json**.

    ```
    "pagination": {
      "availableLimitsList": [1, 2, 3]
    }
    ```

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/property/pagination/availablelimitselist/myEntity3867MultiPickAssocTreePopup.widget.json
    --8<--
    ```

    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/pagination/availablelimitselist){:target="_blank"}

The default number of the records requested for a node is defined by the page limit, see [Page limit](/widget/type/property/defaultlimitpage/defaultlimitpage).

```json
--8<--
{{ external_links.github_raw_doc }}/widgets/property/defaultlimitpage/myEntity359AssocPickAssocTreePopup.widget.json
--8<--
```

[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/defaultlimitpage){:target="_blank"}

#### <a id="searchmodes">Search modes</a>
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/filtration/fulltextsearch/forassoc){:target="_blank"}

Filtration and full text search are performed with a standard request. The found records are displayed in one of two modes, defined by **options**.**tree**.**searchModes**:

* `collapse` — the found records are displayed together with the navigation path. The number of the levels of the path shown above a found record is defined by **options**.**tree**.**onFilterApplyNestLevel** (default `0`).
* `hide` — only the found records are displayed, everything else is hidden.

Both modes can be available at the same time, the first item of the array is the active one. The user switches between them.

The panel above the tree shows:

* `Clear N filter(s)` — the number of the applied filters,
* `Shown N` — the number of the displayed records,
* `More M` — the number of the found records that are not displayed yet.

###### How does it look?
=== "collapse"
    ![search_collapse.png](search_collapse.png)
=== "hide"
    ![search_hide.png](search_hide.png)

###### How to add?
??? Example
    Add in **options** parameter **fullTextSearch** and parameter **tree** to corresponding **.widget.json**.

    ```
    "tree": {
      "searchModes": ["collapse", "hide"],
      "onFilterApplyNestLevel": 0
    }
    ```

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/property/filtration/fulltextsearch/forassoc/myEntity3625PickAssocTreePopup.widget.json
    --8<--
    ```

    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/filtration/fulltextsearch/forassoc){:target="_blank"}

#### <a id="selectionmodes">Selection modes</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

Checkboxes are available both on the nodes and on the leaves of the tree. What exactly the user is allowed to check is defined by **options**.**tree**.**selection**:

* `node` — only the nodes can be checked.
* `leaf` — only the leaves can be checked.
* `nodeAndLeaf` — both the nodes and the leaves can be checked.

!!! info
    The checkbox of the `More` row is always **disabled**: this row is a pagination control, not a record.

**Rule 1.** What the user selected **explicitly** is marked with a **bright** checkmark, and exactly that is sent to the backend. Everything that is selected **indirectly**, as a consequence of an explicit selection, is marked with a **dimmed** checkmark or a **dimmed** square.

The following cases are possible:

* **The user picks the leaves manually.** The identifiers of the picked leaves are sent to the backend. The parent group is marked with a dimmed square, because the group itself is not selected.

* **The user picks a group.** The identifier of the group is sent to the backend. All the children of the group, including the `More` row, become dimmed: they are selected as a part of the group and cannot be selected separately.

* **The user unchecks a child of a selected group.** The selection switches to the manual mode: the group is no longer sent to the backend, instead the identifiers of the remaining children are sent.

!!! info
    Limitation: the selection "the group **minus** N records" cannot be expressed. Such a selection is always transformed into the explicit list of the remaining records.

* **The user checks all the children of a group manually.** This is **not** the same as picking the group itself. The two selections are visually distinguishable, and they behave differently: when new records of that group appear, they are **not** selected in the manual case, while they are a part of the selection when the group itself is picked.

##### Confirmation on page change
**options**.**tree**.**confirms** defines the confirmation dialog shown when the user changes the page while a selection exists:

| Value                | Description                                                                 |
|----------------------|-----------------------------------------------------------------------------|
| `paginationUnselect` | The confirmation is shown when the page is changed and the selection is lost.|
| `paginationSelect`   | The confirmation is shown when the page is changed and the selection is kept.|

The default value is `["paginationUnselect"]`. see more [options.tree](/widget/type/tree/tree/#optionstree)

##### How does it look?
=== "Selection of a group"
    ![selection_group.png](selection_group.png)
=== "Manual selection of the children"
    ![selection_manual.png](selection_manual.png)
=== "Confirmation on page change"
    ![selection_confirm.png](selection_confirm.png)

##### How to add?
??? Example
    Add in **options** parameter **tree** to corresponding **.widget.json**.

    ```
    "tree": {
      "selection": "node",
      "confirms": ["paginationUnselect"]
    }
    ```

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/tree/base/inner/myexample3261AssocTreePopup.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

!!! info
    The button usage and the `multivalueTree` field usage differ in the way the already selected values are shown.

    On a field with type `multivalueTree` the popup shows the already selected values as **tags** at the top, so the user continues the previous selection.

    The popup opened by a button is not directly tied to a field, so it always opens **from scratch**, without the tags of the already selected values. Add filtering to the opened association in order to exclude the records that have already been added.
