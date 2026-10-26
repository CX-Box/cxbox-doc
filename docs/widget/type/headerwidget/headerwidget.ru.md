# HeaderWidget
 
Виджет `HeaderWidget` — компонент для отображения заголовка.

* не поддерживает элементы управления (например, кнопки действий или меню).
* используется для выделения или акцентирования определённого контекста на текущем экране.

## Основы { #basics }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5021){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/base){:target="_blank"}
### Как это выглядит? { #how-does-it-look }
=== "Виджет заголовка"
    ![onlyheaderwidget.png](onlyheaderwidget.png)
=== "Виджет заголовка с другим виджетом"
    ![headerwidget.png](headerwidget.png)

###  <a id="Howtoaddbacis">Как добавить?</a>
??? Example "Пример"
    
    **Шаг 1** Создайте файл **_.widget.json_** с type = **"HeaderWidget"**

    ```json
       --8<--
       {{ external_links.github_raw_doc }}/widgets/headerwidget/base/myExample5021HeaderWidget.widget.json
       --8<--
    ```

    **Шаг 2** Добавьте виджет в соответствующий **_.view.json_**.

    ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/headerwidget/base/myexample5021.view.json
        --8<--
    ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5021){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/base){:target="_blank"}

## <a id="Title">Заголовок</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5027){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/title){:target="_blank"}

### Базовый заголовок { #title-basic }
`Title` для виджета.

Типы:

* `постоянный заголовок`: показывает постоянный текст.
* `вычисляемый заголовок`: показывает значение из скрытого текстового поля, например вычисленное на основе бизнес-логики приложения
 
#### Как это выглядит? { #how-does-it-look_1 }
=== "Постоянный заголовок"
    ![consttitle.png](consttitle.png) 
=== "Вычисляемый заголовок"
    ![calctitle.png](calctitle.png)
#### Как добавить? { #how-to-add }
??? Example "Пример"
    === "Постоянный заголовок"
        **Шаг 1** Добавьте название в **title** в **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/headerwidget/title/myExample5027const.widget.json
        --8<--
        ```
        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5027){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/title/myExample5027const.widget.json){:target="_blank"}

    === "Вычисляемый заголовок"
        <!--родитель??-->
        **Шаг 1** Добавьте ${customField} в **title** в **_.widget.json_**. Добавьте `customField` с типом `hidden` в соответствующий **_.widget.json_**.

        !!! info
            Чтобы значение поля было получено фронтендом и отображено в заголовке, оно должно быть указано в массиве `fields`.
        
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/headerwidget/title/myExample5027.widget.json
        --8<--
        ```
        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5027/view/myexample5027form){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/title/myExample5027.widget.json){:target="_blank"}

### <a id="TitleColor">Цвет заголовка</a>
 
`Title Color` позволяет задать цвет заголовка. Он может быть постоянным или вычисляемым.
 
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5024/view/myexample5024formcolorconst){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/colortitle){:target="_blank"}

* `Постоянный цвет` — фиксированный цвет, который не меняется. Он остаётся одинаковым независимо от каких-либо факторов в приложении.

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5024/view/myexample5024form){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/colortitle){:target="_blank"}

* `Вычисляемый цвет` можно использовать для динамического изменения цвета заголовка. Он меняется в зависимости от бизнес-логики или данных приложения.

!!! info
    Цветовое выделение заголовка **применимо** к следующим [полям](/ru/widget/fields/fieldtypes/): date, dateTime, dateTimeWithSeconds, number, money, percent, time, input, text, dictionary, radio, checkbox, pickList, inlinePickList, multivalue, multivalueHover.


##### Как это выглядит? { #how-does-it-look_2 }
![colorwidget.png](colorwidget.png)

##### Как добавить? { #how-to-add_1 }
 
??? Example "Пример"
    === "Вычисляемый цвет"

        **Шаг 1**   Добавьте `собственное поле для цвета` в соответствующий **DataResponseDTO**. Поле может содержать цвет в формате HEX или быть null.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/headerwidget/colortitle/MyExample5024DTO.java:colorDTO
        --8<--
        ```   
 
        **Шаг 2** Динамический вывод данных в заголовке работает, только если эти поля отображаются на другом виджете или передаются как [Field hidden](/ru/widget/fields/field/hidden/hidden/) с другого виджета: [виджет List](/ru/widget/type/list/list), [виджет Form](/ru/widget/type/form/form), [виджет Info](/ru/widget/type/info/info)
        со свойством bgColorKey.

        Добавьте **"bgColorKey"** :  `собственное поле для цвета` в .widget.json ([виджет List](/ru/widget/type/list/list), [виджет Form](/ru/widget/type/form/form), [виджет Info](/ru/widget/type/info/info))

        Добавьте в `title` поле с `${customField}`

        ```json
        {
        "label": "Custom Field",
        "key": "customFieldText",
        "type": "input",
        "bgColorKey": "customFieldTextColor"
        }
        ```

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/headerwidget/colortitle/myExample5024Form.widget.json
        --8<--
        ```     

        **Шаг 3** Добавьте в `title` поле с `${customField}`. Добавьте поле в массив `fields`.
        

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/headerwidget/colortitle/myExample5024HeaderWidget.widget.json
        --8<--
        ```     

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5024/view/myexample5024form){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/colortitle){:target="_blank"}

    === "Постоянный цвет"
 
        Добавьте **"bgColor"** :  `цвет HEX` в .widget.json.

        Добавьте в `title` поле с `${customField}`

        !!! info
            Чтобы значение поля было получено фронтендом и отображено в заголовке, оно должно быть указано в массиве `fields`.
        

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/headerwidget/colortitle/myExample5024HeaderWidgetConstColor.widget.json
        --8<--
        ```
        
        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5024/view/myexample5024formcolorconst){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/colortitle){:target="_blank"}


## <a id="Showcondition">Условие отображения</a>
подробнее см. [showCondition](/ru/widget/type/property/showcondition/showcondition)

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5021){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/base){:target="_blank"}

* `без условия отображения — рекомендуется`: виджет виден всегда

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5026/view/myexample5026form){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/showcondition/bycurrententity){:target="_blank"}

* `условие отображения по текущей сущности`: условие может содержать логическое выражение, зависящее от полей текущей сущности. Обновление полей вызывает пересчёт условия только при сохранении или если поле force active

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5026/view/myexample5030form){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/showcondition/byparententity){:target="_blank"}

* `условие отображения по родительской сущности`: условие может содержать логическое выражение, зависящее от родительской сущности. Обновление полей родителя вызывает пересчёт условия только при сохранении или если поле force active и отображается на том же view

!!! tips "Совет"
    По возможности рекомендуется не использовать `Show condition`, так как широкое применение этой возможности усложняет поддержку приложения.


#### <a id="howdoesitlook">Как это выглядит?</a>
=== "без условия отображения"
    ![headerwidget.png](headerwidget.png)
=== "условие отображения по текущей сущности"
    ![show_cond_current.gif](show_cond_current.gif)
=== "условие отображения по родительской сущности"
    ![show_cond.gif](show_cond.gif)

### <a id="howtoadd">Как добавить?</a>
??? Example "Пример"

    === "без условия отображения"
        см. [Основы](#Howtoaddbacis)
        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5021){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/base){:target="_blank"}

    === "условие отображения по текущей сущности"
        **Шаг 1** Добавьте **showCondition** в **_.widget.json_**. Подробнее см. [showCondition](/ru/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/headerwidget/showcondition/bycurrententity/myExample5026.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5026/view/myexample5026form){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/showcondition/bycurrententity){:target="_blank"}

    === "условие отображения по родительской сущности"
        **Шаг 1** Добавьте **showCondition** в **_.widget.json_**. Подробнее см. [showCondition](/ru/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/headerwidget/showcondition/byparententity/child/myexample5029Header.widget.json
        --8<--
        ```
        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5026/view/myexample5030form){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/headerwidget/showcondition/byparententity){:target="_blank"}
 
## <a id="bc">Бизнес-компонент</a>
Указывает бизнес-компонент (BC), к которому относится этот headerwidget.
Бизнес-компонент представляет определённую часть системы, отвечающую за конкретную бизнес-логику или данные.

подробнее см. [Бизнес-компонент](/ru/environment/businesscomponent/businesscomponent/)

## <a id="fields">Поля</a>
Этот массив обычно пустой.

Однако если нужно использовать значения полей для отображения данных (например, чтобы динамически формировать заголовок на основе значения поля, см. [Цвет заголовка](#TitleColor)),
добавьте нужное поле с типом [Field hidden](/ru/widget/fields/field/hidden/hidden/) — так фронтенд сможет получить его значение.


```json
{
    "label": "Custom Field",
    "key": "customField",
    "type": "hidden"
}
```

* **"label"**

Описание: заголовок поля.

Тип: String (необязательно).

* **"key"**

Описание: имя поля в соответствующем DataResponseDTO.

Тип: String (обязательно).

* **"type"**

Описание: [Field hidden](/ru/widget/fields/field/hidden/hidden/)

Тип: hidden.

### Как добавить? { #how-to-add_2 }
??? Example "Пример"

    === "С плагином (рекомендуется)"
        **Шаг 1** Скачайте плагин
            [скачать плагин для IntelliJ](https://doc.cxbox.org/ru/plugin/plugininstalling)
    
        **Шаг 2** Добавьте существующее поле в существующий виджет headerwidget
            ![addfield.gif](addfield.gif)

    === "Пример написания кода"
        Добавьте поле в **_.widget.json_**.

        ```json
        {
            "name": "myexampleHeader",
            "title": "Header Widget",
            "type": "HeaderWidget",
            "bc": "myexample",
            "fields": [
                {
                    "label": "Custom Field",
                    "key": "customField",
                    "type": "hidden"
                }
            ]
        }
        ```
        
подробнее см. [Поля](/ru/widget/fields/fieldtypes/)

## Параметры (Options) { #options }
Этот тип виджета не поддерживает options

## Стандартные действия { #standard-actions }
Этот тип виджета не поддерживает кнопки