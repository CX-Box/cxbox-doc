# Show condition
The `showCondition` is used to define the availability or visibility of the widget dynamically.
The `showCondition` in configuration represents the condition under which the widge will be made visible to the user. 
It controls whether the widget appears on the user interface based on the value of a specific field in another or currentbusiness component.

* `no show condition - recommended`: widget always visible
* `show condition by current entity`: condition can include boolean expression depending on current entity fields. Field updates will trigger condition recalculation only on save or if field is force active
* `show condition by parent entity`: condition can include boolean expression depending on parent entity. Parent field updates will trigger condition recalculation only on save or if field is force active shown on same view

!!! tips
    It is recommended not to use `Show condition` when possible, because wide usage of this feature makes application hard to support.

!!! info
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3184/view/myexample3183hiddenparentchild ){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/showcondition/hiddenbc){:target="_blank"}
 
    Child entity data is loaded even when the parent is hidden based on the show condition.

## Structure showCondition

```json
"showCondition": {
    "bcName": "myexample",
    "params": {
        "fieldKey": "customFieldShowCondition",
        "value": true
    }
}
```
 
* **"bcName"**
   
Description:  [BusinessComponent](/environment/businesscomponent/businesscomponent/) that condition described below applies to.

Type: String(required).

* **"fieldKey"**

Description: Name field with show condition.

Type: String(required).

* **"value"**

Description:  Value of the field  for the show condition to be met..

Type: String/boolean/number/null (required).

## How does it look? 

* [Form widget](/widget/type/form/form/#howdoesitlook)
* [Info widget](/widget/type/info/info/#howdoesitlook)
* [List widget](/widget/type/list/list/#howdoesitlook)
* Form Popup widget - not applicable 
* AdditionalInfo widget - not applicable
* Statistics blocks widget - not applicable
* PickListPopup widget - not applicable


## How to add?

* [Form widget](/widget/type/form/form/#howtoadd)
* [Info widget](/widget/type/info/info/#howtoadd)
* [List widget](/widget/type/list/list/#howtoadd)
* Form Popup widget - not applicable
* AdditionalInfo widget - not applicable
* Statistics blocks widget - not applicable
* PickListPopup widget - not applicable

## Deprecated functions

**showCondition.isDefault** marked depricate release cxbox-4.0.0-M9

**showCondition.sequence** marked depricate release cxbox-4.0.0-M9 

**showCondition.multipleParams** marked depricate release cxbox-4.0.0-M9

**showCondition.params.valueList** marked depricate release  cxbox-4.0.0-M9
 