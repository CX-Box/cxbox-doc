# Administration dictionary
(since [release 2.0.9](https://doc.cxbox.org/new/version209/"))

cxbox/core 4.0.0-M12 

[:material-play-circle: Live Sample]({{ external_links.demo }}/ui/#/screen/myexample357){:target="_blank"}

This screen allows you to edit and create dictionaries .

To apply the changes, click the "Clear Cache" button  on the administration screen and refresh the page on the user screen to re-request the data.

## How does it look?
![admin_dict.gif](admin_dict.gif) 

## How to add?
??? Example
    - **Step 1.** Create **DTO** with core entity **DictionaryItem**
 
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/administration/DictionaryItemDTO.java
        --8<--
        ```

    - **Step2** Create **FieldMetaBuilder**
    
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/dictionary/MyExample357Meta.java
        --8<--
        ```

    - **Step3** Create **VersionAwareResponseService**

        `clear-cache`  This will not work in cluster (>1 app nodes).Please, add scheduler or other mechanism to clear cache in cluster
    
        `export_liquibase` 
    
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/dictionary/MyExample357Service.java:toCsv
        --8<--
        ```
        
        `updateEntity` 
    
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/dictionary/MyExample357Service.java:validate
        --8<--
        ```
    
    
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/dictionary/MyExample357Service.java
        --8<--
        ```

    - **Step4** Create **PickListPopup** with types for dictionary fields.

        +  **Step 4.1** Create **DTO** with core entity **DictionaryTypeDesc**.

         ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/dictionary/DictionaryTypeDescPickDTO.java
            --8<--
         ```
 
        +  **Step 4.2** Add business component to corresponding **EnumBcIdentifier**.

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/dictionary/CxboxMyExample357Controller.java:bc
            --8<--
            ``` 
 
        +  **Step 4.3** Create **FieldMetaBuilder**

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/dictionary/DictionaryTypeDescPickMeta.java
            --8<--
            ``` 
 
        +  **Step 4.4**  Create `PickListPopup` **widget.json**

            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/dictionary/dictionaryTypeDescPickPickListPopup.json
            --8<--
            ``` 
 
    - **Step5** Create administration **widget.json**

        ```json
          {
              "title": "Type",
              "key": "type",
              "type": "pickList",
              "popupBcName": "dictionaryTypeDescPick",
              "pickMap": {
                "type": "type",
                "id": "id"
              }
            }
        ```
    
    
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/dictionary/MyExample357DictionaryListc
        --8<--
        ```