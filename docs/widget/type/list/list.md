# List
 
`List` widget is list the general information for many records and present it in a way that is easily interpretable  for users.

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3002){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/list/base){:target="_blank"}
### How does it look?
![list.png](list.png)

###  <a id="Howtoaddbacis">How to add?</a> 
??? Example
    **Step1** Create file **_.widget.json_**.

    * name -  static (unique within the project)
    * [title](#Title) - (optional) 
    * type = "List" (required)
    * bc - (required)
    * fields- (required) see  [field types](/widget/fields/fieldtypes/)  

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/list/base/MyExample3002List.widget.json
    --8<--
    ```
    **Step2** Add widget to corresponding ****_.view.json_** **.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/list/base/myexample3002list.view.json
    --8<--
    ```

## Main visual parts
[Title](#Title), [actions block](#Showcondition)
### <a id="Title">Title</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3104){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/list/title){:target="_blank"}

Title - (optional)

![listwidgetinf.png](listwidgetinf.png)    

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
        {{ external_links.github_raw_doc }}/widgets/list/title/MyExample3104List.widget.json
        --8<--
        ```
    
    === "Constant title empty"
        **Step1** Delete parameter **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/list/title/MyExample3104EmptyTitle.widget.json
        --8<--
### Icon
_not applicable_

### Color
_not applicable_

###  <a id="Fieldslayout">Fields layout</a>
**options.layout** - no use in this type.
###  <a id="Showcondition">Show condition</a>
_not applicable_

<!-- 
###  <a id="Showcondition">Show condition</a> 
* `no show condition - recommended`: widget always visible

  [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3000){:target="_blank"} ·
  [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/base){:target="_blank"}

* `show condition by current entity`: condition can include boolean expression depending on current entity fields. Field updates will trigger condition recalculation only on save or if field is force active

  [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3005/view/myexample3005showcondform){:target="_blank"} ·
  [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/showcondition/bycurrententity){:target="_blank"}

* `show condition by parent entity`: condition can include boolean expression depending on parent entity. Parent field updates will trigger condition recalculation only on save or if field is force active shown on same view

  [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3005/view/myexample3007showcondform){:target="_blank"} ·
  [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/showcondition/byparententity){:target="_blank"}

!!! tips
    It is recommended not to use `Show condition` when possible, because wide usage of this feature makes application hard to support.


#### How does it look?
=== "no show condition"
    ![list.png](list.png)
=== "show condition by current entity"
    ![show_cond_current.gif](show_cond_current.gif)
=== "show condition by parent entity"
    ![show_cond.gif](show_cond.gif)

#### How to add?
??? Example
    * key -  static  
    * sequence -  
    * bcName - (required)
    * params { fieldKey } - (required) name field with show condition
    * params { value } - (required)  show condition

    === "no show condition"
        see [Basics](#Howtoaddbacis)
    === "show condition by current entity"
        **Step1** Add **showCondition** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/list/showcondition/bycurrententity/MyExample31012.widget.json
        --8<--
        ```
    === "show condition by parent entity"
        **Step1** Add **showCondition** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/list/showcondition/byparententity/child/MyExample3107.widget.json
        --8<--
        ```
-->

### Actions
`Actions` show available actions as separate buttons.
As for List widget, there are several actions. 
#### Create 
`Create` button enables you to create a new value by clicking the `Add` button. This action can be performed in three different ways, feel free to choose any, depending on your logic of application:   

**1. Create basic**  
With `Create basic`, a new empty row is immediately added to the top of the list widget when the "Add" button is clicked. This is a quick way to add rows without needing to input data beforehand.

**2. Create with widget**  
`Create with widget` opens an additional widget when the "Add" button is clicked. The form will appear on the same screen, allowing you to view both the list of entities and the form for adding a new row. 
After filling the information in and clicking "Save", the new row is added to the List. 

**3. Create with view**  
With `Create with view`, clicking the "Add" button opens a separate view that displays only the data entry form. After completing the form and saving, the system returns to the list of entities with the new row added. 
##### How does it look? 
??? Example 
    === "Create basic"
        ![list_create_basic.gif](list_create_basic.gif)
    
    === "Create with widget"
        ![list_create_with_widget.gif](list_create_with_widget.gif)
    
    === "Create with view"
        ![list_create_with_view.gif](list_create_with_view.gif)
#### Edit 
`Edit` enables you to change the field value. Just like with `Create` button, there are three ways of implementing this Action. 

**1. Edit Basic**  
`Edit Basic` implies inline-edit. Click twice on the value you want to change.

**2. Edit with widget**  
`Edit with widget` opens an additional widget when clicking on the Edit option from a three-dot menu. 

**3. Edit with view**  
With `Edit with view`, you can edit the entity from a separate view that displays only the data entry form. Click on the "Edit" option in the three-dot menu.  

##### How does it look? 
??? Example 
    === "Edit basic"
        ![list_edit_basic.gif](list_edit_basic.gif)
    
    === "Edit with widget"
        ![list_edit_with_widget.gif](list_edit_with_widget.gif)
    
    === "Edit with view"
        ![list_edit_with_view.gif](list_edit_with_view.gif)

### Additional properties
#### FullTextSearch
`FullTextSearch` - when the user types in the full text search input area, then widget filters the rows that match the search query.
see [FullTextSearch](/features/element/filtration/fulltextsearch/fulltextsearch/)

