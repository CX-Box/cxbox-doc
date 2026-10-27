# Mass operations with confirmation
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101list){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

!!! Attention
    For small and medium data volumes. Use for synchronous processing within a single transaction when the data size is up to 10,000 rows.
 
=== "List"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101list){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

    ![mass_list.gif](mass_list.gif)
=== "GroupingHierarchy"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101gh){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations/gh){:target="_blank"}

    ![mass_gh.gif](mass_gh.gif)

`Mass operation with confirmation` is a [mass operation](/widget/type/property/massoperations/massoperations/) with a confirmation step: before the action is executed, the user fills in a form once, and the values from the form are applied to all selected rows.

## Basic
It is used when the user must choose the values that are written to all selected rows, for example:

* **Set one value in all rows** — assign a priority or a responsible employee to 200 requests.
* **Change status with user data** — set a new status together with a comment or a date chosen by the user.
* **Clear a field** — leave the field empty in the form, and it is cleared in every selected row.

* write the values from the form and, in the same handler, change other fields, recalculate values or change the status;
* return a post-action, for example, show a message. It runs when the user clicks **Close** on [Step 4](#result).

See [Changing data and a post-action in one operation](#postaction).

The user sees the result for each row and can repeat the operation for the rows that failed, see [Retry for failed rows](#retry).

This function is available for widgets:

 * [List](/widget/type/list/list) 
 * [GroupingHierarchy](/widget/type/groupinghierarchy/groupinghierarchy)

After clicking on a mass operation, the user enters the mass-operation mode, which consists of several steps:

1. [Select rows](#selecting_rows)
2. [Review rows](#reviewing)
3. [Confirm operation](#confirming)
4. [View results](#result)

### How does it look?
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101list){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

![massoperations.png](withconfirm/massoperations.png)

!!! Specifics
    * Mass operations become available only if there is at least one row in the table.
    * All requests are executed using the ID of the first selected row!
    * The operation runs in a single transaction: if an error occurs, the changes are rolled back for all selected rows.
    * An empty field in the confirmation form means "clear": the empty value is written to all selected rows.
    * In GroupingHierarchy only rows with records can be selected: a group row without its own record (an empty group, a row of totals) has a disabled checkbox. From Step 2 the table shows only the groups with selected rows.
    * Rows are only viewed during a mass operation, the file preview too: its arrows go through the rows, a row does not become active, the record form is not shown.

#### How to add?

??? Example
    - **Step1**  Add actionGroups **massEdit**(Custom name) to corresponding **.widget.json**.

        ```json
            "actionGroups": {
              "include": [
                "massEdit"
              ]
        }
        ```

        === "List"
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/feature/massoperations/myexample6101List.widget.json
            --8<--
            ```
        === "GroupingHierarchy"
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/feature/massoperations/gh/myexample6102GH.widget.json
            --8<--
            ```

        Add the confirmation widget (FormPopup) with the business component of the widget to the view, and pass its name to `PreAction.confirmWithWidget`.

        === "List"
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/feature/massoperations/myexample6101Form.widget.json
            --8<--
            ```
        === "GroupingHierarchy"
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/feature/massoperations/gh/myexample6102Form.widget.json
            --8<--
            ```
    - **Step2** Create action massEdit to corresponding **AwareResponseService**.      

        === "With plugin(recommended)"
            **Step 1** Download plugin
            [download Intellij Plugin](https://doc.cxbox.org/plugin/plugininstalling)
    
            **Step 2** Add a mass action to the corresponding service
    
            ![addmass.gif](addmass.gif)
    
        === "Example of writing code"
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/feature/massoperations/MyExample6101Service.java:massEditCustomTitle
            --8<--
            ``` 

        Property:

        -  `.action("massEditCustomTitle", "Mass Edit With Custom Text")`
            
            * `"massEditCustomTitle"` — the action name used internally by the backend and frontend.
            * `"Mass Edit With Custom Text"` —  title displayed in the UI.
            
        - `.withPreAction(PreAction.confirmWithWidget(...))`
            
            Adds a confirmation dialog before the mass action executes.
            
            Parameters:
            
            1. The name of the widget used for the confirmation.
            
            2. **`cfw -> ...`** — a configuration block where the properties are defined:
            
            **`.noText("It is text no")`**
                Text for the **Cancel** button.
            
            **`.title("Mass Edit Title")`**
                Title of the confirmation dialog before the mass action executes.
            
            **`.yesText("It is text yes")`**
                Text for the **Save** button.
            
            This allows customizing the buttons and title.
            
        - `.scope(ActionScope.MASS)`
                
            Specifies that this is a **mass action**, applied to all selected rows in the grid.
                
        - `.massInvoker((bc, data, ids) -> { ... })`
            
            The main handler for the mass operation.
            
            Parameters:
            
            * **`bc`** — business component context.
            * **`data`** — data submitted from the confirmation dialog based on the *first row*. An empty field means the field is cleared in every selected row.
            * **`ids`** — the set of IDs of all selected records.
            
            Inside the handler:
             The method processes each record and returns:
            
            * `MassDTO.success(id)` - result success 
            * `MassDTO.fail(id, "message")` - result error 
                
        - `return new MassActionResultDTO<>(massResult)...`
                
            The mass action result includes:
            
            * success/failure information for each record,
            * a UI post-action.
            
            - `.setAction(PostAction.showMessage(...))`

                Displays a message in the UI when the user clicks **Close** on [Step 4](#result), not when the action is executed.

                Parameters:

                * `MessageType.INFO` — message type.
                * `"The fields mass operation was completed!"` — message text.

#### <a id="postaction">Changing data and a post-action in one operation</a>
The confirmation step only collects the values. What happens to the rows is decided by `massInvoker`, the same handler as in [Mass operations without confirmation](/widget/type/property/massoperations/withoutconfirm/).
So one mass action with confirmation can:

1. write the values from the confirmation form (`data`) to every selected row;
2. in the same loop, change other fields of the row, recalculate values or change the status — the same processing as without confirmation;
3. return `MassDTO.fail(id, "message")` for the rows that cannot be processed;
4. return a post-action with `.setAction(...)` in `MassActionResultDTO`. It runs when the user clicks **Close** on [Step 4](#result).

??? Example
    In the sample, `getMassDTO` writes the value of the dictionary field from the form and, in the same handler, the checkbox; the rows with the value `Error` get the status **Fail**.
    After the operation, the message is shown.

    === "List"
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/massoperations/MyExample6101Service.java:massEdit
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101list){:target="_blank"}
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}
    === "GroupingHierarchy"
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/massoperations/gh/MyExample6102Service.java:massEdit
        --8<--
        ```
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101gh){:target="_blank"}
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations/gh){:target="_blank"}

## <a id="selecting_rows">Step 1. Select rows</a>
### How does it look?
![mass_select_row2.png](mass_select_row2.png)

1. Checkboxes for selecting rows are displayed in the first column of the table (true = the row is selected).
2. Filtering and sorting remain available.
3. Rows become non-editable while in mass-operation mode.
4. All selected rows are displayed above the table as chips.

    * If the number of chips exceeds **N**, only the first **N** are shown; the rest are collapsed and replaced with the label **“+N values”**. Hovering over **“+N values”** displays a tooltip: *“Move on to Step 2 to see all the chosen rows.”*
    * A **“Clear”** button is displayed next to the chips. Clicking **Clear** deselects all checkboxes and removes all chips.
    * A gear icon is available for chip-related actions, containing the option **“Select from file”** (importing rows from a file exported on [Step 4](#result)).
      Rows are matched only by ID: the exported Excel file keeps it in a hidden column.

        ![import.png](import.png)

5. **Available actions**:

    * **Cancel** — exits mass-operation mode.
    * **Next** — proceeds to Step 2, where only the selected rows are displayed.

## <a id="reviewing">Step 2. Review rows</a>
### How does it look?
![review.png](review.png)

1. Selected rows from [Step 1. Select rows](#selecting_rows) are displayed in read-only mode.
2. Checkboxes are disabled, and rows cannot be edited.
3. Filtering and sorting of the selected rows remain available.
4. **Available actions**:

    * **Next** — moves the user to [Step 3](#confirming) (confirmation).
    * **Back** — returns the user to Step 1 (row selection).
      When returning to Step 1, the table resets to the first page and all filters are cleared.
    * **Cancel** — exits mass-operation mode without applying any changes.

## <a id="confirming">Step 3. Confirm operation</a>
### How does it look?
=== "Basic"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101list){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

    ![confirm.png](withconfirm/confirm.png)
=== "With custom text"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101listtitle){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

    ![confirmwithcustomtitle.png](withconfirm/confirmwithcustomtitle.png)
=== "Without title"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101listwithouttitle){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

    ![confirmwithouttitle.png](withconfirm/confirmwithouttitle.png)

The values entered in the confirmation form are applied to all selected rows, for example, a new status or a priority.
An empty field means "clear": after **Save** this field is empty in every selected row.

After **Save**, the mass action is executed: the values from the form are written, the other processing of the handler is done (see [Changing data and a post-action in one operation](#postaction)), and the user moves to [Step 4](#result).

In the confirmation step, you can customize 

* the widget’s title
* remove widget’s title
* customize the text of the **Save** and **Cancel** buttons
* the **Back** button is fixed and does not depend on the configuration

### How to add?
??? Example
    === "Basic"
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/massoperations/MyExample6101Service.java:massEdit
        --8<--
        ``` 
    === "With custom text"
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/massoperations/MyExample6101Service.java:massEditCustomTitle
        --8<--
        ``` 
    === "Without title"
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/massoperations/MyExample6101Service.java:massEditWithoutTitle
        --8<--
        ```  

## <a id="result">Step 4. View results</a>
### How does it look?
![result.png](result.png)

After performing a mass operation, the status for each row in the table is displayed:

1. **Success** – the operation was completed successfully
2. **Fail** – the operation was not completed

The widget header displays the number of processed rows (including the number of successful/failed rows).

Filtering/sorting of selected rows is available for any column, including status.

**Available actions:**

1. **Close** – Exit the mass operation mode. The user returns to the normal table view, taking into account all changes made by the operation.
   The postAction of the mass action (for example, a message) runs at this moment, not when the action is executed.
2. **Export** – Export rows to a file.

    * Ability to filter/sort the table before export.
    * File format fully compatible with uploading on Step 1 (**Select from file**).
    * Tooltip on hover: “Export of selected rows. You can use this file on Step 1 via ‘Select from File.’”
    * After export, display a notification: “File exported successfully”

3. **Retry**, menu item **Export failed** – Export all rows with the status “Fail”.

    * The table is automatically filtered by failed rows.
    * File format fully compatible with uploading on Step 1 (**Select from file**).
    * Tooltip on hover: “A file with failed rows will be downloaded. To retry the operation for these rows, upload this file on Step 1 via ‘Select from File.’”

### <a id="retry">Retry for failed rows</a>
The operation is repeated for the failed rows in three steps:

1. **Export** — on Step 4 click **Retry** → **Export failed**. An Excel file with the failed rows is downloaded.
2. **Upload** — start the mass operation again and on [Step 1](#selecting_rows) select **Select from file** in the gear menu. The rows from the file become selected.
   Rows are matched only by ID: the exported file keeps it in a hidden column, so the file does not need to be edited.
3. **Run again** — go through the steps of the mass operation as usual, the values are entered in the confirmation form again.
