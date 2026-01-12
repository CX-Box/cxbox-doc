# 2.0.0
## Added: IntelliJ 2025.2+ support added. (with 1.9.0)
IntelliJ 2025.2+ support added.
 
## Added: Added generation bc from widget (with 2.0.0)
Added generation bc from widget.

![createBc.png](../new/v2.0.15/createBc.png)

You can create a new Service, Entity, or DTO based on the name of your BK, or you can use existing Services, Entities, or DTOs

Select Parameters:

![popupCreateBc.png](../new/v2.0.15/popupCreateBc.png)

Example:

![createBc.gif](../new/v2.0.15/createBc.gif)

## Added: Added to check the sum of span values in options.layout.rows.cols  (with 2.0.0)
Form and Info widgets, a validation was added to check that the sum of span values in options.layout.rows.cols does not exceed the grid limit (24)

![optionsum.png](../new/v2.0.15/optionsum.png)

## Fixed: Incorrect triggering of inspection for ss (with 1.9.0)
We fixed the `SearchParameterAnnotationCorrectEndingInspection`, which was working incorrectly for the `multipleSelect` field.

=== "after"
    ![afterss.png](../new/v2.0.15/afterss.png)
=== "before"
    ![beforess.png](../new/v2.0.15/beforess.png)
 