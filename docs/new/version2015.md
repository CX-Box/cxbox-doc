# 2.0.15

* [cxbox/demo 2.0.15 git](https://github.com/CX-Box/cxbox-demo/tree/v.2.0.15), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.15)

* [cxbox/core 4.0.0-M19 git](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M19), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M19), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/4.0.0-M19)

* [cxbox-ui/core 2.6.1 git](https://github.com/CX-Box/cxbox-ui/tree/2.6.1), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.6.1), [npm](https://www.npmjs.com/package/@cxbox-ui/core/v/2.6.1)

* [cxbox/code-samples 2.0.15 git](https://github.com/CX-Box/cxbox-code-samples/tree/v.2.0.15), [release notes](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v.2.0.15)  

* cxbox/intellij-plugin 2.0.0 [Jetbrains Marketplace](https://plugins.jetbrains.com/plugin/19523-platform-tools#), [cxbox repo (recommended)](https://doc.cxbox.org/new/version2014/#added-intellij-20251-support)


## **Key updates August 2025**

### CXBOX ([Demo](http://demo.cxbox.org))  

#### Added: notification banner – adaptive button display
We’ve made the notification banner responsive to long button texts, so button labels are no longer cut off and the popup resizes accordingly.

=== "After"
    ![notificationButtonAfter.png](v2/0/15/notificationButtonAfter.png)
=== "Before"
    ![notificationButtonBefore.png](v2/0/15/notificationButtonBefore.png)

#### Added:  collapsedCondition tag
Now you can set the collapse state when opening the screen by default.

In view.json, each widget group now has a collapsedCondition tag:

* true is set, the widget group is displayed in a collapsed state immediately after the page loads. Only the main widget header remains visible; the other widgets are hidden
* false is set, the widget group is expanded(default)

![collapse.png](v2/0/15/collapse.png)

#### Fixed: validation handling for required and hidden fields
добавить что для обязательных задизейбленных полей
We have improved validation logic for required and both static and dynamic hidden fields to correctly display messages when required fields are empty. Now the field validation is visible to the user.

=== "required"
    ![requiredEmptyField.png](v2/0/15/requiredEmptyField.png)
=== "hidden"
    ![hiddenEmptyField.png](v2/0/15/hiddenEmptyField.png)

#### Fixed: cancel action after validation warning
We have improved the cancel action logic for cases when a form is blocked by validation. Now, if the system warns about required fields being left empty, users can still cancel and discard all changes.
=== "After"
    ![982after.gif](v2/0/15/982after.gif)
=== "Before"
    ![982before.gif](v2/0/15/982before.gif) 

#### Added: multivalue field – updated display
We’ve updated the display of the multivalue field. Changes include adjustments to field height, chip size, folder icon display, and more to ensure visual consistency with other field types.

#### Fixed: multivalue field – correct display of values
We've improved the logic behind displaying values in multivalue fields, ensuring that each row now shows its own correct data, regardless of the selected row.

#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.15)

### CXBOX ([Core Ui](https://github.com/CX-Box/cxbox-ui/releases/tag/2.6.1))

#### Fixed: Error popups were not shown for fileUpload
Error popups were not shown when for fileUpload an error requiring user notification occurred — the message was logged to the console.
Now the popup is displayed with the error text.

=== "After"
    ![after987.png](v2/0/15/after987.png)
=== "Before"
    ![before987.png](v2/0/15/before987.png)

#### Other Changes
See [cxbox-ui 2.6.1 changelog](https://github.com/CX-Box/cxbox-ui/releases/tag/2.6.1).


### CXBOX 4.0.0-M19 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M19))

We have released a new 4.0.0-M19 CORE version.
#### Fixed: Missing roles in the getSessionUserRoles
Added handling for the situation of missing roles in the getSessionUserRoles method.

=== "after"
    ![afterGetSessionUserRole.png](v2/0/15/afterGetSessionUserRole.png)
=== "before"
    ![beforeGetSessionUserRole.png](v2/0/15/beforeGetSessionUserRole.png)

#### Fixed: Incorrect behavior of getCurrentValue with @JsonSerialize
We fixed the incorrect behavior of getCurrentValue with fields annotated with @JsonSerialize.

=== "after"
    ![afterGetCurrentValue.png](v2/0/15/afterGetCurrentValue.png)
=== "before"
    ![beforeGetCurrentValue.png](v2/0/15/beforeGetCurrentValue.png)

#### Fixed: Logic for @ElementCollection annotation has been changed
The logic for searching fields in the database with the @ElementCollection annotation has been changed:

If a DTO field is annotated with @SearchParameter(name = "joinTable.elementCollectionField"), then filtering will perform a join of the entities that are present in the chain.

Example of a query for count:
```sql
select count(rt_1.id)
    from root_entity rt_1
where rt_1.id in ((select rt_2.id
        from root_entity rt_2
            join join_table jt on jt.id = rt_2.join_table_id
            join element_collection_table ect on jt.id = ect.join_table_id
            where ect.value in ))
```
#### Other Changes
See [cxbox 4.0.0-M19 changelog](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M19).


### CXBOX [plugin](https://plugins.jetbrains.com/plugin/19523-platform-tools).

We have released two versions - 2.0.0, 1.9.0

#### Added: IntelliJ 2025.2+ support added. (with 1.9.0)
IntelliJ 2025.2+ support added.

#### Added: Added generation bc from widget (with 2.0.0)
Added generation bc from widget.

![createBc.png](v2/0/15/createBc.png)

You can create a new Service, Entity, or DTO based on the name of your BK, or you can use existing Services, Entities, or DTOs

Select Parameters:

![popupCreateBc.png](v2/0/15/popupCreateBc.png)

Example:

![createBc.gif](v2/0/15/createBc.gif)

#### Added: Added to check the sum of span values in options.layout.rows.cols  (with 2.0.0)
Form and Info widgets, a validation was added to check that the sum of span values in options.layout.rows.cols does not exceed the grid limit (24)

![optionsum.png](v2/0/15/optionsum.png)

#### Fixed: Incorrect triggering of inspection for ss (with 1.9.0)
We fixed the `SearchParameterAnnotationCorrectEndingInspection`, which was working incorrectly for the `multipleSelect` field.

=== "after"
    ![afterss.png](v2/0/15/afterss.png)
=== "before"
    ![beforess.png](v2/0/15/beforess.png)

### CXBOX [documentation](https://doc.cxbox.org/)  

#### Added: widget GroupingHierarchy - Aggregate
We have provided a description of Aggregate widget `GroupingHierarchy` [Aggregate](https://doc.cxbox.org/widget/type/groupinghierarchy/groupinghierarchy/#data-aggregation)   

#### Added: Multi-upload files
We have provided a description of [Multi-upload files](https://doc.cxbox.org/widget/type/property/bullupload/bulkupload/).

