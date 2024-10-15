# Widget
## Widget Types
* [Form widget](/widget/type/form/form) is a component for data viewing and editing. 
* [Info widget](/widget/type/info/info) is a component only for data viewing.
* [List widget](/widget/type/list/list) is list the general information for many records and present it in a way that is easily interpretable for users.
* [Form Popup widget](widget/type/formpopup/formpopup) is a component for additional field checks in popup and the ability to add information inside the popup.
* [AdditionalInfo widget](widget/type/additionalinfo/additionalinf) is a component only for data viewing. Widget is always located **on the left**.
* [Statistics blocks widget](widget/type/statblocks/statblocks)  is a  tool designed to display aggregated data in a visually accessible format.
* [PickListPopup widget](widget/type/pickListPopup/pickListPopup)
 
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
 