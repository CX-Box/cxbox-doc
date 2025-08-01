# Screen
!!! warning line end "Work in progress"   

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