# 2.0.15

* [cxbox/demo 2.0.15 git](https://github.com/CX-Box/cxbox-demo/tree/v.2.0.15), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.15)

* [cxbox/core 4.0.0-M19 git](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M19), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M19), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/4.0.0-M19)

!!!!!CHANGE * [cxbox-ui/core 2.6.0 git](https://github.com/CX-Box/cxbox-ui/tree/2.6.0), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.6.0), [npm](https://www.npmjs.com/package/@cxbox-ui/core/v/2.6.0)

* [cxbox/code-samples 2.0.15 git](https://github.com/CX-Box/cxbox-code-samples/tree/v.2.0.15), [release notes](https://github.com/CX-Box/cxbox-code-samples/releases/tag/v.2.0.15)  

* cxbox/intellij-plugin 2.0.0 [Jetbrains Marketplace](https://plugins.jetbrains.com/plugin/19523-platform-tools#), [cxbox repo (recommended)](https://doc.cxbox.org/new/version2014/#added-intellij-20251-support)


## **Key updates August 2025**

### CXBOX ([Demo](http://demo.cxbox.org))  

#### Added: notification banner – adaptive button display
We’ve made the notification banner responsive to long button texts, so button labels are no longer cut off and the popup resizes accordingly.

=== "After"
    ![notificationButtonAfter.png](v2/0/15/notificationButtonAfter.png)
=== "Before"
    ![notificationButtonBefore.png](v2/0/15/notificationButtonBefore.png)

#### Fixed: validation handling for required and hidden fields

We have improved validation logic for required and both static and dynamic hidden fields to correctly display messages when required fields are empty. If a field is required and left empty, validation 

==="required"
    ![requiredEmptyField.png](v2/0/15/requiredEmptyField.png)
==="hidden"
    ![hiddenEmptyField.png](v2/0/15/hiddenEmptyField.png)

#### Fixed: cancel action after validation warning
We have improved the cancel action logic for cases when a form is blocked by validation. Now, if the system warns about required fields being left empty, users can still cancel and discard all changes.
=== "After"
    ![982after.gif](v2/0/15/982after.gif)
=== "Before"
    ![982before.gif](v2/0/15/982before.gif) 


#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.15)


### CXBOX ([Core Ui](https://github.com/CX-Box/cxbox-ui/releases/tag/2.6.0))   CHANGE

We have released two CORE UI versions - 2.6.0  CHANGE!!

#### Added: multivalue field – updated display
We’ve updated the display of the multivalue field. Changes include adjustments to field height, chip size, folder icon display, and more to ensure visual consistency with other field types.

#### Fixed: multivalue field – correct display of values
We've improved the logic behind displaying values in multivalue fields, ensuring that each row now shows its own correct data, regardless of the selected row.

#### Fixed: Fixed: Error popups were not shown
Error popups were not shown when an error requiring user notification occurred — the message was logged to the console.
Now the popup is displayed with the error text.

=== "After"
    ![after987.png](v2/0/15/after987.png)
=== "Before"
    ![before987.png](v2/0/15/before987.png)

#### Other Changes
See [cxbox-ui 2.6.0 changelog](https://github.com/CX-Box/cxbox-ui/releases/tag/2.6.0). CHANGE


### CXBOX 4.0.0-M19 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M19))

We have released a new 4.0.0-M19 CORE version.

#### 
#### Other Changes
See [cxbox 4.0.0-M19 changelog](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M19).


### CXBOX [plugin](https://plugins.jetbrains.com/plugin/19523-platform-tools)
#### 


### CXBOX [documentation](https://doc.cxbox.org/)  

#### Added: Pagination - hideLimitOptions updated  
We have updated the Pagination article, [hideLimitOptions](https://doc.cxbox.org/widget/type/property/pagination/pagination/?h=pag#hidelimitoptions) section.  

