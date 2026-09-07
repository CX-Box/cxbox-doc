# 3.0.1

* [cxbox/demo 3.0.1 git](https://github.com/CX-Box/cxbox-demo/tree/v.3.0.1), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v.3.0.1)

* [cxbox/core 5.0.2 git](https://github.com/CX-Box/cxbox/tree/cxbox-5.0.2), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-5.0.2), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/5.0.2)

* [cxbox-ui/core 2.8.2 git](https://github.com/CX-Box/cxbox-ui/tree/2.8.2), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.8.2), [npm](https://www.npmjs.com/package/@cxbox-ui/core/v/2.8.2)

* [cxbox/code-samples 3.0.1 git](https://github.com/CX-Box/cxbox-code-samples/tree/v.3.0.1), [release notes](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v.3.0.1)

## **Key updates August 2026**

### CXBOX ([Demo](https://demo.cxbox.org))  

#### Added: Tree - NEW widget type!  

We’ve added a new Tree widget for displaying data in a tree-like structure.

The widget is designed for working with large data sets and supports any number of nesting levels. Data is loaded on demand using lazy loading, so the entire data set does not need to be loaded at once. Initially, only the root-level rows are loaded. Upon expanding the nodes, child rows are loaded. The More option allows the user to load the next page of rows.  

<!--TODO>> basic picture-->  

The Tree widget supports the main functionality available in the List widget, including:

* actions
* filtering 
* pagination
* parent-child relation
* search  

Search and filtering results can be displayed in two modes:

* Collapse - only matching rows are highlighted and displayed, while the user can still navigate through the tree, expand nodes.  
* Hide - only matching rows are highlighted and displayed, navigation through the tree is not supported.  

<!-- TODO>> 
=== "collapse"  
=== "hide"  
-->

When matching rows are located deep in the tree, the path can be not fully displayed (for compact display reasons). The number of displayed parent nodes can be configured, and upper nodes can be loaded when needed to view the whole path.  

<!--TODO>> path not fully restored picture -->

!!! info  
    Detailed documentation for the Tree widget will be available soon in our official documentation - stay tuned!  

#### Added: PickTreePopup - NEW widget type!  

We’ve added a new PickTreePopup widget for selecting a single value from data displayed in a tree-like structure.

PickTreePopup is a tree-based alternative to the existing [PickListPopup](https://doc.cxbox.org/widget/type/picklistpopup/picklistpopup/). Unlike the List-based PickListPopup, PickTreePopup supports any number of nesting levels and lazy loading, making it suitable for working with large data sets.

Just like with the new Tree widget, the root-level rows are loaded first, while child rows are loaded when the user expands a node. Next pages of data can be loaded using the More option.  

<!--TODO>> basic picture -->

The widget supports:

* single-row selection
* actions
* filtering 
* search
* pagination
* parent-child relations
* lazy loading

The selection behavior can be configured depending on the use case. The user can be allowed to select:

* nodes only
* leaf rows only
* both nodes and leaf rows

Just like in Tree widget, search and filtering results can be displayed in two modes: collapse and hide.  

The PickTreePopup widget is opened from the new pickTree and inlinePickTree fields.

!!! info  
    Detailed documentation for the PickTreePopup widget will be available soon. Stay tuned!  

#### Added: AssocTreePopup - NEW widget type!  

We’ve added a new AssocTreePopup widget for selecting multiple values from data displayed in a tree-like structure.

AssocTreePopup is a tree-based alternative to the existing AssocListPopup. It allows users to select multiple rows using checkboxes while keeping the tree structure visible.  

<!--TODO>> basic picture -->

The widget supports:

* multiple selection using checkboxes
* actions
* filtering and sorting
* search
* pagination
* parent-child relationships
* lazy loading 
* nodes/leaf rows/both nodes and leaf rows selection  

Selected values are displayed at the top of the popup.  

Search and filtering results can be displayed in two modes: collapse and hide.  

The AssocTreePopup widget is opened from the new multivalueTree field.

!!! info  
    Detailed documentation for the AssocTreePopup widget will be available soon in our official documentation - stay tuned!  

#### Added: pickTree- NEW field type!  

We have added a new pickTree field type for selecting a single value from tree-like data. The new field type triggers the new PickTreePopup widget.  

<!--TODO>> basic picture -->

For more information about the PickTreePopup widget, see PickTreePopup widget.  

!!! info  
    Detailed documentation for the pickTree field will be available soon in our official documentation - stay tuned!  

#### Added: inlinePickTree - NEW field type!  

We've added a new inlinePickTree field for selecting a single value from tree-like data.  

<!-- TODO>> basic picture -->

The field opens the new PickTreePopup widget, where users navigate the tree and select a value.  

!!! info  
    Detailed documentation for the inlinePickTree field will be available soon in our official documentation - stay tuned!  

#### Added: multivalueTree - NEW field type!  

We have added a new multivalueTree field for selecting multiple values from tree-like data.  

<!-- TODO>> basic picture -->

It works similarly to the existing multivalue field, but opens the new AssocTreePopup widget, where users navigate the tree and select multiple values using checkboxes.  

!!! info  
    Detailed documentation for the multivalueTree field will be available soon in our official documentation - stay tuned!

#### Added: text and richText fields - configurable height  

We've added support for configuring the height of text and richText fields on Form, List and Info widgets.  

The minimum and maximum number of rows can now be set separately for viewing and editing, making it easier to adjust the fields to the content and screen layout.   

<!-- TODO>> pictures readonly and editing-->

#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.3.0.1)

