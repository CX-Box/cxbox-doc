# Actions
`Actions` show available actions as separate buttons

!!! warning line end "Work in progress"
 
* [text](#text) - (can be empty string) static 
* icon - (optional) static
* availability condition (optional)
* preAction - (optional) CONFIRMATION,INFORMATION,ERROR,CUSTOM
* invoker - (required). can change data. can additionally return
* postAction - (optional) REFRESH_BC, DOWNLOAD_FILE, DOWNLOAD_FILE_BY_URL, OPEN_PICK_LIST, DRILL_DOWN, DELAYED_REFRESH_BC, SHOW_MESSAGE, POST_DELETE
* fields validation results
* business and other exceptions
* scope - (required) bc, record

## <a id="text">Text</a>
 
!!! tips 
    We recommend always using text with a string. 
    If text is not specified, localized text will be used by default. see more [Localization](/features/element/localizaton/localization)
<!--

### How does it look?
=== "text"
    === "empty"
    === "filled"
=== "icon"
    === "only icon"
    === "icon and text"
=== "availability"
    === "false"
    === "true"
=== "preAction"
    === "CONFIRMATION"
    === "INFORMATION"
    === "ERROR"
=== "postAction"
    === "DRILL_DOWN"
    === "DOWNLOAD_FILE"
    === "SHOW_MESSAGE"
    === "REFRESH_BC"
    === "...Deprecated"
        === "DOWNLOAD_FILE_BY_URL"
        === "OPEN_PICK_LIST"
        === "DELAYED_REFRESH_BC"
        === "POST_DELETE"
=== "scope bc"
    === "bc"
    === "record"

### How does it look?
=== "actions"
##### How to add?
??? Example

### Standard actions
#### create
##### How does it look?
=== "Form widget"
##### How to add?
??? Example

#### cancel-create
##### How does it look?
=== "Form widget"
##### How to add?
??? Example

#### save
##### How does it look?
=== "Form widget"
##### How to add?
??? Example

#### delete
##### How does it look?
=== "Form widget"
##### How to add?
??? Example

#### copy
##### How does it look?
=== "Form widget"
##### How to add?
??? Example
-->

<!--
#### <a id="Actionsgroups">Actions groups</a>
`Actions groups` group subset of available actions into a single button with drop down


##### How does it look?
=== "Form widget"
##### How to add?
??? Example
-->

