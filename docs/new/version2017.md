# 2.0.17

* [cxbox/demo 2.0.17 git](https://github.com/CX-Box/cxbox-demo/tree/v.2.0.17), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.17)

* [cxbox/core 4.0.0-M22 git](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M22), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M22), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/4.0.0-M22)

* [cxbox-ui/core 2.8.0 git](https://github.com/CX-Box/cxbox-ui/tree/2.8.0), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.8.0), [npm](https://www.npmjs.com/package/@cxbox-ui/core/v/2.8.0)

* [cxbox/code-samples 2.0.17 git](https://github.com/CX-Box/cxbox-code-samples/tree/v.2.0.17), [release notes](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v.2.0.17)  

## **Key updates January, February 2026**

### CXBOX ([Demo](http://demo.cxbox.org))  

#### Added: New Year atmosphere in the application
<!-- CXBOX-1212 -->  
We have added an option to create a festive New Year atmosphere in the application. You can enable a falling snow effect in the application menu.

The effect is controlled via a configuration parameter.
See more  [New Year atmosphere](/features/happynewyear/happynewyear/)

![CXBOX-1212.png](v2.0.17/CXBOX-1212.png)

#### Added: RelationGraph – NEW widget type!
<!-- CXBOX-1157 -->  
We’ve introduced the RelationGraph widget to visualize relationships between nodes in a structured graph format.

Key functionality includes:

* Switch between graph and table view
* Parent–child support
* DrillDown support
* Custom color configuration for nodes and edges
* Configurable graph direction (top-bottom, left-right, etc.)
* Customizable node text, edge labels, and edge styles

![CXBOX-1157.jpg](v2.0.17/CXBOX-1157.jpg)

!!! info  
    A detailed article on RelationGraph will be available soon in our official documentation – stay tuned!
 
#### Added: CardList – NEW widget type!
<!-- CXBOX-901 -->
We’ve introduced a new CardList widget designed for convenient file preview and management.
All uploaded files are displayed as preview cards, allowing you to easily browse, edit, add, or delete items directly within the widget.

Key functionality includes:

* File preview in card format
* Actions’ support
* DrillDown support
* Configurable card size
* 
![CXBOX-901.jpg](v2.0.17/CXBOX-901.jpg)

!!! info  
    A detailed article on CardList will be available soon in our official documentation – stay tuned!

#### Added: CardCarouselList – NEW widget type!
<!-- CXBOX-901 -->
We’ve added a new CardCarouselList widget with functionality similar to CardList, but presented in a carousel layout.
Cards are arranged in a horizontal scrollable strip, while the selected item is displayed prominently above for easier viewing.

Key functionality includes:

* Carousel navigation (forward/backward scrolling)
* Actions’ support
* DrillDown support
* Configurable card size

![CXBOX-901_CardCarouselList.jpg](v2.0.17/CXBOX-901_CardCarouselList.jpg)

!!! info 
    A detailed article on CardCarouselList will be available soon in our official documentation – stay tuned!

#### Added: Export to Excel as a regular button
<!-- CXBOX-816 -->  
Added the ability to display Export to Excel as a regular button. To do this, you only need to indicate a new `PostAction.exportToExcel` for a BC button.

=== "Before"  
    ![CXBOX-816-Export.png](v2.0.17/CXBOX-816-Export.png)   
=== "After"  
    ![CXBOX-816-CustomExport.png](v2.0.17/CXBOX-816-CustomExport.png)

#### Added: Support for `gridWidth` for popup
<!-- CXBOX-715 -->
We have added support for `gridWidth` for AssocListPopup and PickListPopup, like we did for FormPopup in [v2.0.9](https://doc.cxbox.org/new/version209/?h=grid#added-formpopup-widget-gridwidth-support). You can now directly indicate the width using `view.json -> widgets -> gridWidth` and the width now dynamically adjusts based on the following factors:  

* The state of the menu (collapsed or expanded)  

=== "gridWidth12 Menu Expanded"  
    ![CXBOX-715-menuExpandedPopup.png](v2.0.17/CXBOX-715-menuExpandedPopup.png)
=== "gridWidth12 Menu Collapsed"  
    ![CXBOX-715-menuCollapsed.png](v2.0.17/CXBOX-715-menuCollapsed.png)  

* The presence or absence of the additional widget on the view  

=== "gridWidth12 No Additional"  
    ![CXBOX-715-noAdditional.png](v2.0.17/CXBOX-715-noAdditional.png)
=== "gridWidth12 With Additional"  
    ![CXBOX-715-additional.png](v2.0.17/CXBOX-715-additional.png)
**Note!** Before this release value of gridWidth was ignored, e.g. popup widget was constant. After release one can set `gridWidth = 16` to remain old popup sizes.

#### Added: Alternative pagination support
<!-- CXBOX-1118 -->  
We have introduced the ability to retrieve the total row count on demand via a new `alternativeType` parameter. By clicking a button, users can request the total number of rows. Once activated, the count remains available during filtering and page navigation and resets only after a page refresh.  

=== "After"  
    You can keep a performance-friendly pagination mode by default ([nextAndPreviousWithHasNext](https://doc.cxbox.org/widget/type/property/pagination/pagination/?h=next#nextandpreviouswithhasnext)/ [nextAndPreviousSmart](https://doc.cxbox.org/widget/type/property/pagination/pagination/?h=next#nextandprevioussmart)) and switch to [nextAndPreviousWithCount](https://doc.cxbox.org/widget/type/property/pagination/pagination/?h=next#default-nextandpreviouswithcount) only when record counting is needed.  
    ![CXBOX-1118After.gif](v2.0.17/CXBOX-1118After.gif)
=== "Before"
    To display the total row count, you can only indicate [nextAndPreviousWithCount](https://doc.cxbox.org/widget/type/property/pagination/pagination/?h=next#default-nextandpreviouswithcount) pagination type, which sends a /count request and may impact performance.  
    ![CXBOX-1118Before.gif](v2.0.17/CXBOX-1118Before.gif)  

#### Added: Support for .ogg, .aac, and .flac
<!-- CXBOX-1234 --> 
Support for .ogg, .aac, and .flac formats has been added.

=== ".ogg"
    ![ogg_CXBOX-1234.png](v2.0.17/ogg_CXBOX-1234.png)
=== ".aac"
    ![aac_CXBOX-1234.png](v2.0.17/aac_CXBOX-1234.png)
=== ".flac"
    ![flac_CXBOX-1234.png](v2.0.17/flac_CXBOX-1234.png)

#### Added: Export to Excel support all types fields

Support has also been added for exporting the following field types to Excel:

* [multivalue](https://doc.cxbox.org/widget/fields/field/multivalue/multivalue/)
* [multivalueHover](https://doc.cxbox.org/widget/fields/field/multivalueHover/multivalueHover/)
* [multipleSelect](https://doc.cxbox.org/widget/fields/field/multipleSelect/multipleSelect/)
* [fileUpload](https://doc.cxbox.org/widget/fields/field/fileUpload/fileUpload/)
* [money with Сurrency](https://doc.cxbox.org/widget/fields/field/money/money/#currency)
* [suggestionPickList](https://doc.cxbox.org/widget/fields/field/suggestionpicklist/suggestionPickList/)

#### Fixed: CalendarYearList the buttons are displayed correctly depending on the type
<!-- CXBOX-1149 --> 

For the *CalendarYearList* type, the buttons are displayed correctly depending on the type — *record* or *BC*

=== "After"
    ![CXBOX-1149After.png](v2.0.17/CXBOX-1149After.png)
=== "Before"
    ![CXBOX-1149Before.png](v2.0.17/CXBOX-1149Before.png)

#### Fixed: Settings Menu Update
<!-- CXBOX-985 -->  
The settings icon (gear) has been moved to the table header and positioned on the right side, above the three-dot menu. This will save space when there are no actions, PDQ, or full-text search on the table.

=== "After" 
    ![CXBOX-985After.png](v2.0.17/CXBOX-985After.png)
=== "Before"
    ![CXBOX-985Before.png](v2.0.17/CXBOX-985Before.png)

The view mode toggle icon (chart / table) has been moved to the settings menu.
=== "After"
    ![CXBOX-985graphAfter.gif](v2.0.17/CXBOX-985graphAfter.gif)
=== "Before"
    ![CXBOX-985graphBefore.gif](v2.0.17/CXBOX-985graphBefore.gif)

The **Collapse columns** function has been moved to the settings menu.
=== "After"
    ![CXBOX-985collapseAfter.gif](v2.0.17/CXBOX-985collapseAfter.gif) 
=== "Before"
    ![CXBOX-985collapseBefore.gif](v2.0.17/CXBOX-985collapseBefore.gif) 


#### Fixed: Full-Width Numeric Fields
<!-- CXBOX-1203 -->  
The display of fields with the following types has been improved:

* [number](https://doc.cxbox.org/widget/fields/field/number/number/)
* [percent](https://doc.cxbox.org/widget/fields/field/percent/percent/)
* [money](https://doc.cxbox.org/widget/fields/field/money/money/)

The field input now spans the full width of the table column.

=== "After"
    ![CXBOX-1203-After.png](v2.0.17/CXBOX-1203-After.png)
=== "Before"
    ![CXBOX-1203-Before.png](v2.0.17/CXBOX-1203-Before.png)

#### Fixed: GroupingHierarchy Empty State Improvement
<!-- CXBOX-1146 -->  
For the GroupingHierarchy widget, scroll display has been added for cases when there is no data and no default hierarchy is defined.

=== "After"
    ![CXBOX-1146After.png](v2.0.17/CXBOX-1146After.png)
=== "Before"
    ![CXBOX-1146Before.png](v2.0.17/CXBOX-1146Before.png)

#### Fixed: Adaptive Action Group Width
<!-- CXBOX-1179 -->  
The display of the action group has been improved: the width of the window showing button labels now automatically adjusts based on the content.  

=== "After"  
    ![CXBOX-1179After.png](v2.0.17/CXBOX-1179After.png)
=== "Before"  
    ![CXBOX-1179Before.png](v2.0.17/CXBOX-1179Before.png)

#### Fixed: Improved Scrolling for Large Lists
<!-- CXBOX-1188 --> 
The behavior of the scroll and arrows has been improved when there are many values in dictionary.

=== "After"
    ![after_CXBOX-1188.gif](v2.0.17/after_CXBOX-1188.gif)
=== "Before"
    ![befoe_CXBOX-1188.gif](v2.0.17/befoe_CXBOX-1188.gif)
    
#### Fixed: Gear Icon Display Fix
<!-- CXBOX-1192 --> 
Fixed the gear icon behavior when there are no buttons on the widget — the gear icon is now displayed.  

=== "After"  
    ![CXBOX-1192After.png](v2.0.17/CXBOX-1192After.png)
=== "Before"  
    ![CXBOX-1192Before.png](v2.0.17/CXBOX-1192Before.png)

#### Fixed: Fixed the highlighting of required multivalue field
<!-- CXBOX-1138 --> 
Fixed the highlighting of required multivalue field in the list widget when using inline form editing.

=== "After"
    ![CXBOX-1138After.png](v2.0.17/CXBOX-1138After.png)
=== "Before"
    ![CXBOX-1138Before.png](v2.0.17/CXBOX-1138Before.png)  

#### Fixed: Multivalue,multivalueHover и pickList Filter Display Fix
<!-- CXBOX-1145 --> 
Fixed the display of filters for multivalue,multivalueHover и pickList fields: selected values are now shown correctly, regardless of whether they are present on the selected page.

=== "After"  
    === "first page"  
        ![CXBOX-1145After1.png](v2.0.17/CXBOX-1145After1.png)  
    === "second page"  
        ![CXBOX-1145After2.png](v2.0.17/CXBOX-1145After2.png)
=== "Before"  
    === "first page"  
        ![CXBOX-1145Before1.png](v2.0.17/CXBOX-1145Before1.png)  
    === "second page"  
        ![CXBOX-1145Before2.png](v2.0.17/CXBOX-1145Before2.png)  

!!! info  
    There is a limitation when using predefined filters of the following types: multivalue, pickList, and multivalueHover. When such filters are predefined, the filter tags display id values. When the filter is manually edited (for example, by adding values via a picklist), the tags are displayed according to the standard rules. This behavior is caused by a frontend limitation: the frontend cannot resolve display names for filter tags if the records specified in the predefined filter are located on different pages of the picklist popup and are not loaded in the current UI context.  
    ![CXBOX_1145.png](v2.0.17/CXBOX_1145.png)

#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.17)

### CXBOX ([Core Ui](https://github.com/CX-Box/cxbox-ui/releases/tag/2.8.0))  
We have released a new 2.8.0 CORE UI version.  

#### Added: Optional WebSocket Updates
<!-- CXBOX-1060 --> 

Added the option to disable WebSocket calls from the frontend. The notification bell count is still displayed, but it will only update when the page is reloaded.

WebSocket Request Behavior Based on featureSettings

* webSocketNotificationEnabled: false → WebSocket requests are disabled
* webSocketNotificationEnabled: true → WebSocket requests are enabled
* If the setting is not provided → WebSocket requests are enabled by default  

#### Fixed: Optimized functionality for ...
 <!-- CXBOX-1111 --> 
Removed the request triggered by clicking on ...  the GET /api/v1/row-meta/id request is no longer sent.
 
=== "after"
    ![after_CXBOX-1111.png](v2.0.17/after_CXBOX-1111.png)
=== "before"
    ![before_CXBOX-1111.png](v2.0.17/before_CXBOX-1111.png)

#### Other Changes
See [cxbox-ui 2.8.0 changelog](https://github.com/CX-Box/cxbox-ui/releases/tag/2.8.0).


### CXBOX 4.0.0-M22 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M22))

We have released a new 4.0.0-M22 CORE version.
#### Added: Parameter New Year atmosphere  
<!-- CXBOX-1212 -->  
We added a new parameter for `UiProperties`: `seasonalEffectsEnabled`.

When set to `true`, it enables a snowfall effect in the menu area.

#### Added: Parameter WebSocket 
<!-- CXBOX-1060 --> 
We added a new parameter for `UiProperties`: `webSocketNotificationEnabled`.

When set to `false` the frontend guarantees no WebSocket interactions, so the backend WebSocket functionality may be safely removed.

#### Added: New PostAction exportToExcel
<!-- CXBOX-1060 --> 
Added the ability to add button Export to Excel as a regular button. 
 
#### Other Changes
See [cxbox 4.0.0-M22 changelog](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M22).

### CXBOX [documentation](https://doc.cxbox.org/)
#### Added: Description New Year atmosphere in the application
<!-- CXBOX-1212 -->   
We have provided a description on how to create a festive [New Year atmosphere](/features/happynewyear/happynewyear/) in the application.

#### Added: Description Bulk operations (Mass Operations)
<!-- CXBOX-1079  -->
We have provided a description [Bulk operations](https://doc.cxbox.org/widget/type/property/massoperations/massoperations)

`Bulk operations` are a mechanism that allows the user to perform a single action on a large number of table rows at once. Instead of processing each row individually, the user can select a set of data and apply a common operation to it—such as updating, deleting, changing statuses, recalculating values, and other typical scenarios.

#### Added: Description forward/back/refresh buttons
<!-- CXBOX-1163 -->   
Describe in the documentation the behavior of the browser's [forward/back/refresh buttons](https://doc.cxbox.org/navigation/browsernavigationbuttons/browsernavigationbuttons/).

#### Added: Description widget Steps 
<!-- CXBOX-562 CXBOX-1065 -->  
We have provided a description of [Steps widget](https://doc.cxbox.org/widget/type/steps/steps/)

#### Added: Description Screen Search in Left Menu
<!-- CXBOX-1221 -->   
We have provided a description [Screen Search in Left Menu](https://doc.cxbox.org/navigation/screen/screen/#screen-search-in-left-menu)

#### Added: Description Screen Name Wrapping in Left Menu
<!-- CXBOX-1221 -->   
We have provided a description [Screen Name Wrapping in Left Menu](https://doc.cxbox.org/navigation/screen/screen/#screen-name-wrapping-in-left-menu)

#### Added: Description setHidden
<!-- CXBOX-1155 -->   
We have provided a description [setHidden](https://doc.cxbox.org/environment/meta/buildrowdependentmeta/sethidden/sethidden/)

#### Added: Description new properties Time
<!-- CXBOX-1222 -->   
We have provided a description new properties [time](https://doc.cxbox.org/widget/fields/field/time/time/)

#### Added: Description a limitation when using predefined filters
<!-- CXBOX-1145 -->  
There is a limitation when using predefined filters of the following types: multivalue, pickList, and multivalueHover.

* When such filters are predefined, the filter tags display id values.
* When the filter is manually edited (for example, by adding values via a picklist), the tags are displayed according to the standard rules.

* see more [filters](https://doc.cxbox.org/widget/type/property/filtration/filtration/#by-filter-group)

#### Added: Description to the sorting behavior
<!-- CXBOX-1089 --> 
Please pay attention to the sorting behavior:

* If the user has not set a sorting option, the default sorting is applied if it is defined.
* If the user has applied a sorting option, it will be preserved when navigating via drill-down or between screens.

see more [sorting](https://doc.cxbox.org/widget/type/property/sorting/sorting/#type-sorting)
#### Added: Recommendations for Spring Data JPA 3.5.1, queries involving Hibernate custom types
<!-- CXBOX-1068  -->
Starting with Spring Data JPA 3.5.1, queries involving Hibernate custom types 
(for example, dictionary-like value objects) may break when Spring Data rewrites JPQL queries into constructor-based projections.

Recommendations for solving the problem are [here](https://doc.cxbox.org/environment/jparepository/jparepository/#spring-data-jpa-351-regression-with-converted-entity-properties)

#### Added: Recommendations for Spring Data JPA 3.5.1: Custom Hibernate Types Issue
<!-- CXBOX-1176  -->
Starting with Spring Data JPA 3.5.1, support for custom Hibernate types in queries is broken when Spring Data rewrites queries into constructor-based projections.

Recommendations for solving the problem are [here](https://doc.cxbox.org/environment/jparepository/jparepository/#spring-data-jpa-351-custom-hibernate-types-issue)
 