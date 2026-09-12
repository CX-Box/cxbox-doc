# MultivalueTree

`MultivalueTree` is a component that allows to select multiple values from Popup tree of entities

It is a tree-shaped analogue of [Multivalue](/widget/fields/field/multivalue/multivalue): all configuration keys are the same (`popupBcName`, `assocValueKey`, `displayedKey`), the only difference is the field `type` and the fact that the opened popup is an [AssocTreePopup](/widget/type/assoctreepopup/assoctreepopup) instead of a list popup.

!!! tips
    For this field type we need to talk about number of rows in popup and number of selected rows.Number of rows in popup: Feel free to use this field type for large entities of any size (the tree is loaded lazily, only one page of one node is loaded in memory).Number of selected rows: should be <1000-10000, because selected rows are stored in memory

!!! info
    The popup shows a hierarchical, lazily loaded tree: it opens collapsed, root rows are requested with `parentId.specified=false`, expanding a node requests `parentId.equals=<id>`. Pagination is per node, so the `next` arrow is replaced by a `More` button. Data requirements for the tree (`id`, `parentId` - always returned by the backend and filterable, `isLeaf`) are described in [Widget Tree](/widget/type/tree/tree).

    What the user selects explicitly is exactly what is sent to the backend, see [Selection modes](/widget/type/assoctreepopup/assoctreepopup/#selectionmodes).

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
    - **Step 1. AssocTreePopup**

        In the following example, Myexample3263 entity has a ManyToMany reference to the hierarchical Myexample3261 entity.
        Link is made by id in table MYEXAMPLE3263_MYEXAMPLE3261_PICK0, e.g. Myexample3263.id = MYEXAMPLE3263_MYEXAMPLE3261_PICK0.MYEXAMPLE3263_ID, Myexample3261.id = MYEXAMPLE3263_MYEXAMPLE3261_PICK0.MYEXAMPLE3261_ID.

        +  **Step 1.1** Create link table for ManyToMany (MYEXAMPLE3263_MYEXAMPLE3261_PICK0).
        +  **Step 1.2** Create hierarchical Entity Myexample3261.
        +  **Step 1.3** Create DTO Myexample3261Pick0DTO.
        +  **Step 1.4** Add **String** `additional field` and tree fields (`parentId`, `isLeaf`) to corresponding **DataResponseDTO**. `parentId` must be filterable, because the popup requests children by it.

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3261Pick0DTO.java
            --8<--
            ```

        +  **Step 1.5** Add **fields.setEnabled** and **fields.enableFilter** to corresponding **FieldMetaBuilder**.

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3261Pick0Meta.java
            --8<--
            ```

        +  **Step 1.6.AssocTreePopup**  Create AssocTreePopup to **_.widget.json_**.

            `options.tree.selection` - defines what may be selected (node / leaf / both), see [Selection modes](/widget/type/assoctreepopup/assoctreepopup/#selectionmodes)

            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/inner/myexample3261AssocTreePopup.widget.json
            --8<--
            ```

        +  **Step2** Add **List** field to corresponding **BaseEntity**.

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3263.java
            --8<--
            ```

        +  **Step 3** Add **MultivalueField** field to corresponding **DataResponseDTO**.

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/inner/Myexample3263DTO.java
            --8<--
            ```

        +  **Step4** Add bc **myexample3261Pick0** to corresponding **EnumBcIdentifier**.

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/CxboxMyExample3263Controller.java
            --8<--
            ```

        +  **Step5** Add AssocTreePopup widget to view.

            ```json
            --8<--
            {{ external_links.github_raw_doc }}/widgets/tree/base/views/myexample3261list.view.json
            --8<--
            ```

        === "Form widget"
            **Step 6** Add popupBcName and assocValueKey to **_.widget.json_**.

            `popupBcName` - name bc Step 1.6.AssocTreePopup

            `assocValueKey` - field for opening AssocTreePopup

            `displayedKey` - text field usually containing contcatenated values from linked rows

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
    _not applicable_
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![img_plchldr_form.png](img_plchldr_form.png)

### How to add?
??? Example
    Add **fields.setPlaceholder** to corresponding **FieldMetaBuilder**.

    === "List widget"
        **_not applicable_**
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
    _not applicable_
=== "Form widget"
    _not applicable_


### How to add?
??? Example
    === "Calculated color"
        **Step 1**   Add `custom field for color` to corresponding **DataResponseDTO**. The field can contain a HEX color or be null.

        === "List widget"
            **Step 2** Add **"bgColorKey"** :  `custom field for color`  to .widget.json.
        === "Info widget"
            _not applicable_
        === "Form widget"
            _not applicable_

    === "Constant color"
        === "List widget"
            Add **"bgColor"** :  `HEX color`  to .widget.json.
        === "Info widget"
            _not applicable_
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
        _not applicable_
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
            **_not applicable_**
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
            **_not applicable_**
        === "Info widget"
            **_not applicable_**
        === "Form widget"
            **Works for Form.**

## Filtering
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

`Filtering` allows you to search data based on criteria. Search uses `.equalsOneOf` operation for this field type, which compares ids in this case, see [SearchOperation for filtering](/widget/fields/filtersearchoperation).
### How does it look?
=== "List widget"
    <!-- TODO screenshot -->
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

        **Step 3**  Add popupBcName and assocValueKey to **_.widget.json_**.

        popupBcName - name bc

        assocValueKey - field for opening AssocTreePopup

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/inner/MyExample3263List.widget.json
        --8<--
        ```


    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

## Drilldown
**_not applicable_**

## Validation
`Validation` allows you to check any business rules for user-entered value. There are types of validation:

1) Exception:Displays a message to notify users about technical or business errors.

2) Confirm: Presents a dialog with an optional message, requiring user confirmation or cancellation before proceeding.

3) Field level validation: shows error next to all fields, that validation failed for

### How does it look?
=== "List widget"
    === "BusinessException"
        <!-- TODO screenshot -->
    === "RuntimeException"
        <!-- TODO screenshot -->
    === "Confirm"
        <!-- TODO screenshot -->
    === "Field level validation"
        <!-- TODO screenshot -->
=== "Info widget"
    _not applicable_
=== "Form widget"
    === "BusinessException"
        <!-- TODO screenshot -->
    === "RuntimeException"
        <!-- TODO screenshot -->
    === "Confirm"
        <!-- TODO screenshot -->
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
**_not applicable_**

## Required
`Required` allows you to denote, that this field must have a value provided.

### How does it look?
=== "List widget"
    _not applicable_
=== "Info widget"
    _not applicable_
=== "Form widget"
    ![img_req_form.png](img_req_form.png)
### How to add?
??? Example
    Add **fields.setRequired** to corresponding **FieldMetaBuilder**.

    === "List widget"
        **_not applicable_**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        **Works for Form.**

## Additional properties
### Primary
Not supported for `multivalueTree`: the `options.primary` setting of the popup is available only for [AssocListPopup](/widget/type/assoclistpopup/assoclistpopup).

#### How does it look?
=== "List widget"
    _not applicable_
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_

#### How to add?
_not applicable_

### <a id="SelectionModes">Selection modes</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}

What the user selects explicitly in the popup is exactly what is sent to the backend.

* If the user picks separate records, those record ids are sent.
* If the user picks a whole group (node), the id of the group is sent, and its children become dimmed - they are covered by the selected group and are not sent separately.
* A selection like "the whole group minus N records" cannot be expressed: either the group is selected, or the required records are selected one by one.

Which rows may be selected at all - nodes, leaves or both - is defined by the `options.tree.selection` property of the popup widget, see [Selection modes](/widget/type/assoctreepopup/assoctreepopup/#selectionmodes).

#### How does it look?
=== "List widget"
    _not applicable_
=== "Info widget"
    _not applicable_
=== "Form widget"
    <!-- TODO screenshot -->

#### How to add?
??? Example
    === "List widget"
        **_not applicable_**
    === "Info widget"
        **_not applicable_**
    === "Form widget"
        Add **tree.selection** to corresponding Assoc **.widget.json**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/tree/base/inner/myexample3261AssocTreePopup.widget.json
        --8<--
        ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3261/view/myexample3261list){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/tree/base/inner){:target="_blank"}
