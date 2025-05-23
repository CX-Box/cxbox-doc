# v2.0.1

* [cxbox/demo 2.0.1 git](https://github.com/CX-Box/cxbox-demo/tree/v.2.0.1), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.1)

* [cxbox/core 4.0.0-M3 git](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M3), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M3), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent)

* [cxbox-ui/core 2.0.0 git](https://github.com/CX-Box/cxbox-ui/tree/2.0.0), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.0.0), [npm](https://www.npmjs.com/package/@cxbox-ui/core)

* [cxbox/code-samples 2.0.1 git](https://github.com/CX-Box/cxbox-code-samples/tree/v2.0.1), [release notes](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v2.0.1)

## **Key updates July 2024**
###  CXBOX [plugin](https://plugins.jetbrains.com/plugin/19523-platform-tools)
We've updated the plugin from version 1.7.1 to version 1.7.4.
You have the latest features and improvements available.
#### Dynamically selects whether to use the Javax library or Jakarta
![jakarta.gif](v2.0.1/jakarta.gif)
Dynamically selects whether to use the Javax library or Jakarta depending on the version Hibernate 

#### Added quick-fix and check for correct filling for the "hidden" property
![hidden.gif](v2.0.1/hidden.gif)
For the "hidden" property in .widget.json, a quick-fix has been implemented, and inspection for correct filling has been added.

#### Added a check for correct filling  for the "title" property
![title.png](v2.0.1/title.png)
Property "title" inspection for correct filling in .widget.json for type widget "List" has been added.
 
#### Other Changes
see [cxbox-plugin changelog](https://plugins.jetbrains.com/plugin/19523-platform-tools/versions)

### CXBOX [documetation](https://doc.cxbox.org/)
#### Added getting started for developer
![getstart.png](v2.0.1/getstart.png)

This tutorial serves as an introduction to the fundamentals, guiding you through the creation of standard elements essential for initiating your project promptly.

see more [Getting started](https://doc.cxbox.org/gettingstarted/getstartedfordevelopers/)
#### Added creation examples for microservice
![microservices.png](v2.0.1/microservices.png)

We have included an overview of standard methodologies for working with microservices. 
Additionally, we have outlined a scenario where it is necessary to integrate with an existing microservice responsible for data operations.

see more [Microservices](https://doc.cxbox.org/features/element/microservices/microservices/)
#### Added creation examples for widgets
![widget.png](v2.0.1/widget.png)

We have included a description of how to work with the following types of widgets:

[Info](https://doc.cxbox.org/widget/type/info/info.md/):
Info widget is a component only for data viewing.

[Form](https://doc.cxbox.org/widget/type/form/form/):
Form widget is a component for data viewing and editing. Usually it shows multiple fields. Also, it can show available action

[List](https://doc.cxbox.org/widget/type/list/list/):
List widget is list the general information for many records and present it in a way that is easily interpretable for users.

[AdditionalInfo](https://doc.cxbox.org/widget/type/additionalinfo/additionalinfo/):
AdditionalInfo widget is a component only for data viewing. Widget is always located on the left.

[Statistics blocks](https://doc.cxbox.org/widget/type/statblocks/statblocks/):
Statistics blocks widget is a tool designed to display aggregated data in a visually accessible format. This data can be sourced either from a database or from external sources.
#### Added creation examples for fulltextsearch,Filter group
![fulltextsearch.png](v2.0.1/fulltextsearch.png)

We have included descriptions of the following filtering methods:

[Fulltextsearch](https://doc.cxbox.org/widget/type/property/filtration/filtration/#by-fulltextsearch) :
When the user types in the full text search input area, then widget filters the rows that match the search query (search criteria is configurable and will usually check if at least one column has corresponding value). This feature makes it easier for users to quickly find the information they are looking for within a List widget.

[Filter group](https://doc.cxbox.org/features/element/filtration/filtergroup/filtergroup/):
A user-filled filter can be saved for each individual user.

#### Added creation examples for drilldown
![drilldown.png](v2.0.1/drilldown.png)
We have included a description of working with drilldown, detailing their features and the various possibilities for utilizing them.

[Drilldown](https://doc.cxbox.org/features/element/drilldown/drilldown/) :
DrillDown link is an element that lets the user navigate to another view by tapping it.
#### Added creation examples for multivalue_primary
![multivalue_primary.png](v2.0.1/multivalue_primary.png)
We have included an example demonstrating the possibility of adding a primary attribute to a field type "multivalue".

[Multivalue_primary](https://doc.cxbox.org/widget/fields/field/multivalue/multivalue//):
Added the option to specify the Primary value to the AssocListPopup widget. If this value is specified, display an additional column labeled "Primary" that allows setting a checkbox in only one of the rows.

#### Other Changes
see [cxbox-doc changelog](https://github.com/CX-Box/cxbox-doc/releases/tag/v2.0.1)


### CXBOX ([Demo](https://github.com/CX-Box/cxbox-demo), [Code Samples](https://github.com/CX-Box/cxbox-code-samples))
#### File preview

![preview.gif](v2.0.1/preview.gif)

An eye button has been added. When clicked, the system generates a pop-up displaying a full-screen preview of the file.
Three types of buttons have been added to the preview:

Fullscreen: When clicked, the system generates a pop-up displaying a full-screen preview of the file.
Navigate: The system displays file previews in the pop-up from the widget list in the order present when the pop-up was activated. This respects any applied filters or sorting.
Download: The system initiates a file download and saves it to the user's standard Download folder.

see more [File preview]({{ external_links.demo }}/ui/#/screen/meeting/view/meetingview/meeting/1000053)
#### Multi-upload of files without popup.

![multiupload.gif](v2.0.1/multiupload.gif)

With the new update, you can use a widget to download the files. 
After uploading, the files will be stored and displayed on the page once the process is complete.
Added progress bar for download files.
This improvement simplifies the process of uploading multiple documents simultaneously.

Live sample [Add files]({{ external_links.demo }}/ui/#/screen/meeting/view/meetingview/meeting/1000053)
#### Added display of the number of applied filters
![clearfilter.gif](v2.0.1/clearfilter.gif)

If you have filtered by table, the "Clear all filters" button will appear.
It is suggested to indicate the number of applied filters by displaying "Clear n filters" (where n represents the number of columns being filtered).

Live sample [Add files]({{ external_links.demo }}/ui/#/screen/meeting)

#### Added new widget type - GroupingHierarchy
![groupinghierarchy.gif](v2.0.1//groupinghierarchy.gif)

"Grouping Hierarchy" is purely display modes.
Fundamentally, this widget is a list widget enhanced with a grouping feature.
Live sample [GroupingHierarchy]({{ external_links.demo }}/ui/#/screen/meeting/view/meetingview/meeting/1000053)
 
#### Added view with responsibility
![responsibility.gif](v2.0.1/responsibility.gif)

Added screen with responsivenes. Allows you to add or remove view accessibility.

[Live sample]({{ external_links.demo }}/ui/#/screen/admin/view/resplist)

#### Added filtration by range for Date/DateTime/DateTimeWithSeconds
![filtrationdate.gif](v2.0.1/filtrationdate.gif)

You can now filter fields Date/DateTime/DateTimeWithSeconds by range. This feature is available for all global construction projects.
#### Added support BgColor/BgColorKey of field in Title template
![titlecolor.gif](v2.0.1/titlecolor.gif)

Introduced the functionality to highlight portions of the widget title with color.
#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.1)

see [cxbox-code-samples changelog](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v2.0.1)


### <a id="CXBOXUI">CXBOX</a> ([Core Ui](https://github.com/CX-Box/cxbox-ui))

#### Added filtration by range  
Added filtration by range for Date/DateTime/DateTimeWithSeconds
#### Added support Color in Title template
Added support BgColor/BgColorKey of field in Title template
#### Select Multiple Files
Added supports additional for multiple files
#### File preview
Added supports additional in meta for file preview

### <a id="CXBOXCORE">CXBOX 4.0.0-M3</a>  ([Core](https://github.com/CX-Box/cxbox))
####  Updated to Springbot 3.2.4
Updated to Springbot 3.2.4
#### File preview
Added supports additional in meta for file preview 
#### Added filtration by range  
Added supports filtration by range for Date/DateTime/DateTimeWithSeconds
#### Added sorting in the LOV dictionary
Added sorting in the LOV dictionary
#### Default Bc limit value is configurable
You can now configure in application.yml (cxbox.meta.bcDefaultPageLimit) default number of rows that will be shown on any widget (it was 5 before). 
Of course, you can still override this value for exact bc in BC_Properties.csv with PAGE_LIMIT
#### Other Changes
see [cxbox changelog](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M3)
