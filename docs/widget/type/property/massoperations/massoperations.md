# Bulk operations (Mass operations)
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

!!! Attention
    For small and medium data volumes. Use for synchronous processing within a single transaction when the data size is up to 10,000 rows.

`Bulk operations` are a mechanism that allows the user to perform a single action on a large number of table rows at once. Instead of processing each row individually, the user can select a set of data and apply a common operation to it—such as updating, deleting, changing statuses, recalculating values, and other typical scenarios.

This function is available for widgets:

 * [List](/widget/type/list/list) 
 * [GroupingHierarchy](/widget/type/groupinghierarchy/groupinghierarchy)

When the table contains at least one row, bulk operations become available. 
After clicking on a bulk operation, the user enters the bulk-operation mode, which consists of several steps:

1. [Selecting rows](#selecting_rows)
2. [Reviewing the selected rows](#reviewing)
3. [Confirming the action](#confirming) (this step is optional)
4. [Viewing the result](#result) 

### How does it look?
=== "With confirm"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101list){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

    ![massoperations.png](massoperations.png)
=== "Without confirm"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101checkboxtruelist){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

    ![massoperations3.png](massoperations3.png)

!!! Specifics
    * Bulk operations become available only if there is at least one row in the table.
    * All requests are executed using the ID of the first selected row!
    * In GroupingHierarchy only rows with records can be selected: a group row without its own record (an empty group, a row of totals) has a disabled checkbox. From Step 2 the table shows only the groups with selected rows.
    * Rows are only viewed during a bulk operation, the file preview too: its arrows go through the rows, a row does not become active, the record form is not shown.


##### How to add?

??? Example
    - **Step1**  Add actionGroups **massEdit**(Custom name) to corresponding **.widget.json**.

        ```json
            "actionGroups": {
              "include": [
                "massEdit"
              ]
        }
        ```

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/massoperations/myexample6101List.widget.json
        --8<--
        ``` 
    - **Step2** Create action massEdit to corresponding **AwareResponseService**.      

        === "With plugin(recommended)"
            **Step 1** Download plugin
            [download Intellij Plugin](https://doc.cxbox.org/plugin/plugininstalling)
    
            **Step 2** Add existing field to an existing form widget
    
            ![addmass.gif](addmass.gif)
    
        === "Example of writing code"
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/feature/massoperations/MyExample6101Service.java:massEditCustomTitle
            --8<--
            ``` 

        Property:

        -  `.action("massEditCustomTitle", "Mass Edit With Custom Text")`
            
            * `"massEditCustomTitle"` — name button for internal used by backend and frontend.
            * `"Mass Edit With Custom Text"` —  title displayed in the UI.
            
            
        - `.withPreAction(PreAction.confirmWithWidget(...))`
            
            Adds a confirmation dialog before the mass action executes.
            
            Parameters:
            
            - 1) The name widget used for the confirmation .
            
            - 2) **`cfw -> ...`**:
            
            A configuration block where  properties are defined:
            
            **`.noText("It is text no")`**
              Text for the **Cancel ** button.
            
            **`.title("Mass Edit Title")`**
                Title of the a confirmation dialog before the mass action executes.
            
            **`.yesText("It is text yes")`**
                Text for the **Apply** button.
            
            This allows customizing the buttons and title.
            
        - `.scope(ActionScope.MASS)`
                
            Specifies that this is a **mass action**, applied to all selected rows in the grid.
                
        - `.massInvoker((bc, data, ids) -> { ... })`
            
            The main handler for the mass operation.
            
            Parameters:
            
            * **`bc`** — business component context.
            * **`data`** — data submitted from the confirmation dialog based on the *first row*.
            * **`ids`** — the set of IDs of all selected records.
            
            Inside the handler:
             The  method processes each record and returns:
            
            * `MassDTO.success(id)` - result success 
            * `MassDTO.fail(id, "message")` - result error 
        
                
        - `return new MassActionResultDTO<>(massResult)...`
                
            The mass action result includes:
            
            * success/failure information for each record,
            * a UI post-action.
            
          - `.setAction(PostAction.showMessage(...))`
                
             Displays a message in the UI after the mass action completes.
            
             Parameters:
            
             * `MessageType.INFO` — message type.
             * `"The fields mass operation was completed!"` — message text.

        === "With confirm"
             [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101list){:target="_blank"}
             [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

             ```java
             --8<--
             {{ external_links.github_raw_doc }}/feature/massoperations/MyExample6101Service.java:massEdit
             --8<--
             ``` 
        === "Without confirm"
             [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101checkboxtruelist){:target="_blank"}
             [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

             ```java
             --8<--
             {{ external_links.github_raw_doc }}/feature/massoperations/MyExample6101Service.java:massCheckboxTrue
             --8<--
             ``` 


## <a id="selecting_rows">Step 1. Selecting rows</a>
### How does it look?
![mass_select_row2.png](mass_select_row2.png)

1. Checkboxes for selecting rows are displayed in the first column of the table (true = the row is selected).
2. Filtering and sorting remain available.
3. Rows become non-editable while in bulk-operation mode.
4. All selected rows are displayed above the table as chips.

    * If the number of chips exceeds **N**, only the first **N** are shown; the rest are collapsed and replaced with the label **“+N values”**. Hovering over **“+N values”** displays a tooltip: *“Move on to Step 2 to see all the chosen rows.”*
    * A **“Clear”** button is displayed next to the chips. Clicking **Clear** deselects all checkboxes and removes all chips.
    * A gear icon is available for chip-related actions, containing the option **“Select from file”** (importing data from an Excel file [step 4](#result)).
          ![import.png](import.png)
  
5. **Available actions**:

    * **Cancel** — exits bulk-operation mode.
    * **Next** — proceeds to Step 2, where only the selected rows are displayed.

## <a id="reviewing">Step 2. Reviewing the selected rows</a>
### How does it look?
![review.png](review.png)

1.Selected rows from [Step 1. Selecting rows](#selecting_rows) are displayed in read-only mode.

2.Checkboxes are disabled, and rows cannot be edited.

3.Filtering and sorting of the selected rows remain available.

4.Available actions:

4.1.Dynamic **“Next / Apply** button 

* **Next** — moves the user to Step 3 (confirmation).
* **Apply** — immediately executes the bulk action and navigates to the *View Results* step.

4.2.**Back** — returns the user to Step 1 (row selection).
    When returning to Step 1, the table resets to the first page and all filters are cleared.

4.3.**Cancel** — exits bulk-operation mode without applying any changes.

## <a id="confirming">Step 3. Confirming the action</a>
### How does it look?
=== "Basic"
    ![confirm.png](confirm.png)
=== "With custom text"
    ![confirmwithcustomtitle.png](confirmwithcustomtitle.png)
=== "Without title"
    ![confirmwithouttitle.png](confirmwithouttitle.png)

You can enable or disable the confirmation step — if it’s disabled, the system moves directly to the *View results* stage.

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

## <a id="result">Step 4. Viewing the result</a>
### How does it look?
![result.png](result.png)


After performing a mass operation, the status for each row in the table is displayed:

1. **Success** – the operation was completed successfully
2. **Fail** – the operation was not completed

The widget header on displays the number of processed rows (including the number of successful/failed rows).

Filtering/sorting of selected rows is available for any column, including status.

**Available actions:**

1. **Save and Close** – Exit the mass operation mode. The user returns to the normal table view, taking into account all changes made by the operation.

2. **Export** – Export rows to a file.
   2.1 Ability to filter/sort the table before export.
   2.2 File format fully compatible with uploading on Step 1 (Select from File).
   2.3 Tooltip on hover:  “Export of selected rows. You can use this file on Step 1 via ‘Select from File.’”
   2.4 After export, display a notification:  "File exported successfully"

3. **Export failed (for Retry)** – Export all rows with the status “Fail”
   3.1 The table is automatically filtered by failed rows.
   3.2 File format fully compatible with uploading on Step 1 (Select from File).
   3.3 Tooltip on hover: A file with failed rows will be downloaded. To retry the operation for these rows, upload this file on Step 1 via ‘Select from File.’”
  


## Delete
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101delete){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

Bulk record deletion can be performed. Successfully deleted records will no longer appear in the step results.

### How does it look?
![deletemass.gif](deletemass.gif) 

### How to add?
??? Example
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/massoperations/MyExample6101Service.java:massDelete
    --8<--
    ```
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6101/view/myexample6101delete){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/massoperations){:target="_blank"}

## <a id="crypto">Signing and encrypting</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711masssignlist){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign){:target="_blank"}

The files of the selected rows can be signed and encrypted with CryptoPro, see [Signing and encrypting](/features/sign/sign/).

On [Step 3](#confirming) the confirmation of the action is shown first, if the action has one, with its own buttons.
Then the user selects the certificates, as in the popup for one document, and clicks **Execute**.
The files are processed row by row, the step shows how many rows are processed. Then the action is sent once for all rows.
**Interrupt and next** ends the processing at once, the action is sent for the processed rows.

On [Step 4](#result) a row that was not processed shows an error: a row without a file, a CryptoPro error, a row left after **Interrupt and next**.

### How to add?
??? Example
    **Step 1** Add a mass action to the corresponding **Service**.

    * `data.getMassIds_()` gives only the rows processed on the frontend.
      The files of a row are in its options: `mass.getOption(MassOptionType.SIGNATURE_FILE_ID)` and other keys of `MassOptionType`.
    * The rows that failed on the frontend get their errors in the result automatically.
      If the handler returns its own result for such a row, its own result is shown.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/Myexample3711MassService.java:getActions
    --8<--
    ```

    To react to the rows that failed on the frontend, read `data.getMassErrors_()`:

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/Myexample3711MassService.java:massErrors
    --8<--
    ```

    **Step 2** Add an item with the name of the mass action to `options.cryptoGenerator` and the action to `actionGroups` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/mass/MyExample3711MassList.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711masssignlist){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign){:target="_blank"}
