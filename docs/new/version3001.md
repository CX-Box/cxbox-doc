# 3.0.1

* [cxbox/demo 3.0.1 git](https://github.com/CX-Box/cxbox-demo/tree/v.3.0.1), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v.3.0.1)

* [cxbox/core 5.0.2 git](https://github.com/CX-Box/cxbox/tree/cxbox-5.0.2), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-5.0.2), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/5.0.2)

* [cxbox-ui/core 2.8.2 git](https://github.com/CX-Box/cxbox-ui/tree/2.8.2), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.8.2), [npm](https://www.npmjs.com/package/@cxbox-ui/core/v/2.8.2)

* [cxbox/code-samples 3.0.1 git](https://github.com/CX-Box/cxbox-code-samples/tree/v.3.0.1), [release notes](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v.3.0.1)

## **Key updates August 2026**

### CXBOX ([Demo](https://demo.cxbox.org))  

#### Added: Tree - NEW widget type!  
<!-- CXBOX-1341 -->  

We’ve added a new Tree widget for displaying data in a tree-like structure.

The widget is designed for working with large data sets and supports any number of nesting levels. Data is loaded on demand using lazy loading, so the entire data set does not need to be loaded at once. Initially, only the root-level rows are loaded. Upon expanding the nodes, child rows are loaded. The More option allows the user to load the next page of rows.  

![CXBOX-1341_tree.png](v3.0.1/CXBOX-1341_tree.png)

The Tree widget supports the main functionality available in the List widget, including:

* actions
* filtering 
* pagination
* parent-child relation
* search  

Search and filtering results can be displayed in two modes:

* Collapse - only matching rows are highlighted and displayed, while the user can still navigate through the tree, expand nodes.  
* Hide - only matching rows are highlighted and displayed, navigation through the tree is not supported.  

=== "collapse" 
    ![CXBOX-1341_tree_collapse.png](v3.0.1/CXBOX-1341_tree_collapse.png)
=== "hide"  
    ![CXBOX-1341_tree_hide.png](v3.0.1/CXBOX-1341_tree_hide.png)

When matching rows are located deep in the tree, the path can be not fully displayed (for compact display reasons). The number of displayed parent nodes can be configured, and upper nodes can be loaded when needed to view the whole path.  

<!--TODO>> path not fully restored picture -->

!!! info  
    Detailed documentation for the [Tree](https://doc.cxbox.org/widget/type/tree/tree/) widget will be available soon in our official documentation - stay tuned!  

#### <a id="pickTree">Added: pickTree - NEW field type!</a>
<!-- CXBOX-1341 -->  

We have added a new pickTree field type for selecting a single value from tree-like data. The new field type triggers the new PickTreePopup widget.

![CXBOX-1341_pickTree.gif](v3.0.1/CXBOX-1341_pickTree.gif)

For more information about the PickTreePopup widget, see [PickTreePopup](#PickTreePopup) widget.

!!! info  
    Detailed documentation for the [pickTree](https://doc.cxbox.org/widget/fields/field/picktree/picktree/)  field will be available soon in our official documentation - stay tuned!

####  <a id="PickTreePopup">Added: PickTreePopup - NEW widget type!</a>
<!-- CXBOX-1341 -->  

We’ve added a new PickTreePopup widget for selecting a single value from data displayed in a tree-like structure.

PickTreePopup is a tree-based alternative to the existing [PickListPopup](https://doc.cxbox.org/widget/type/picklistpopup/picklistpopup/). 

PickTreePopup supports any number of nesting levels and lazy loading, making it suitable for working with large data sets.
Just like with the new Tree widget, the root-level rows are loaded first, while child rows are loaded when the user expands a node. Next pages of data can be loaded using the More option.  

![CXBOX-1341_pickTreePopup.png](v3.0.1/CXBOX-1341_pickTreePopup.png)

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

The PickTreePopup widget is opened from the new [pickTree](#pickTree) field.

!!! info
    Detailed documentation for the [PickTreePopup](https://doc.cxbox.org/widget/type/picktreepopup/picktreepopup/) widget will be available soon in our official documentation - stay tuned!

#### <a id="multivalueTree">Added: multivalueTree - NEW field type!</a>
<!-- CXBOX-1341 -->  

We have added a new multivalueTree field for selecting multiple values from tree-like data.

![CXBOX-1341_multivalueTree.gif](v3.0.1/CXBOX-1341_multivalueTree.gif)

It works similarly to the existing multivalue field, but opens the new [AssocTreePopup](#AssocTreePopup) widget, where users navigate the tree and select multiple values using checkboxes.

!!! info  
    Detailed documentation for the [multivalueTree](https://doc.cxbox.org/widget/fields/field/multivalueTree/multivalueTree/)  field will be available soon in our official documentation - stay tuned!

#### <a id="AssocTreePopup">Added: AssocTreePopup - NEW widget type!</a>

We’ve added a new AssocTreePopup widget for selecting multiple values from data displayed in a tree-like structure.

AssocTreePopup is a tree-based alternative to the existing AssocListPopup. It allows users to select multiple rows using checkboxes while keeping the tree structure visible.  

![CXBOX-1341_assocTreePopup.png](v3.0.1/CXBOX-1341_assocTreePopup.png)

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

The AssocTreePopup widget is opened from the new [multivalueTree](#multivalueTree) field.

!!! info  
    Detailed documentation for the [AssocTreePopup](https://doc.cxbox.org/widget/type/assoctreepopup/assoctreepopup/) widget will be available soon in our official documentation - stay tuned!

#### Added: text and richText fields - configurable height  
<!-- CXBOX-1350 -->  

We've added support for configuring the height of text and richText fields on widgets.  

The minimum and maximum number of rows can now be set separately for viewing and editing, making it easier to adjust the fields to the content and screen layout.   
=== "List widget"
    ![CXBOX-1350 List.png](v3.0.1/CXBOX-1350%20List.png)
=== "Info widget"
    ![CXBOX-1350 Info.png](v3.0.1/CXBOX-1350%20Info.png)
=== "Form widget"
    ![CXBOX-1350 Form.png](v3.0.1/CXBOX-1350%20Form.png)


#### Added: Default filter by saved group (`filter group`)
<!-- CXBOX-1382 -->  
A default filter can now be configured for a saved group (`filter group`).
The configured filter is automatically applied when the page is initialized and refreshed.

The default filter is marked with a **star ★**.

![CXBOX-1382 filter_group.png](v3.0.1/CXBOX-1382%20filter_group.png)

### Added: Button To default filter(s)
<!-- CXBOX-1382 --> 
The **`To default filter(s)`** button has been added next to the **`Clear N filter(s)`** button.

The **`To default filter(s)`** button allows users to restore the filters to the default values defined by the developer.

When resetting filters, the following priority is applied:

1. **`bc_property`** — filters defined using `bc_property`;
2. **`default filter group`** — filters defined in the default filter group.

The **`To default filter(s)`** button is displayed only default filters are configured for the page.

![CXBOX_1382 To_default_filters.gif](v3.0.1/CXBOX_1382%20To_default_filters.gif)

#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.3.0.1)

### CXBOX ([Core Ui](https://github.com/CX-Box/cxbox-ui/releases/tag/???2.8.1))
We have released a new ???2.8.1 CORE UI version.

#### Fixed: `encryptAndSign` for detached signatures
<!-- CXBOX-1383 --> 
Fixed an issue with the `encryptAndSign` operation when creating a detached signature.

Additional Base64 encoding has been removed for detached signatures. Previously, signatures created using `encryptAndSign` in detached mode could not be successfully verified by the Gosuslugi signature verification service.

Detached signatures can now be successfully verified on Gosuslugi.


### CXBOX 5.0.2 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-5.0.2))
We have released a new 5.0.2 CORE version.

#### Fixed: uniqueness check when saving a filter name
<!-- CXBOX-1361 --> 
Fixed an issue where the uniqueness constraint could not be correctly identified when using the `ru_RU.UTF-8` locale.
The uniqueness check is now handled correctly regardless of the system locale.

#### Fixed: CIB seven migration compatibility
<!-- CXBOX-1362 --> 

If you are planning to migrate from **Camunda 7 Community Edition to CIB seven** because the final **Camunda 7 Community Edition 7.24** release does not support **Spring Boot 4**, the core has been updated to simplify and streamline the migration process.

Previously, using `@EnableWebMvc` caused Spring to create `WebMvcConfigurationSupport`, which prevented `WebMvcAutoConfiguration` from being applied. This could lead to additional configuration requirements during migration.

The core has been updated to eliminate this issue, making migration to CIB seven more straightforward.
