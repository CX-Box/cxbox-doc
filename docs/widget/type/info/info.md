# Info
 
`Info` widget is a component only for data viewing.
## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3001){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/info/base){:target="_blank"}
### How does it look?
![info.png](info.png)

###  <a id="Howtoaddbacis">How to add?</a> 
??? Example
    **Step1** Create file **_.widget.json_**.

    * name -  static (unique within the project)
    * [title](#Title) - (optional) 
    * type = "Info" (required)
    * bc - (required)
    * fields- (required) see  [field types](/widget/fields/fieldtypes/)  
    * [options](#Fieldslayout)  

    ```json
    --8<--
    {{ external_links.github_raw }}/widgets/info/base/MyExample3001Info.widget.json
    --8<--
    ```
    **Step2** Add widget to corresponding ****_.view.json_** **.

    ```json
    --8<--
    {{ external_links.github_raw }}/widgets/info/base/myexample3001info.view.json
    --8<--
    ```

## Main visual parts
[Title](#Title), [fields block](#Fieldslayout) in grid, [actions block](#Showcondition)
### <a id="Title">Title</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3008){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/title){:target="_blank"}

Title - (optional)

![infowidgetinf.png](infowidgetinf.png)    

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
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/info/title/MyExample3102Info.widget.json
        --8<--
        ```
    
    === "Constant title empty"
        **Step1** Delete parameter **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/info/title/MyExample3102EmptyTitle.widget.json
        --8<--
        ```
    === "Calculated title"
        <!--родитель??-->
        **Step1** Add ${customField} for **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/info/title/MyExample3102CustomTitle.widget.json
        --8<--
        ```   

###  <a id="Fieldslayout">Fields layout</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3004){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/form/fieldslayoute){:target="_blank"}

* `single column layout - recommended`: shows each field on new row. Each field can have width from 1 to 24.
* `multi column layout`: shows fields in grid. Grid can contain any number of rows. Each row can contain any number of fields, until sum of fields widths in row is less than 24. Each field can have width from 1 to 24.
* `empty`: only title and actions are shown. Usually used when standard buttons position needs to be changed (for example we want to show buttons under widget). One can hide buttons on widget with data. Create separate widget only with buttons and place it anywhere on view

!!! tip
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
        {{ external_links.github_raw }}/widgets/info/fieldslayoute/MyExample3008Info.widget.json
        --8<--
        ```

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
        {{ external_links.github_raw }}/widgets//info/fieldslayoute/MyExample3008MultiColumn.widget.json
        --8<--
        ```
    === "Empty only buttons"
        **Step1** Create **"options": {"layout": {}}**.

        Button "Create" - On default
        
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/info/fieldslayoute/MyExample3008EmptyOnlyButtons.widget.json
        --8<--
        ```

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

!!! tip
    It is recommended not to use `Show condition` when possible, because wide usage of this feature makes application hard to support.


#### How does it look?
=== "no show condition"
    ![info.png](info.png)
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
        {{ external_links.github_raw }}/widgets/info/showcondition/bycurrententity/MyExample31032.widget.json
        --8<--
        ```
    === "show condition by parent entity"
        **Step1** Add **showCondition** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/info/showcondition/byparententity/child/MyExample3107.widget.json
        --8<--
        ```

### Actions
`Actions` show available actions as separate buttons
see [Actions](/features/element/actions/actions)

 