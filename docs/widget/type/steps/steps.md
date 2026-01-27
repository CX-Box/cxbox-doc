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
    {{ external_links.github_raw_doc }}/widgets/steps/base/myExampleStep.widget.json
    --8<--
    ```
    **Step2** Add widget to corresponding ****_.view.json_** **.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/steps/base/myexample5023step1.view.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5023){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/steps/base){:target="_blank"}
     
## Title
This widget type does not support Title

## <a id="bc">Business component</a>
This specifies the business component (BC) to which this form belongs.
A business component represents a specific part of a system that handles a particular business logic or data.

see more  [Business component](/environment/businesscomponent/businesscomponent/)
 
## <a id="Showcondition">Show condition</a> 
This widget type does not support Show condition

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
           {{ external_links.github_raw_doc }}/widgets/steps/base/MyExample5023Steps.widget.json
           --8<--
        ```


see more  [Fields](/widget/fields/fieldtypes/)

## Options layout
This widget type does not support Options layout
## Actions
This widget type does not support buttons


 