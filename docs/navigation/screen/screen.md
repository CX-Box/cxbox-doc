# Screen
!!! warning line end "Work in progress"   

## Additional properties

### Screen Name Wrapping in Left Menu

When using the application, screen names in the left navigation panel can sometimes be long.
You can control how these names are displayed.

Screen names:

* remain on a single line. No line breaks are applied (Default behavior)
* can wrap to multiple lines if they do not fit within the left panel

#### How does it look?
=== "multiple lines"
    ![withSideBar.png](withSideBar.png)
=== "single line"
    ![withoutSideBar.png](withoutSideBar.png)

#### How to add?
??? Example
    
    | Value       | Behavior Description                                                                                                         |
    | ----------- | ---------------------------------------------------------------------------------------------------------------------------- |
    | **not set** | Screen names remain on a single line. No line breaks are applied.                                                            |
    | **none**    | Same as the default behavior: screen names stay on a single line.                                                            |
    | **auto**    | Screen names can wrap to multiple lines if they do not fit within the left panel width. There is no line length restriction. |

    **Step 1** Add the `sideBarWordBreak` parameter to `application.yml`

    ```yml
    cxbox:
        ui: 
            side-bar-word-break: auto
    ```

    **Step 2** Add the `sideBarWordBreak` parameter to `LoginServiceImpl`  

    ```java
	public Collection<SimpleDictionary> getFeatureSettings() {
		return Stream.of(
    						feature(
								UIProperties.SIDE_BAR_WORD_BREAK,
								uiProperties.getSideBarWordBreak()
						),
    ```


### Screen Search in Left Menu

The application allows controlling whether the screen search in the left navigation panel is displayed for a user. 

The screen search is :

* always visible when the left menu is expanded (Default behavior)
* not rendered in the expanded left menu for the user

#### How does it look?
=== "always visible"
    ![sideBarSearchEnabledTrue.png](sideBarSearchEnabledTrue.png)
=== "not rendered"
    ![sideBarSearchEnabledFalse.png](sideBarSearchEnabledFalse.png)
#### How to add?
??? Example
    
    | Value       | Behavior Description                                                                  |
    | ----------- | ------------------------------------------------------------------------------------- |
    | **not set** | Default behavior: the screen search is always visible when the left menu is expanded. |
    | **true**    | Same as default: the screen search is always visible.                                 |
    | **false**   | The screen search is not rendered in the expanded left menu for the user.             |

    **Step 1** Add the `sideBarSearchEnabled` parameter to `application.yml`

    ```yml
    cxbox:
        ui: 
            side-bar-search-enabled: true
    ```

    **Step 2** Add the `sideBarSearchEnabled` parameter to `LoginServiceImpl`  

    ```java
	public Collection<SimpleDictionary> getFeatureSettings() {
		return Stream.of(
 						feature(
								UIProperties.SIDE_BAR_SEARCH_ENABLE,
								uiProperties.getSideBarSearchEnabled()
						),
    ```
 
<!-- 
1. Define the Root Object:
    - Create a JSON object with the following properties: name, icon, order, title, and navigation.

2. Set Basic Properties:
    - name: A unique identifier for your file.
    - icon: A string representing the type of icon associated with this configuration (e.g., "calendar").
    - order: A numerical value that indicates the order or priority.
    - title: A descriptive title for the configuration.



## JSON structure
This JSON defines the structure of a navigation menu

```json
{
  "name": "myexample",
  "icon": "calendar",
  "order": 12,
  "title": "My example screen",
  "navigation": {
    "type": "standard",
    "menu": [
      
    ]
  }
}
```

Root Properties:

| Property     | Type   | Description                                       |
| ------------ | ------ | ------------------------------------------------- |
| `name`       | string | Unique identifier of the module.                  |
| `icon`       | string | Icon name used for the module (e.g., "calendar"). |
| `order`      | number | Display order of the module in the UI.            |
| `title`      | string | Title displayed in the UI.                        |
| `navigation` | object | Navigation settings for this module.              |

Navigation Properties:

| Property | Type   | Description                           |
| -------- | ------ |---------------------------------------|
| `type`   | string | Navigation style (e.g., `standard` ). |
| `menu`   | array  | Array of top-level menu sections.     |


## Sidebar Word Wrapping (`sideBarWordBreak`)

A new feature flag, `sideBarWordBreak`, has been added to the `featureSettings` object returned from the backend during user login.

This setting controls whether long screen names in the left-hand navigation menu will wrap onto multiple lines.
 
Available Values:

* `none` (default): No word wrapping is applied.
* `auto`: Enables automatic word wrapping for screen names in the sidebar.

If the screen name is too long to fit within the sidebar width, it will wrap onto the next line when `auto` is set.

### Behavior

| `sideBarWordBreak` Value | Sidebar Behavior                                         |
| ------------------------ | -------------------------------------------------------- |
| *Not provided*           | Default behavior: screen names do not wrap.              |
| `none`                   | Same as default: screen names do not wrap.               |
| `auto`                   | Long screen names automatically wrap onto the next line. |

### Example

If a screen name is too long for the current sidebar width and `sideBarWordBreak` is set to `auto`, it will appear like this:

```
Very Long Screen
Name Example
```
 -->