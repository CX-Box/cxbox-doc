# Type standard
`Tab`  is a  component that enables users to switch between different components using tabs.
The tabs are organized as a tab bar. If the number of tabs exceeds the space available in the tab bar, navigation buttons will appear to help users scroll through the tabs.

* Tab names can only use **constant** values.
* Currently, a **three-level tab hierarchy** is supported.

![tablevels.png](tablevels.png) 

##  <a id="OneLevel">View without tabs</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample32356){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/basic/onelevel){:target="_blank"}

### How does it look?
![onelevel.png](onelevel.png)

###  How to add?
??? Example
    **Step1** Add business widget to **.view.json** using [widget position](/navigation/view/view/) property.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/onelevel/myexample32356single.view.json
    --8<--
    ```
    **Step2** Add view to the **.screen.json** with type [Single](/navigation/tabs/standard/basicdevelop/tabfordevelop/#how-add-a-view-to-the-screen)
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/onelevel/myexample32356.screen.json
    --8<--
    ```

    ![onelevel.gif](onelevel.gif)


##  <a id="SecondLevel">SecondLevel</a>

### How does it look?
=== "Top"
    ![secondleveltop.gif](secondleveltop.gif)

=== "Down"
    ![secondleveldown.gif](secondleveldown.gif)

###  How to add?
??? Example
    === "Top"
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample32358){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/basic/secondlevel/top){:target="_blank"}

        **Step1** Add widget **SecondLevelMenu** `first` to **.view.json** using [widget position](/navigation/view/view/) property. 
    
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/secondlevel/top/myexample3235second.view.json
        --8<--
        ```
     
        **Step2** Add view to the **.screen.json** with type [Single](/navigation/tabs/standard/basicdevelop/tabfordevelop/#how-add-a-view-to-the-screen)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/secondlevel/top/myexample32358.screen.json
        --8<--
        ```

        ![secondleveldowndev.gif](secondleveldowndev.gif)
    === "Down"
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample32358down){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/basic/secondlevel/down){:target="_blank"}

        **Step1** Add widget **SecondLevelMenu** `after a widget` to **.view.json** using [widget position](/navigation/view/view/)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/secondlevel/down/myexample3235seconddown.view.json
        --8<--
        ```
    
        **Step2** Add view to the **.screen.json** with type [Single](/navigation/tabs/standard/basicdevelop/tabfordevelop/#how-add-a-view-to-the-screen)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/secondlevel/down/myexample32358down.screen.json
        --8<--
        ```
        ![secondleveltopdev.gif](secondleveltopdev.gif)

##  <a id="ThirdLevelMenu">ThirdLevelMenu</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3235){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/basic/thirdlevel){:target="_blank"}
### How does it look?
![thirdlevel.png](thirdlevel.png)

###  How to add?
??? Example
    **Step1** Add widget **ThirdLevelMenu** after a widget **SecondLevelMenu** to **.view.json** using [widget position](/navigation/view/view/)
        see more [Tab levels](/navigation/tab/typestandard/basic/tabfordevelop/#tab-levels)
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/secondlevel/down/myexample3235seconddown.view.json
    --8<--
    ```

    **Step2** Add view to the **.screen.json** with type [Aggregate](/navigation/tabs/standard/basicdevelop/tabfordevelop/#how-add-a-view-to-the-screen)
     see more [How add name for tab](/navigation/tabs/standard/basicdevelop/tabfordevelop/#how-add-name-for-tab)
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/thirdlevel/myexample3235.screen.json
    --8<--
    ```
    ![thirdleveltopdev.gif](thirdleveltopdev.gif)

##  <a id="FourthLevelMenu">FourthLevelMenu</a>
 
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample32353){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/basic/fourthlevel){:target="_blank"}
### How does it look?
![fourthlevel.gif](fourthlevel.gif) 

### How to add?
??? Example
    **Step1** Add widget **FourthLevelMenu** after a widget **ThirdLevelMenu** to **.view.json** using [widget position](/navigation/view/view/)
    see more [Tab levels](/navigation/tab/typestandard/basic/tabfordevelop/#tab-levels)
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/fourthlevel/myexample3235fourthleveltab1.view.json
    --8<--
    ```

    **Step2** Add view to the **.screen.json** with type [Aggregate](/navigation/tabs/standard/basicdevelop/tabfordevelop/#how-add-a-view-to-the-screen)
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/basic/fourthlevel/myexample32353.screen.json
    --8<--
    ```

    ![fourthleveldev.gif](fourthleveldev.gif)

## Additional properties
### <a id="hidden">Hidden</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample32359){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/hidden){:target="_blank"}

If a view is marked as hidden, it will not appear in the general hierarchy and can only be accessed through a specific link (e.g., drilldown or button click). When you exit a hidden view, it will disappear.

#### How does it look?
 ![hiddenview.gif](hiddenview.gif)

#### How to add?
??? Example
    **Step1** Add **hidden** = **true** for  view 
 
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/hidden/myexample32359.screen.json
    --8<--
    ```
### defaultView 
(since [release 2.0.5](https://doc.cxbox.org/new/version205/"))

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3235defaultview){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/defaultview){:target="_blank"}

The "defaultView" for [Aggregate view](/navigation/tabs/standard/basicdevelop/tabfordevelop/#how-add-a-view-to-the-screen) 

The "defaultView" feature lets you set a default view to open when navigating through drilldowns on a screen or selecting an option from the left-hand menu. You can also configure it to open a hidden view if needed.

#### How does it look?
![hiddenview.gif](hiddenview.gif)

#### How to add?
??? Example
    **Step1** Add **defaultView** for [Aggregate view](/navigation/tabs/standard/basicdevelop/tabfordevelop/#how-add-a-view-to-the-screen)

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/defaultview/myexample3235defaultview.screen.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3235defaultview){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/defaultview){:target="_blank"}

#### Typical Use Case
1) Navigate to the Client List tab within the main Task entity.
2) Select the Create button to open a new tab for entering client details.
3) After completing the details, click the Save button to return to the Client List.

###  primaryViewName

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3235primaryview){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/primaryviewname){:target="_blank"}

The "primaryViewName" for screen.

The "primaryViewName" feature lets you set a default view to open when navigating through drilldowns on a screen or selecting an option from the left-hand menu. You can also configure it to open a hidden view if needed.

#### How does it look?
![hiddenview.gif](hiddenview.gif)

#### How to add?
??? Example
    **Step1** Add **primaryViewName**  for  screen

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/primaryviewname/myexample3235primaryview.screen.json
    --8<--
    ```

### primaryViews

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3235primaryviews){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/navigation/tab/typestandard/primaryviews){:target="_blank"}

The "primaryViews" for screen.

The "primaryViews" feature lets you set a default views to open when navigating through drilldowns on a screen or selecting an option from the left-hand menu. You can also configure it to open a hidden view if needed.

The "primaryViews" feature lets you define a sequence of views. If a user's role restricts access to the first view, the system automatically displays the next available view from the list. If none of the views are accessible, the default will be the first view specified on the screen.

#### How does it look?
![hiddenview.gif](hiddenview.gif)

#### How to add?
??? Example
    **Step1** Add **primaryViews**  for screen

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/navigation/tab/typestandard/primaryviews/myexample3235primaryviews.screen.json
    --8<--
    ```
