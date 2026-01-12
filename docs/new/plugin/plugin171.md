# 1.7.1
## Fix for filtering fields of Type Hint
The `SearchParameter` annotation was added to `Hint` fields in the DTO, enabling proper filtering functionality.

## Added quick-fix for action builder api
You can choose to migrate actions either selectively or for the entire project to the new API.

Selectively:

![quickfixoneaction.gif](../new/v2.0.5/quickfixoneaction.gif)

For the entire project:

![quickfixallaction.gif](../new/v2.0.5/quickfixallaction.gif)

##  Added inspection for widget references
1. Reference and inspection for `option.create.widget` and `option.edit.widget`  
   1.1 Added references in `.widget.json` for `option.create.widget` and `option.edit.widget` to the `name` field, enabling autocomplete, navigation to usages, definition, and rename refactoring.  
   1.2 Error and warning inspections added for invalid widget types and missing references.  
   ![create&edit_reference&inspection](../new/v2.0.5/create&edit_reference&inspection.gif)
2. Reference and inspection for `confirmWithCustomWidget`  
   2.1 Implemented references for `confirmWithCustomWidget` method arguments to widgets in `.widget.json`, with the same autocomplete, navigation, and refactoring functionality.  
   2.2 Error and warning inspections added for invalid widget types and missing references.
   ![confirmWithCustomWidget_reference&inspection](../new/v2.0.5/confirmWithCustomWidget_reference&inspection.gif)
3. Introduced the `@WidgetName` annotation in the core, which checks the widget type via the `typePostfix` parameter to ensure the correct type is used.
4. Expanded coverage of inspections and autocompletion for methods where arguments are annotated with `@WidgetName`.  
   ![widgetName_reference&inspection](../new/v2.0.5/widgetName_reference&inspection.gif)

 



 