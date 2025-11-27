# `setHidden()`
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5010){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/repository/metabuilder/buildrowdependentmeta/sethidden/basic){:target="_blank"}

The `setHidden()` method sets the hidden state for the specified DTO fields.

```java
public final void setHidden(DtoField<? super T, ?>... fields)
```

Parameters:

* `fields` – fields the DTO fields

Applies to:

*   [AdditionalInfo widget](widget/type/additionalinfo/additionalinfo)  
*   [Form widget](/widget/type/form/form) 
*   [FormPopup widget](/widget/type/formpopup/formpopup)   
*   [Info widget](/widget/type/info/info) 
 

### How does it look?
![basic_setHidden.gif](basic_setHidden.gif)

!!! info
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5019){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/sethidden){:target="_blank"}

    *Field Handling in Table-Type Widgets*

    Applies to:

    * [AdditionalList widget](/widget/type/additionallist/additionallist)
    * [AssocListPopup widget](/widget/type/assoclistpopup/assoclistpopup)
    * [GroupingHierarchy widget](/widget/type/groupinghierarchy/groupinghierarchy)
    * [List widget](/widget/type/list/list) 
    * [PickListPopup widget](/widget/type/picklistpopup/picklistpopup)

    1.Dynamic field hiding (setHidden)
    
    For all table-type widgets, dynamic field hiding via setHidden does not affect which columns are shown in the table.
    setHidden may work inside create/edit forms (if the widget has them), but it cannot change the visible columns of the table itself.
    
    2.Controlling table columns (fields in widget.json)
    
    The set of visible table columns is defined only by the fields array in widget.json.
    No runtime changes (setHidden, conditions, roles, etc.) can modify the column set.
    
    **Behavior by widget type** : [GroupingHierarchy widget](/widget/type/groupinghierarchy/groupinghierarchy), [List widget](/widget/type/list/list) 
 
    In create / edit mode (<create> / <edit>), the fields array affects only the create/edit form.
    
    It does not affect which columns are shown in the list.
    
    **Behavior by widget type** [AdditionalList widget](/widget/type/additionallist/additionallist)
    
    In read mode (<read>), the fields array does not affect either the table or the view form.
    The behavior is fixed and defined by the widget's implementation.

    Example for all type widgets:
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5019){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/sethidden){:target="_blank"}

## How to add?
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5010){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/repository/metabuilder/buildrowdependentmeta/sethidden/basic){:target="_blank"}

??? Example

    **buildRowDependentMeta** 
     ```java
     --8<--
     {{ external_links.github_raw }}/repository/metabuilder/buildrowdependentmeta/sethidden/basic/MyExample5010Meta.java:buildRowDependentMeta
     --8<--
     ```
 
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample5010){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/repository/metabuilder/buildrowdependentmeta/sethidden/basic){:target="_blank"}
 