# Statistics blocks
`Statistics blocks`  widget is a  tool designed to display aggregated data in a visually accessible format. This data can be sourced either from a database or from external sources.

## Main visual parts
We can modify the following parameters on this widget:

* Title - name for block.Not required
* Value - field that specifies formulas for data aggregation
* Icon - picture representing a particular function.Not required([example icon](https://3x.ant.design/components/icon/))
* Color - color for block.Not required
* Description - comment for field.Not required

![img_stat_description.png](img_stat_description.png)

## Basics
You have the option to utilize custom field names for standard properties such as color, icon, etc. When doing so, you'll need to establish mappings for these fields to standard criteria

`Custom fields`:
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4200){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/statsblock/base/customfields){:target="_blank"}

`Default fields`:
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4203){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/statsblock/base/defaultfields){:target="_blank"}

### How does it look?
![img_stat.png](img_stat.png)


### How to add?
??? Example

    === "Custom name fields"

        You have the option to utilize custom field names for standard properties such as color, icon, etc. When doing so, you'll need to establish mappings for these fields to standard criteria

         **Step1** Create **DataResponseDTO** with custom fields.
 
        ```java
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/customfields/MyExample4200DTO.java
        --8<--
        ```
    
        **Step2**  Create **DAO** extends AbstractAnySourceBaseDAO<> implements AnySourceBaseDAO.
        ```java
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/customfields/MyExample4200Dao.java
        --8<--
        ```
       **Step3** Create **Meta** extends AnySourceFieldMetaBuilder.
        ```java
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/customfields/MyExample4200Meta.java
        --8<--
        ```
       **Step4** Create **Service** extends AnySourceVersionAwareResponseService.
        ```java
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/customfields/MyExample4200Service.java
        --8<--
        ```
       **Step5** Create **Widget** with  type **StatsBlock**

         "fields" - We recommend including all fields used in the widget within this block. This maintains the principle of consistency in your application
        
         "options.stats"  - This map how custom fields are matched to standard properties.
          
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/customfields/MyExample4200List.widget.json
        --8<--
        ```  
 
    === "Default name fields"
 
         You have the option to utilized default  field names for standard properties such as color, icon, etc. When doing so, you'll not need to establish mappings for these fields to standard criteria

        **Step1** Create **DataResponseDTO** with custom fields.

        ```java
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/defaultfields/MyExample4203DTO.java
        --8<--
        ```
    
        **Step2**  Create **DAO** extends AbstractAnySourceBaseDAO<> implements AnySourceBaseDAO.
        ```java
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/defaultfields/MyExample4203Dao.java
        --8<--
        ```
       **Step3** Create **Meta** extends AnySourceFieldMetaBuilder.
        ```java
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/defaultfields/MyExample4203Meta.java
        --8<--
        ```
       **Step4** Create **Service** extends AnySourceVersionAwareResponseService.
        ```java
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/defaultfields/MyExample4203Service.java
        --8<--
        ```
       **Step5** Create **Widget** with  type **StatsBlock**
       
          "fields" - We recommend including all fields used in the widget within this block. This maintains the principle of consistency in your application 
      
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/defaultfields/MyExample4203List.widget.json
        --8<--
        ```
 
## Color
`Color` allows you to specify a field color. It can be calculated based on business logic of application

`Calculated color`:
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4205){:target="_blank"} · 
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation//widgets/statsblock/color/color){:target="_blank"}

`Constant color`:
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4206){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation//widgets/statsblock/color/colorconst){:target="_blank"}

### How does it look?
 ![img_color.png](img_color.png)
 

### How to add?
??? Example
    === "Calculated color"
        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null.
 
        ```java
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/color/color/MyExample4206DTO.java
        --8<--
        ```
  
        **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/color/color/MyExample4206List.widget.json
        --8<--
        ```
  

    === "Constant color"
 
        Add **"bgColor"** :  `HEX color`  to .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/color/colorconst/MyExample4205List.widget.json
        --8<--
        ```

  
 
 