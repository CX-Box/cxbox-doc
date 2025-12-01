# Bulk operations
!!! info
    For small and medium data volumes. Use for synchronous processing within a single transaction when the data size is up to 10,000 rows.

`Bulk operations` are a mechanism that allows the user to perform a single action on a large number of table rows at once. Instead of processing each row individually, the user can select a set of data and apply a common operation to it—such as updating, deleting, changing statuses, recalculating values, and other typical scenarios.

This function is available:

* for widgets: [List](/widget/type/list/list), [GroupingHierarchy](/widget/type/groupinghierarchy/groupinghierarchy).
* for fields: See more [field types](/widget/fields/fieldtypes/) 


When the table contains at least one row, bulk operations become available. 
After clicking on a bulk operation, the user enters the bulk-operation mode, which consists of several steps:

1. [Selecting rows](#selecting_rows)
2. [Reviewing the selected rows](#reviewing)
3. [Confirming the action](#confirming) (this step is optional)
4. [Viewing the result](#result) 

=== "With confirm" 
    ![massoperations.png](massoperations.png)
=== "Without confirm" 
    ![massoperations3.png](massoperations3.png)

!!! Specifics
    * Bulk operations become available only if there is at least one row in the table.
    * All requests are executed using the ID of the first selected row!

## <a id="selecting_rows">Step 1. Selecting rows</a>
![select.png](select.png)

1. Checkboxes for selecting rows are displayed in the first column of the table (true = the row is selected).
2. Filtering and sortingremain available.
3. Rows become non-editable while in bulk-operation mode.
4. All selected rows are displayed above the table as chips.

    * If the number of chips exceeds **N**, only the first **N** are shown; the rest are collapsed and replaced with the label **“+N values”**. Hovering over **“+N values”** displays a tooltip: *“Move on to Step 2 to see all the chosen rows.”*
    * A **“Clear”** button is displayed next to the chips. Clicking **Clear** deselects all checkboxes and removes all chips.
    * A gear icon is available for chip-related actions, containing the option **“Select from file”** (importing data from an Excel file).
5. **Available actions**:

    * **Cancel** — exits bulk-operation mode.
    * **Next** — proceeds to Step 2, where only the selected rows are displayed.
 
## <a id="reviewing">Step 2. Reviewing the selected rows</a>
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
=== "Basic"
    ![confirm.png](confirm.png)
=== "With custom text"
    ![confirmwithcustomtitle.png](confirmwithcustomtitle.png)
=== "Without title"
    ![confirmwithouttitle.png](confirmwithouttitle.png)

## <a id="result">Step 4. Viewing the result</a>

![result.png](result.png)