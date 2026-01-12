# 1.7.7

## Added: *.screen.json - inspection when "type" : "standard"

We have added inspections for screens that have explicitly set `"type"="standard"` in .screen.json. These include making sure each `viewName` is unique, detecting empty arrays. We have also improved view generation (triggered by `+` icon click)

## Added: *.widget.json - auto-completion and navigation for `actionKey`

Previous plugin versions provided navigation for actions referenced in `options->actionGroups` of .widget.json.
In this release we added same feature for actions referenced in `options->buttons->actionKey` tag of .widget.json used for files drag-and-drop configuration.

![actionKey.gif](../new/v2.0.7/actionKey.gif){width="800"}

## Added: *.widget.json - inspection for actionGroups location.

We have added an inspection for `actionGroups` tag in .widget.json to ensure it is located within `options`.

![actionGroupsLocation.gif](../new/v2.0.7/actionGroupsLocation.gif){width="800"}

## New: Intellij 2024.3+ support
Intellij 2024.3+ support
## New: Autocomplete, Ctrl-click navigation and inspection for @SearchParameter
Autocomplete, Ctrl-click navigation and inspection for @SearchParameter name parameter containing path to Hibernate entity field. Inspection highlights 2 simple but usefully cases: not existing fields references (most common error) and not finished path (expression not ending with hibernate @Column field)

* Autocomplete:
  ![autocomplete.gif](../new/v2.0.9/autocomplete.gif)

* Ctrl-click navigation
  ![navigation.gif](../new/v2.0.9/navigation.gif)

* Inspection
  ![inspection.gif](../new/v2.0.9/inspection.gif)

* Refactoring
  ![refactor.gif](../new/v2.0.9/refactor.gif)

## New. Actions in .widget.json
Autocomplete, Ctrl-click navigation and inspection for Actions in .widget.json -> options -> actionGroups -> include. Now available without downloading sources with maven!

### Plus icon and code generation
We can now generate java boilerplate for new action and navigate to it immediately!
![actions.gif](../new/v2.0.9/actions.gif)

### **Actions - `string` in .widget.json support:**

#### Ctrl-click navigation
Service  -> .widget.json, .widget.json -> Service:
![navigation_action.gif](../new/v2.0.9/navigation_action.gif)

#### Autocomplete
![autocomplete_action.gif](../new/v2.0.9/autocomplete_action.gif)

#### Inspection
![inspection_action.gif](../new/v2.0.9/inspection_action.gif)

#### Refactoring
![refactoring_action_string.gif](../new/v2.0.9/refactoring_action_string.gif)

### **Actions - `Enum` in .widget.json support:**

#### Ctrl-click navigation.
Service  -> .widget.json, .widget.json -> Service:
![navigation_action_enum.gif](../new/v2.0.9/navigation_action_enum.gif)

#### Autocomplete
![autocomplete_action_enum.gif](../new/v2.0.9/autocomplete_action_enum.gif)

#### Inspection
![inspection_action_enum.gif](../new/v2.0.9/inspection_action_enum.gif)

#### Refactoring
![refactoring_action_enum.gif](../new/v2.0.9/refactoring_action_enum.gif)

### Actions - `java constant`  in .widget.json support:

#### Ctrl-click navigation
Only .widget.json -> Service :
![navigation_action_java_const.gif](../new/v2.0.9/navigation_action_java_const.gif)

#### Autocomplete
![autocomplete_java_const.gif](v2.0.9%2Fautocomplete_java_const.gif)

#### Inspection
![inspection_java_const.gif](../new/v2.0.9/inspection_java_const.gif)

## New. Inspection viewName
Inspection that checks viewName is unique per screen
![unique_view.png](v2.0.9%2Funique_view.png)

Inspection that checks viewName is unique per screen (.screen.json -> navigation correctness), when type = standard is set (we skip this checks in other cases for backward compatibility with project customizations). We check:
## New. Inspection that checks popupBcName in widget.json -> fields
![picklist.png](../new/v2.0.9/picklist.png)

Inspection that checks popupBcName in widget.json -> fields must be child for owning widget bc. Inspection checks this only for fields with type picklist
## New. Inspection that checks actionGroups in widget.json
![action_group.png](../new/v2.0.9/action_group.png)

Inspection that checks actionGroups in widget.json location (e.g. it is located in options tag)
