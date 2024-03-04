# v2.0.0

cxbox/core 3.0.6-SNAPSHOT

cxbox-ui/core 2.0.0-alpha.4


## **Key updates March 4, 2024**

### CXBOX ([Demo](https://github.com/CX-Box/cxbox-demo))

#### New version front cxbox
The release uses new version cxbox front UI.

see more [New ui](#CXBOXUI)

#### New version core cxbox
The release uses new version core cxbox.

see more [New core](#CXBOXCORE)

####  Support for microservice architecture
Added the ability to work not only with data from the database, but also to support receiving data from services. Support for microservice architecture.

see more [Improved work with microservices](#Microservices)
 
#### Added multi-download for files
![multidown.gif](v2.0.0/multidown.gif)

Multi-upload of documents. To upload several documents to a page, you need to select several documents in the popup area,wait for loading and click the "Save" button. 
The images will be downloaded to the file storage system selected in the current implementationand will appear on the page
once the upload process is complete. This feature makes it easy to upload multiple documents at once,streamlining the process and saving time for the user.
It also ensures that all necessary documents are uploaded to the page in one go, eliminating the need for multiple uploads of individual documents.

Live sample [Add files](  {{ external_links.demo }}/ui/#/screen/meeting/view/meetingview/meeting/1000053)

#### Added full text search
![fulltextsearch.gif](v2.0.0/fulltextsearch.gif)
 
Added the ability for List widgets to support fullText Search. When the user types in the search input field, the widget filters the rows that match the search query. This feature makes it easier for users to quickly find the information they are looking for within a table widget.

Live sample [Full text search]({{ external_links.demo }}/ui/#/screen/meeting)

#### Customization of displayed columns
![customizationcolumns.gif](v2.0.0/customizationcolumns.gif)

If you'd like to change the composition or sequence of the columns displayed, you can do so by customizing your preferences in the settings menu.
These changes will be saved for your account only, so you can view the columns in a way that suits your preferences.

Live sample [Customization of displayed columns]({{ external_links.demo }}/ui/#/screen/meeting)

#### New pickList filter
![picklistfiltr.gif](v2.0.0/picklistfiltr.gif)

New filtering allows users to search for picklist entries by either their ID or text, providing a more flexible and efficient way to find the desired information. The filtering modes are mutually exclusive, meaning that users can only use one mode at a time to search for entries within the picklist.
This enhancement improves the user experience and accelerates the process of selecting entries from picklists.

Live sample [New pickList filter]({{ external_links.demo }}/ui/#/screen/meeting)

#### Filter group setting
![filtrgroup.gif](v2.0.0/filtrgroup.gif)

The user filter can be is saved for this user and can be selected from the drop-down list.This allows to easily access their preferred filters save without having to re-enter them each time. These changes will be saved for your account only.

Live sample [Filter group setting]({{ external_links.demo }}/ui/#/screen/client).

#### Added new type widget - StatsBlock
![statisticsformbar.gif](v2.0.0/statisticsformbar.gif)

Widget allows you to display in the form of a bar. Only for data viewing.
 
Live sample [StatsBlock]({{ external_links.demo }}/ui/#/screen/client).
#### Added new type widget - suggestionPickList
![suggestionpiclist.gif](v2.0.0/suggestionpiclist.gif)
 
The new widget type allows you to search for data in other systems by specific fields. The current release provides an example with hints dadata.

Live sample [suggestionPickList]({{ external_links.demo }}/ui/#/screen/client)

#### Added new type widget -  FormPopup
![formpopup.png](v2.0.0/formpopup.png)

Added new type widget for additional field checks in popup and the ability to add information inside the popup.

Live sample [FormPopup](https://doc.cxbox.org/widget/type/formpopup/formpopup/)

#### Added new type widget -  AdditionalInfo
![additionalinfo.png](v2.0.0/additionalinfo.png)

Added new type widget only for data viewing. Widget is always located on the

Live sample [AdditionalInfo](https://doc.cxbox.org/widget/type/additionalinfo/additionalinfo/)
#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.0)

see [cxbox-code-samples changelog](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v2.0.0)

### <a id="CXBOXUI">CXBOX</a> ([Core Ui](https://github.com/CX-Box/cxbox-ui))
 
#### Removed support Node JS < version 18
Removed support for Node JS < version 18

#### All direct dependencies have been removed
The changes made it possible to use dependencies within the project that meet the requirements of the version range.

#### UIKit has been disconnected from the core
UIKit has been disconnected from the core, now you can use any design system to quickly develop interfaces within the project.

#### Replaced custom typescript utilities
We have replaced custom typescript utilities with well-documented, standardized functions of the Redux-toolkit and the Redux-observable libraries.

#### Change standard actions behavior
Added the ability to change the behavior of standard actions on project.

#### Change routing logic on the frontend
Added the ability to select a library for routing on the frontend.

#### Autotests for asynchronous Marble testing processes
It is now possible to implement autotests for asynchronous Marble testing processes

### <a id="CXBOXCORE">CXBOX</a>  ([Core](https://github.com/CX-Box/cxbox))
#### Updated to Springbot 3(java 17+)
Updated to Springbot 3(java 17+)

#### <a id="Microservices">Improved work with microservices</a>
The new API allows you to output/edit/update data now from microservices or any other sources.
The API's feature is complete uniformity with the API for working in standard mode.
Support for multi-stage entity creation with force active fields.

#### Fixed security alert 
Fixed all github security alert currently.

#### Removed from the core of the table
Removed from the core of the table:

    * User
    * User_Role
    * USER_DIVISIONS
    * REVINFO
    * DIVISION
    * DEPT

#### Removed the starters
Removed the starters:

    * cxbox notifications starter(the example has been moved to demo and implemented on web sockets for the possibility of deep customization on projects)
    * cxbox quartz starter (removed)
    * cxbox workflow starter (removed)
    * Changelistener (recommended to use the standard hibernate Listner)

#### Made FieldExtractors spring service 
Don't need to register them in META-INF.services.