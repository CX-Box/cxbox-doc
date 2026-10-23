# Widget basics
Every widget is described in a **_.widget.json_** file. The common properties of all widget types are described below; the properties of a widget type are described in the article of this type, see [Widgets](/widget/type/widget/).

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
 