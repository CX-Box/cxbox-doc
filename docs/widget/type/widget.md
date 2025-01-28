# Widget
<!-- 
## Widget Type Family
* Info: [Base widget - Info widget](/widget/type/info/info.md) 
* Form: [Base widget - Form widget](/widget/type/form/form)
* List: [Base widget - List widget](/widget/type/list/list) 
* GroupingHierarchy: [Base widget - GroupingHierarchy widget](docs/widget/type/groupinghierarchy/groupinghierarchy)
* StatsBlock: [Base widget - Statistics blocks widget](widget/type/statblocks/statblocks)
* HeaderWidget
* LevelMenu
* Steps
-->

## Widget Types 
 
* [Form widget](/widget/type/form/form) is a component for data viewing and editing. 
* [Info widget](/widget/type/info/info.md) is a component only for data viewing.
* [List widget](/widget/type/list/list) is list the general information for many records and present it in a way that is easily interpretable for users.
* [AdditionalList widget](/widget/type/additionallist/additionallist.md) is list the general information for many records. Widget is always located **on the left**.* [AdditionalInfo widget](widget/type/additionalinfo/additionalinfo) is a component only for data viewing. Widget is always located **on the left**.
* [Statistics blocks widget](/widget/type/statblocks/statblocks) is a tool designed to display aggregated data in a visually accessible format.
* [PickListPopup widget](/widget/type/picklistpopup/picklistpopup) is a component that allows the user to select a value from a Popup list of entities.
* [AssocListPopup widget](/widget/type/assoclistpopup/assoclistpopup) is a popup component designed to the selection of multiple values.
* [FormPopup widget](/widget/type/formpopup/formpopup) is a component for additional field checks in popup and the ability to add information inside the popup.
* [GroupingHierarchy widget](/widget/type/groupinghierarchy/groupinghierarchy) presents shared information across multiple records, enabling rows to be grouped by one or more specified fields.

## Structure .widget.json

```json
{
  "name": "MyExampleForm",
  "title": "Title Form",
  "type": "Form",
  "bc": "myexample",
  "showCondition":{},
  "fields": [],
  "options": {}
}
```

* **"name"**

Description: This is a unique identifier for the show condition within the project.

Type: String(required).

Notes: This value must be unique across the project

* **"title"**

Description: Title for widget

Type: String(optional).

* **"type"**

The value for this widget is required to be "Form",

* **"bc"**

Description: [Business Component](/environment/businesscomponent/businesscomponent/)

Type: String(required).

*  **"showCondition"**

Description: Define the availability or visibility of the widget  dynamically. see more [showCondition](/widget/type/property/showcondition/showcondition)

Type: String(optional).

* **"fields"**

Description: Fields Configuration

Type: String(required).

* **"options"**

Description:  Defines the structure of the widget using rows and columns.

Type: String(required).
 