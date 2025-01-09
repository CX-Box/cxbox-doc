# Plugin
* cxbox/intellij-plugin 1.7.7 [Jetbrain
* s Marketplace](https://plugins.jetbrains.com/v209/19523-platform-tools/versions/stable/653424), [cxbox-intellij-plugin.zip](https://drive.google.com/uc?export=download&id=1qKMRmyrv4NUiJF9No46ffh83DRVz-PDp)

# v2.0.9

## Intellij 2024.3+ support

## Autocomplete, Ctrl-click navigation and inspection for @SearchParameter
Autocomplete, Ctrl-click navigation and inspection for @SearchParameter name parameter containing path to Hibernate entity field. Inspection highlights 2 simple but usefully cases: not existing fields references (most common error) and not finished path (expression not ending with hibernate @Column field)

* Autocomplete:
![autocomplete.gif](v209/autocomplete.gif)

* Ctrl-click navigation
![navigation.gif](v209/navigation.gif)

 * Inspection
![inspection.gif](v209/inspection.gif)

* Refactoring
![refactor.gif](v209/refactor.gif)

## Actions in .widget.json 
Autocomplete, Ctrl-click navigation and inspection for Actions in .widget.json -> options -> actionGroups -> include. Now available without downloading sources with maven!

## Plus icon and code generation
We can now generate java boilerplate for new action and navigate to it immediately!
![actions.gif](v209/actions.gif)

## **Actions - `string` in .widget.json support:**

### Ctrl-click navigation
Service  -> .widget.json, .widget.json -> Service:
  ![navigation_action.gif](v209/navigation_action.gif)

### Autocomplete
![autocomplete_action.gif](v209/autocomplete_action.gif)

### Inspection
![inspection_action.gif](v209/inspection_action.gif)

### Refactoring
![refactoring_action_string.gif](v209/refactoring_action_string.gif)

## **Actions - `Enum` in .widget.json support:**

### Ctrl-click navigation.
Service  -> .widget.json, .widget.json -> Service:
![navigation_action_enum.gif](v209/navigation_action_enum.gif)

### Autocomplete
![autocomplete_action_enum.gif](v209/autocomplete_action_enum.gif)

### Inspection
![inspection_action_enum.gif](v209/inspection_action_enum.gif)

### Refactoring
![refactoring_action_enum.gif](v209/refactoring_action_enum.gif) 

## Actions - `java constant`  in .widget.json support:

### Ctrl-click navigation
Only .widget.json -> Service :
![navigation_action_java_const.gif](v209/navigation_action_java_const.gif)

### Autocomplete
![autocomplete_java_const.gif](plugin%2Fautocomplete_java_const.gif)

### Inspection
![inspection_java_const.gif](v209/inspection_java_const.gif)

## Inspection viewName
Inspection that checks viewName is unique per screen
![unique_view.png](v209/unique_view.png)

Inspection that checks viewName is unique per screen (.screen.json -> navigation correctness), when type = standard is set (we skip this checks in other cases for backward compatibility with project customizations). We check:
## Inspection that checks popupBcName in widget.json -> fields
![picklist.png](v209/picklist.png)

Inspection that checks popupBcName in widget.json -> fields must be child for owning widget bc. Inspection checks this only for fields with type picklist
## Inspection that checks actionGroups in widget.json
![action_group.png](v209/action_group.png)

Inspection that checks actionGroups in widget.json location (e.g. it is located in options tag)

# v2.0.7
## *.widget.json - auto-completion and navigation for `actionKey`

Previous plugin versions provided navigation for actions referenced in `options->actionGroups` of .widget.json.
In this release we added same feature for actions referenced in `options->buttons->actionKey` tag of .widget.json used for files drag-and-drop configuration.

### Ctrl-click navigation
![navigation_actionKey.gif](v207/navigation_actionKey.gif)

### Autocomplete
![autocomplete_actionKey.gif](v207/autocomplete_actionKey.gif)

### Inspection
![inspection_actionKey.gif](v207/inspection_actionKey.gif)

### Plus icon and code generation
![plus_actionKey.gif](v207/plus_actionKey.gif)

### Refactoring
![refactoring_actionKey.gif](v207/refactoring_actionKey.gif)

# v2.0.5
## Fix for filtering fields of Type Hint
The `SearchParameter` annotation was added to `Hint` fields in the DTO, enabling proper filtering functionality.
![hint_ss.gif](v205/hint_ss.gif)

## Added inspection for widget references
1. Reference and inspection for `option.create.widget` and `option.edit.widget`  
   1.1 Added references in `.widget.json` for `option.create.widget` and `option.edit.widget` to the `name` field, enabling autocomplete, navigation to usages, definition, and rename refactoring.  
      ![create-edit-autocomplete.gif](v205/create-edit-autocomplete.gif)

   1.2 Error and warning inspections added for invalid widget types and missing references.  
      ![create-edit-inspection.gif](v205/create-edit-inspection.gif)

2. Reference and inspection for `confirmWithCustomWidget`  
   2.1 Implemented references for `confirmWithCustomWidget` method arguments to widgets in `.widget.json`, with the same autocomplete, navigation, and refactoring functionality.  
   2.2 Error and warning inspections added for invalid widget types and missing references.
   ![confirm_with_custom_widget.gif](v205%2Fconfirm_with_custom_widget.gif)
3. Introduced the `@WidgetName` annotation in the core, which checks the widget type via the `typePostfix` parameter to ensure the correct type is used.
4. Expanded coverage of inspections and autocompletion for methods where arguments are annotated with `@WidgetName`.  
   ![widgetName_reference&inspection](v2.0.5/widgetName_reference&inspection.gif)  

