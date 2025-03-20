# 2.0.12

* [cxbox/demo 2.0.12 git](https://github.com/CX-Box/cxbox-demo/tree/v.2.0.12), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.12)

* [cxbox/core 4.0.0-M16 git](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M16), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M16), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/4.0.0-M16)

* [cxbox-ui/core 2.5.2 git](https://github.com/CX-Box/cxbox-ui/tree/2.5.2), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.5.2), [npm](https://www.npmjs.com/package/@cxbox-ui/core/v/2.5.2)

* [cxbox/code-samples 2.0.12 git](https://github.com/CX-Box/cxbox-code-samples/tree/v.2.0.12), [release notes](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v.2.0.12)


## **Key updates February, March 2025**

### CXBOX ([Demo](http://demo.cxbox.org))

#### Added: Push Notifications - new display modes  

We have introduced three display modes for [WebSocket Push Notifications](https://doc.cxbox.org/features/element/notifications/push/websocket/): `single`, `stack`, and `column`.  

=== "Stack (default)"  
    Notifications appear separately, stacking on top of each other.  
    ![notificationStack.gif](v2.0.12/notificationStack.gif)  
=== "Column"  
    Notifications appear separately, aligned vertically in a column.  
    ![notificationColumn.gif](v2.0.12/notificationColumn.gif)  
=== "Single"  
    Each new notification replaces the previous one in a single area.  
    ![notificationSingle.gif](v2.0.12/notificationSingle.gif)  

You can configure `timeout` for all three modes. For `stack` and `column`, you can also set the maximum number of visible notifications and the display direction (`upward`/`downward`).  

#### Added: Line2D widget - New widget type!  

We have introduced a new widget type `Line2D` to display data using X and Y axes in a linear format.



Key features include:

* Axis scale/ step control
* Grouped display
* Tooltip display

Functionality includes:

=== "Drilldown"  
    Click on xAxis values to drilldown to the filtered data displayed in a table.   

=== "Switch mode"  
    Switch from column mode to table mode to view data in a tabular format.  

=== "Segment interaction"  
    Click on legend values to add or remove lines from the plot.  

#### Added: DualAxes2D widget - New widget type!

We have introduced a new widget type `DualAxes2D` to display data from different types of charts in a single graph. The charts share the same X axis, but can have separate Y axes. **Note!** DualAxes2D can only display 2D types of widgets (e.g. Line2D, Column2D). The features (tooltip and axis scale/step) for 2D widgets will apply to DualAxes2D automatically.


Functionality includes:

=== "Drilldown"  
    Click on yAxis values to drilldown to the filtered data displayed in a table.

=== "Switch mode"  
    Switch from column mode to table mode to view data in a tabular format.

=== "Segment interaction"  
    Click on legend values to add or remove lines/bars from the plot. 

#### Added: Push Notifications - long link label support  

We have enhanced the display of long link labels for [Push Notifications](https://doc.cxbox.org/features/element/notifications/push/websocket/). Now, if the link label exceeds the width of the notification, the text automatically wraps to the next line, ensuring the full label is displayed correctly without being truncated.  

=== "After"
    ![notificationLinkAfter.png](v2.0.12/notificationLinkAfter.png)
=== "Before"
    ![notificationLinkBefore.png](v2.0.12/notificationLinkBefore.png)  

#### Added: suggestionPickList field - scrollbar support  

We have improved the suggestionPickList field by adding scrollbar support - you can now navigate long lists more easily using the scrollbar.  

=== "After"
    ![suggestionPickListScroll.png](v2.0.12/suggestionPickListScroll.png)
=== "Before"
    ![suggestionPickListNoScroll.png](v2.0.12/suggestionPickListNoScroll.png)  

#### Fixed: formPopup widget - forceActive update  

We have enhanced the forceActive feature for FormPopup widget to ensure that only a POST row-meta request is executed. This guarantees the most up-to-date information even when the entity is being edited, preventing data loss.  

#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.12)

### CXBOX ([Core Ui](https://github.com/CX-Box/cxbox-ui/releases/tag/2.5.2))

We have released a new 2.5.2 CORE UI versions.

#### Other Changes
See [cxbox-ui 2.5.2 changelog](https://github.com/CX-Box/cxbox-ui/releases/tag/2.5.2).  

### CXBOX 4.0.0-M16 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M16))

We have released a new 4.0.0-M16 CORE version.  

#### Other Changes
See [cxbox 4.0.0-M16 changelog](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M16).  

