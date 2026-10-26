# Подписание и шифрование { #signing-and-encrypting }
(начиная с [релиза 2.0.18](https://doc.cxbox.org/ru/new/version2018/))

Поддержка подписания и шифрования документов с использованием квалифицированной электронной подписи (КЭП) и программного обеспечения КриптоПро.

## Предварительная настройка { #prerequisitespre-setup-for-working }

Для использования этой функциональности у пользователя должно быть установлено необходимое [ПО КриптоПро](http://testca2012.cryptopro.ru/ui/).
 
## Основы { #basic }

Поддерживаются:

* [подписание документа](#doc_signing);
* [шифрование документа](#doc_encryption);
* [подписание и шифрование документа](#doc_signing_encryption);
* [шифрование и подписание документа](#doc_encryption_signing);

`type` — тип операции:

| Параметр          | Описание                                  |
|------------------|-------------------------------------------|
| `sign`           | Только подписание                         |
| `encrypt`        | Только шифрование                         |
| `encryptAndSign` | Сначала шифрование, затем подписание      |
| `signAndEncrypt` | Сначала подписание, затем шифрование      |
  
## <a id="doc_signing">Подписание документа</a>

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign){:target="_blank"}

| Параметр                | Описание                                                                    |
    |------------------------|-----------------------------------------------------------------------------|
| `type` (обязательный)   | Тип операции. `sign` — подписание документа                                 |
| `signaturePackage`      | Тип контейнера подписи (`detached` / `attached` / `any`), по умолчанию: `detached` |
| `signatureType`         | Тип электронной подписи (`CADES_BES` / `CADES_T`), по умолчанию: `CADES_BES` |
| `actionName` (обязательный) | Имя выполняемой операции (например, `documentSign`)                     |
| `documentFileIdKey` (обязательный) | Ключ ID файла документа                                          |
| `documentFileNameKey` (обязательный) | Ключ имени файла документа                                     |
| `signatureFileIdKey` (обязательный) | Ключ ID файла подписи                                           |
| `signatureFileNameKey` (обязательный) | Ключ имени файла подписи                                      |

Как это выглядит?

=== "Подпись"
    <video controls width="800">
    <source src="/features/sign/sign.mp4" type="video/mp4">
    </video>
=== "Проверка подписи"
    <video controls width="800">
    <source src="/features/sign/check_sign.mp4" type="video/mp4">
    </video>

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте кнопку подписания в соответствующий **Service**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/Myexample3711Service.java:getActions
    --8<--
    ```

    **Шаг 2** Добавьте `options.cryptoGenerator` в параметры конфигурации `.widget`.
 
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/base/MyExample3711Form.widget.json
    --8<--
    ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/base){:target="_blank"}

### Тип электронной подписи { #electronic-signature-type }
"CAdES_T"
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcadesbestlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/cades/MyExample3711CadesTForm.widget.json){:target="_blank"}

CAdES_BES
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcadesbeslist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/cades/MyExample3711CadesBesForm.widget.json){:target="_blank"}

Пользователь может выбрать тип электронной подписи:

- **CAdES_BES** — базовый тип электронной подписи
  Используется для стандартного подписания документов без дополнительных атрибутов.

- **CAdES_T** — расширенный тип подписи
  Включает все свойства CAdES_BES и дополнительно содержит доверенную метку времени, фиксирующую точный момент подписания.

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `signatureType` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    `CADES_BES` (по умолчанию) / `CADES_T`

    === "CAdES_BES"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/cades/MyExample3711CadesBesForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcadesbeslist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/cades/MyExample3711CadesBesForm.widget.json){:target="_blank"}

    === "CAdES_T"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/cades/MyExample3711CadesTForm.widget.json
        --8<--
        ```

        Чтобы изменить адрес сервера штампов времени (TSA):
        
        * Откройте файлы `ui/.env` и `ui/.env.development`.
        * Добавьте переменную REACT_APP_CRYPTOPRO_TSA_URL:
        
            В `ui/.env.development` — укажите адрес тестового сервера.
            
            В `ui/.env` — укажите адрес промышленного сервера (по умолчанию).
            
        !!! info
            Если эта константа отсутствует, приложение по умолчанию использует http://testca2012.cryptopro.ru/tsp/tsp.srf.

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcadesbestlist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/cades/MyExample3711CadesTForm.widget.json){:target="_blank"}

### Формат контейнера подписи { #signature-container-format }

**Пользователь может выбрать формат формируемого контейнера:**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerdetachedform){:target="_blank"} ·[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711DetachedForm.widget.json){:target="_blank"}

**detached (отсоединённая подпись)**

Формируется отдельный файл подписи, содержащий только подпись документа.
Сам документ в контейнер не включается.

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerattachedform){:target="_blank"} · [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711AttachedForm.widget.json){:target="_blank"}

**attached (присоединённая подпись)**

Формируется единый контейнер, включающий исходный документ и подпись документа

**В интерфейсе возможны два сценария:**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontaineranyform){:target="_blank"} ·[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711AnyForm.widget.json){:target="_blank"}

**Пользователь выбирает тип подписи**

 Отображается всплывающее окно с выпадающим списком, в котором пользователь выбирает формат контейнера (detached / attached)

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerdetachedform){:target="_blank"} ·[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711DetachedForm.widget.json){:target="_blank"}

**Тип подписи заранее задан системой**

Выпадающий список в интерфейсе не отображается.
Подпись формируется автоматически в соответствии с заданной конфигурацией.

Как это выглядит?
=== "Пользователь выбирает тип подписи"
    <video controls width="800">
    <source src="/features/sign/sign_any.mp4" type="video/mp4">
    </video>
=== "attached (присоединённая подпись)"
    <video controls width="800">
    <source src="/features/sign/sign_attach.mp4" type="video/mp4">
    </video>
=== "detached (отсоединённая подпись)"
    <video controls width="800">
    <source src="/features/sign/sign_deattch.mp4" type="video/mp4">
    </video>

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `signaturePackage` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    `any` — пользователь выбирает тип подписи
    `detached` (по умолчанию) / `attached` — тип подписи заранее задан системой

    === "Пользователь выбирает тип подписи"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/attached/MyExample3711AnyForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontaineranyform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711AnyForm.widget.json){:target="_blank"}

    === "detached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/attached/MyExample3711DetachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerdetachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711DetachedForm.widget.json){:target="_blank"}

    === "attached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/attached/MyExample3711AttachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerattachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711AttachedForm.widget.json){:target="_blank"}

    === "по умолчанию"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/sign/attached/MyExample3711DefaultForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711signcontainerdefaultform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/attached/MyExample3711DefaultForm.widget.json){:target="_blank"}

### Переопределение имени подписанного документа { #override-of-the-signed-document-name }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711overridesignform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/filebasename){:target="_blank"}

Можно переопределить имя файла подписанного документа.

Как это выглядит?

<video controls width="800">
<source src="/features/sign/sign_override.mp4" type="video/mp4">
</video>

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `signatureFileBaseNameKey` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/sign/filebasename/MyExample3711BaseNameForm.widget.json
    --8<--
    ```

    **Шаг 2** Добавьте в `fields` скрытое поле, на которое ссылается `signatureFileBaseNameKey`.

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3711/view/myexample3711overridesignform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/sign/filebasename){:target="_blank"}


## <a id="doc_encryption">Шифрование документа</a>

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3713){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt){:target="_blank"}


| Параметр                | Описание                                                                    |
|------------------------|-----------------------------------------------------------------------------|
| `type` (обязательный)   | Тип операции. `encrypt` — шифрование документа                              |
| `actionName` (обязательный) | Имя выполняемой операции (например, `documentEncrypt`)                  |
| `documentFileIdKey` (обязательный) | Ключ ID файла документа                                          |
| `documentFileNameKey` (обязательный) | Ключ имени файла документа                                     |
| `encryptedFileIdKey` (обязательный) | Ключ ID зашифрованного файла                                    |
| `encryptedFileNameKey` (обязательный) | Ключ имени зашифрованного файла                               |

Как это выглядит?

<video controls width="800">
<source src="/features/sign/encrypt.mp4" type="video/mp4">
</video>

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте кнопку шифрования в соответствующий **Service**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/Myexample3713Service.java:getActions
    --8<--
    ```

    **Шаг 2** Добавьте `options.cryptoGenerator` в параметры конфигурации `.widget`.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/base/MyExample3713BaseForm.widget.json
    --8<--
    ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713encryptform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt/base){:target="_blank"}

### Переопределение имени зашифрованного документа { #override-of-the-encrypted-document-name }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713overrideform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt/filebasename){:target="_blank"}

Можно переопределить имя файла зашифрованного документа.

Как это выглядит?

<video controls width="800">
<source src="/features/sign/encrypt_override.mp4" type="video/mp4">
</video>

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `encryptedFileBaseNameKey` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encrypt/filebasename/MyExample3713BaseNameForm.widget.json
    --8<--
    ```

    **Шаг 2** Добавьте в `fields` скрытое поле, на которое ссылается `encryptedFileBaseNameKey`.

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3713/view/myexample3713overrideform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encrypt/filebasename){:target="_blank"}


## <a id="doc_signing_encryption">Подписание и шифрование документа</a>

Сначала подписание, затем шифрование (`signAndEncrypt`).

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt){:target="_blank"}


| Параметр                | Описание                                                                    |
|------------------------|-----------------------------------------------------------------------------|
| `type` (обязательный)   | Тип операции. `signAndEncrypt` — сначала подписание, затем шифрование       |
| `actionName` (обязательный) | Имя выполняемой операции (например, `documentSignEncrypt`)              |
| `documentFileIdKey` (обязательный) | Ключ ID файла документа                                          |
| `documentFileNameKey` (обязательный) | Ключ имени файла документа                                     |
| `signatureFileIdKey` (обязательный) | Ключ ID файла подписи                                           |
| `signatureFileNameKey` (обязательный) | Ключ имени файла подписи                                      |
| `encryptedFileIdKey` (обязательный) | Ключ ID зашифрованного файла                                    |
| `encryptedFileNameKey` (обязательный) | Ключ имени зашифрованного файла                               |


Как это выглядит?

<video controls width="800">
<source src="/features/sign/signencrypt.mp4" type="video/mp4">
</video>

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте кнопку подписания и шифрования в соответствующий **Service**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/Myexample3714Service.java:getActions
    --8<--
    ```

    **Шаг 2** Добавьте `options.cryptoGenerator` с `type: signAndEncrypt` в параметры конфигурации `.widget`.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/base/MyExample3714Form.widget.json
    --8<--
    ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/base){:target="_blank"}

### Тип электронной подписи { #electronic-signature-type_1 }
"CAdES_T"
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbestlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesTForm.widget.json){:target="_blank"}

CAdES_BES
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbeslist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesBesForm.widget.json){:target="_blank"}

Пользователь может выбрать тип электронной подписи:

- **CAdES_BES** — базовый тип электронной подписи
  Используется для стандартного подписания документов без дополнительных атрибутов.

- **CAdES_T** — расширенный тип подписи
  Включает все свойства CAdES_BES и дополнительно содержит доверенную метку времени, фиксирующую точный момент подписания.
 
Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `signatureType` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    === "CAdES_BES"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/cades/MyExample3714CadesBesForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbeslist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesBesForm.widget.json){:target="_blank"}

    === "CAdES_T"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/cades/MyExample3714CadesTForm.widget.json
        --8<--
        ```
        Чтобы изменить адрес сервера штампов времени (TSA):
        
        * Откройте файлы `ui/.env` и `ui/.env.development`.
        * Добавьте переменную REACT_APP_CRYPTOPRO_TSA_URL:
        
            В `ui/.env.development` — укажите адрес тестового сервера.
            
            В `ui/.env` — укажите адрес промышленного сервера (по умолчанию).
            
        !!! info
            Если эта константа отсутствует, приложение по умолчанию использует http://testca2012.cryptopro.ru/tsp/tsp.srf.

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcadesbestlist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/cades/MyExample3714CadesTForm.widget.json){:target="_blank"}

### Формат контейнера подписи { #signature-container-format_1 }

**Пользователь может выбрать формат формируемого контейнера:**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerdetachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714DetachedForm.widget.json){:target="_blank"}

**detached (отсоединённая подпись)**

Формируется отдельный файл подписи, содержащий только подпись документа.
Сам документ в контейнер не включается.

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerattachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714AttachedForm.widget.json){:target="_blank"}

**attached (присоединённая подпись)**

Формируется единый контейнер, включающий исходный документ и подпись документа

**В интерфейсе возможны два сценария:**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontaineranyform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714AnyForm.widget.json){:target="_blank"}

**Пользователь выбирает тип подписи**

Отображается всплывающее окно с выпадающим списком, в котором пользователь выбирает формат контейнера (detached / attached)

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerdetachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714DetachedForm.widget.json){:target="_blank"}

**Тип подписи заранее задан системой**

Выпадающий список в интерфейсе не отображается.
Подпись формируется автоматически в соответствии с заданной конфигурацией.

Как это выглядит?
=== "Пользователь выбирает тип подписи"
    <video controls width="800">
    <source src="/features/sign/signencrypt_any.mp4" type="video/mp4">
    </video>
=== "attached (присоединённая подпись)"
    <video controls width="800">
    <source src="/features/sign/signencrypt_attach.mp4" type="video/mp4">
    </video>
=== "detached (отсоединённая подпись)"
    <video controls width="800">
    <source src="/features/sign/signencrypt_deatach.mp4" type="video/mp4">
    </video>

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `signaturePackage` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    === "Пользователь выбирает тип подписи"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/attached/MyExample3714AnyForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontaineranyform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714AnyForm.widget.json){:target="_blank"}

    === "detached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/attached/MyExample3714DetachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerdetachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714DetachedForm.widget.json){:target="_blank"}

    === "attached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/attached/MyExample3714AttachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerattachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714AttachedForm.widget.json){:target="_blank"}

    === "по умолчанию"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/attached/MyExample3714DefaultForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptcontainerdefaultform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/attached/MyExample3714DefaultForm.widget.json){:target="_blank"}

### Переопределение имени подписанного документа { #override-of-the-signed-document-name_1 }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptoverridesignform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/filebasename){:target="_blank"}

Можно переопределить имя файла подписанного документа.

Как это выглядит?

<video controls width="800">
<source src="/features/sign/signencrypt_override.mp4" type="video/mp4">
</video>

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `signatureFileBaseNameKey` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/signencrypt/filebasename/MyExample3714BaseNameForm.widget.json
    --8<--
    ```

    **Шаг 2** Добавьте в `fields` скрытое поле, на которое ссылается `signatureFileBaseNameKey`.

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3714/view/myexample3714signencryptoverridesignform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/signencrypt/filebasename){:target="_blank"}


## <a id="doc_encryption_signing">Шифрование и подписание документа</a>

Сначала шифрование, затем подписание (`encryptAndSign`).

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign){:target="_blank"}


| Параметр                | Описание                                                                    |
|------------------------|-----------------------------------------------------------------------------|
| `type` (обязательный)   | Тип операции. `encryptAndSign` — сначала шифрование, затем подписание       |
| `actionName` (обязательный) | Имя выполняемой операции (например, `documentEncryptSign`)              |
| `documentFileIdKey` (обязательный) | Ключ ID файла документа                                          |
| `documentFileNameKey` (обязательный) | Ключ имени файла документа                                     |
| `signatureFileIdKey` (обязательный) | Ключ ID файла подписи                                           |
| `signatureFileNameKey` (обязательный) | Ключ имени файла подписи                                      |
| `encryptedFileIdKey` (обязательный) | Ключ ID зашифрованного файла                                    |
| `encryptedFileNameKey` (обязательный) | Ключ имени зашифрованного файла                               |

Как это выглядит?

<video controls width="800">
<source src="/features/sign/encryptsign.mp4" type="video/mp4">
</video>
 
Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте кнопку шифрования и подписания в соответствующий **Service**.

    ```java
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/Myexample3712Service.java:getActions
    --8<--
    ```

    **Шаг 2** Добавьте `options.cryptoGenerator` с `type: encryptAndSign` в параметры конфигурации `.widget`.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/base/MyExample3712Form.widget.json
    --8<--
    ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/base){:target="_blank"}

### Тип электронной подписи { #electronic-signature-type_2 }
"CAdES_T"
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcadesbestlist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/cades/MyExample3712CadesTForm.widget.json){:target="_blank"}

CAdES_BES
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcadesbeslist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/cades/MyExample3712CadesBesForm.widget.json){:target="_blank"}

Пользователь может выбрать тип электронной подписи:

- **CAdES_BES** — базовый тип электронной подписи
  Используется для стандартного подписания документов без дополнительных атрибутов.

- **CAdES_T** — расширенный тип подписи
  Включает все свойства CAdES_BES и дополнительно содержит доверенную метку времени, фиксирующую точный момент подписания.

Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `signatureType` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    === "CAdES_BES"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/cades/MyExample3712CadesBesForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcadesbeslist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/cades/MyExample3712CadesBesForm.widget.json){:target="_blank"}

    === "CAdES_T"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/cades/MyExample3712CadesTForm.widget.json
        --8<--
        ```

        Чтобы изменить адрес сервера штампов времени (TSA):
        
        * Откройте файлы `ui/.env` и `ui/.env.development`.
        * Добавьте переменную REACT_APP_CRYPTOPRO_TSA_URL:
        
            В `ui/.env.development` — укажите адрес тестового сервера.
            
            В `ui/.env` — укажите адрес промышленного сервера (по умолчанию).
            
        !!! info
            Если эта константа отсутствует, приложение по умолчанию использует http://testca2012.cryptopro.ru/tsp/tsp.srf.


        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcadesbestlist){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/cades/MyExample3712CadesTForm.widget.json){:target="_blank"}

### Формат контейнера подписи { #signature-container-format_2 }

**Пользователь может выбрать формат формируемого контейнера:**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerdetachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712DetachedForm.widget.json){:target="_blank"}

**detached (отсоединённая подпись)**

Формируется отдельный файл подписи, содержащий только подпись документа.
Сам документ в контейнер не включается.

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerattachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AttachedForm.widget.json){:target="_blank"}

**attached (присоединённая подпись)**

Формируется единый контейнер, включающий исходный документ и подпись документа

**В интерфейсе возможны два сценария:**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontaineranyform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AnyForm.widget.json){:target="_blank"}

**Пользователь выбирает тип подписи**

Отображается всплывающее окно с выпадающим списком, в котором пользователь выбирает формат контейнера (detached / attached)

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerattachedform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AttachedForm.widget.json){:target="_blank"}

**Тип подписи заранее задан системой**

Выпадающий список в интерфейсе не отображается.
Подпись формируется автоматически в соответствии с заданной конфигурацией.

Как это выглядит?
=== "Пользователь выбирает тип подписи"
    <video controls width="800">
    <source src="/features/sign/encryptsign_any.mp4" type="video/mp4">
    </video>
=== "attached (присоединённая подпись)"
    <video controls width="800">
    <source src="/features/sign/encryptsign_attach.mp4" type="video/mp4">
    </video>
=== "detached (отсоединённая подпись)"
    <video controls width="800">
    <source src="/features/sign/encryptsign_deatach.mp4" type="video/mp4">
    </video>


Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `signaturePackage` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    === "Пользователь выбирает тип подписи"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/attached/MyExample3712AnyForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontaineranyform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AnyForm.widget.json){:target="_blank"}

    === "detached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/attached/MyExample3712DetachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerdetachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712DetachedForm.widget.json){:target="_blank"}

    === "attached"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/attached/MyExample3712AttachedForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerattachedform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712AttachedForm.widget.json){:target="_blank"}

    === "по умолчанию"
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/attached/MyExample3712DefaultForm.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptcontainerdefaultform){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/attached/MyExample3712DefaultForm.widget.json){:target="_blank"}

### Переопределение имени подписанного документа { #override-of-the-signed-document-name_2 }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptoverridesignform){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/filebasename){:target="_blank"}

Можно переопределить имя файла подписанного документа.

Как это выглядит?

<video controls width="800">
<source src="/features/sign/encryptsign_override.mp4" type="video/mp4">
</video>


Как добавить?
??? Example "Пример"

    **Шаг 1** Добавьте свойство `signatureFileBaseNameKey` в `options.cryptoGenerator` в параметрах конфигурации `.widget`.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/feature/encryptsign/encryptsign/filebasename/MyExample3712BaseNameForm.widget.json
    --8<--
    ```

    **Шаг 2** Добавьте в `fields` скрытое поле, на которое ссылается `signatureFileBaseNameKey`.

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3712/view/myexample3712signencryptoverridesignform){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/encryptsign/encryptsign/filebasename){:target="_blank"}
