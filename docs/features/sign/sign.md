# Signing and encrypting
(since [release 2.0.18](https://doc.cxbox.org/new/version2018/))

Support for signing and encrypting documents using a Qualified Electronic Signature (QES) with CryptoPro software.

## Prerequisites

To use this functionality, the user must have the required [software CryptoPro](http://testca2012.cryptopro.ru/ui/) installed.
 
## Basic

Supported:

* [document signing](#doc_signing);
* [document encrypting](#doc_encryption);
* [document signing and encrypting](#doc_signing_encryption);
* [document encrypting and signing](#doc_encryption_signing);

`type` — operation type:

| Parameter         | Description                               |
|------------------|-------------------------------------------|
| `sign`           | Signing only                              |
| `encrypt`        | Encryption only                           |
| `encryptAndSign` | Encrypt first, then sign                  |
| `signAndEncrypt` | Sign first, then encrypt                  |
  
## <a id="limits">Limitations and settings</a>

### <a id="file_size">File size</a>

| Operation          | File size                        |
|--------------------|----------------------------------|
| Detached signature | Any                              |
| Encryption         | Any                              |
| Attached signature | Up to 30 MB (30 000 000 bytes)   |

Detached signing and encryption process the file in parts, so the file size does not matter.
An attached signature is created by the CryptoPro plugin from the whole file at once. The plugin cannot process large files (depending on the computer, it fails at 10–60 MB, see [CryptoPro documentation](https://docs.cryptopro.ru/cades/plugin/content-encoding){:target="_blank"}), so the application limits the attached signature to 30 MB.

The limit is the same for every operation with an attached signature: signing, signing and encrypting, encrypting and signing.
When encrypting and signing, the encrypted file is signed, but the limit is still counted against the original file.

!!! tips
    If users work with large files, use a detached signature: `signaturePackage: detached` (default).

<a id="attached_assembly"></a>**Attached signature of files over 30 MB**

!!! warning
    We do not recommend removing the limit. Do this only if your project, your information security department and the recipients of the signed documents have agreed on it.

The limit can be removed with the `REACT_APP_CRYPTOPRO_ATTACHED_ASSEMBLY` variable. Then the attached signature is created differently:
CryptoPro signs the file hash in parts, as for a detached signature, and the application itself inserts the file into the signature container (the `pkijs` library).

What changes when the variable is enabled:

* **Every attached signature** is created this way, for files of any size, including small ones.
* **The signature container is assembled by the application, not by CryptoPro.** The file hash and the signature value are still calculated by CryptoPro, but the container is assembled outside the certified CryptoPro software. If your process requires the signature to be created entirely by certified means (for example, a qualified electronic signature for government information systems), check this before enabling the variable.

How to enable?
??? Example

    **Step 1** Add the variable to `ui/.env` (and to `ui/.env.development` for the test environment):

    ```
    REACT_APP_CRYPTOPRO_ATTACHED_ASSEMBLY = 'true'
    ```

    `false` (default) — an attached signature only for files up to 30 MB.
    Any value other than `true` or `false` is treated as `false`, and an error is written to the browser console.

    **Step 2** Restart the frontend: the variables are read when the frontend is built or started.

How to remove the assembly from the project?
??? Example

    The assembly is a separate optional module `ui/src/features/cryptoPro/attachedAssembly`. It is loaded only when the variable is enabled.
    If the project must never create an attached signature this way, remove the module from the build:

    **Step 1** Delete all files in `ui/src/features/cryptoPro/attachedAssembly` except `index.ts`.

    **Step 2** In `index.ts`, replace the loader with `undefined`:

    ```ts
    export const loadAttachedAssembly: OptionalModuleLoader<AttachedAssembly> | undefined = undefined
    ```

    **Step 3** Remove the `pkijs` and `asn1js` dependencies from `ui/package.json`.

    Nothing else changes. If the variable is enabled after that, attached signing fails with the message *Attached signature of large files is not included in the application*.

## <a id="doc_signing">Document signing</a>

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign){:target="_blank"}

| Parameter               | Description                                                                 |
    |------------------------|-----------------------------------------------------------------------------|
| `type` (required)       | Operation type. `sign` — document signing                                   |
| `signaturePackage`      | Signature container type (`detached` / `attached` / `any`), default: `detached` |
| `signatureType`         | Electronic signature type (`CADES_BES` / `CADES_T`), default: `CADES_BES`  |
| `actionName` (required) | Name of the operation to be executed (e.g. `documentSign`)                |
| `documentFileIdKey` (required) | Key used for the document file ID                                   |
| `documentFileNameKey` (required) | Key used for the document file name                              |
| `signatureFileIdKey` (required) | Key for the signature file ID                                    |
| `signatureFileNameKey` (required) | Key for the signature file name                                |

How does it look?

=== "Signature"
    <video controls width="800">
    <source src="/features/sign/sign.mp4" type="video/mp4">
    </video>
=== "Signature verification"
    <video controls width="800">
    <source src="/features/sign/check_sign.mp4" type="video/mp4">
    </video>

How to add?
??? Example

    **Step 1** Add a button for signing in the corresponding **Service**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/Myexample3711Service.java:getActions
    --8<--
    ```

    **Step 2** Include `options.cryptoGenerator` in the `.widget` configuration options.
 
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/base/MyExample3711Form.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/base){:target="_blank"}

### Electronic Signature Type
"CAdES_T"
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcadesbestlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/cades/MyExample3711CadesTForm.widget.json){:target="_blank"}

CAdES_BES
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcadesbeslist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/cades/MyExample3711CadesBesForm.widget.json){:target="_blank"}

The user can select the electronic signature type:

- **CAdES_BES** — basic electronic signature type  
  Used for standard document signing without additional attributes.

- **CAdES_T** — extended signature type  
  Includes all properties of CAdES_BES and additionally contains a trusted timestamp that records the exact moment of signing.

How to add?
??? Example

    **Step 1** Add the `signatureType` property to `options.cryptoGenerator` in the `.widget` configuration options.

    `CADES_BES` (default) / `CADES_T`

    === "CAdES_BES"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/cades/MyExample3711CadesBesForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcadesbeslist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/cades/MyExample3711CadesBesForm.widget.json){:target="_blank"}

    === "CAdES_T"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/cades/MyExample3711CadesTForm.widget.json
        --8<--
        ```

        To set the Time Stamping Authority (TSA) server address:
        
        * Navigate to the `ui/.env` and `ui/.env.development` files.
        * Add the REACT_APP_CRYPTOPRO_TSA_URL variable:
        
            In `ui/.env.development` — set the test server address, for example the CryptoPro test service `http://testca2012.cryptopro.ru/tspservice` (use it only for testing).
            
            In `ui/.env` — set the production server address.
            
        !!! info
            There is no default address. If the variable is not set, a `CAdES_T` signature is not created: the user sees the message *The time stamp service for CAdES-T signatures is not configured*. `CAdES_BES` signatures are created as usual.

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcadesbestlist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/cades/MyExample3711CadesTForm.widget.json){:target="_blank"}

### Signature Container Format

**The user can choose the format of the generated container:**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerdetachedform){:target="_blank"} ·[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711DetachedForm.widget.json){:target="_blank"}

**detached (detached signature)** 

A separate signature file is generated that contains only the signature for the document.  
The document itself is not included in the container.

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerattachedform){:target="_blank"} · [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711AttachedForm.widget.json){:target="_blank"}

**attached (attached signature)**

A single container is generated that includes: original document and signature for the document

!!! restriction
    An attached signature can be created for files up to 30 MB. For larger files use a detached signature. See [File size](#file_size).

**Two scenarios are possible in the UI:**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontaineranyform){:target="_blank"} ·[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711AnyForm.widget.json){:target="_blank"}

**User selects the signature type**

 A popup is displayed with a dropdown allowing the user to choose: container format (detached / attached)

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerdetachedform){:target="_blank"} ·[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711DetachedForm.widget.json){:target="_blank"}

**Signature type is predefined by the system**

The dropdown is not shown in the interface.  
The signature is generated automatically according to the predefined configuration.

How does it look?
=== "User selects the signature type"
    <video controls width="800">
    <source src="/features/sign/sign_any.mp4" type="video/mp4">
    </video>
=== "attached (attached signature)"
    <video controls width="800">
    <source src="/features/sign/sign_attach.mp4" type="video/mp4">
    </video>
=== "detached (detached signature)"
    <video controls width="800">
    <source src="/features/sign/sign_deattch.mp4" type="video/mp4">
    </video>

How to add?
??? Example

    **Step 1** Add the `signaturePackage` property to `options.cryptoGenerator` in the `.widget` configuration options.

    `any` — user selects the signature type  
    `detached` (default) / `attached` — signature type is predefined by the system

    === "User selects the signature type"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/attached/MyExample3711AnyForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontaineranyform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711AnyForm.widget.json){:target="_blank"}

    === "detached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/attached/MyExample3711DetachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerdetachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711DetachedForm.widget.json){:target="_blank"}

    === "attached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/attached/MyExample3711AttachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerattachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711AttachedForm.widget.json){:target="_blank"}

    === "default"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/attached/MyExample3711DefaultForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerdefaultform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711DefaultForm.widget.json){:target="_blank"}

### Override of the signed document name
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711overridesignform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/filebasename){:target="_blank"}

You can override the name of the signed document file.

How does it look?

<video controls width="800">
<source src="/features/sign/sign_override.mp4" type="video/mp4">
</video>

How to add?
??? Example

    **Step 1** Add the `signatureFileBaseNameKey` property to `options.cryptoGenerator` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/filebasename/MyExample3711BaseNameForm.widget.json
    --8<--
    ```

    **Step 2** Add a hidden field referenced by `signatureFileBaseNameKey` to `fields`.

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711overridesignform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/filebasename){:target="_blank"}

### Mass operation
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711masssignlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign){:target="_blank"}

The user can sign the files of several rows at once with a bulk operation, see [Bulk signing and encrypting](/widget/type/property/massoperations/sign/).

How to add?
??? Example

    **Step 1** Add a mass action to the corresponding **Service**. The files created on the frontend come with each row: `mass.getOption(MassOptionType.SIGNATURE_FILE_ID)`, `mass.getOption(MassOptionType.SIGNATURE_FILE_NAME)`.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/Myexample3711MassService.java:getActions
    --8<--
    ```

    **Step 2** Add an item with the name of the mass action to `options.cryptoGenerator` and the action to `actionGroups` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/mass/MyExample3711MassList.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711masssignlist){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/mass){:target="_blank"}

## <a id="doc_encryption">Document encrypting</a>

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3713){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt){:target="_blank"}


| Parameter               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `type` (required)       | Operation type. `encrypt` — document encryption                             |
| `actionName` (required) | Name of the operation to be executed (e.g. `documentEncrypt`)               |
| `documentFileIdKey` (required) | Key used for the document file ID                                   |
| `documentFileNameKey` (required) | Key used for the document file name                              |
| `encryptedFileIdKey` (required) | Key for the encrypted file ID                                    |
| `encryptedFileNameKey` (required) | Key for the encrypted file name                                |

How does it look?

<video controls width="800">
<source src="/features/sign/encrypt.mp4" type="video/mp4">
</video>

How to add?
??? Example

    **Step 1** Add a button for encryption in the corresponding **Service**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/Myexample3713Service.java:getActions
    --8<--
    ```

    **Step 2** Include `options.cryptoGenerator` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/base/MyExample3713BaseForm.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713encryptform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt/base){:target="_blank"}

### Override of the encrypted document name
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713overrideform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt/filebasename){:target="_blank"}

You can override the name of the encrypted document file.

How does it look?

<video controls width="800">
<source src="/features/sign/encrypt_override.mp4" type="video/mp4">
</video>

How to add?
??? Example

    **Step 1** Add the `encryptedFileBaseNameKey` property to `options.cryptoGenerator` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/filebasename/MyExample3713BaseNameForm.widget.json
    --8<--
    ```

    **Step 2** Add a hidden field referenced by `encryptedFileBaseNameKey` to `fields`.

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713overrideform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt/filebasename){:target="_blank"}

### Mass operation
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713massencryptlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt){:target="_blank"}

The user can encrypt the files of several rows at once with a bulk operation, see [Bulk signing and encrypting](/widget/type/property/massoperations/sign/).

How to add?
??? Example

    **Step 1** Add a mass action to the corresponding **Service**. The files created on the frontend come with each row: `mass.getOption(MassOptionType.ENCRYPTED_FILE_ID)`, `mass.getOption(MassOptionType.ENCRYPTED_FILE_NAME)`.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/Myexample3713MassService.java:getActions
    --8<--
    ```

    **Step 2** Add an item with the name of the mass action to `options.cryptoGenerator` and the action to `actionGroups` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/mass/MyExample3713MassList.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713massencryptlist){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt/mass){:target="_blank"}

## <a id="doc_signing_encryption">Document signing and encrypting</a>

Sign first, then encrypt (`signAndEncrypt`).

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt){:target="_blank"}


| Parameter               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `type` (required)       | Operation type. `signAndEncrypt` — sign first, then encrypt                 |
| `actionName` (required) | Name of the operation to be executed (e.g. `documentSignEncrypt`)           |
| `documentFileIdKey` (required) | Key used for the document file ID                                   |
| `documentFileNameKey` (required) | Key used for the document file name                              |
| `signatureFileIdKey` (required) | Key for the signature file ID                                    |
| `signatureFileNameKey` (required) | Key for the signature file name                                |
| `encryptedFileIdKey` (required) | Key for the encrypted file ID                                    |
| `encryptedFileNameKey` (required) | Key for the encrypted file name                                |


How does it look?

<video controls width="800">
<source src="/features/sign/signencrypt.mp4" type="video/mp4">
</video>

How to add?
??? Example

    **Step 1** Add a button for signing and encrypting in the corresponding **Service**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/Myexample3714Service.java:getActions
    --8<--
    ```

    **Step 2** Include `options.cryptoGenerator` with `type: signAndEncrypt` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/base/MyExample3714Form.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/base){:target="_blank"}

### Electronic Signature Type
"CAdES_T"
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbestlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesTForm.widget.json){:target="_blank"}

CAdES_BES
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbeslist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesBesForm.widget.json){:target="_blank"}

The user can select the electronic signature type:

- **CAdES_BES** — basic electronic signature type  
  Used for standard document signing without additional attributes.

- **CAdES_T** — extended signature type  
  Includes all properties of CAdES_BES and additionally contains a trusted timestamp that records the exact moment of signing.
 
How to add?
??? Example

    **Step 1** Add the `signatureType` property to `options.cryptoGenerator` in the `.widget` configuration options.

    === "CAdES_BES"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/cades/MyExample3714CadesBesForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbeslist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesBesForm.widget.json){:target="_blank"}

    === "CAdES_T"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/cades/MyExample3714CadesTForm.widget.json
        --8<--
        ```
        To set the Time Stamping Authority (TSA) server address:
        
        * Navigate to the `ui/.env` and `ui/.env.development` files.
        * Add the REACT_APP_CRYPTOPRO_TSA_URL variable:
        
            In `ui/.env.development` — set the test server address, for example the CryptoPro test service `http://testca2012.cryptopro.ru/tspservice` (use it only for testing).
            
            In `ui/.env` — set the production server address.
            
        !!! info
            There is no default address. If the variable is not set, a `CAdES_T` signature is not created: the user sees the message *The time stamp service for CAdES-T signatures is not configured*. `CAdES_BES` signatures are created as usual.

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbestlist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesTForm.widget.json){:target="_blank"}

### Signature Container Format

**The user can choose the format of the generated container:**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerdetachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714DetachedForm.widget.json){:target="_blank"}

**detached (detached signature)**

A separate signature file is generated that contains only the signature for the document.  
The document itself is not included in the container.

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerattachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714AttachedForm.widget.json){:target="_blank"}

**attached (attached signature)**

A single container is generated that includes: original document and signature for the document

!!! restriction
    An attached signature can be created for files up to 30 MB. For larger files use a detached signature. See [File size](#file_size).

**Two scenarios are possible in the UI:**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontaineranyform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714AnyForm.widget.json){:target="_blank"}

**User selects the signature type**

A popup is displayed with a dropdown allowing the user to choose: container format (detached / attached)

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerdetachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714DetachedForm.widget.json){:target="_blank"}

**Signature type is predefined by the system**

The dropdown is not shown in the interface.  
The signature is generated automatically according to the predefined configuration.

How does it look?
=== "User selects the signature type"
    <video controls width="800">
    <source src="/features/sign/signencrypt_any.mp4" type="video/mp4">
    </video>
=== "attached (attached signature)"
    <video controls width="800">
    <source src="/features/sign/signencrypt_attach.mp4" type="video/mp4">
    </video>
=== "detached (detached signature)"
    <video controls width="800">
    <source src="/features/sign/signencrypt_deatach.mp4" type="video/mp4">
    </video>

How to add?
??? Example

    **Step 1** Add the `signaturePackage` property to `options.cryptoGenerator` in the `.widget` configuration options.

    === "User selects the signature type"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/attached/MyExample3714AnyForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontaineranyform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714AnyForm.widget.json){:target="_blank"}

    === "detached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/attached/MyExample3714DetachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerdetachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714DetachedForm.widget.json){:target="_blank"}

    === "attached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/attached/MyExample3714AttachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerattachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714AttachedForm.widget.json){:target="_blank"}

    === "default"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/attached/MyExample3714DefaultForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerdefaultform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714DefaultForm.widget.json){:target="_blank"}

### Override of the signed document name
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptoverridesignform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/filebasename){:target="_blank"}

You can override the name of the signed document file.

How does it look?

<video controls width="800">
<source src="/features/sign/signencrypt_override.mp4" type="video/mp4">
</video>

How to add?
??? Example

    **Step 1** Add the `signatureFileBaseNameKey` property to `options.cryptoGenerator` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/filebasename/MyExample3714BaseNameForm.widget.json
    --8<--
    ```

    **Step 2** Add a hidden field referenced by `signatureFileBaseNameKey` to `fields`.

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptoverridesignform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/filebasename){:target="_blank"}

### Mass operation
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714masssignencryptlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt){:target="_blank"}

The user can sign and encrypt the files of several rows at once with a bulk operation, see [Bulk signing and encrypting](/widget/type/property/massoperations/sign/).

How to add?
??? Example

    **Step 1** Add a mass action to the corresponding **Service**. The files created on the frontend come with each row: `mass.getOption(MassOptionType.SIGNATURE_FILE_ID)`, `mass.getOption(MassOptionType.SIGNATURE_FILE_NAME)`, `mass.getOption(MassOptionType.ENCRYPTED_FILE_ID)`, `mass.getOption(MassOptionType.ENCRYPTED_FILE_NAME)`.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/Myexample3714MassService.java:getActions
    --8<--
    ```

    **Step 2** Add an item with the name of the mass action to `options.cryptoGenerator` and the action to `actionGroups` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/mass/MyExample3714MassList.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714masssignencryptlist){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/mass){:target="_blank"}

## <a id="doc_encryption_signing">Document encrypting and signing</a>

Encrypt first, then sign (`encryptAndSign`).

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign){:target="_blank"}


| Parameter               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `type` (required)       | Operation type. `encryptAndSign` — encrypt first, then sign                 |
| `actionName` (required) | Name of the operation to be executed (e.g. `documentEncryptSign`)           |
| `documentFileIdKey` (required) | Key used for the document file ID                                   |
| `documentFileNameKey` (required) | Key used for the document file name                              |
| `signatureFileIdKey` (required) | Key for the signature file ID                                    |
| `signatureFileNameKey` (required) | Key for the signature file name                                |
| `encryptedFileIdKey` (required) | Key for the encrypted file ID                                    |
| `encryptedFileNameKey` (required) | Key for the encrypted file name                                |

How does it look?

<video controls width="800">
<source src="/features/sign/encryptsign.mp4" type="video/mp4">
</video>
 
How to add?
??? Example

    **Step 1** Add a button for encrypting and signing in the corresponding **Service**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/Myexample3712Service.java:getActions
    --8<--
    ```

    **Step 2** Include `options.cryptoGenerator` with `type: encryptAndSign` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/base/MyExample3712Form.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/base){:target="_blank"}

### Electronic Signature Type
"CAdES_T"
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcadesbestlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/cades/MyExample3712CadesTForm.widget.json){:target="_blank"}

CAdES_BES
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcadesbeslist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/cades/MyExample3712CadesBesForm.widget.json){:target="_blank"}

The user can select the electronic signature type:

- **CAdES_BES** — basic electronic signature type  
  Used for standard document signing without additional attributes.

- **CAdES_T** — extended signature type  
  Includes all properties of CAdES_BES and additionally contains a trusted timestamp that records the exact moment of signing.

How to add?
??? Example

    **Step 1** Add the `signatureType` property to `options.cryptoGenerator` in the `.widget` configuration options.

    === "CAdES_BES"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/cades/MyExample3712CadesBesForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcadesbeslist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/cades/MyExample3712CadesBesForm.widget.json){:target="_blank"}

    === "CAdES_T"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/cades/MyExample3712CadesTForm.widget.json
        --8<--
        ```

        To set the Time Stamping Authority (TSA) server address:
        
        * Navigate to the `ui/.env` and `ui/.env.development` files.
        * Add the REACT_APP_CRYPTOPRO_TSA_URL variable:
        
            In `ui/.env.development` — set the test server address, for example the CryptoPro test service `http://testca2012.cryptopro.ru/tspservice` (use it only for testing).
            
            In `ui/.env` — set the production server address.
            
        !!! info
            There is no default address. If the variable is not set, a `CAdES_T` signature is not created: the user sees the message *The time stamp service for CAdES-T signatures is not configured*. `CAdES_BES` signatures are created as usual.


        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcadesbestlist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/cades/MyExample3712CadesTForm.widget.json){:target="_blank"}

### Signature Container Format

**The user can choose the format of the generated container:**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerdetachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712DetachedForm.widget.json){:target="_blank"}

**detached (detached signature)**

A separate signature file is generated that contains only the signature for the document.  
The document itself is not included in the container.

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerattachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AttachedForm.widget.json){:target="_blank"}

**attached (attached signature)**

A single container is generated that includes: original document and signature for the document

!!! restriction
    An attached signature can be created for files up to 30 MB. For larger files use a detached signature. See [File size](#file_size).

**Two scenarios are possible in the UI:**

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontaineranyform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AnyForm.widget.json){:target="_blank"}

**User selects the signature type**

A popup is displayed with a dropdown allowing the user to choose: container format (detached / attached)

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerattachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AttachedForm.widget.json){:target="_blank"}

**Signature type is predefined by the system**

The dropdown is not shown in the interface.  
The signature is generated automatically according to the predefined configuration.

How does it look?
=== "User selects the signature type"
    <video controls width="800">
    <source src="/features/sign/encryptsign_any.mp4" type="video/mp4">
    </video>
=== "attached (attached signature)"
    <video controls width="800">
    <source src="/features/sign/encryptsign_attach.mp4" type="video/mp4">
    </video>
=== "detached (detached signature)"
    <video controls width="800">
    <source src="/features/sign/encryptsign_deatach.mp4" type="video/mp4">
    </video>


How to add?
??? Example

    **Step 1** Add the `signaturePackage` property to `options.cryptoGenerator` in the `.widget` configuration options.

    === "User selects the signature type"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/attached/MyExample3712AnyForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontaineranyform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AnyForm.widget.json){:target="_blank"}

    === "detached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/attached/MyExample3712DetachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerdetachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712DetachedForm.widget.json){:target="_blank"}

    === "attached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/attached/MyExample3712AttachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerattachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AttachedForm.widget.json){:target="_blank"}

    === "default"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/attached/MyExample3712DefaultForm.widget.json
        --8<--
        ```

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerdefaultform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712DefaultForm.widget.json){:target="_blank"}

### Override of the signed document name
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptoverridesignform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/filebasename){:target="_blank"}

You can override the name of the signed document file.

How does it look?

<video controls width="800">
<source src="/features/sign/encryptsign_override.mp4" type="video/mp4">
</video>


How to add?
??? Example

    **Step 1** Add the `signatureFileBaseNameKey` property to `options.cryptoGenerator` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/filebasename/MyExample3712BaseNameForm.widget.json
    --8<--
    ```

    **Step 2** Add a hidden field referenced by `signatureFileBaseNameKey` to `fields`.

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptoverridesignform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/filebasename){:target="_blank"}

### Example PostAction - zip
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptzip){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign){:target="_blank"}

After encrypting and signing, the source file, the encrypted file and the signature can be put into one zip archive.
The user sees the source file and the archive, the fields of the encrypted file and the signature are hidden.

How to add?
??? Example

    **Step 1** Add the field of the archive to `fields`. Make the fields of the encrypted file and the signature `hidden`.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/postaction/MyExample3712ZipForm.widget.json
    --8<--
    ```

    **Step 2** In `doUpdateEntity` of the corresponding **Service**, when the encrypted file and the signature come, put the three files into a zip archive and save it to the field of the archive.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/Myexample3712Service.java:doUpdateEntity
    --8<--
    ```

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/Myexample3712Service.java:uploadZip
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptzip){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/postaction){:target="_blank"}

### Mass operation
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712massencryptsignlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign){:target="_blank"}

The user can encrypt and sign the files of several rows at once with a bulk operation, see [Bulk signing and encrypting](/widget/type/property/massoperations/sign/).

How to add?
??? Example

    **Step 1** Add a mass action to the corresponding **Service**. The files created on the frontend come with each row: `mass.getOption(MassOptionType.ENCRYPTED_FILE_ID)`, `mass.getOption(MassOptionType.ENCRYPTED_FILE_NAME)`, `mass.getOption(MassOptionType.SIGNATURE_FILE_ID)`, `mass.getOption(MassOptionType.SIGNATURE_FILE_NAME)`.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/Myexample3712MassService.java:getActions
    --8<--
    ```

    **Step 2** Add an item with the name of the mass action to `options.cryptoGenerator` and the action to `actionGroups` in the `.widget` configuration options.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/mass/MyExample3712MassList.widget.json
    --8<--
    ```

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712massencryptsignlist){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/mass){:target="_blank"}

