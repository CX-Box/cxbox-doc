# PickTree

`PickTree` is a component that allows to select a value from Popup tree of entities

It is a tree-shaped analogue of [PickList](/widget/fields/field/pickList/pickList): all configuration keys are the same (`popupBcName`, `pickMap`), the only difference is the field `type` and the fact that the opened popup is a [PickTreePopup](/widget/type/picktreepopup/picktreepopup) instead of a list popup.

!!! tips
    Use if user needs to pick a value from a hierarchy. Feel free to use this field type for large entities of any size (the tree is loaded lazily, only one page of one node is loaded in memory)

!!! info
    The popup shows a hierarchical, lazily loaded tree: it opens collapsed, root rows are requested with `parentId.specified=false`, expanding a node requests `parentId.equals=<id>`. Pagination is per node, so the `next` arrow is replaced by a `More` button. Data requirements for the tree (`id`, `parentId` - always returned by the backend and filterable, `isLeaf`) are described in [Widget Tree](/widget/type/tree/tree).

    A value is picked by clicking a row. What exactly may be picked - a node, a leaf or both - is set by the popup widget property `options.tree.selection`, see [PickTreePopup](/widget/type/picktreepopup/picktreepopup).

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

### How does it look?

=== "List widget"
    ![img_list.png](img_list.png)
=== "Info widget"
    ![img_info.png](img_info.png)
=== "Form widget"
    ![img_form.png](img_form.png)


### How to add?

??? Example
    - **Step 1. Popup**

        In the following example, **Myexample3263** entity has a **OneToOne/ManyToOne** reference to the hierarchical **Myexample3261** entity. Link is made by id, e.g. **Myexample3263.departmentId** = **Myexample3261.id**. Also, in this example we will use one `additional field` **Myexample3261.department**, that will be shown on Myexample3263 widget

        +  **Step 1.1** Add **String** `additional field` and tree fields (`parentId`, `isLeaf`) to corresponding **DataResponseDTO**. `parentId` must be filterable, because the popup requests children by it.

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3261PickDTO.java
            --8<--
            ```

        +  **Step 1.2**  Create Popup Tree **_.widget.json_**.

            `options.tree.selection` - defines what may be picked (node / leaf / both)

            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/inner/myexample3261TreePickListPopup.widget.json
            --8<--
            ```

        +  **Step 1.3** Add **fields.setEnabled** and **fields.enableFilter** to corresponding **FieldMetaBuilder**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3261PickMeta.java
            --8<--
            ```

    -   **Step 2** Add **Popup** to **_.view.json_**.

        === "list.view.json"
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/views/myexample3261list.view.json
            --8<--
            ```

    -   **Step3** Add **Myexample3261** field to corresponding **BaseEntity**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3263.java
        --8<--
        ```

    -   **Step4** Add two fields (for id and for `additional field`) to corresponding **DataResponseDTO**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3263DTO.java
        --8<--
        ```

    -   **Step5** Add bc myexample3261Pick to corresponding **EnumBcIdentifier**.

        !!! info
            `myexample3261Pick` business component needs to be a child of the business component from which the popup window is invoked.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/CxboxMyExample3263Controller.java
        --8<--
        ```

    === "Form widget"

        **Step6** Add popupBcName and pickMap to **_.widget.json_**.
        `pickMap` - maping for field PickTree to Myexample3263

        pickMap defines the mapping between fields of the main BC (the primary form) and the popup BC from which the user selects a record.

        * Left side — the field in the main BC where the value should be written.
        * Right side — the field in the popup BC from which the value is taken when the user selects a row.

        When the user selects a record in the popup, take the value from the right-side field and place it into the left-side field.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/inner/MyExample3263List.widget.json
        --8<--
        ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

## Placeholder
`Placeholder` allows you to provide a concise hint, guiding users on the expected value. This hint is displayed before any user input. It can be calculated based on business logic of application
### How does it look?
=== "List widget"
    ![img_plchldr_list.png](img_plchldr_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![img_plchldr_form.png](img_plchldr_form.png)
### How to add?
??? Example
    Add **fields.setPlaceholder** to corresponding **FieldMetaBuilder**.

    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**

## Color
`Color` allows you to specify a field color. It can be calculated based on business logic of application

### How does it look?
=== "List widget"
    ![img_color_list.png](img_color_list.png)
=== "Info widget"
    ![img_color_info.png](img_color_info.png)
=== "Form widget"
    _not applicable_

### How to add?
??? Example
    === "Calculated color"
        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null.

        === "List widget"
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
        === "Info widget"
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
        === "Form widget"
            _not applicable_

    === "Constant color"
        === "List widget"
            Add **"bgColor"** :  `HEX color`  to .widget.json.
        === "Info widget"
            Add **"bgColor"** :  `HEX color`  to .widget.json.
        === "Form widget"
            _not applicable_

## Readonly/Editable
`Readonly/Editable` indicates whether the field can be edited or not. It can be calculated based on business logic of application

`Editable`
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

### How does it look?
=== "Editable"
    === "List widget"
        ![img_list.png](img_list.png)
    === "Info widget"
        _not applicable_
    === "Form widget"
        ![img_form.png](img_form.png)
=== "Readonly"
    === "List widget"
        ![img_ro_list.png](img_ro_list.png)
    === "Info widget"
        ![img_ro_info.png](img_ro_info.png)
    === "Form widget"
        ![img_ro_form.png](img_ro_form.png)

### How to add?
??? Example
    === "Editable"
        **Step1** Add mapping DTO->entity to corresponding **VersionAwareResponseService** (see `doUpdateEntity`).
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3263Service.java
        --8<--
        ```
        **Step2** Add **fields.setEnabled** to corresponding **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3263MetaBuilder.java
        --8<--
        ```
        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

    === "Readonly"

        **Option 1** Enabled by default.

        **Option 2** `Not recommended.` Property fields.setDisabled() overrides the enabled field if you use after property fields.setEnabled.
        === "List widget"
            **Works for List.**
        === "Info widget"
            **Works for Info.**
        === "Form widget"
            **Works for Form.**

## Filtering
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

`Filtering` allows you to search data based on criteria. Search uses `.contains` operation for this field type, see [SearchOperation for filtering](/widget/fields/filtersearchoperation).
!!! tips
    Pop up widget for filtration is auto-generated based on widget for field editing (e.g. same fields, same filters and so on will be on both widgets). Optionally - separate widget for filtration can still be provided
### How does it look?
=== "List widget"
    ![img_filtr_list.png](img_filtr_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_

### How to add?
??? Example
    === "List widget"
        **Step 1** Add **@SearchParameter** to corresponding **DataResponseDTO**. (Advanced customization [SearchParameter](/advancedCustomization/element/searchparameter/searchparameter))
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3263DTO.java
        --8<--
        ```
        **Step 2**  Add **fields.enableFilter** to corresponding **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3263MetaBuilder.java
        --8<--
        ```
    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

## Drilldown
`DrillDown` allows you to navigate to another view by simply tapping on it. Target view and other drill-down parts can be calculated based on business logic of application

Also, it optionally allows you to filter data on target view before it will be opened `see more` [DrillDown](/features/element/drilldown/drilldown)

### How does it look?
=== "List widget"
    ![img_drilldown_list.png](img_drilldown_list.png)
=== "Info widget"
    ![img_drilldown_info.png](img_drilldown_info.png)
=== "Form widget"
    _not applicable_

### How to add?
??? Example

    **Option 1**

    `Step 1` Add [fields.setDrilldown](/features/element/drilldown/drilldown) to corresponding **FieldMetaBuilder**.

    === "List widget"

        `Step 2` Add **"drillDown": "true"**  to .widget.json.

        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. See more [Drilldown](/advancedCustomization/element/drilldown/drilldown)

    === "Info widget"

        `Step 2` Add **"drillDown": "true"**  to .widget.json.

        **Option 2**
           Add **"drillDownKey"** :  `custom field`  to .widget.json. See more [Drilldown](/advancedCustomization/element/drilldown/drilldown)

    === "Form widget"
        _not applicable_

[Advanced customization](/advancedCustomization/element/drilldown/drilldown)

## Validation
`Validation` allows you to check any business rules for user-entered value. There are types of validation:

1) Exception:Displays a message to notify users about technical or business errors.

2) Confirm: Presents a dialog with an optional message, requiring user confirmation or cancellation before proceeding.

3) Field level validation: shows error next to all fields, that validation failed for

### How does it look?
=== "List widget"
    === "BusinessException"
        ![img_business_error.png](img_business_error.png)
    === "RuntimeException"
        ![img_runtime_error.png](img_runtime_error.png)
    === "Confirm"
        ![confirm_form.png](confirm_form.png)
    === "Field level validation"
        <!-- TODO screenshot -->
=== "Info widget"
    _not applicable_
=== "Form widget"
    === "BusinessException"
        ![img_business_error.png](img_business_error.png)
    === "RuntimeException"
        ![img_runtime_error.png](img_runtime_error.png)
    === "Confirm"
        ![confirm_form.png](confirm_form.png)
    === "Field level validation"
        <!-- TODO screenshot -->
### How to add?
??? Example
    === "BusinessException"
        `BusinessException` describes an error  within a business process.

        Add **BusinessException** to corresponding **VersionAwareResponseService**.

        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**

    === "RuntimeException"

        `RuntimeException` describes technical error  within a business process.

        Add **RuntimeException** to corresponding **VersionAwareResponseService**.

        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**

    === "Confirm"
        Add [PreAction.confirm](/advancedCustomization_validation) to corresponding **VersionAwareResponseService**.

        === "List widget"
            **Works for List.**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**

    === "Field level validation"
        === "Option 1"
            Add javax.validation to corresponding **DataResponseDTO**.

            Use if:

            Requires a simple fields check (javax validation)

            === "List widget"
                **Works for List.**
            === "Info widget"
                **_not applicable_**
            === "Form widget"
                **Works for Form.**

        === "Option 2"
            Create сustom service for business logic check.

            Use if:

            Business logic check required for fields

            `Step 1`  Create сustom method for check.

            `Step 2` Add сustom method for check to corresponding **VersionAwareResponseService**.

## Sorting
`Sorting` allows you to sort data in ascending or descending order. Sort by value join field.

### How does it look?
=== "List widget"
    ![img_sort_list.png](img_sort_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_
### How to add?
??? Example
    === "List widget"
        see more [Sorting](/widget/type/property/sorting/sorting)

        **Step 1**  Add **fields.enableSort** to corresponding **FieldMetaBuilder**.

    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

## Required
`Required` allows you to denote, that this field must have a value provided.

### How does it look?
=== "List widget"
    ![img_req_list.png](img_req_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![img_req_form.png](img_req_form.png)
### How to add?
??? Example
    Add **fields.setRequired** to corresponding **FieldMetaBuilder**.

    === "List widget"
        **Works for List.**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**
