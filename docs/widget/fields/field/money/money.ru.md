# Money

`Money` — компонент для отображения и редактирования полей с денежными суммами
## Основы { #basics }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample56){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/basic){:target="_blank"}

### Как это выглядит? { #how-does-it-look }
=== "Виджет List"
    ![img_list.gif](img_list.gif)
=== "Виджет Info"
    ![img_info.gif](img_info.gif)
=== "Виджет Form"
    ![img_form.gif](img_form.gif)

### Как добавить? { #how-to-add }

??? Example "Пример"
    **Вариант 1**
    
    Обычно для хранения этого типа поля в DTO и Entity используются Java-типы Long, Double или BigDecimal.
    
    В следующем примере используется Double:
    **Шаг 1** Добавьте поле **Double** в соответствующий **DataResponseDTO**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/money/basic/MyExample56DTO.java
    --8<--
    ```
    **Шаг 2** Добавьте поле **Double** в соответствующий **BaseEntity**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/money/basic/MyEntity56.java
    --8<--
    ```
    === "Виджет List"
        **Шаг 3** Добавьте в **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/basic/MyExample56List.widget.json
        --8<--
        ```
    === "Виджет Info"
        **Шаг 3** Добавьте в **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/basic/MyExample56Info.widget.json
        --8<--
        ```
    === "Виджет Form"
        **Шаг 3** Добавьте в **_.widget.json_**.

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/basic/MyExample56Form.widget.json
        --8<--
        ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample56){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/basic){:target="_blank"}

## Placeholder
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample64){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/placeholder){:target="_blank"}

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
    {{ external_links.github_raw_doc }}/fields/money/placeholder/MyExample64Meta.java:documentation
    --8<--
    ```
    === "Виджет List"
        **Работает для List.**
    === "Виджет Info"
        **_неприменимо_**
    === "Виджет Form"
        **Работает для Form.**

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample64){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/placeholder){:target="_blank"}

## Цвет { #color }
`Color` позволяет задать цвет поля. Его можно вычислять на основе бизнес-логики приложения

**Вычисляемый цвет**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample59){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/color){:target="_blank"}

**Постоянный цвет**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample60){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/colorconst){:target="_blank"}

### Как это выглядит? { #how-does-it-look_2 }
=== "Виджет List"
    ![img_color_list.gif](img_color_list.gif)
=== "Виджет Info"
    ![img_color_info.gif](img_color_info.gif)
=== "Виджет Form"
    ![img_color_form.png](img_color_form.png)


### Как добавить? { #how-to-add_2 }
??? Example "Пример"
    === "Вычисляемый цвет"
        **Шаг 1**   Добавьте `собственное поле для цвета` в соответствующий **DataResponseDTO**. Поле может содержать цвет в формате HEX или быть null.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/color/MyExample59DTO.java
        --8<--
        ```
        === "Виджет List"
            **Шаг 2** Добавьте **"bgColorKey"** :  `собственное поле для цвета` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/color/MyExample59List.widget.json
            --8<--
            ```
        === "Виджет Info"
            **Шаг 2** Добавьте **"bgColorKey"** :  `собственное поле для цвета` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/color/MyExample59Info.widget.json
            --8<--
            ```
        === "Виджет Form"
            **Шаг 2** Добавьте **"bgColorKey"** :  `собственное поле для цвета` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/color/MyExample59Form.widget.json
            --8<--
            ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample59){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/color){:target="_blank"}

    === "Постоянный цвет"
        === "Виджет List"
            Добавьте **"bgColor"** :  `цвет HEX` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/colorconst/MyExample60List.widget.json
            --8<--
            ```
        === "Виджет Info"
            Добавьте **"bgColor"** :  `цвет HEX` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/colorconst/MyExample60Info.widget.json
            --8<--
            ```
        === "Виджет Form"
            Добавьте **"bgColor"** :  `цвет HEX` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/colorconst/MyExample60Form.widget.json
            --8<--
            ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample60){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/colorconst){:target="_blank"}

## Только чтение/Редактирование { #readonlyeditable }
`Readonly/Editable` указывает, можно ли редактировать поле. Это можно вычислять на основе бизнес-логики приложения

`Editable`
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample56){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/basic){:target="_blank"}

`Readonly`
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample61){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/ro){:target="_blank"}

### Как это выглядит? { #how-does-it-look_3 }
=== "Редактирование"
    === "Виджет List"
        ![img_edit_list.gif](img_edit_list.gif)
    === "Виджет Info"
        _неприменимо_
    === "Виджет Form"
        ![img_edit_form.gif](img_edit_form.gif)
=== "Только чтение"
    === "Виджет List"
        ![img_ro_list.gif](img_ro_list.gif)
    === "Виджет Info"
        ![img_ro_info.gif](img_ro_info.gif)
    === "Виджет Form"
        ![img_ro_form.gif](img_ro_form.gif)

### Как добавить? { #how-to-add_3 }
??? Example "Пример"
    === "Редактирование"
        **Шаг 1** Добавьте маппинг DTO->entity в соответствующий **VersionAwareResponseService**.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/basic/MyExample56Service.java:doUpdateEntity
        --8<--
        ```

        **Шаг 2** Добавьте **fields.setEnabled** в соответствующий **FieldMetaBuilder**.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/basic/MyExample56Meta.java:buildRowDependentMeta
        --8<--
        ```

        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **_неприменимо_**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample56){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/basic){:target="_blank"}

    === "Только чтение"
        **Вариант 1** Включено по умолчанию.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/ro/MyExample61Meta.java:ro
        --8<--
        ```
        **Вариант 2** `Не рекомендуется.` Свойство fields.setDisabled() переопределяет доступность поля, если используется после свойства fields.setEnabled.
        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **Работает для Info.**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample61){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/ro){:target="_blank"}

## Фильтрация { #filtering }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample63){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/filtration){:target="_blank"}

`Filtering` позволяет искать данные по критериям.

Поиск использует:

* операторы `greaterOrEqualThan`(>=) и `lessOrEqualThan`(<=).
* оператор `equals` (=).

### Как это выглядит? { #how-does-it-look_4 }
=== "Виджет List"
    === "По диапазону"
        ![filter_by_range.gif](filter_by_range.gif)
    === "Равно"
        ![img_filtr_list.png](img_filtr_list.png)
=== "Виджет Info"
    _неприменимо_
=== "Виджет Form"
    _неприменимо_

### Как добавить? { #how-to-add_4 }
??? Example "Пример"
    === "Виджет List"
        !!! info  
            По умолчанию фильтрация выполняется **по диапазону**. Чтобы отключить её, укажите `cxbox.widget.fields.filter-by-range-enabled-default: false` в meta.
            [подробнее](/ru/features/element/applicationparams/applicationparams)

        **Шаг 1** Добавьте **@SearchParameter** в соответствующий **DataResponseDTO**. (Расширенная настройка [SearchParameter](/ru/advancedCustomization/element/searchparameter/searchparameter))
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/filtration/MyExample63DTO.java
        --8<--
        ```
        **Шаг 2**  Добавьте **fields.enableFilter** в соответствующий **FieldMetaBuilder**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/filtration/MyExample63Meta.java:buildIndependentMeta
        --8<--
        ```
    === "Виджет Info"
        _неприменимо_
    === "Виджет Form"
        _неприменимо_

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample63){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/filtration){:target="_blank"}

## Drilldown
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample62){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/drilldown){:target="_blank"}

`DrillDown` позволяет перейти в другое представление простым нажатием. Целевое представление и другие части drill-down можно вычислять на основе бизнес-логики приложения

Также при необходимости можно отфильтровать данные целевого представления до его открытия, `подробнее см.` [DrillDown](/ru/features/element/drilldown/drilldown)


### Как это выглядит? { #how-does-it-look_5 }
=== "Виджет List"
    ![img_drilldown_list](img_drilldown_list.gif)
=== "Виджет Info"
    ![img_drilldown_info](img_drilldown_info.gif)
=== "Виджет Form"
    _неприменимо_

### Как добавить? { #how-to-add_5 }
??? Example "Пример"

    **Вариант 1**

    `Шаг 1` Добавьте [fields.setDrilldown](/ru/features/element/drilldown/drilldown) в соответствующий **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/money/drilldown/MyExample62Meta.java:drilldown
    --8<--
    ```
    === "Виджет List"
        `Шаг 2` Добавьте **"drillDown": "true"** в .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/drilldown/MyExample62List.widget.json
        --8<--
        ```
        **Вариант 2**
           Добавьте **"drillDownKey"** :  `собственное поле` в .widget.json. Подробнее см. [Drilldown](/ru/features/element/drilldown/drilldown)
    === "Виджет Info"
        `Шаг 2` Добавьте **"drillDown": "true"** в .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/drilldown/MyExample62Info.widget.json
        --8<--
        ```
        **Вариант 2**
           Добавьте **"drillDownKey"** :  `собственное поле` в .widget.json. Подробнее см. [Drilldown](/ru/features/element/drilldown/drilldown)
 
    === "Виджет Form"
        _неприменимо_

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample62){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/drilldown){:target="_blank"}

[Расширенная настройка](/ru/features/element/drilldown/drilldown)

## Валидация { #validation }
`Validation` позволяет проверять любые бизнес-правила для введённого пользователем значения. Типы валидации:

1) Exception: отображает сообщение, уведомляющее пользователя о технических или бизнес-ошибках.

   `Business Exception`:
   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample67){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationbusinessex){:target="_blank"}

   `Runtime Exception`:
   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample69){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationruntimeex){:target="_blank"}
   
2) Confirm: показывает диалог с необязательным сообщением, требующий от пользователя подтверждения или отмены перед продолжением.

   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample68){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationconfirm){:target="_blank"}

3) Валидация на уровне полей: показывает ошибку рядом со всеми полями, не прошедшими проверку

   `Option 1`:
   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample271){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationannotation){:target="_blank"}

   `Option 2`:
   [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample333){:target="_blank"} ·
   [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationdynamic){:target="_blank"}

### Как это выглядит? { #how-does-it-look_6 }
=== "Виджет List"
    === "BusinessException"
        ![img_business_error](img_business_error.gif)
    === "RuntimeException"
        ![img_runtime_error](img_runtime_error.gif)
    === "Confirm"
        ![confirm_form](confirm_form.gif)
    === "Валидация на уровне полей"
        ![img_javax_stat_list.gif](img_javax_stat_list.gif)
=== "Виджет Info"
    _неприменимо_
=== "Виджет Form"
    === "BusinessException"
        ![img_business_error](img_business_error.gif)
    === "RuntimeException"
        ![img_runtime_error](img_runtime_error.gif)
    === "Confirm"
        ![confirm_form](confirm_form.gif)
    === "Валидация на уровне полей"
        ![img_javax_stat_form](img_javax_stat_form.gif)
### Как добавить? { #how-to-add_6 }
??? Example "Пример"
    === "BusinessException"
        `BusinessException` описывает ошибку в рамках бизнес-процесса.

        Добавьте **BusinessException** в соответствующий **VersionAwareResponseService**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/validationbusinessex/MyExample67Service.java:doUpdateEntity
        --8<--
        ```

        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **_неприменимо_**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample67){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationbusinessex){:target="_blank"}

    === "RuntimeException"

        `RuntimeException` описывает техническую ошибку в рамках бизнес-процесса.
        
        Добавьте **RuntimeException** в соответствующий **VersionAwareResponseService**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/validationruntimeex/MyExample69Service.java:doUpdateEntity
        --8<--
        ```
 
        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **_неприменимо_**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample69){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationruntimeex){:target="_blank"}

    === "Confirm"
        Добавьте [PreAction.confirm](/ru/advancedCustomization_validation) в соответствующий **VersionAwareResponseService**.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/validationconfirm/MyExample68Service.java:getActions
        --8<--
        ```
        === "Виджет List"
            **Работает для List.**
        === "Виджет Info"
            **_неприменимо_**
        === "Виджет Form"
            **Работает для Form.**

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample68){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationconfirm){:target="_blank"}

    === "Валидация на уровне полей"
        === "Вариант 1"
            Используйте, если:

            Нужна простая проверка полей (javax validation)

            Добавьте javax.validation в соответствующий **DataResponseDTO**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/validationannotation/MyExample271DTO.java
            --8<--
            ```
 
            === "Виджет List"
                **Работает для List.**
            === "Виджет Info"
                **_неприменимо_**
            === "Виджет Form"
                **Работает для Form.**

            [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample271){:target="_blank"} ·
            [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationannotation){:target="_blank"}

        === "Вариант 2"
            Создайте собственный сервис для проверки бизнес-логики.

            Используйте, если:

            Для полей требуется проверка бизнес-логики

            `Шаг 1`  Создайте собственный метод проверки.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/validationdynamic/MyExample333Service.java:validateFields
            --8<--
            ```
 
            `Шаг 2` Добавьте собственный метод проверки в соответствующий **VersionAwareResponseService**.
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/validationdynamic/MyExample333Service.java:doUpdateEntity
            --8<--
            ```

            [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample333){:target="_blank"} ·
            [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/validationdynamic){:target="_blank"}

## Сортировка { #sorting }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample66){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/sorting){:target="_blank"}

`Sorting` позволяет сортировать данные по возрастанию или убыванию.

### Как это выглядит? { #how-does-it-look_7 }
=== "Виджет List"
    ![img_sort_list](img_sort_list.png)
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
        {{ external_links.github_raw_doc }}/fields/money/sorting/MyExample66Meta.java:buildIndependentMeta
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample66){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/sorting){:target="_blank"}

    === "Виджет Info"
        _неприменимо_
    === "Виджет Form"
        _неприменимо_

## Обязательность { #required }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample65){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/required){:target="_blank"}

`Required` позволяет указать, что поле обязательно должно иметь значение.
По умолчанию UI устанавливает значение `Money` в 0, когда пользователь удаляет его, а `nullable` не задан или равен false. Подробнее см. [[Дополнительные свойства — nullable]](#nullable)

### Как это выглядит? { #how-does-it-look_8 }
=== "Виджет List"
    ![img_req_list.gif](img_req_list.gif)
=== "Виджет Info"
    _неприменимо_
=== "Виджет Form"
    ![img_req_form.gif](img_req_form.gif)
### Как добавить? { #how-to-add_8 }
??? Example "Пример"
    Добавьте **fields.setRequired** в соответствующий **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/fields/money/required/MyExample65Meta.java:buildRowDependentMeta
    --8<--
    ```
 
    === "Виджет List"
        **Работает для List.**
    === "Виджет Info"
        **_неприменимо_**
    === "Виджет Form"
        **Работает для Form.**

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample65){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/required){:target="_blank"}

## Дополнительные свойства { #additional-properties }
### <a id="nullable">nullable</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample307){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/nullable){:target="_blank"}

По умолчанию UI устанавливает значение `Money` в 0, когда пользователь удаляет его. Если `nullable` равен true, UI оставляет пустое значение как обычно
#### Как это выглядит? { #how-does-it-look_9 }
=== "Виджет List"
    ![img_nullable_list.gif](img_nullable_list.gif)
=== "Виджет Info"
    _неприменимо_
=== "Виджет Form"
    ![img_nullable_form.gif](img_nullable_form.gif)

#### Как добавить? { #how-to-add_9 }
??? Example "Пример"
    === "Виджет List"
        Добавьте **nullable** в **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/nullable/MyExample307List.widget.json
        --8<--
        ```
  
    === "Виджет Info"
        _неприменимо_

    === "Виджет Form"
        Добавьте **nullable** в **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/nullable/MyExample307Form.widget.json
        --8<--
        ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample307){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/nullable){:target="_blank"}

### <a id="currency">currency</a>
`Currency` позволяет добавлять и отображать значения валюты в интерфейсе.
<!--

**Вычисляемая валюта**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3151){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/currency/fieldkey){:target="_blank"}
 
Значение валюты может вычисляться динамически на основе бизнес-логики приложения.
-->
**Постоянная валюта**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3150){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/currency/constkey){:target="_blank"}

Если нужно только отображать фиксированное значение валюты, можно использовать постоянную валюту.

#### Как это выглядит? { #how-does-it-look_10 }
=== "Виджет List"
    ![img_currency_list.gif](img_currency_list.gif)
=== "Виджет Info"
    ![img_currency_info.gif](img_currency_info.gif)
=== "Виджет Form"
    ![img_currency_form.gif](img_currency_form.gif)
=== "Виджет AdditionalInfo"
    ![img_currency_addinfo.png](img_currency_addinfo.png)
=== "Виджет GroupingHierarchy"
    ![img_currency_gh.png](img_currency_gh.png) 


#### Как добавить? { #how-to-add_10 }

<!--
    === "Вычисляемая валюта"
        **Шаг 1**   Добавьте `собственное поле для валюты` в соответствующий **DataResponseDTO**.

        ```java
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/currency/fieldkey/MyExample3151DTO.java
        --8<--
        ```
 
        === "Виджет List"

            **Шаг 2** Добавьте **"currencyKey"** :  `собственное поле для валюты` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/currency/fieldkey/MyExample3151List.widget.json
            --8<--
            ```
        === "Виджет Info"

            **Шаг 2** Добавьте **"currencyKey"** :  `собственное поле для валюты` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/currency/fieldkey/MyExample3151Info.widget.json
            --8<--
            ```
        === "Виджет Form"

            **Шаг 2** Добавьте **"currencyKey"** :  `собственное поле для валюты` в .widget.json.
            ```json
            --8<--
            {{ external_links.github_raw_doc }}/fields/money/currency/fieldkey/MyExample3151Form.widget.json
            --8<--
            ```

    === "Постоянная валюта"
-->

??? Example "Пример"
    === "Виджет List"

        Добавьте **"currency"** в .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/currency/constkey/MyExample3150List.widget.json
        --8<--
        ```
    === "Виджет Info"

        Добавьте **"currency"** в .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/currency/constkey/MyExample3150Info.widget.json
        --8<--
        ```
    === "Виджет Form"

        Добавьте **"currency"** в .widget.json.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/fields/money/currency/constkey/MyExample3150Form.widget.json
        --8<--
        ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3150){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/fields/money/currency/constkey){:target="_blank"}
