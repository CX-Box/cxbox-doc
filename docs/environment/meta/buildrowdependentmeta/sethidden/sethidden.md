# `setHidden()`
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4901/view/myexample3420FA){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/other/forceactive2/anysource){:target="_blank"}

The `setHidden()` method Sets the hidden state for the specified DTO fields.

```java
public final void setHidden(DtoField<? super T, ?>... fields)
```

Parameters:

* `fields` – fields the DTO fields

Field Handling in Table-Type Widgets

Applies to:
List, AdditionalList, GroupingHierarchy (GH), StatsBlock, Line2D, Column2D, DualAxes2D, and list-like widgets inside pop-ups.

1. Dynamic field hiding (setHidden)

For all table-type widgets, dynamic field hiding via setHidden does not affect which columns are shown in the table.
setHidden may work inside create/edit forms (if the widget has them), but it cannot change the visible columns of the table itself.

2. Controlling table columns (fields in widget.json)

The set of visible table columns is defined only by the fields array in widget.json.
No runtime changes (setHidden, conditions, roles, etc.) can modify the column set.

Behavior by widget type
List / GroupingHierarchy (GH)

In create / edit mode (<create> / <edit>), the fields array affects only the create/edit form.

It does not affect which columns are shown in the list.

AdditionalList

In read mode (<read>), the fields array does not affect either the table or the view form.
The behavior is fixed and defined by the widget's implementation.

## How to add?
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample4901/view/myexample3420FA){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/other/forceactive2/anysource){:target="_blank"}

??? Example

    **buildRowDependentMeta** 

     ```java
     --8<--
     {{ external_links.github_raw_doc }}/other/forceactive2/anysource/MyExample3420Meta.java:buildRowDependentMeta
     --8<--
     ```

## How it works?

On the frontend side, a new tag `changedNow_` was introduced.
This tag stores only the fields **modified in the current user session**, before being sent to the backend.

=== "After row-meta/ (POST) (v2.0.14+)"
    ![new_rowmeta_post.png](new_rowmeta_post.png)
