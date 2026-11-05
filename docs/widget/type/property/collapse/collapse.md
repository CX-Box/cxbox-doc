# Collapse widget group
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3022/view/myexample3022list){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/collapse){:target="_blank"}

Widgets on a view can be combined into groups that can be collapsed and expanded.

When the group is collapsed, all widgets of the group are hidden except for the header of the main widget.

=== "Expanded (default)"
     ![collapsedFalse.png](collapsedFalse.png)
=== "Collapsed (collapsedCondition default: true)"
     ![collapsedTrue.png](collapsedTrue.png)

## Basic

This function is available for:

* [List](/widget/type/list/list)
* [Form](/widget/type/form/form)
* [Info](/widget/type/info/info)
* [GroupingHierarchy widget](/widget/type/groupinghierarchy/groupinghierarchy)
* [Tree widget](/widget/type/tree/tree)
* [CardList widget](/widget/type/cardlist/cardlist)
* [CardCarouselList widget](/widget/type/cardcarousellist/cardcarousellist)
* [HeaderWidget](/widget/type/headerwidget/headerwidget)
* [AdditionalInfo widget](/widget/type/additionalinfo/additionalinfo)
* [AdditionalList widget](/widget/type/additionallist/additionallist)
* [StatsBlock widget](/widget/type/statblocks/statblocks)
* [Steps widget](/widget/type/steps/steps)
* [DashboardList widget](/widget/type/dashboardlist/dashboardlist)
* [FilePreview widget](/widget/type/filepreview/filepreview)
* [Column2D widget](/widget/type/column2d/column2d)
* [Line2D widget](/widget/type/line2d/line2d)
* [Pie1D widget](/widget/type/pie1d/pie1d)
* Level menu widgets (SecondLevelMenu, ThirdLevelMenu, FourthLevelMenu)

!!! info
     * A widget should be included in only one group. If a widget is listed in several groups, the first group with this widget is used.
     * The collapse state is stored for each view separately.
     * [collapsedCondition(default)](#collapsed-condition) is applied each time the view is opened: if the user expanded the group and then returned to the view, the group is collapsed again.


The main widget is the widget that controls the group:

* it is the **first widget in the `widgetNames` list** of the group. The order of widgets on the view (`position`) does not matter: if the main widget has a larger `position` than the other widgets, it still controls the group;
* the header of the main widget shows the collapse icon (`down` - expanded, `right` - collapsed). Clicking the header collapses or expands the whole group;
* when the group is collapsed, only the header of the main widget stays visible. The content of the main widget and all other widgets of the group are hidden;
* the header with the collapse icon is shown even if the main widget has no `title`.
* level menu widgets (SecondLevelMenu, ThirdLevelMenu, FourthLevelMenu) can be the main widget: the `title` of the menu widget is shown as a header with the collapse icon, the menu tabs are hidden when the group is collapsed. As a non-main widget the menu is hidden when the group is collapsed.


 
### How to add?
??? Example
     The first widget of the group (main widget) gets an icon to control collapsing.

     Add `groups` in **_.view.json_**. Each group contains `widgetNames` - names of the widgets included in the group.
     The first widget of the group becomes the main widget: its header with the collapse icon stays visible when the group is collapsed.

     If `collapsedCondition` is not specified, the group is expanded after the page is loaded.

     ```json
     {
       "name": "myexample3022list",
       "title": "MyExample3022 List",
       "template": "DashboardView",
       "url": "/screen/myexample3022/view/myexample3022list",
       "widgets": [
         ...
       ],
       "groups": [
         {
           "widgetNames": [
             "myexample3022ringprocessl",
             "myexample3022funnel",
             "myexample3022dashboardlist"
           ]
         },
         {
           "widgetNames": [
             "myexample3022list",
             "myexample3022form",
             "myexample3022info",
             "myexample3022header"
           ]
         }
       ]
     }
     ```
     [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3022/view/myexample3022list){:target="_blank"} ·
     [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/collapse){:target="_blank"}


## <a id="collapsed-condition">Collapsed by default</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3022/view/myexample3022listwithcondition){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/collapse/myexample3022listwithcondition.view.json){:target="_blank"}

Sets the state of the widget group after the page is loaded:

* The group is collapsed. Only the header of the main widget is visible, the other widgets of the group are hidden.
* (default) - the group is expanded.

The user can still expand or collapse the group with the icon of the main widget.

### How to add?
??? Example

     Add `collapsedCondition` with `default` to the group in **_.view.json_**.

     ```json
     {
       "name": "myexample3022listwithcondition",
       "title": "MyExample3022 List",
       "template": "DashboardView",
       "url": "/screen/myexample3022/view/myexample3022listwithcondition",
       "widgets": [
         ...
       ],
       "groups": [
         {
           "widgetNames": [
             "myexample3022ringprocessl",
             "myexample3022funnel",
             "myexample3022dashboardlist"
           ],
           "collapsedCondition": {
             "default": true
           }
         },
         {
           "widgetNames": [
             "myexample3022list",
             "myexample3022form",
             "myexample3022info",
             "myexample3022header"
           ]
         }
       ]
     }
     ```
