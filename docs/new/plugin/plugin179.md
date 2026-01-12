# 1.7.9

## Added: Run Inspections Button

We have added a Run Inspections button to the IntelliJ IDEA sidebar, enabling one-click execution of inspections across the entire project. The functionality automates the manual steps required to run inspections, eliminating the need to configure profiles or adjust settings.

![pluginRunInspections.gif](../new/../new/v2.0.12/pluginRunInspections.gif)

## Added: AdditionalInfo widget - fieldKey validation in *.widget.json

Added inspections for [AdditionalInfo](https://doc.cxbox.org/widget/type/additionalinfo/additionalinfo/) widget, following the same logic as [Info](https://doc.cxbox.org/widget/type/info/info/) widget. Now, if a `fieldKey` in `layout` is missing or does not reference a field from `fields`, an inspection warning is triggered.

![pluginAdditionalInfo.gif](../new/v2.0.12/pluginAdditionalInfo.gif)

## Added: Inspection for options -> create/edit -> widget in *.widget.json

Added an inspection to ensure that widgets referenced in `create` and `edit` parameters are present on the same view as the main widget. Missing widgets are automatically added to the view.

![pluginCreateEdit.gif](../new/v2.0.12/pluginCreateEdit.gif)

## Added: postAction drillDownAndWaitUntil - validation for successCondition_bcName

We have added a validation check to verify that the field specified in the successCondition_bcName parameter is present on the indicated bc in the drillDownAndWaitUntil postAction.

![drillDownAndWaitUntilCheck.gif](../new/v2.0.12/drillDownAndWaitUntilCheck.gif)
## Added: multipleSelect field - updated method for field auto-generation in *.widget.json

Now, when adding a multipleSelect field via the + button, the plugin automatically generates the necessary code. If the project's core version supports it, the generated code will use `setConcreteValues()` instead of `setDictionaryTypeWithCustomValues()` marked as **@deprecated** since 4.0.0-M12.

![multipleSelectGenerate.gif](../new/v2.0.12/multipleSelectGenerate.gif)
## Fixed: inlinePicklist field - parent bc check in *.widget.json

Fixed the inspection for `popupBcName` in *.widget.json, ensuring that it correctly checks that the referenced business component (bc) is a child to the parent widget's bc.

![inlinePickListCheck.gif](../new/v2.0.11/inlinePickListCheck.gif)

## Added: @SearchParam – enhanced inspection algorithm

We've improved the validation of the path to the filtered field, ensuring better compatibility with microservices (Anysource services).
Additionally, we resolved an issue affecting the inspection process in cases where the initial annotated field lacked an explicitly specified path.
 