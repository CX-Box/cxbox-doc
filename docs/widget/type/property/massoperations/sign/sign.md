# Bulk signing and encrypting
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711masssignlist){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign){:target="_blank"}

`Bulk signing and encrypting` is a [bulk operation](/widget/type/property/massoperations/massoperations/) that signs and encrypts the files of the selected rows with CryptoPro.
All operation types of [Signing and encrypting](/features/sign/sign/) are available: signing, encrypting, signing and encrypting, encrypting and signing.

To use this functionality, the user must have the required [software CryptoPro](http://testca2012.cryptopro.ru/ui/) installed.

After clicking on the bulk action, the user goes through the steps:

1. [Select rows](/widget/type/property/massoperations/massoperations/#selecting_rows)
2. [Review rows](/widget/type/property/massoperations/massoperations/#reviewing)
3. [Certificate selection](#certificates)
4. [Confirm operation](#confirming) (this step is optional)
5. [View results](#result)

### How does it look?
=== "Signing"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711masssignlist){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/mass){:target="_blank"}
=== "Encrypting"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713massencryptlist){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt/mass){:target="_blank"}
=== "Signing and encrypting"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714masssignencryptlist){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/mass){:target="_blank"}
=== "Encrypting and signing"
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712massencryptsignlist){:target="_blank"}
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/mass){:target="_blank"}

!!! Specifics
    * The bulk action has the same settings as the action for one document: an item in `options.cryptoGenerator` with the name of the bulk action.
    * The user selects the certificates once for all rows.
    * The files are processed row by row: the file of a row is signed or encrypted, and the new files are saved to the file storage. When all rows are processed, the action is sent once for all of them.
    * A row that cannot be processed is skipped, the other rows are processed: a row without a file, a CryptoPro error, a file that was not saved.
    * The file preview works on all steps. Its arrows go through the rows, the active row does not change.
    * The postAction of the bulk action runs when the user clicks **Close** on [Step 5](#result).

##### How to add?

??? Example
    **Step 1** Add a bulk action to the corresponding **Service**.

    * `data.getMassIds_()` gives only the rows processed on the frontend.
      The files of a row are in its options: `mass.getOption(MassOptionType.SIGNATURE_FILE_ID)` and other keys of `MassOptionType`.
    * The rows that failed on the frontend get their errors in the result automatically.
      If the handler returns its own result for such a row, its own result is shown.

    **Step 2** Add an item with the name of the bulk action to `options.cryptoGenerator` and the action to `actionGroups` in the `.widget` configuration options.

    === "Signing"
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711masssignlist){:target="_blank"}
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign){:target="_blank"}

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/Myexample3711MassService.java:getActions
        --8<--
        ```

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/mass/MyExample3711MassList.widget.json
        --8<--
        ```
    === "Encrypting"
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713massencryptlist){:target="_blank"}
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt){:target="_blank"}

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/Myexample3713MassService.java:getActions
        --8<--
        ```

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/mass/MyExample3713MassList.widget.json
        --8<--
        ```
    === "Signing and encrypting"
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714masssignencryptlist){:target="_blank"}
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt){:target="_blank"}

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/Myexample3714MassService.java:getActions
        --8<--
        ```

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/mass/MyExample3714MassList.widget.json
        --8<--
        ```
    === "Encrypting and signing"
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712massencryptsignlist){:target="_blank"}
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign){:target="_blank"}

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/Myexample3712MassService.java:getActions
        --8<--
        ```

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/mass/MyExample3712MassList.widget.json
        --8<--
        ```

    To react to the rows that failed on the frontend, read `data.getMassErrors_()`:

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/Myexample3711MassService.java:massErrors
    --8<--
    ```

## <a id="certificates">Step 3. Certificate selection</a>

1. The user selects the certificates, as in the popup for one document: for signing, for encryption or both, by the operation type.
2. **Available actions**:

    * **Execute** - processes the files of the rows and sends the action. The button is shown when the action has no confirmation.
    * **Next** - moves the user to [Step 4](#confirming). The button is shown when the action has a confirmation. The files are not processed yet.
    * **Back** - returns the user to [Step 2](/widget/type/property/massoperations/massoperations/#reviewing).

3. While the files are processed, the step shows a progress bar and **Processed N of M**. **Back** is not available.

    * **Stop and send processed** - stops the processing at once. The processed rows are sent, the current row and the rows after it get the error "Interrupted".
      If no row is processed yet, nothing is sent and the step is shown again.

4. If the action fails on the server, the user can go back and run the step again.
   A row that is already processed with the same certificates and the same file is not processed again until the bulk operation is closed.

## <a id="confirming">Step 4. Confirm operation</a>
The step is shown only when the bulk action has a confirmation, as in [Bulk operations](/widget/type/property/massoperations/massoperations/#confirming).

1. The confirmation is shown with its own buttons.
2. After the yes button, the files are processed on this step, as on [Step 3](#certificates): a progress bar, **Processed N of M**, **Stop and send processed**. Then the action is sent.
3. The no button closes the bulk operation. Nothing is signed or encrypted.
4. **Back** returns the user to [Step 3](#certificates).

## <a id="result">Step 5. View results</a>
The step works as [View results](/widget/type/property/massoperations/massoperations/#result) of bulk operations.

A row that was not processed has the status **Fail** and the error:

* "There is no file in this row" - the row has no file;
* the text of the CryptoPro error;
* "Interrupted" - the processing was stopped with **Stop and send processed** before this row.

The postAction of the bulk action runs when the user clicks **Close**.
