# Tree

`Tree` widget presents hierarchical records as an expandable tree, so users can browse parent and child rows in one table.

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5200){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base){:target="_blank"}

### How does it look?
    ![tree.png](tree.png)

###  <a id="Howtoaddbacis">How to add?</a>
??? Example
    **Step1** Create file **_.widget.json_** with type = **"Tree"**

    Add existing field to a tree widget. see more [Fields](#fields)

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/tree/base/onefield/MyExample5200Tree.widget.json
    --8<--
    ```

    **Step2** Add widget to corresponding ****_.view.json_** **.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/tree/base/onefield/myexample5200tree.view.json
    --8<--
    ```
    Parent-child nesting is stored on the row: set **parentId** on the DTO (and a hidden `parentId` field on the widget). Root rows leave `parentId` empty; child rows point to the parent record id.
## <a id="Title">Title</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5202){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/title){:target="_blank"}
### Title Basic
`Title` for widget (optional)
    ![treewidgetinf.png](treewidgetinf.png)   

There are types of:
* `constant title`: shows constant text.
* `constant title empty`: if you want to visually connect widgets by  them to be placed one under another

#### How does it look?
=== "Constant title"
    ![consttitle.png](consttitle.png)
=== "Constant title empty"
    ![empytitle.png](empytitle.png)

#### How to add?
??? Example
    === "Constant title"
        **Step1** Add name for **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/title/MyExample5202Tree.widget.json
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5202){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/title){:target="_blank"}
    === "Constant title empty"
        **Step1** Delete parameter **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/title/MyExample5202EmptyTitle.widget.json
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5202){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/title){:target="_blank"}
## Title Color
`Title Color` allows you to specify a color for a title. It can be constant or calculated.
**Constant color**
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5203/view/myexample5203tree){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/colortitle){:target="_blank"}
*Constant color* is a fixed color that doesn't change. It remains the same regardless of any factors in the application.
**Calculated color**
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5203/view/myexample5203treecolorconst){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/colortitle){:target="_blank"}
*Calculated color* can be used to change a title color dynamically. It changes depending on business logic or data in the application.
!!! info
Title colorization is **applicable** to the following [fields](https://doc.cxbox.org/widget/fields/fieldtypes/): date, dateTime, dateTimeWithSeconds, number, money, percent, time, input, text, dictionary, radio, checkbox, multivalue, multivalueHover.
Title colorization is **applicable** to the following [fields](/widget/fields/fieldtypes/): date, dateTime, dateTimeWithSeconds, number, money, percent, time, input, text, dictionary, radio, checkbox, multivalue, multivalueHover.
##### How does it look?
![colorwidget.png](colorwidget.png)


This specifies the business component (BC) to which this form belongs.
A business component represents a specific part of a system that handles a particular business logic or data.
see more  [Business component](https://doc.cxbox.org/environment/businesscomponent/businesscomponent/)
see more  [Business component](/environment/businesscomponent/businesscomponent/)
## <a id="Showcondition">Show condition</a>

[33 lines collapsed]

        see [Basic](#Howtoaddbacis)
    === "show condition by current entity"
        **Step1** Add **showCondition** to **_.widget.json_**. see more [showCondition](https://doc.cxbox.org/widget/type/property/showcondition/showcondition)
        **Step1** Add **showCondition** to **_.widget.json_**. see more [showCondition](/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/showcondition/bycurrententity/MyExample52042.widget.json

[1 line collapsed]

        ```
<!--
    === "show condition by parent entity"
        **Step1** Add **showCondition** to **_.widget.json_**. see more [showCondition](https://doc.cxbox.org/widget/type/property/showcondition/showcondition)
        **Step1** Add **showCondition** to **_.widget.json_**. see more [showCondition](/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/showcondition/byparententity/child/MyExample3107.widget.json

[26 lines collapsed]

  
* **"type"**
  
  Description: [Field types](https://doc.cxbox.org/widget/fields/fieldtypes/)
  Description: [Field types](/widget/fields/fieldtypes/)
  
  Type: String(required).

[22 lines collapsed]

## Actions
`Actions` show available actions as separate buttons see more [Actions](https://doc.cxbox.org/features/element/actions/actions).
`Actions` show available actions as separate buttons see more [Actions](/features/element/actions/actions).
As for Tree widget, there are several actions. 
#### Create 

[332 lines collapsed]

When fields stored in the additional settings table are deleted from the widget, the functionality will continue to work correctly by ignoring these old fields.
#### Filtration
##### Basic
see more  [Fields](https://doc.cxbox.org/widget/type/property/filtration/filtration/)
see more  [Fields](/widget/type/property/filtration/filtration/)
#### FullTextSearch
`FullTextSearch` - when the user types in the full text search input area, then widget filters the rows that match the search query.
see [FullTextSearch](https://doc.cxbox.org/widget/type/property/filtration/filtration/#by-fulltextsearch)
see [FullTextSearch](/widget/type/property/filtration/filtration/#by-fulltextsearch)
##### Personal filter group
A user-filled filter can be saved for each individual user.
see [Personal filter group](https://doc.cxbox.org/widget/type/property/filtration/filtration/#by-personal-filter-group)
see [Personal filter group](/widget/type/property/filtration/filtration/#by-personal-filter-group)
##### Filter group
`Filter group` - predefined filters settings that users can use in an application. They allow users to quickly apply specific filtering criteria without having to manually input.
see [Filter group](https://doc.cxbox.org/widget/type/property/filtration/filtration/#by-filter-group)
see [Filter group](/widget/type/property/filtration/filtration/#by-filter-group)
#### Pagination
`Pagination` is the process of dividing content into separate, discrete pages, making it easier to navigate and consume large amounts of information.
see [Pagination](https://doc.cxbox.org/widget/type/property/pagination/pagination)
see [Pagination](/widget/type/property/pagination/pagination)
#### Export to Excel
`Export to Excel` enables users to download a .xlsx file containing the table's data.
see [Excel](https://doc.cxbox.org/widget/type/property/export/excel/excel)
see [Excel](/widget/type/property/export/excel/excel)
#### Multi-upload files
We have implemented multi-file upload. You can use a dedicated drag-and-drop zone or a standard button to select your files.
see more [Multi-upload files](https://doc.cxbox.org/widget/type/property/multiupload/multiupload)