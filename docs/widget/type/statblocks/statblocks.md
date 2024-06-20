# Statistics blocks
`Statistics blocks`  widget is a  tool designed to display aggregated data in a visually accessible format. This data can be sourced either from a database or from external sources.

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
        !!! tip
            **fields**.We recommend including all fields used in the widget within this block. This maintains the principle of consistency in your application
        **options.stats** - This map how custom fields are matched to standard properties.    
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
        !!! tip
            **fields**. We recommend including all fields used in the widget within this block. This maintains the principle of consistency in your application 
      
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/base/defaultfields/MyExample4203List.widget.json
        --8<--
        ```

## Main visual parts
We can modify the following parameters on this widget:

* [Title](#Title). Optional
* Value - field that specifies formulas for data aggregation
* [Icon](#Icon). Optional
* [Color](#Color). Optional
* Description - comment for field. Optional

![img_stat_description.png](img_stat_description.png)  
 
### <a id="Title">Title</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4209){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/statsblock/title/withtitle){:target="_blank"}

Title - name for block.Optional

There are types of:

* `constant title`: shows constant text.
* `constant title empty`.
 
#### How does it look?
=== "Constant title"
    ![img_title.png](img_title.png)
=== "Constant title empty"
    ![img_no_title.png](img_no_title.png)

#### How to add?
??? Example
    === "Constant title"
        **Step1** Add name for **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/title/withtitle/MyExample4226Stat.widget.json
        --8<--
        ```
 
    === "Constant title empty"
        **Step1** No use parameter **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/title/withouttitle/MyExample4225Stat.widget.json
        --8<--
        ```
 
### <a id="Icon">Icon</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4215){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/statsblock/icon/withicon){:target="_blank"}

Icon - picture representing a particular function.Optional
[Example icon](https://3x.ant.design/components/icon/))

There are types of:

* `icon`.
* `icon empty`.

#### How does it look?
=== "Icon"
    ![icon.png](icon.png)
=== "Icon empty"
    ![empyicon.png](empyicon.png)

#### How to add?
??? Example
    === "Icon"
        **Step1** Add name for **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/icon/withicon/MyExample4223Stat.widget.json
        --8<--
        ```

    === "Icon empty"
        **Step1** No use parameter **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/icon/withouticon/MMyExample4224Stat.widget.json
        --8<--
        ```

### <a id="ColorField">Color</a>
`Color` allows you to specify a field block.Optional. It can be calculated based on business logic of application

`Calculated color`:
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4205){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/statsblock/color/color){:target="_blank"}

`Constant color`:
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4206){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/statsblock/color/colorconst){:target="_blank"}

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

###  <a id="Fieldslayout">Fields layout</a>
**options.layout** - no use in this type.

By default, we use the view gridWidth field to arrange widgets in a row, each occupying 1/3 of the given size. 
For example, if the row has a total width of 24 spans, each widget will take up 8 spans.

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4228){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/statsblock/fieldslayoute){:target="_blank"}
  
#### How does it look?
=== "view gridWidth 24 - recommended"
    ![gridWidth24.png](gridWidth24.png)
=== "view gridWidth 12"
    ![gridWidth12.png](gridWidth12.png)
=== "view gridWidth 6"
    ![gridWidth6.png](gridWidth6.png)
#### How to add?
??? Example
    === "gridWidth24 - recommended"

        Change **gridWidth**=24  to corresponding **view**

        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/fieldslayoute/MyExample4228Stat.view.json
        --8<--
        ```

    === "gridWidth12"

        Change **gridWidth**=24  to corresponding **view**

        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/fieldslayoute/MyExample4228Stat12.view.json
        --8<--
        ```
    === "gridWidth6"

       Change **gridWidth**=24  to corresponding **view**

        ```json
        --8<--
        {{ external_links.github_raw }}/widgets/statsblock/fieldslayoute/MyExample4228Stat6.view.json
        --8<--
        ```