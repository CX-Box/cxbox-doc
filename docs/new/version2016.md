# 2.0.16

* [cxbox/demo 2.0.16 git](https://github.com/CX-Box/cxbox-demo/tree/v.2.0.16), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.16)

* [cxbox/core 4.0.0-M20 git](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M20), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M20), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/4.0.0-M20)

* [cxbox-ui/core 2.6.1 git](https://github.com/CX-Box/cxbox-ui/tree/2.6.1), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.6.1), [npm](https://www.npmjs.com/package/@cxbox-ui/core/v/2.6.1)

* [cxbox/code-samples 2.0.16 git](https://github.com/CX-Box/cxbox-code-samples/tree/v.2.0.16), [release notes](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v.2.0.16)  

* cxbox/intellij-plugin 2.0.0 [Jetbrains Marketplace](https://plugins.jetbrains.com/plugin/19523-platform-tools#), [cxbox repo (recommended)](https://doc.cxbox.org/new/version2014/#added-intellij-20251-support)


## **Key updates September 2025**

### CXBOX ([Demo](http://demo.cxbox.org))  

#### Fixed: Lazy loading for picklists
<!-- CXBOX-1069  -->
Lazy loading for picklists has been implemented.

Data is now fetched only upon:

* Opening the pop-up
* Performing CRUD operations on its contents

=== "after"
    ![after_save_CXBOX-1069.gif](v2.0.16/after_save_CXBOX-1069.gif)
=== "before"
    ![before_save_CXBOX-1069.gif](v2.0.16/before_save_CXBOX-1069.gif)

The count() function is no longer called when an inline picklist is opened.

=== "after"
    ![after_CXBOX-1069.png](v2.0.16/after_CXBOX-1069.png)
=== "before"
    ![before_CXBOX-1069.png](v2.0.16/before_CXBOX-1069.png)

#### New: Added inline-edit widget validation
<!-- CXBOX-1069  -->
Added a check to ensure that an inline editing widget belongs to the same business component 
as its parent PickList or Assoc widget. If this rule is violated, an error message is logged to the browser console.

![valid_CXBOX-1069.png](v2.0.16/valid_CXBOX-1069.png)

#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.16)

### CXBOX ([Core Ui](https://github.com/CX-Box/cxbox-ui/releases/tag/2.6.1))

####  

#### Other Changes
See [cxbox-ui 2.6.1 changelog](https://github.com/CX-Box/cxbox-ui/releases/tag/2.6.1).


### CXBOX 4.0.0-M20 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M20))

We have released a new 4.0.0-M20 CORE version.
 
#### Other Changes
See [cxbox 4.0.0-M20 changelog](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M20).


### CXBOX [plugin](https://plugins.jetbrains.com/plugin/19523-platform-tools).
  

### CXBOX [documentation](https://doc.cxbox.org/)  

#### Added: Support for truncating long values
<!-- CXBOX-1094  -->
We have provided a description of [Support for truncating long values](https://doc.cxbox.org/widget/fields/field/text/text/#support-for-truncating-long-values).

#### Added: Highlighting Functionality for the Current Item (Tile)
<!-- CXBOX-1078  -->
We added a description of [Highlighting Functionality for the Current Item (Tile)](https://doc.cxbox.org/widget/type/statblocks/statblocks/#highlighting-functionality).

#### Added: Description Widget Header
<!-- CXBOX-1061  -->
We added a description of [Widget Header](https://doc.cxbox.org/widget/type/headerwidget/headerwidget/).