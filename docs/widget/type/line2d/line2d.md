# Line2D

`Line2D` widget draws a line chart: one value per category on the X axis, a number on the Y axis.
Several lines are shown when the records are grouped by a field. The user can switch the chart to a table.

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4240){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/base){:target="_blank"}
### How does it look?
![line2d.png](line2d.png)

Every record of the business component is one point of the chart. The widget takes the point from two fields:

* `xValueFieldKey`: the field with the category on the X axis (a month, a client, a date as text).
* `yValueFieldKey`: the numeric field with the value on the Y axis.

The `title` of these fields is shown as the axis title. Records without a Y value are skipped.
The backend returns the records in the order of the X axis: the chart does not sort them.

Options of `options.chart2D`:

| Option                | Required | Description                                                                                                                  |
|-----------------------|----------|------------------------------------------------------------------------------------------------------------------------------|
| `xValueFieldKey`      | yes      | Field key for the X axis.                                                                                                    |
| `yValueFieldKey`      | yes      | Field key for the Y axis. Must be a numeric field type (`number`, `money`, `percent`).                                       |
| `groupFieldKey`       | no       | Field key that splits the records into lines. One line per value, the values are shown in the legend. See [Groups](#groups). |
| `stack`               | no       | `true` draws the lines one on top of the other. See [Stack](#stack).                                                         |
| `yMin`, `yMax`, `yStep` | no     | Scale and step of the Y axis. See [Axis scale and step](#axis).                                                              |
| `xMin`, `xMax`, `xStep` | no     | Scale and step of the X axis. Only for a numeric X field. See [Axis scale and step](#axis).                                  |
| `descriptionFieldKey` | no       | Field keys shown in the tooltip instead of the X value. See [Tooltip](#tooltip).                                             |

###  <a id="Howtoaddbacis">How to add?</a>
??? Example
    **Step1** Create **DataResponseDTO** with the fields of a point: the X value and the Y value.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/base/MyExample4240DTO.java
    --8<--
    ```

    **Step2** Create **DAO** extends AbstractAnySourceBaseDAO<> implements AnySourceBaseDAO.
    The DAO returns one record per point, sorted along the X axis, with a unique `id`.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/base/MyExample4240Dao.java:getStats
    --8<--
    ```

    **Step3** Create **Meta** extends AnySourceFieldMetaBuilder.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/base/MyExample4240Meta.java
    --8<--
    ```

    **Step4** Create **Service** extends AnySourceVersionAwareResponseService.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/base/MyExample4240Service.java
    --8<--
    ```

    **Step5** Create file **_.widget.json_** with type = **"Line2D"**.
    Add the fields of the point and **options.chart2D** with `xValueFieldKey` and `yValueFieldKey`.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/base/MyExample4240Line2D.widget.json
    --8<--
    ```

    **Step6** Add widget to corresponding **_.view.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/base/myexample4240line2d.view.json
    --8<--
    ```

    **Step7** Set the page limit of the business component to the number of points, for example 1000.
    The default limit is 5. When the business component has more records than the limit, the widget shows only the table.
    See [Page limit](#pagelimit).

    Add the business component to the **BC_PROPERTIES** table:
    ```csv
    BC;PAGE_LIMIT;MASS_PAGE_LIMIT;SORT;FILTER;ID
    myExampleBc4240;1000;NULL;NULL;'""';
    ```

## <a id="Title">Title</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4241){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/title){:target="_blank"}

### Title Basic
`Title` for widget (optional)

There are types of:

* `constant title`: shows constant text.
* `constant title empty`: if you want to visually connect widgets by them to be placed one under another

#### How does it look?
=== "Constant title"
    ![title.png](title.png)
=== "Constant title empty"
    ![title_empty.png](title_empty.png)

#### How to add?
??? Example
    === "Constant title"
        **Step1** Add name for **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/line2d/title/MyExample4241Line2D.widget.json
        --8<--
        ```
    === "Constant title empty"
        **Step1** Add empty **title** to **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/line2d/title/MyExample4241Line2DEmptyTitle.widget.json
        --8<--
        ```

### Title Color
_not applicable_

## <a id="bc">Business component</a>
This specifies the business component (BC) to which this widget belongs.
A business component represents a specific part of a system that handles a particular business logic or data.

The chart takes the data from an **AnySource** business component: the DAO builds the points (for example, a sum per month)
and returns them in the order of the X axis. One record is one point, so the `id` of a record must be unique.

see more  [Business component](/environment/businesscomponent/businesscomponent/)

## <a id="Showcondition">Show condition</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4242){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/showcondition){:target="_blank"}

* `no show condition - recommended`: widget always visible
* `show condition by current entity`: the chart is shown when a field of the current record of another business component on the view has the given value

!!! tips
    It is recommended not to use `Show condition` when possible, because wide usage of this feature makes application hard to support.

#### <a id="howdoesitlook">How does it look?</a>
=== "no show condition"
    ![line2d.png](line2d.png)
=== "show condition by current entity"
    ![show_cond_current.gif](show_cond_current.gif)

#### <a id="howtoadd">How to add?</a>
??? Example

    === "no show condition"
        see [Basic](#Howtoaddbacis)

    === "show condition by current entity"
        **Step1** Add **showCondition** to **_.widget.json_**. see more [showCondition](/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/line2d/showcondition/MyExample4242Line2D.widget.json
        --8<--
        ```

## <a id="fields">Fields</a>
Fields Configuration. The fields array defines the fields of a point. The chart uses the fields named in `options.chart2D`;
the other fields are shown in the [table mode](#tablemode) and in the tooltip.

```json
{
    "title": "Month",
    "key": "month",
    "type": "input"
}
```

* **"title"**

  Description: Field Title. For the X and Y fields it is the axis title. An empty title hides the axis title.

  Type: String(optional).

* **"key"**

    Description: Name field to corresponding DataResponseDTO.

    Type: String(required).

* **"type"**

  Description: [Field types](/widget/fields/fieldtypes/). The Y field must be numeric.

  Type: String(required).

A field with type `hidden` is not shown in the table mode. Use it for the values that only the drilldown filter needs.

### How to add?
??? Example
    Add field to **_.widget.json_**.

      ```json
         --8<--
         {{ external_links.github_raw_doc }}/widgets/line2d/base/MyExample4240Line2D.widget.json
         --8<--
      ```

## <a id="Fieldslayout">Options layout</a>
**options.layout** - no use in this type.

## Actions
_not applicable_

### Additional properties

#### <a id="tooltip">Tooltip</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4246){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/tooltip){:target="_blank"}

The tooltip appears when the user moves the mouse over a point. By default it shows the X value and the value of every line.
`descriptionFieldKey` replaces it with the values of the listed fields of the record, joined with a comma.

###### How does it look?
![tooltip.png](tooltip.png)

###### How to add?
??? Example
    **Step1** Add the description field to **fields** and **descriptionFieldKey** to **options.chart2D** in **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/tooltip/MyExample4246Line2D.widget.json
    --8<--
    ```

#### <a id="color">Color</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4247){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/color){:target="_blank"}

The color of the lines is set on the X field:

* `bgColorKey`: the key of the field with the color of the record. The line takes the color of its first record.
* `bgColor`: one constant color for all lines.

Without them the widget uses the default palette.

###### How does it look?
=== "Color from a field"
    ![color_key.png](color_key.png)
=== "Constant color"
    ![color_constant.png](color_constant.png)

###### How to add?
??? Example
    === "Color from a field"
        **Step1** Add the color field to **DataResponseDTO** and fill it in the DAO.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/line2d/color/MyExample4247Dao.java:getStats
        --8<--
        ```
        **Step2** Add **bgColorKey** to the X field in **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/line2d/color/MyExample4247Line2DColorKey.widget.json
        --8<--
        ```
    === "Constant color"
        **Step1** Add **bgColor** to the X field in **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/line2d/color/MyExample4247Line2DColor.widget.json
        --8<--
        ```

#### <a id="drilldown">Drilldown</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4248){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/drilldown){:target="_blank"}

A click on a point opens the view with the records behind the point. The drilldown is set on the X field:
`drillDown: true` in the widget and the target view with a filter in the Meta of the record.
With `groupFieldKey` the point knows its line, so the filter can include the group value.

In the table mode the X value is a link with the same drilldown.

###### How does it look?
![drilldown.gif](drilldown.gif)

###### How to add?
??? Example
    **Step1** Add **drillDown** to the X field in **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/drilldown/MyExample4248Line2D.widget.json
    --8<--
    ```
    **Step2** Set the target view and the filter in **buildRowDependentMeta** of the **Meta**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/drilldown/MyExample4248Meta.java:buildRowDependentMeta
    --8<--
    ```
    **Step3** Add the target **List** widget and its view. The filtered fields have **@SearchParameter** in the DTO.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/drilldown/MyExample4248ListDTO.java
    --8<--
    ```

    see more [DrillDown](/advancedCustomization/element/drillDown/drillDown)

#### <a id="tablemode">Table mode</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4249){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/tablemode){:target="_blank"}

The settings icon of the widget opens the `Mode` menu with `Chart` and `Table`. In the table mode the widget shows the records
as a table with a column per field of the widget (fields with type `hidden` are not shown).

###### How does it look?
![table_mode.gif](table_mode.gif)

###### How to add?
The table mode is always available, nothing to add.

#### <a id="groups">Groups</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4243){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/groups){:target="_blank"}

`groupFieldKey` splits the records into lines: one line per value of the field. The values are shown in the legend.
A click on a legend value hides or shows the line.

Without `groupFieldKey` the chart has one line, and the legend shows the title of the Y field.

###### How does it look?
![groups.png](groups.png)

###### How to add?
??? Example
    **Step1** Add **groupFieldKey** to **options.chart2D** in **_.widget.json_**.
    The DAO returns one record per X value and group.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/groups/MyExample4243Line2D.widget.json
    --8<--
    ```

#### <a id="stack">Stack</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4244){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/stack){:target="_blank"}

`stack: true` draws the lines one on top of the other: the point of a line is its value plus the values of the lines below.
Use it with `groupFieldKey`.

###### How does it look?
![stack.png](stack.png)

###### How to add?
??? Example
    **Step1** Add **stack** to **options.chart2D** in **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/stack/MyExample4244Line2D.widget.json
    --8<--
    ```

#### <a id="axis">Axis scale and step</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4245){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/axis){:target="_blank"}

`yMin`, `yMax` set the range of the Y axis, `yStep` sets the distance between the axis labels.
Without them the range is taken from the data.

`xMin`, `xMax`, `xStep` do the same for the X axis and work only when the X field has a numeric type.
For a text X field they are ignored, and the widget writes a message to the browser console.

###### How does it look?
![axis.png](axis.png)

###### How to add?
??? Example
    **Step1** Add **yMin**, **yMax**, **yStep** to **options.chart2D** in **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/axis/MyExample4245Line2D.widget.json
    --8<--
    ```

#### DualAxes2D
A `Line2D` widget can be combined with a `Column2D` widget in one area with the `DualAxes2D` widget:
the charts share the X axis and can have separate Y axes.

#### Customization of displayed columns
**not available** in this release.

#### Filtration
##### Basic
Works only in the [table mode](#tablemode): the column filters are shown for the fields with `enableFilter` in the Meta, as in a List widget.
In the chart mode there are no filters. The widget sends the filter to the backend, and the AnySource DAO of the chart applies it itself:
the DAO of the samples does not, so there is no Live Sample.
see more [Filtration](/widget/type/property/filtration/filtration/)
#### FullTextSearch
Works only in the [table mode](#tablemode) with `options.fullTextSearch` in **_.widget.json_**: the search input is shown above the table.
The widget sends the search text to the backend, and the AnySource DAO of the chart applies it itself.
see [FullTextSearch](/widget/type/property/filtration/filtration/#by-fulltextsearch)
##### Personal filter group
**not available** in this release: the settings menu of the chart has only the `Mode` items, so there is no `Save filters` item.
##### Filter group
Works only in the [table mode](#tablemode): the filter groups of the business component are shown above the table, as in a List widget.
The widget sends the filter of the chosen group to the backend, and the AnySource DAO of the chart applies it itself.
see [Filter group](/widget/type/property/filtration/filtration/#by-filter-group)

#### Pagination
_not applicable_: the chart shows one page, see [Page limit](#pagelimit).

#### Export to Excel
**not available** in this release.

#### Multi-upload files
_not applicable_

#### Sorting
Works only in the [table mode](#tablemode) for the fields with `enableSort` in the Meta.
The widget sends the sort to the backend, and the AnySource DAO of the chart applies it itself.
see more [Sorting](/widget/type/property/sorting/sorting)

#### <a id="pagelimit">Page limit</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4251){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/pagelimit){:target="_blank"}

The chart draws only the first page of the business component. When the business component has more records than the page limit,
the chart is not drawn: the widget opens in the table mode, the `Chart` mode is disabled and a warning icon explains why.

Set the page limit of the business component to the number of points, see [Page limit](/widget/type/property/defaultlimitpage/defaultlimitpage).

###### How does it look?
![page_limit.png](page_limit.png)

###### How to add?
??? Example
    **Step1** Set the page limit in the **BC_PROPERTIES** table. In the sample it is 4 for 12 points.
    ```csv
    BC;PAGE_LIMIT;MASS_PAGE_LIMIT;SORT;FILTER;ID
    myExampleBc4251;4;NULL;NULL;'""';
    ```
    **Step2** The DAO returns the page asked by the widget.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/line2d/pagelimit/MyExample4251Dao.java:getList
    --8<--
    ```

#### <a id="nodata">No data</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4250){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/line2d/nodata){:target="_blank"}

When the business component returns no records, the widget shows `No Data` instead of the chart.

###### How does it look?
![no_data.png](no_data.png)

#### Parent-child
**not available** in the chart mode in this release: a click on a point does not select the record, the child widgets do not change.
In the table mode a click on a row selects the record.
