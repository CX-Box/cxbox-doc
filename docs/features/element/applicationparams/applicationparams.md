# Application params
 
!!! warning line end "Work in progress"

## cxbox
### widget
#### fields
##### filter-by-range-enabled-default
This parameter allows you to choose the filtering display mode for the following data types:

* [Number](/widget/fields/field/number/number/#filtering)
* [Money](/widget/fields/field/money/money/#filtering)
* [Percent](docs/widget/fields/field/percent/percent/#filtering)
* [Date](/widget/fields/field/date/date/#filtering)
* [DateTime](/widget/fields/field/dateTime/dateTime/#filtering)
* [DateTimeWithSeconds](/widget/fields/field/dateTimeWithSeconds/dateTimeWithSeconds/#filtering)

Available filtering options:

1. **Range** – Filter by minimum and maximum values (e.g., from/to a date, amount, or number).
2. **Specific value** – Filter by a single selected value (e.g., an exact date, amount, or number).

The choice depends on whether you need to search within a range or match an exact value.

By default, filtration is carried out **by range**.
If you want to turn it off, indicate `cxbox.widget.fields.filter-by-range-enabled-default: false` in meta.
