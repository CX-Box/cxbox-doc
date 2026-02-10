# v2.0.4

* [cxbox/demo 2.0.4 git](https://github.com/CX-Box/cxbox-demo/tree/v2.0.4), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v2.0.4)

* [cxbox/core 4.0.0-M6 git](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M6), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M6), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/4.0.0-M6)

* [cxbox-ui/core 2.0.0 git](https://github.com/CX-Box/cxbox-ui/tree/2.0.0), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.0.0), [npm](https://www.npmjs.com/package/@cxbox-ui/core/v/2.0.0)

## **Key updates August 2024**
### CXBOX ([Demo](https://github.com/CX-Box/cxbox-demo))
#### New version core
New version core  CXBOX 4.0.0-M6

#### File API authorization 
![authorization.gif](v2.0.4/authorization.gif)

Added: File upload is now available only for authorized users. An authorization token is passed while uploading a single file or multiple files. Otherwise, file upload option will not be available. The same logic is applicable to file preview and file download processes. 
#### Creating a Line in the InlinePickList Popup 

![inlinePickListCreate.gif](v2.0.4/inlinePickListCreate.gif)

Added: We have extended the possibility of creating a new line in [picklist](https://doc.cxbox.org/widget/fields/field/pickList/pickList/) and [inline-picklist](https://doc.cxbox.org/widget/fields/field/inlinePickList/inlinePickList/) fields. One can now create new row in picklist/inline-picklist during parent edit/creation process (Parent force save is not triggered anymore. As a result required fields do not block row creation in picklist anymore, parent changes can be correctly cancelled even after new row creation in picklist and so on). New special method for fetching parent DTO field with single line of code introduced

#### Tab functionality 

Added: we added type tag for different tab schemas (just like field types and widget types). Default tab schema has type='standard' now. Few fixes in it:

1) Fixed: resolved an error that occurred when navigating between screens via a link to a related entity on the same screen

![gettingContext.gif](v2.0.4/gettingContext.gif)

2) Fixed: the work of third-level tabs

![contextTab3and4.gif](v2.0.4/contextTab3and4.gif)

[Fulltextsearch](https://doc.cxbox.org/widget/type/property/filtration/filtration/#by-fulltextsearch) 

3) Fixed: default display hidden view of the first level

We have added a restriction for displaying hidden views in navigation. Now, if a hidden view is specified in the metadata, it will not be displayed when the screen is opened.
For the application to work correctly, the following rule must be observed: at each navigation level (aggregate or single), there must be at least one visible view. 

#### Added fulltext search option in pop-up (pickListPopup and inlinePickList)

![fullTextSearch.gif](v2.0.4/fullTextSearch.gif)

A search bar has been added.When the user types in the full text search input area, then widget filters the rows that match the search query (search criteria is configurable and will usually check if at least one column has corresponding value). This feature makes it easier for users to quickly find the information they are looking for within a List widget.

#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.4)

### <a id="CXBOXCORE">CXBOX 4.0.0-M6</a>  ([Core](https://github.com/CX-Box/cxbox))
#### Creation of new record directly in Popup (picklist, inlinePicklist and so on)
* Added: abstractAnySourceResponseService and AbstractResponseService now have new method ```getParentField(<PARENT_DTO>_.<parent_field>, bc)``` to get Parent bc DTO field with single line of code
* Added: support of creation new records directly in popups (picklist and so on) without force saving parent bc. AbstractAnySourceResponseService and AbstractResponseService can be used for this popups services with the only restriction -- one must use new method ```getParentField``` instead of ```repository.findById(bc.getParentIdAsLong())``` to get parent values if needed
* Fixed: BcStateAware now cleans cache only for exact bc (for user session), when terminal action request completed (instead of whole cache for user session)
#### LOV sorting in filter and edit dropdowns by display_order
* Added: java doc for ```setDictionaryTypeWithAllValues``` and ```setAllFilterValuesByLovType``` methods describing, that this methods sort items by display_order, then by key. Deleted duplication methods ```setAllFilterValuesByLovTypeOrdered``` and ```setDictionaryTypeWithAllValuesOrdered```
* Fixed: ```setAllFilterValuesByLovType``` method signature - redundant argument fields removed
* Fixed: ```setDictionaryTypeWithAllValues``` method signature - redundant argument fields removed
* Fixed: LOV dictionary loader :
  NOW: sorting items by display_order, then by key (display_order can be null)
  WAS: sorting items by display_order (display_order could not be null)


#### Other Changes
see [cxbox changelog](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M6)

