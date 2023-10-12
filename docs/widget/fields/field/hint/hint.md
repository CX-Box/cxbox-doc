# Hint

`Hint` is a non-editable component used for indirect indication or suggestion
The typical scenario involves using in a logical block [Multifield](/widget/fields/field/multifield/multifield)
## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample156){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/hint/basic){:target="_blank"}
### How does it look?

=== "List widget"
    ![img_list.gif](img_list.gif)
=== "Info widget"
    ![img_info.png](img_info.png)
=== "Form widget"
    ![img_form.png](img_form.png)


### How to add?

??? Example
    **Step1** Add **String** field  to corresponding **BaseEntity**.
    ```java
    --8<--
    {{ external_links.github_raw }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/hint/basic/MyEntity156.java
    --8<--
    ```

    **Step2** Add **String** field  to corresponding **DataResponseDTO**.

    ```java
    --8<--
    {{ external_links.github_raw }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/hint/basic/MyExample156DTO.java
    --8<--
    ```

    === "List widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        --8<--
        {{ external_links.github_raw }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/hint/basic/MyExample156List.widget.json
        --8<--
        ```
    === "Info widget"
        **Step3** Add to **_.widget.json_**.
        
        ```json
        --8<--
        {{ external_links.github_raw }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/hint/basic/MyExample156Info.widget.json
        --8<--
        ```

    === "Form widget"

        **Step3** Add to **_.widget.json_**.

        ```json
        --8<--
        {{ external_links.github_raw }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/hint/basic/MyExample156Form.widget.json
        --8<--
        ```    

## Placeholder
_not applicable_

## Color
_not applicable_

## Readonly/Editable
_not applicable_

## Filtering
_not applicable_

## Drilldown
_not applicable_

## Validation
_not applicable_

## Sorting
_not applicable_

## Required
_not applicable_