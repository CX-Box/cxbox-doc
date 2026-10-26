# PickTree

Доступно начиная с [v3.0.1](/ru/new/version3001/)

`PickTree` — компонент, позволяющий выбрать значение из всплывающего списка сущностей

!!! tips "Совет"
    Используйте, если пользователю нужно открывать подробный просмотр связанных сущностей. Этот тип поля можно использовать для больших сущностей любого размера (в память загружается только одна страница)

## Основы { #basics }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3282){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/basic){:target="_blank"}

### Как это выглядит? { #how-does-it-look }

=== "Виджет List"
    ![img_list.gif](img_list.gif)
=== "Виджет Info"
    ![img_info.png](img_info.png)
=== "Виджет Form"
    ![img_form.gif](img_form.gif)


### Как добавить? { #how-to-add }
!!! info
    Всплывающее окно — дерево: бизнес-компонент всплывающего окна должен возвращать `parentId` (фильтруемое, `null` для корней) и `isLeaf`, оба объявлены как **hidden**-поля виджета всплывающего окна. Настройки дерева описаны в [options.tree](/ru/widget/type/picktreepopup/picktreepopup/#optionstree).


??? Example "Пример"
    - **Шаг 1. Popup**

        В следующем примере сущность **MyEntity** имеет ссылку **OneToOne/ManyToOne** на сущность **MyEntityPick**. Связь выполняется по id, например **MyEntity.customFieldId** = **MyEntityPick.id**. Также в этом примере используется одно `дополнительное поле` **MyEntityPick.customField**, которое отображается на виджете MyEntity

        +  **Шаг 1.1** Добавьте `дополнительное поле` **String** в соответствующий **BaseEntity**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/basic/MyEntity3282Pick.java
            --8<--
            ```

        +  **Шаг 1.2** Добавьте `дополнительное поле` **String** в соответствующий **DataResponseDTO**.

            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/basic/MyEntity3282PickDTO.java
            --8<--
            ```


        +  **Шаг 1.3**  Создайте Popup List **_.widget.json_**.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/basic/myEntity3282PickTreePopup.widget.json
            --8<--
            ```

        +  **Шаг 1.4** Добавьте **fields.setEnabled** в соответствующий **FieldMetaBuilder**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/basic/MyEntity3282PickPickTreeMeta.java:buildIndependentMeta
            --8<--
            ```
        
    -   **Шаг 2** Добавьте **Popup** в **_.view.json_**.

        === "list.view.json"
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/basic/myexample3282list.view.json
            --8<--
            ```
        === "form.view.json"
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/basic/myexample3282form.view.json
            --8<--
            ```
    -   **Шаг 3** Добавьте поле **MyEntityPick** в соответствующий **BaseEntity**.
        ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/basic/MyEntity3282.java
            --8<--
        ```

    -   **Шаг 4** Добавьте два поля (для id и для `дополнительного поля`) в соответствующий **DataResponseDTO**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/basic/MyExample3282DTO.java
        --8<--
        ```
    -   **Шаг 5** Добавьте bc myEntityPickTreePopup в соответствующий **EnumBcIdentifier**.
        
        !!! info
            Бизнес-компонент `myEntityPickTreePopup` должен быть дочерним для бизнес-компонента, из которого вызывается всплывающее окно.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/basic/PlatformMyExample3282Controller.java:bc
        --8<--
        ```

    === "Виджет List"
        **Шаг 6** Добавьте popupBcName и pickMap в **_.widget.json_**.
        `pickMap` — маппинг полей Picktree на MyEntity

        pickMap задаёт соответствие между полями основного BC (основной формы) и BC всплывающего окна, из которого пользователь выбирает запись.
        
        * Левая часть — поле основного BC, в которое записывается значение.
        * Правая часть — поле BC всплывающего окна, из которого берётся значение при выборе строки.
        
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/basic/MyExample3282List.widget.json
        --8<--
        ```    

    === "Виджет Info"
        **Шаг 6** Добавьте popupBcName и pickMap в **_.widget.json_**.
        `pickMap` — маппинг полей Picktree на MyEntity

        pickMap задаёт соответствие между полями основного BC (основной формы) и BC всплывающего окна, из которого пользователь выбирает запись.
        
        * Левая часть — поле основного BC, в которое записывается значение.
        * Правая часть — поле BC всплывающего окна, из которого берётся значение при выборе строки.
        
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/basic/MyExample3282Info.widget.json
        --8<--
        ``` 

    === "Виджет Form"

        **Шаг 6** Добавьте popupBcName и pickMap в **_.widget.json_**.
        `pickMap` — маппинг полей Picktree на MyEntity

        pickMap задаёт соответствие между полями основного BC (основной формы) и BC всплывающего окна, из которого пользователь выбирает запись.
        
        * Левая часть — поле основного BC, в которое записывается значение.
        * Правая часть — поле BC всплывающего окна, из которого берётся значение при выборе строки.
        
        Когда пользователь выбирает запись во всплывающем окне, значение берётся из поля справа и записывается в поле слева.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/basic/MyExample3282Form.widget.json
        --8<--
        ``` 

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3282){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/basic){:target="_blank"}

## Placeholder
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3287){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/placeholder){:target="_blank"}

`Placeholder` позволяет задать краткую подсказку об ожидаемом значении. Подсказка отображается до ввода пользователем. Её можно вычислять на основе бизнес-логики приложения. Она отображается и для поля `Readonly`.
### Как это выглядит? { #how-does-it-look_1 }
=== "Виджет List"
    ![img_plchldr_list.png](img_plchldr_list.png) 
=== "Виджет Info"
    _неприменимо_
=== "Виджет Form"
    ![img_plchldr_form.png](img_plchldr_form.png)
### Как добавить? { #how-to-add_1 }
??? Example "Пример"
    Добавьте **fields.setPlaceholder** в соответствующий **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/picktree/placeholder/MyExample3287Meta.java:buildRowDependentMeta
    --8<--
    ```  
    === "Виджет List"
        **Работает для List.**
    === "Виджет Info"
        **_неприменимо_**
    === "Виджет Form"
        **Работает для Form.**

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3287){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/placeholder){:target="_blank"}

## Цвет { #color }
`Color` позволяет задать цвет поля. Его можно вычислять на основе бизнес-логики приложения

**Вычисляемый цвет**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3283){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/color){:target="_blank"}

**Постоянный цвет**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3284){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/colorconst){:target="_blank"}

### Как это выглядит? { #how-does-it-look_2 }
=== "Виджет List"
    ![img_color_list.png](img_color_list.png)
=== "Виджет Info"
    ![img_color_info.png](img_color_info.png)
=== "Виджет Form"
    _неприменимо_

### Как добавить? { #how-to-add_2 }
??? Example "Пример"
    === "Вычисляемый цвет"
        **Шаг 1**   Добавьте `собственное поле для цвета` в соответствующий **DataResponseDTO**. Поле может содержать цвет в формате HEX или быть null.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/color/MyExample3283DTO.java
        --8<--
        ```    
        === "Виджет List"

            **Шаг 2** Добавьте **"bgColorKey"** :  `собственное поле для цвета` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/color/MyExample3283List.widget.json
            --8<--
            ```
        === "Виджет Info"
            **Шаг 2** Добавьте **"bgColorKey"** :  `собственное поле для цвета` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/color/MyExample3283Info.widget.json
            --8<--
            ```
        === "Виджет Form"
            _неприменимо_

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3283){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/color){:target="_blank"}

    === "Постоянный цвет"
        === "Виджет List"
            Добавьте **"bgColor"** :  `цвет HEX` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/colorconst/MyExample3284List.widget.json
            --8<--
            ```
        === "Виджет Info"
            Добавьте **"bgColor"** :  `цвет HEX` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/colorconst/MyExample3284Info.widget.json
            --8<--
            ```
        === "Виджет Form"
            _неприменимо_

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3284){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/colorconst){:target="_blank"}

## Только чтение/Редактирование { #readonlyeditable }
`Readonly/Editable` указывает, можно ли редактировать поле. Это можно вычислять на основе бизнес-логики приложения

`Editable`
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3282){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/basic){:target="_blank"}

`Readonly`
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3289){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/ro){:target="_blank"}

### Как это выглядит? { #how-does-it-look_3 }
=== "Редактирование"
    === "Виджет List"
        ![img_list.gif](img_list.gif)
    === "Виджет Info"
        _неприменимо_
    === "Виджет Form"
        ![img_form.gif](img_form.gif)
=== "Только чтение"
    === "Виджет List"
        ![img_ro_list.png](img_ro_list.png)
    === "Виджет Info"
        ![img_ro_info.png](img_ro_info.png)
    === "Виджет Form"
        ![img_ro_form.png](img_ro_form.png)

### Как добавить? { #how-to-add_3 }
??? Example "Пример"
    === "Редактирование"
        **Шаг 1** Добавьте маппинг DTO->entity в соответствующий **VersionAwareResponseService**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/basic/MyExample3282Service.java:doUpdateEntity
        --8<--
        ```
        **Шаг 2** Добавьте **fields.setEnabled** в соответствующий **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/basic/MyExample3282Meta.java:buildRowDependentMeta
        --8<--
        ```    
        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **_неприменимо_**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3282){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/basic){:target="_blank"}

    === "Только чтение"
    
        **Вариант 1** Включено по умолчанию.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/ro/MyExample3289Meta.java:buildRowDependentMeta
        --8<--
        ```    
        **Вариант 2** `Не рекомендуется.` Свойство fields.setDisabled() переопределяет доступность поля, если используется после свойства fields.setEnabled.
        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **Работает для Info.**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3289){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/ro){:target="_blank"}

## Фильтрация { #filtering }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3286){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/filtration){:target="_blank"}

`Filtering` позволяет искать данные по критериям. У фильтра колонки два режима, применение одного из них сбрасывает другой:

* `По тексту`: введите часть значения и нажмите **Apply**. Поиск использует оператор contains для поля, указанного в `key`.
* `По записям`: нажмите **...** и выберите записи во всплывающем окне. Поиск использует оператор in, который сравнивает id (поле, сопоставленное с `id` в `pickMap`). Пока этот фильтр применён, **...** показывает количество выбранных записей.

!!! tips "Совет"
    Всплывающий виджет для фильтрации автоматически формируется на основе виджета редактирования поля (то есть на обоих виджетах будут одинаковые поля, фильтры и т. д.). При необходимости можно задать отдельный виджет для фильтрации
### Как это выглядит? { #how-does-it-look_4 }
=== "Виджет List"
    === "По тексту"
        ![img_filtr_list.gif](img_filtr_list.gif)
    === "По записям"
        ![img_filtr_popup_list.gif](img_filtr_popup_list.gif)
=== "Виджет Info"
    _неприменимо_
=== "Виджет Form"
    _неприменимо_

### Как добавить? { #how-to-add_4 }
??? Example "Пример"
    === "Виджет List"
        **Шаг 1** Добавьте **@SearchParameter** в соответствующий **DataResponseDTO**. (Расширенная настройка [SearchParameter](/ru/advancedCustomization/element/searchparameter/searchparameter))
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/filtration/MyExample3286DTO.java
        --8<--
        ```
        **Шаг 2**  Добавьте **fields.enableFilter** в соответствующий **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/filtration/MyExample3286Meta.java:buildIndependentMeta
        --8<--
        ```
    === "Виджет Info"
        _неприменимо_
    === "Виджет Form"
        _неприменимо_

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3286){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/filtration){:target="_blank"}

## Drilldown
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3285){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/drilldown){:target="_blank"}

`DrillDown` позволяет перейти в другое представление простым нажатием. Целевое представление и другие части drill-down можно вычислять на основе бизнес-логики приложения

Также при необходимости можно отфильтровать данные целевого представления до его открытия, `подробнее см.` [DrillDown](/ru/features/element/drilldown/drilldown)


### Как это выглядит? { #how-does-it-look_5 }
=== "Виджет List"
    ![img_drilldown_list.png](img_drilldown_list.png)
=== "Виджет Info"
    ![img_drilldown_info.png](img_drilldown_info.png)
=== "Виджет Form"
    _неприменимо_

### Как добавить? { #how-to-add_5 }
??? Example "Пример"

    **Вариант 1**

    `Шаг 1` Добавьте [fields.setDrilldown](/ru/features/element/drilldown/drilldown) в соответствующий **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/picktree/drilldown/MyExample3285Meta.java:buildRowDependentMeta
    --8<--
    ```
    === "Виджет List"

        `Шаг 2` Добавьте **"drillDown": "true"** в .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/drilldown/MyExample3285List.widget.json
        --8<--
        ```
        **Вариант 2**
           Добавьте **"drillDownKey"** :  `собственное поле` в .widget.json. Подробнее см. [Drilldown](/ru/features/element/drilldown/drilldown)
 
    === "Виджет Info"

        `Шаг 2` Добавьте **"drillDown": "true"** в .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/drilldown/MyExample3285Info.widget.json
        --8<--
        ```
        **Вариант 2**
           Добавьте **"drillDownKey"** :  `собственное поле` в .widget.json. Подробнее см. [Drilldown](/ru/features/element/drilldown/drilldown)
 
    === "Виджет Form"
        _неприменимо_

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3285){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/drilldown){:target="_blank"}

[Расширенная настройка](/ru/features/element/drilldown/drilldown)

## Валидация { #validation }
`Validation` позволяет проверять любые бизнес-правила для введённого пользователем значения. Типы валидации:

1) Exception: отображает сообщение, уведомляющее пользователя о технических или бизнес-ошибках.

   `Business Exception`:
   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3292){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationbusinessex){:target="_blank"}

   `Runtime Exception`:
   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3295){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationruntimeex){:target="_blank"}
   
2) Confirm: показывает диалог с необязательным сообщением, требующий от пользователя подтверждения или отмены перед продолжением.

   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3293){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationconfirm){:target="_blank"}

3) Валидация на уровне полей: показывает ошибку рядом со всеми полями, не прошедшими проверку

   `Option 1`:
   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3291){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationannotation){:target="_blank"}

   `Option 2`:
   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3294){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationdynamic){:target="_blank"}

### Как это выглядит? { #how-does-it-look_6 }
=== "Виджет List"
    === "BusinessException"
        ![img_business_error.png](img_business_error.png)
    === "RuntimeException"
        ![img_runtime_error.png](img_runtime_error.png)
    === "Confirm"
        ![confirm_form.png](confirm_form.png)
    === "Валидация на уровне полей"
        ![img_javax_stat_list.png](img_javax_stat_list.png)
=== "Виджет Info"
    _неприменимо_
=== "Виджет Form"
    === "BusinessException"
        ![img_business_error.png](img_business_error.png)
    === "RuntimeException"
        ![img_runtime_error.png](img_runtime_error.png)
    === "Confirm"
        ![confirm_form.png](confirm_form.png)
    === "Валидация на уровне полей"
        ![img_javax_stat_form.png](img_javax_stat_form.png)
### Как добавить? { #how-to-add_6 }
??? Example "Пример"
    === "BusinessException"
        `BusinessException` описывает ошибку в рамках бизнес-процесса.

        Добавьте **BusinessException** в соответствующий **VersionAwareResponseService**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/validationbusinessex/MyExample3292Service.java:doUpdateEntity
        --8<--
        ```
        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **_неприменимо_**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3292){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationbusinessex){:target="_blank"}

    === "RuntimeException"

        `RuntimeException` описывает техническую ошибку в рамках бизнес-процесса.
        
        Добавьте **RuntimeException** в соответствующий **VersionAwareResponseService**.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/validationruntimeex/MyExample3295Service.java:doUpdateEntity
        --8<--
        ```

        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **_неприменимо_**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3295){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationruntimeex){:target="_blank"}

    === "Confirm"
        Добавьте [PreAction.confirm](/ru/advancedCustomization_validation) в соответствующий **VersionAwareResponseService**.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/validationconfirm/MyExample3293Service.java:getActions
        --8<--
        ```
        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **_неприменимо_**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3293){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationconfirm){:target="_blank"}

    === "Валидация на уровне полей"
        === "Вариант 1"
            Добавьте javax.validation в соответствующий **DataResponseDTO**.

            Используйте, если:

            Нужна простая проверка полей (javax validation)
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/validationannotation/MyExample3291DTO.java
            --8<--
            ```
            === "Виджет List"
                **Работает для List.**
            === "Виджет Info"
                **_неприменимо_**
            === "Виджет Form"
                **Работает для Form.**

            [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3291){:target="_blank"} ·
            [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationannotation){:target="_blank"}

        === "Вариант 2"
            Создайте собственный сервис для проверки бизнес-логики.

            Используйте, если:

            Для полей требуется проверка бизнес-логики

            `Шаг 1`  Создайте собственный метод проверки.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/validationdynamic/MyExample3294Service.java:validateFields
            --8<--
            ```
            `Шаг 2` Добавьте собственный метод проверки в соответствующий **VersionAwareResponseService**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/picktree/validationdynamic/MyExample3294Service.java:doUpdateEntity
            --8<--
            ```

            [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3294){:target="_blank"} ·
            [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/validationdynamic){:target="_blank"}

## Сортировка { #sorting }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3290){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/sorting){:target="_blank"}

`Sorting` позволяет сортировать данные по возрастанию или убыванию. Сортировка по значению связанного поля.

### Как это выглядит? { #how-does-it-look_7 }
=== "Виджет List"
    ![img_sort_list.png](img_sort_list.png)
=== "Виджет Info"
    _неприменимо_
=== "Виджет Form"
    _неприменимо_
### Как добавить? { #how-to-add_7 }
??? Example "Пример"
    === "Виджет List"
        подробнее см. [Сортировка](/ru/widget/type/property/sorting/sorting)

        **Шаг 1**  Добавьте **fields.enableSort** в соответствующий **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/picktree/sorting/MyExample3290Meta.java:buildIndependentMeta
        --8<--
        ```
        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3290){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/sorting){:target="_blank"}

    === "Виджет Info"
        _неприменимо_
    === "Виджет Form"
        _неприменимо_


## Обязательность { #required }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3288){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/required){:target="_blank"}

`Required` позволяет указать, что поле обязательно должно иметь значение.

### Как это выглядит? { #how-does-it-look_8 }
=== "Виджет List"
    ![img_req_list.png](img_req_list.png)
=== "Виджет Info"
    _неприменимо_
=== "Виджет Form"
    ![img_req_form.png](img_req_form.png)
### Как добавить? { #how-to-add_8 }
??? Example "Пример"
    Добавьте **fields.setRequired** в соответствующий **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/picktree/required/MyExample3288Meta.java:buildRowDependentMeta
    --8<--
    ```
    === "Виджет List"
        **Работает для List.**
    === "Виджет Info"
        **_неприменимо_**
    === "Виджет Form"
        **Работает для Form.**

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3288){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/picktree/required){:target="_blank"}
