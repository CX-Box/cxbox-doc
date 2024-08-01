# Filtration
!!! warning line end "Work in progress"
<!-- 
## Filter
Filtration

by fields

by fulltextsearch

by filter group

by personal filter group

каждый кейс для ВСЕХ типов виджетов поддерживающих фильтрацию
List | PickList | Assoc | Grouping Hierarhy

The system has the ability to filter recording by value in the field. For this, it is necessary to indicate that this field is allowed to filter in FieldMetaBuilder, and also indicate in the DTO the @SearchParameter annotation for the field that is being searched.

### Filter widget:

It is possible to display the necessary filters on a specific widget immediately after loading the view. Currently, such filters cannot be removed from the widget's filter panel.
You can add filters to different fields at the same time. After adding a filter to the widget field, a filter object is created in screen meta.

### Filter types

The system has the ability to filter for entries by value in the field. To do this, you must indicate that this field is allowed to filter in FieldMetaBuilder, and also indicate in the DTO the @SearchParameter annotation for the field that is being searched.


Different types of fields have different filtering operations for field records.

Filter available column types:

| Field | Filter type
|:---|:---|
| **input** | contains
| **text** | contains
| **checkbox** | specified
| **dictionary** | equalsOneOf
| **multivalue** | equalsOneOf
| **number** | equals
| **date** | equals
| **dateTime** | equals
| **dateTimeWithSeconds** | equals
| **pickList** | equals
| **inlinePickList** | equals
| **percent** | equals
| **money** | equals
| **multifield** | equals
| **default (other)** | equals  

Description supported Filter Operations:

| Filter type | Description
|:---|:---|
| **contains** | values containing specified
| **specified** | certain values
| **equalsOneOf** | equal to one of these
| **equals** | equal values

### Multivalue field filter specification
---

Filtering fields of type `multivalue` is implemented not like other types. This type of filter pass filter field keys
in the url parameters, when other types pass values directly. Filtered values keys are assigned from AssocListPopup widget,
where the user marked the necessary entries.

Popup widget should be added to the some view. Widget with `multivalue` field filter should have additional keys in the field meta.

Addition widget meta keys for `multivalue` field popup:  
`popupBcName: string` - name BC popup  
`assocValueKey: string` - field key which key values will be filtered  
`associateFieldKey: string` - field key to be added to the filter


Example widget field meta that has filter by multivalue field:
```json
{
  "id": 1111111,
  "name": "Widget Name",
  "title": "Title",
  "type": "Form",
  "bc": "testBcName",
  "fields": [
    ...
    {
      "label": "Field Name",
      "key": "fieldKey",
      "type": "multivalue",
      "popupBcName": "popupAssocBcName",
      "assocValueKey": "popupValueFieldKey",
      "associateFieldKey": "fieldKey"
    }
    ...
  ],
  "axisFields": [],
  "chart": [],
  "options": {}
}
```
 -->