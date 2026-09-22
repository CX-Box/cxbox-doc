# 3.0.2

### CXBOX 5.0.3 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-5.0.3))

#### Added: Drilldowns with field-based filter – hint field
<!-- CXBOX-1281 -->
The drilldown filter builder has a new method `fb.hint` for fields having `"type": "hint"` in *.widget.json.
It filters the target view by part of the value, case-insensitive (same as for `input`).

`buildRowDependentMeta`

```java
fields.setDrilldownWithFilter(
        MyExampleDTO_.customFieldHint, DrillDownType.INNER, "/screen/MyExample/view/MyExamplelist/", fc ->
        fc.add(
                CxboxMyExampleController.myexample,
                MyExampleDTO.class,
                fb -> fb.hint(MyExampleDTO_.customFieldHint, fields.getCurrentValue(MyExampleDTO_.customFieldHint).orElse(null))
        )
);
```
