# Условие отображения (Show condition) { #show-condition }
`showCondition` используется для динамического определения доступности или видимости виджета.
`showCondition` в конфигурации — условие, при котором виджет становится видимым пользователю.
Оно определяет, отображается ли виджет в интерфейсе, на основе значения определённого поля другого или текущего бизнес-компонента.

* `без условия отображения — рекомендуется`: виджет виден всегда
* `условие отображения по текущей сущности`: условие может содержать логическое выражение, зависящее от полей текущей сущности. Обновление полей вызывает пересчёт условия только при сохранении или если поле force active
* `условие отображения по родительской сущности`: условие может содержать логическое выражение, зависящее от родительской сущности. Обновление полей родителя вызывает пересчёт условия только при сохранении или если поле force active и отображается на том же view

!!! tips "Совет"
    По возможности рекомендуется не использовать `Show condition`, так как широкое применение этой возможности усложняет поддержку приложения.

!!! info
    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3184/view/myexample3183hiddenparentchild ){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/property/showcondition/hiddenbc){:target="_blank"}
 
    Данные дочерней сущности загружаются, даже когда родитель скрыт условием отображения.

## Структура showCondition { #structure-showcondition }

```json
"showCondition": {
    "bcName": "myexample",
    "params": {
        "fieldKey": "customFieldShowCondition",
        "value": true
    }
}
```
 
* **"bcName"**
   
Описание: [бизнес-компонент](/ru/environment/businesscomponent/businesscomponent/), к которому применяется описанное ниже условие.

Тип: String (обязательно).

* **"fieldKey"**

Описание: имя поля с условием отображения.

Тип: String (обязательно).

* **"value"**

Описание: значение поля, при котором условие отображения выполняется.

Тип: String/boolean/number/null (обязательно).

## Как это выглядит? { #how-does-it-look }
 
*   [виджет AdditionalInfo](/ru/widget/type/additionalinfo/additionalinfo/#howdoesitlook)
*   [EmptyWidget](/widget/type/emptywidget/emptywidget/#howdoesitlook)
*   виджет Form Popup — неприменимо
*   [виджет Form](/ru/widget/type/form/form/#howdoesitlook)
*   [HeaderWidget](/widget/type/headerwidget/headerwidget/#howdoesitlook)
*   [виджет Info](/ru/widget/type/info/info/#howdoesitlook)
*   [виджет List](/ru/widget/type/list/list/#howdoesitlook)
*   [виджет Tree](/ru/widget/type/tree/tree/#howdoesitlook)
*   виджет PickListPopup — неприменимо
*   виджет PickTreePopup — неприменимо
*   виджет AssocTreePopup — неприменимо
*   [виджет блоков статистики](/ru/widget/type/statblocks/statblocks/#howdoesitlook)

## Как добавить? { #how-to-add }

*   [виджет AdditionalInfo](/ru/widget/type/additionalinfo/additionalinfo/#howtoadd)
*   [EmptyWidget](/widget/type/emptywidget/emptywidget/#howtoadd)
*   виджет Form Popup — неприменимо
*   [виджет Form](/ru/widget/type/form/form/#howtoadd)
*   [HeaderWidget](/widget/type/headerwidget/headerwidget/#howtoadd)
*   [виджет Info](/ru/widget/type/info/info/#howtoadd)
*   [виджет List](/ru/widget/type/list/list/#howtoadd)
*   [виджет Tree](/ru/widget/type/tree/tree/#howtoadd)
*   виджет PickListPopup — неприменимо
*   виджет PickTreePopup — неприменимо
*   виджет AssocTreePopup — неприменимо
*   [виджет блоков статистики](/ru/widget/type/statblocks/statblocks/#howtoadd)

## Устаревшие функции { #deprecated-functions }

**showCondition.isDefault** помечен как устаревший в релизе cxbox-4.0.0-M9

**showCondition.sequence** помечен как устаревший в релизе cxbox-4.0.0-M9

**showCondition.multipleParams** помечен как устаревший в релизе cxbox-4.0.0-M9

**showCondition.params.valueList** помечен как устаревший в релизе cxbox-4.0.0-M9
 