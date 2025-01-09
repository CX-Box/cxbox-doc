# Filtration
!!! warning line end "Work in progress"
 
* [by fields](#by_fields)
* [by fulltextsearch](#by_fulltextsearch) 
* [by filter group](#by_filter_group)
* by personal filter group

## <a id="by_fields">by fields</a>
The availability or unavailability of filtering operations for each field type see [Fields](/widget/fields/fieldtypes/).

Each field type requires a distinct filtering operation sent by the frontend.
Here are the standard field types with their respective filtering methods see [SearchOperation for filtering](/widget/fields/filtersearchoperation).

## <a id="by_fulltextsearch">by fulltextsearch</a>
`FullTextSearch` - when the user types in the full text search input area, then widget filters the rows that match the search query.

see [FullTextSearch](/widget/type/property/filtration/fulltextsearch/fulltextsearch/)

## <a id="by_filter_group">by filter group</a>
`Filter group` - a user-filled filter can be saved for each individual user.

see [Filter group](/widget/type/property/filtration/filtergroup/filtergroup/)
 
<!-- 
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