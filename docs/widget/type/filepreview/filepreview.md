# FilePreview

`FilePreview` widget is used for file viewing. It always occupies 50% of the main screen area and is placed next to other content. The widget is fixed at the top of the screen while scrolling, ensuring the document remains visible.  
## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5003){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/filepreview/base){:target="_blank"}  

* Displays only the [fileUpload](https://doc.cxbox.org/widget/fields/field/fileUpload/fileUpload/) field type  
* Supports a new mode:inline for the fileUpload field, displaying the document directly within the page without opening a popup  
* The allocated area remains fixed even if no file is uploaded  
* The area cannot be collapsed  

!!! info
    Due to its fixed position, placing other widgets directly below it on the same vertical axis is not possible.  

### How does it look?  

![filepreview.png](filepreview.png)  

###  <a id="Howtoaddbacis">How to add?</a>
??? Example

    **Step1** Create file **_.widget.json_** with type = **"FilePreview"**
    Add existing field with type `fileUpload` to a `FilePreview` widget. see more [Fields](#fields)
    Add 
        ```json
            "preview": {
                "enabled": true,
                "mode": "inline"
            }
        ```
    ```json
       --8<--
       {{ external_links.github_raw_doc }}/widgets/filepreview/base/MyExample5003FilePreview.widget.json
       --8<--
    ```

    **Step2** Add widget to corresponding ****_.view.json_** **.
    
    ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/filepreview/base/MyExample5003form.view.json
        --8<--
    ```

## <a id="Title">Title</a>
!!! warning line end "Work in progress"

## <a id="bc">Business component</a>  
!!! warning line end "Work in progress"

## <a id="Showcondition">Show condition</a>
!!! warning line end "Work in progress"

## <a id="Standard Actions">Standard Actions</a>  
!!! warning line end "Work in progress"

