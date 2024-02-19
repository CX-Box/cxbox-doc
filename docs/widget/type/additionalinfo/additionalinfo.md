# AdditionalInfo
 
`AdditionalInfo` widget is a component only for data viewing. Widget is always located on the left.

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3600){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/additionalinfo/base){:target="_blank"}
### How does it look?
![additionalinfo.png](additionalinfo.png)

###  <a id="Howtoaddbacis">How to add?</a> 
??? Example
    **Step1** Create file **_.widget.json_**.

    * name -  static (unique within the project)
    * [title](#Title) - (optional) 
    * type = "AdditionalInfo" (required)
    * bc - (required)
    * fields- (required) see  [field types](/widget/fields/fieldtypes/)  
    * [options](#Fieldslayout)  

    ```json
    --8<--
    {{ external_links.github_raw }}/widgets/additionalinfo/base/MyExample3600Additional.widget.json
    --8<--
    ```
    **Step2** Add widget to corresponding ****_.view.json_** **.

    ```json
    --8<--
    {{ external_links.github_raw }}/widgets/additionalinfo/base/MyExample3600List.widget.json
    --8<--
    ```