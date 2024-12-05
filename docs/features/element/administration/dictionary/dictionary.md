# Administration dictionary
(since [release 2.0.9](https://doc.cxbox.org/new/version209/"))

cxbox/core 4.0.0-M12 

[:material-play-circle: Live Sample]({{ external_links.demo }}/ui/#/screen/myexample357){:target="_blank"}

## How does it look?
 

## How to add?
??? Example
    **Step 1.**  Add DTO with entity **DictionaryItem**
 
this.dictionaryTypeId = Optional.ofNullable(dictionaryItem.getDictionaryTypeId()).map(BaseEntity::getId).orElse(null);
 key  - key for dictionary 
 value 
active  
 type 
 displayOrder  
 description  

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/administration/DictionaryItemDTO.java
    --8<--
    ```
 
    **Step 2.**  Add DTO with entity **DictionaryItem**
    
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/basic/Regions.java
    --8<--
    ```
        
        **Step 3.** Add field with new record to corresponding **BaseEntity**.
        
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/basic/MyEntity352.java
        --8<--
        ```
        
        **Step 4.** Add field with new record to corresponding **DataResponseDTO**.
        
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/basic/MyExample352DTO.java
         --8<--
        ```
            
        **Step 5.** Use **fields.setDictionaryValues** in the appropriate **FieldMetaBuilder** to ensure the frontend reseives the list of values in the **/row-meta**
                method under **"values"** tag.

        If the values list is dependent on a parent field, use fields.setEnumValues within the buildRowDependentMeta 
                method to dynamically set it based on the parent.
        
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/basic/MyExample352Meta.java:buildIndependentMeta
        --8<--
        ```
            
        **Step 6.** Add **fields.setDictionaryFilterValues** to corresponding **FieldMetaBuilder**.
        
        The front-end requires us to display all directory data within the method /row-meta tag values. 
        If the values list is dependent on the parent, we should use the buildIndependentMeta method for this purpose.
        
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/basic/MyExample352Meta.java:buildRowDependentMeta
        --8<--
        ```
        
        === "List widget"
            **Step 7.** Add to **_.widget.json_**.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/basic/MyExample352List.widget.json
            --8<--
            ```
        
            [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample352){:target="_blank"} ·
            [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/dictionary/dictionarylov/basic){:target="_blank"}
        
        === "Info widget"
            **Step 7.** Add to **_.widget.json_**.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/basic/MyExample352Info.widget.json
            --8<--
            ```
        
            [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample352){:target="_blank"} ·
            [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/dictionary/dictionarylov/basic){:target="_blank"}
         
        === "Form widget"
        
            **Step 7.** Add to **_.widget.json_**.
        
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/dictionary/dictionarylov/basic/MyExample352Form.widget.json
            --8<--
            ```  
        