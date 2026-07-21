# Signing and encrypting
(since [release 2.0.18](https://doc.cxbox.org/new/version2018/))

Support for signing and encrypting documents using a Qualified Electronic Signature (QES) with CryptoPro software.

## PrerequisitesPre-setup for Working

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
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbeslist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesBesForm.widget.json){:target="_blank"}

CAdES_BES
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbestlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesTForm.widget.json){:target="_blank"}

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
