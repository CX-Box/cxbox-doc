Standard repository elements:

* [Entity](/environment/entity/entity)
* [DTO](/environment/dto/dto)
* [Service](/environment/service/service)
* [MetaBuilder](/environment/meta/metabuilder)
* [Controller](/environment/controller/controller)

<!-- 
Visual elements
* widget
* view
* screen

## Basics
 
??? Example   
    === "Datasource"
    
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/InputBasic){:target="_blank"} ·
        
        - **Step1.1** Create **Entity** 
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/input/basic/InputBasic.java
            --8<--
            ```
    
        - **Step1.2** Create **DTO** extends **DataResponseDTO**
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/input/basic/InputBasicDTO.java
            --8<--
            ```
        - **Step1.3** Create **Meta** extends **FieldMetaBuilder**
        
            see more [Meta builder](/environment/meta/metabuilder)
            
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/input/basic/InputBasicMeta.java
            --8<--
            ```
        - **Step1.4** Create **Service** implements **VersionAwareResponseService**
        
             ```java
             --8<--
             {{ external_links.github_raw_doc }}/fields/input/basic/InputBasicService.java
             --8<--
             ```
        - **Step1.5** Create **PlatformController** implements **EnumBcIdentifier**
        
             ```java
             --8<--
             {{ external_links.github_raw_doc }}/fields/input/basic/CxboxInputBasicController.java
             --8<--
             ```
    - **Step2** Create visual elements       
        - **Step2.1** Create **widget.json** 
            see more [Widget](widget/type/widget)
        - **Step2.2** Create **view.json**      
            see more [Widget](navigation/view/view)
        - **Step2.3** Add widget to corresponding  **view** 
            see more [Widget](navigation/view/view)
        - **Step2.4** Create **screen.json** 
            see more [Screen](screen/screen)
        - **Step2.5** Add view to corresponding  **screen** 
            see more [Screen](screen/screen)
--->