# Steps
 
`Steps` widget is used to define and manage sequential actions or stages within a business process in the application. They allow developers and users to structure complex behavior into smaller, manageable steps, improving readability, maintainability.

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5023){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/steps/base){:target="_blank"}

### How does it look?
![steps.png](steps.png)


###  <a id="Howtoaddbacis">How to add?</a> 
??? Example
    **Step1** Create file **_.widget.json_**. with type = "Steps"
 
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/steps/base/onefield/MyExample3009Steps.widget.json
    --8<--
    ```
    **Step2** Add widget to corresponding ****_.view.json_** **.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/steps/base/onefield/myexample3009steps.view.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3001){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/steps/base/onefield){:target="_blank"}
     
## Title
This widget type does not support Title

## <a id="bc">Business component</a>
This specifies the business component (BC) to which this form belongs.
A business component represents a specific part of a system that handles a particular business logic or data.

see more  [Business component](/environment/businesscomponent/businesscomponent/)
 
## <a id="Showcondition">Show condition</a> 
The `showCondition` is used to define the availability or visibility of the widget dynamically.
The `showCondition` in configuration represents the condition under which the widge will be made visible to the user. It controls whether the form appears on the user interface based on the value of a specific field in another or currentbusiness component.

  [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3001){:target="_blank"} ·
  [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/steps/base/onefield){:target="_blank"}

* `no show condition - recommended`: widget always visible
 
  [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3103/view/myexample3103showcond){:target="_blank"} ·
  [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/steps/showcondition/bycurrententity){:target="_blank"}

* `show condition by current entity`: condition can include boolean expression depending on current entity fields. Field updates will trigger condition recalculation only on save or if field is force active

 
  [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3103/view/myexample3105showcond){:target="_blank"} ·
  [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/steps/showcondition/byparententity){:target="_blank"}

* `show condition by parent entity`: condition can include boolean expression depending on parent entity. Parent field updates will trigger condition recalculation only on save or if field is force active shown on same view

!!! tips
    It is recommended not to use `Show condition` when possible, because wide usage of this feature makes application hard to support.

### <a id="howdoesitlook">How does it look?</a>
=== "no show condition"
    ![steps.png](steps.png)
=== "show condition by current entity"
    ![show_cond_current.gif](show_cond_current.gif)
=== "show condition by parent entity"
    ![show_cond.gif](show_cond.gif)
 
### <a id="howtoadd">How to add?</a>
??? Example
 
    === "no show condition"
        see [Basic](#Howtoaddbacis)

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3001){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/steps/base/onefield){:target="_blank"}

    === "show condition by current entity"
        **Step1** Add **showCondition** to **_.widget.json_**. see more [showCondition](/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/steps/showcondition/bycurrententity/MyExample31032.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3103/view/myexample3103showcond){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/steps/showcondition/bycurrententity){:target="_blank"}

    === "show condition by parent entity"
        **Step1** Add **showCondition** to **_.widget.json_**. see more [showCondition](/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/steps/showcondition/byparententity/child/MyExample3107.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3103/view/myexample3105showcond){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/steps/showcondition/byparententity){:target="_blank"}

## <a id="bc">Fields</a>
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

    === "With plugin"
        **Step 1** Download plugin
            [download Intellij Plugin](https://document.cxbox.org/plugin/plugininstalling)
    
        **Step 2** Add existing field to an existing form widget
            ![addfield.gif](addfield.gif)

    === "Other"
        Add field to **_.widget.json_**.

        ```json
           --8<--
           {{ external_links.github_raw_doc }}/widgets/steps/base/onefield/MyExample3009Steps.widget.json
           --8<--
        ```


see more  [Fields](/widget/fields/fieldtypes/)

## Options layout
This widget type does not support Options layout
## Actions
This widget type does not support buttons


 