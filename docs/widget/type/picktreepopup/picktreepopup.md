# PickTreePopup

`PickTreePopup` is a component that allows the user to select a value from a Popup tree of entities.

It is the tree-shaped analogue of [PickListPopup](/widget/type/picklistpopup/picklistpopup): the records are shown not as a flat list, but as a hierarchical, lazily loaded tree. There are no checkboxes, a record is picked by a click on the row.

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

For the widget to work correctly, the same requirements as for the [Tree](/widget/type/tree/tree) widget must be met.

The minimal data set of a record is:

* `id` — the identifier of the record.
* `parentId` — the identifier of the parent record. For a root record the value is `null`.
  The backend must **always** return this field, and the field must be **filterable**. see more [Lazy load](/widget/type/tree/tree/#lazyload)
* a name (title) field — the value shown in the tree column.
* `isLeaf` — a computed boolean flag. The default value is `false`. The value `true` means that the record has no child records, so the expand arrow is not displayed for it.

!!! info
    The **first** field of the `fields` array is rendered as the tree column: the expand arrow and the indent of the nesting level are placed in it (Ant Design Tree style). All the other fields are rendered as ordinary columns.

    `parentId` and `isLeaf` are service fields. They must be declared in the widget with type **hidden**.

All tree specific settings are placed in **options**.**tree**. see more [options.tree](/widget/type/tree/tree/#optionstree)

### How does it look?
![pickTreePopupBasic.png](pickTreePopupBasic.png)

??? Example

    **Step1** Create field `parentId`, `isLeaf` to corresponding **DataResponseDTO**.

    * `parentId` — identifies the parent record of the current record and defines the parent-child relationship in the tree. If the record is a root node, `parentId` must be empty. The field must be **filterable**.
    * `isLeaf` — indicates whether the record can be expanded. The value `true` means that the record cannot be expanded, while `false` means that the record can be expanded to display child records.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3261PickDTO.java
    --8<--
    ```

    **Step2** Add field with type **pickTree**  see more [Fields](#fields)

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/tree/base/inner/MyExample3263List.widget.json
    --8<--
    ```

    **Step3** Create file **_.widget.json_** with type = **"PickTreePopup"**

    Add existing field to a popup widget. see more [Fields](#fields)

    The widget must contain the `parentId` and `isLeaf` fields. These fields should be configured as **hidden**.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/tree/base/inner/myexample3261TreePickListPopup.widget.json
    --8<--
    ```

    **Step4** Add a dependency on parent BC for popup BC for to corresponding **EnumBcIdentifier**

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/tree/base/CxboxMyExample3263Controller.java
    --8<--
    ```

    **Step5** Add widget and popup widget to corresponding ****_.view.json_** **.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/tree/base/views/myexample3261list.view.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

## Title
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3267/view/myexample3267listall){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/colortitle){:target="_blank"}

### Title Basic
There are 3 types of titles for a PickTree Popup:

* `constant title`: displays a fixed piece of text which cannot be changed.
* `constant title empty`: shows no text.
* `calculated title`: displays a dynamic piece of text, meaning it can change based on business logic or data in the application.

#### How does it look?
=== "Constant title"
    ![pickTreePopupWithTitle.png](pickTreePopupWithTitle.png)
=== "Constant title empty"
    ![pickTreePopupWithoutTitle.png](pickTreePopupWithoutTitle.png)
=== "Calculated title"
    ![pickTreePopupCalculatedTitle.png](pickTreePopupCalculatedTitle.png)


#### How to add?
??? Example
    === "Constant title"
        **Step1** Add name for **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/colortitle/myEntity3267PicklistPickTreePopup.widget.json
        --8<--
        ```

    === "Constant title empty"
        **Step1** Delete parameter **title** to **_.widget.json_**.

    === "Calculated title"
        **Step1** Add ${customField} for **title** to **_.widget.json_**.

### Title Color
`Title Color` allows you to specify a color for a title. It can be constant or calculated.

**Constant color**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3267/view/myexample3267listcolorconstall){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/colortitle){:target="_blank"}

*Constant color* is a fixed color that doesn't change. It remains the same regardless of any factors in the application.
**Calculated color**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3267/view/myexample3267listall){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/colortitle){:target="_blank"}

*Calculated color* can be used to change a title color dynamically. It changes depending on business logic or data in the application.

!!! info
    Title colorization is **applicable** to the following [fields](/widget/fields/fieldtypes/): date, dateTime, dateTimeWithSeconds, number, money, percent, time, input, text, dictionary, radio, checkbox, multivalue, multivalueHover.

#### How does it look?
![pickTreePopupColor.png](pickTreePopupColor.png)

#### How to add?
??? Example
    === "Calculated color"

        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/colortitle/MyExample3267DTO.java:colorDTO
        --8<--
        ```

        **Step 2** Add **"bgColorKey"** :  `custom field for color` and  to .widget.json.

        Add in `title` field with `${customField}`

        ```
        "bgColorKey": "customFieldColor"
        ```

    === "Constant color"

        Add **"bgColor"** :  `HEX color`  to .widget.json.

        Add in `title` field with `${customField}`

        ```
        "bgColor": "#F5A623"
        ```

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

!!! info
    The **first** field of the `fields` array is rendered as the tree column.

    The fields `parentId` and `isLeaf` must be declared with type **hidden**.

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
             {{ external_links.github_raw_doc }}/widgets/tree/base/inner/myexample3261TreePickListPopup.widget.json
             --8<--
          ```

## <a id="Fieldslayout">Options layout</a>
**options.layout** - no use in this type.

## Standard Actions
`Actions` show available actions as separate buttons see more [Actions](/features/element/actions/actions).

**Standard Actions**:

* [`Create`](#standart_create): Action to initialize the process of creating a new record
* `Delete` - _not applicable_
* `Edit`  -  _not applicable_
* [`Save`](#standart_save): Action to store the data entered or modified
* [`Cancel-create`](#standart_cancel_create): Action to abort the creation of a new record, discarding any input without saving


####  <a id="standart_create">Create</a>
`Create` button enables you to create a new value by clicking the `Add` button. This action can be performed in three different ways, feel free to choose any, depending on your logic of application:

There are three methods to create a record:

* [Inline](#createinline): You can add a line directly.

!!! info
    Pagination won't function until the page is refreshed after adding records.

* [Inline-form](#withwidget): You can add data using a form widget without leaving your current view.

* [With view](#withview): not applicable.

!!! info
    The position of a newly created row inside its node is defined by **options**.**tree**.**insertPosition** (`start`, `end`). see more [options.tree](/widget/type/tree/tree/#optionstree)

##### <a id="createinline">Inline</a>
With `Line Addition`, a new empty row is immediately added to the top of the widget when the "Add" button is clicked. This is a quick way to add rows without needing to input data beforehand.
###### How does it look?
![create_inline.png](create_inline.png)

###### How to add?
The action is configured in the same way as for the tree widget, see [Inline](/widget/type/tree/tree/#createinline).

##### <a id="withwidget">Inline-form</a>
`Create with widget` opens an additional widget when the "Add" button is clicked. The form will appear on the same screen, allowing you to view both the tree of entities and the form for adding a new row.
After filling the information in and clicking "Save", the new row is added to the tree.
###### How does it look?
![create_with_widget.png](create_with_widget.png)

###### How to add?
The action is configured in the same way as for the tree widget, see [Inline-form](/widget/type/tree/tree/#withwidget).

##### <a id="withview">With view</a>
_not applicable_

#### Delete
_not applicable_

#### Edit
_not applicable_

###  **<a id="standart_save">Save</a>**
`Save` to store the data entered or modified. see [information on autosave](/features/element/autosave/autosave)

###### How does it look?
![actionsave.png](actionsave.png)

### **<a id="standart_cancel_create">Cancel-create</a>**
`Cancel-create` abort the creation of a new record, discarding any input without saving

###### How does it look?
![actioncancel.png](actioncancel.png)

##### <a id="editline">Inline edit </a>
###### How does it look?
Not supported in this release, see `CXBOX-1369`.

###### How to add?
Not supported in this release, see `CXBOX-1369`.

##### <a id="editwithwidger">Inline-form</a>
###### How does it look?
Not supported in this release, see `CXBOX-1369`.

###### How to add?
Not supported in this release, see `CXBOX-1369`.

#### **<a id="standart_delete">Delete</a>**
###### How does it look?
Not supported in this release, see `CXBOX-1369`.

###### How to add?
Not supported in this release, see `CXBOX-1369`.

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

!!! info
    `Export to Excel` is **not available** for the tree widgets in this release.

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
    {{ external_links.github_raw_doc }}/widgets/property/pagination/availablelimitselist/myEntity3867PickPickPickTreePopup.widget.json
    --8<--
    ```

    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/pagination/availablelimitselist){:target="_blank"}

The default number of the records requested for a node is defined by the page limit, see [Page limit](/widget/type/property/defaultlimitpage/defaultlimitpage).

```json
--8<--
{{ external_links.github_raw_doc }}/widgets/property/defaultlimitpage/myEntity359PickPickPickTreePopup.widget.json
--8<--
```

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample359/view/myexample359picktree){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/defaultlimitpage){:target="_blank"}

#### <a id="searchmodes">Search modes</a>
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/filtration/fulltextsearch/forpicklist){:target="_blank"}

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
    {{ external_links.github_raw_doc }}/widgets/property/filtration/fulltextsearch/forpicklist/myEntity3614PickPickPickTreePopup.widget.json
    --8<--
    ```

    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/filtration/fulltextsearch/forpicklist){:target="_blank"}

#### <a id="selection">Selection modes</a>
A value is picked by a click on the row. What exactly the user is allowed to pick is defined by **options**.**tree**.**selection**:

* `node` — only the nodes can be picked.
* `leaf` — only the leaves can be picked.
* `nodeAndLeaf` — both the nodes and the leaves can be picked.

The rows that cannot be picked are still displayed and can be expanded, so the user navigates through them to the required record.

!!! info
    The `More` row is a pagination control, not a record, so it cannot be picked.

##### How does it look?
=== "node"
    ![selection_node.png](selection_node.png)
=== "leaf"
    ![selection_leaf.png](selection_leaf.png)
=== "nodeAndLeaf"
    ![selection_nodeandleaf.png](selection_nodeandleaf.png)

##### How to add?
??? Example
    Add in **options** parameter **tree** to corresponding **.widget.json**.

    ```
    "tree": {
      "selection": "leaf"
    }
    ```

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/tree/base/inner/myexample3261TreePickListPopup.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}
