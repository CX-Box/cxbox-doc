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

![Line2Dbasic.jpg](v2.0.12/Line2Dbasic.jpg){width="700"}

Key features include:

* Axis scale/ step control
* Grouped display
* Tooltip display

Functionality includes:

* Drilldown - click on xAxis values to drilldown to the filtered data displayed in a table.   
* Switch mode - switch from column mode to table mode to view data in a tabular format.  
* Segment interaction - click on legend values to add or remove lines from the plot.  

#### Added: DualAxes2D widget - New widget type!

We have introduced a new widget type `DualAxes2D` to display data from different types of charts in a single area. The charts share the same X axis, but can have separate Y axes. 
**Note!** DualAxes2D can only display 2D types of widgets (e.g. Line2D, Column2D). The features (tooltip and axis scale/step) for 2D widgets will apply to DualAxes2D automatically.

![DualAxes2Dbasic.PNG](v2.0.12/DualAxes2Dbasic.PNG){width="700"}

Functionality includes:  

* Drilldown - click on yAxis values to drilldown to the filtered data displayed in a table.  
* Switch mode - switch from column mode to table mode to view data in a tabular format.  
* Segment interaction - click on legend values to add or remove lines/bars from the plot.   

#### Added: UI panel - display of application version and environment type  

We have added the ability to display the environment type and current application version in the UI panel for convenience. The text adapts depending on the menu state (`collapsed`/`expanded`) and shows a tooltip with more details. Background color customization for this section is also supported.  

=== "After"  
    ![envAfter.gif](v2.0.12/envAfter.gif)
=== "Before"
    ![envBefore.gif](v2.0.12/envBefore.gif)

#### Added: Push Notifications - long links support  

We have enhanced the display of long link labels for [Push Notifications](https://doc.cxbox.org/features/element/notifications/push/websocket/). Now, if the link label exceeds the width of the notification, the text automatically wraps to the next line, ensuring the full label is displayed correctly without being truncated. In addition, the *"and (N) more..."* text (in case there are several links) is also displayed correctly within the notification area.   

=== "After"
    ![notificationLinkAfter.png](v2.0.12/notificationLinkAfter.png){width="700"}
=== "Before"
    ![notificationLinkBefore.png](v2.0.12/notificationLinkBefore.png){width="700"}  

#### Added: suggestionPickList field - scrollbar support  

We have improved the suggestionPickList field by adding scrollbar support - you can now navigate long lists more easily using the scrollbar.  

=== "After"
    ![suggestionPickListScroll.png](v2.0.12/suggestionPickListScroll.png){width="700"}
=== "Before"
    ![suggestionPickListNoScroll.png](v2.0.12/suggestionPickListNoScroll.png){width="700"}  

#### Added: suggestionPickList field - changes in filtering method  

We have refined the filtering method for the suggestionPickList field. Previously, it required an exact match with the typed characters (`equals`). Now, the filtering logic is less strict, and displays all the results that contain the entered text (`contains`).  
=== "After"  
    ![suggestionPickListFiltrationAfter.gif](v2.0.12/suggestionPickListFiltrationAfter.gif)  
=== "Before"  
    ![suggestionPickListFiltrationBefore.gif](v2.0.12/suggestionPickListFiltrationBefore.gif)  

#### Added: dictionary field - improved layout for mode:icon  

We have removed the minimum width restriction for [Dictionary](https://doc.cxbox.org/widget/fields/field/dictionary/dictionary/) field with `mode: icon`. This allows the field to shrink dynamically while keeping the icon and value closer together, resulting in a more compact layout.  
=== "After"  
    ![dictionaryPaddingAfter.png](v2.0.12/dictionaryPaddingAfter.png){width="700"}   
=== "Before"  
    ![dictionaryPaddingBefore.png](v2.0.12/dictionaryPaddingBefore.png){width="700"}

#### Fixed: FormPopup widget - forceActive update  

We have enhanced the forceActive feature for [FormPopup widget](https://doc.cxbox.org/widget/type/formpopup/formpopup/) to ensure that only a POST row-meta request is executed. This guarantees the most up-to-date information even when the entity is being edited, preventing data loss.  

#### Fixed: AssocListPopup - ignored scope for action buttons  

We have updated [AssocListPopup](https://doc.cxbox.org/widget/type/assoclistpopup/assoclistpopup/) to ignore `scope` for action buttons, which prevents unnecessary duplication. Previously, actions from the three-dot menu were duplicated as separate buttons at the top. 

#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.12)

### CXBOX ([Core Ui](https://github.com/CX-Box/cxbox-ui/releases/tag/2.5.2))

We have released a new 2.5.2 CORE UI version.

#### Other Changes
See [cxbox-ui 2.5.2 changelog](https://github.com/CX-Box/cxbox-ui/releases/tag/2.5.2).  

### CXBOX 4.0.0-M16 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M16))

We have released a new 4.0.0-M16 CORE version.  

#### Added: NEW! Java API for confirm preActions  

New Java API for confirm preActions in the **CORE** now provides with a standardized and unified behavior for both `confirm` and `confirmWithWidget` preActions.  

1)`confirm` preAction 

=== "NEW! withoutTitle()"  
    We have added support for an empty title using a `.withoutTitle()` method  
    ```java
    PreAction.confirm(cf -> cf
    .withoutTitle()
    .text("Changes will be saved")
    .yesText("Approve and Save")
    .noText("Cancel"))
    ```  
    ![confirmWithoutTitle.jpg](v2.0.12/confirmWithoutTitle.jpg)  

=== "NEW! withoutText()"  
    We have added support for an empty text using a `.withoutText()` method. The body of the confirmPopup shrinks as the text is left empty.  
    ```java
    PreAction.confirm(cf -> cf
    .title("Approve?")
    .withoutText()
    .yesText("Approve and Save")
    .noText("Cancel"))
    ```  
    ![confirmWithoutText.jpg](v2.0.12/confirmWithoutText.jpg)  

=== "Unchanged: default title"  
    If you indicate `.title(null)` or don't indicate it at all, the default title is displayed.  
    ```java
    PreAction.confirm(cf -> cf
    .title(null)
    .text("Changes will be saved")
    .yesText("Approve and Save")
    .noText("Cancel"))
    ```
    ![confirmDefaultTitle.jpg](v2.0.12/confirmDefaultTitle.jpg)  

=== "Unchanged: default text"  
    If you indicate `.text(null)` or don't indicate it at all, the default text is displayed.  
    ```java
    PreAction.confirm(cf -> cf
    .title("Approve?")
    .text(null)
    .yesText("Approve and Save")
    .noText("Cancel"))
    ```
    ![confirmDefaultText.jpg](v2.0.12/confirmDefaultText.jpg)  

=== "Unchanged: custom title/text"  
    If `title` or `text` contains a value, it is displayed correctly.  
    ```java
    PreAction.confirm(cf -> cf
    .title("Approve?")
    .text("Changes will be saved")
    .yesText("Approve and Save")
    .noText("Cancel"))
    ```
    ![confirmCustomTitleText.jpg](v2.0.12/confirmCustomTitleText.jpg)  

=== "Unchanged: all default"  
    If nothing except for `preAction.confirm()` is indicated, all default values are displayed.  
    ```java
    PreAction.confirm()
    ```    
    ![confirmAllDefault.jpg](v2.0.12/confirmAllDefault.jpg)  

2)`confirmWithWidget` preAction (renamed from `confirmWithCustomWidget`)  

=== "NEW! withoutTitle()"  
    Just like with `confirm`, there is now a support for an empty title using a `.withoutTitle()` method  
    ```java
    PreAction.confirmWithWidget(
    "meetingResultFormPopup", cf -> cf
    .withoutTitle()
    .yesText("Approve and Save")
    .noText("Cancel")
    )
    ```  
    ![confirmWithWidgetWithoutTitle.jpg](v2.0.12/confirmWithWidgetWithoutTitle.jpg)  

=== "Unchanged: default title"  
    If `.title(null)` is indicated, the default title is displayed.  The same logic is if you don't indicate `title` at all.   
    ```java
    PreAction.confirmWithWidget(
    "meetingResultFormPopup", cf -> cf
    .title(null)
    .yesText("Approve and Save")
    .noText("Cancel")
    )
    ```
    ![confirmWithWidgetDefaultTitle.jpg](v2.0.12/confirmWithWidgetDefaultTitle.jpg)  

=== "Unchanged: custom title"  
    If `title` contains a value, it is displayed.  
    ```java
    PreAction.confirmWithWidget(
    "meetingResultFormPopup", cf -> cf
    .title("Approve?")
    .yesText("Approve and Save")
    .noText("Cancel")
    )
    ```  
    ![confirmWithWidgetCustom.jpg](v2.0.12/confirmWithWidgetCustom.jpg)  

#### MultivalueField & MultivalueFieldSingleValue - Implemented Serializable  

We have implemented Serializable for `MultivalueField` and `MultivalueFieldSingleValue` to ensure compatibility with springSessionJDBC. This change allows the backend to serialize bcState using the JDK serializer (instead of Jackson) by default, resolving issues with inconsistent behavior when attempting to serialize these objects.

#### Other Changes
See [cxbox 4.0.0-M16 changelog](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M16).  

### CXBOX [plugin](https://plugins.jetbrains.com/plugin/19523-platform-tools)  

#### Added: Run Inspections Button  

We have added a Run Inspections button to the IntelliJ IDEA sidebar, enabling one-click execution of inspections across the entire project. The functionality automates the manual steps required to run inspections, eliminating the need to configure profiles or adjust settings.  

#### Added: AdditionalInfo widget - fieldKey validation in *.widget.json

Added inspections for [AdditionalInfo](https://doc.cxbox.org/widget/type/additionalinfo/additionalinfo/) widget, following the same logic as [Info](https://doc.cxbox.org/widget/type/info/info/) widget. Now, if a `fieldKey` in `layout` is missing or does not reference a field from `fields`, an inspection warning is triggered.  

#### Added: Inspection for options -> create/edit -> widget in *.widget.json  

Added an inspection to ensure that widgets referenced in `create` and `edit` parameters are present on the same view. Missing widgets are automatically added to the view.  

#### Added: postAction drillDownAndWaitUntil - validation for successCondition_bcName  

We have added a validation check to verify that the field specified in the successCondition_bcName parameter is present on the indicated bc in the drillDownAndWaitUntil postAction.  



