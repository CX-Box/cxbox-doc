# 1.8.0

## Added: IntelliJ 2025.1+ support

Installing the *Platform Tools* Plugin

The plugin now has **separate builds** for different versions of JetBrains IDEs. Make sure the correct update repository is configured.

1) Open the Plugin Manager

* In your JetBrains IDE, go to `Help → Find Action`
* Type `Plugins` and open the corresponding option

2) Add the Plugin Repository

* In the Plugins window, click the ⚙️ (gear icon) → `Manage Plugin Repositories...`
* Click ➕
* Enter the following URL:
  ```
  https://document.cxbox.org/plugin/updatePlugins.xml
  ```

* Click **OK**

3) Install the Plugin

* Switch to the `Marketplace` tab
* Search for **Platform Tools**
* Click **Install**
* After installation, click **OK**

4) Restart the IDE

## Added: Code generation support added for fields with type <code>Time</code> in <code>.widget.json</code>.<br>

Works with [core 4.0.0-M17](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M17) and the versions above.

### Code Generation

Added support for code generation of fields with the `time` type. You can now:

* Generate a `time` field with the default format `hh:mm:ss`;
* Specify a custom time format by selecting the desired pattern from the list of supported formats.

=== "time"
    ![time_field.gif](../new/v2.0.14/timeField.gif)
=== "time with format"
    ![time_field_format.gif](../new/v2.0.14/timeFieldFormat.gif)

### Autocomplete

Autocomplete is now available for `time` fields. When entering a format, you'll see a list of **officially supported patterns**,
making it easier and faster to configure the desired time format.

![format_time_example.png](../new/v2.0.14/formatTtimeExample.png)

## Added: type checking for fields containing <code>pickMap</code>
For fields containing <code>pickMap</code>, type checking was added to ensure Java type consistency of <code>pickMap</code> parameters (excluding the <code>id</code> field).

**Validation is implemented for the following field types:**

* `inline-pickList`
* `pickList`
* `suggestionPickList`

![pickMap_check.png](../new/v2.0.14/pickMapCheck.png)

## Added: inspection and quick-fix support for the new API
As part of the [core 4.0.0-M15](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M15) release, used Lombok’s @RequiredArgsConstructor and @Getter (meta,dao)
for AnySourceVersionAwareResponseService and @Getter (meta) VersionAwareResponseService instead of explicitly writing a constructor.
Added a quick-fix for the plugin to ensure compatibility with the new API and simplify the migration to the updated service implementation.

![new_api_service.gif](../new/v2.0.14/newApiService.gif)

## Added: <code>@SearchParameter</code>: if no explicit parameter is defined
Now, if no parameter is specified for @SearchParameter,  through to the entity with the corresponding field name.

![searchParameter.gif](../new/v2.0.14/searchParameter.gif)

## Added: Autocomplete, Ctrl-click navigation and inspection for defaultView
Autocomplete, Ctrl-click navigation and inspectio support added for the <code>defaultView</code> property in <code>.screen.json</code>

### Autocomplete:
![autocomplete.gif](../new/v2.0.14/autocomplete.gif)

### Ctrl-click navigation
![navigation.gif](../new/v2.0.14/navigation.gif)

### Inspection
![inspection.gif](../new/v2.0.14/inspection.gif)

### Refactoring
![refactor.gif](../new/v2.0.14/refactor.gif)

## Fixed: code generation for fields with type <code>Picklist</code> and <code>inline-pickList</code>
For fields with type <code>Picklist</code> and <code>inline-pickList</code> in <code>.widget.json</code> code generation fixed:

* **Field filtering added** to the popup for selecting fields when creating a picklist.
  Now only fields of the following types are displayed:

   * `String`
   * `LocalDateTime`
   * `Long`
   * `Double`
   * `Enum`
   * `Dictionary extension`
   * `Boolean`

* **Autogeneration of picklist configuration** is now supported **only** for the above simple field types.
  Other field types can be added manually via the picklist widget.

> **Autogeneration message:**
> *Autogeneration is supported for simple field types: String, LocalDateTime, Long, Double, Enum, Dictionary extension, Boolean. Other types can be added manually via the picklist widget.*

![popupCreatedPicklist.png](../new/v2.0.14/popupCreatedPicklist.png)
 