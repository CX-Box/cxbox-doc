# Виджеты { #widgets }
<!-- 
## Семейства типов виджетов { #widget-type-family }

AdditionalInfo
SuggestionPickList
DashboardList
 
LevelMenu
Steps 
-->


## Типы виджетов { #widget-types }
=== "AdditionalInfo"
    ![additionalinfo.png](additionalinfo/additionalinfo.png)
=== "AdditionalList"
    ![basic.png](additionallist/basic.png)
=== "AssocListPopup"
    ![assoc.png](assoclistpopup/assoc.png)
=== "AssocTreePopup"
    ![choose_assoc.png](assoctreepopup/choose_assoc.png)
=== "CardCarouselList"
    ![cardcarousellist.png](cardcarousellist/cardcarousellist.png)
=== "Column2D"
    ![column2d.png](column2d/column2d.png)
=== "CardList"
    ![cardlist.png](cardlist/cardlist.png)
=== "EmptyWidget"
    ![emptywidget.png](emptywidget/emptywidget.png)
=== "FilePreview"
    ![filepreview.png](filepreview/filepreview.png)
=== "Form"
    ![formwidget.png](form/formwidget.png)
=== "FormPopup"
    ![formpopup.png](formpopup/formpopup.png)
=== "GroupingHierarchy"
    ![gh.png](groupinghierarchy/gh.png)
=== "HeaderWidget"
    ![headerwidget.png](headerwidget/headerwidget.png)
=== "Info"
    ![info.png](info/info.png)
=== "List"
    ![list.png](list/list.png)
=== "PickListPopup"
    ![picklist.png](picklistpopup/picklist.png)
=== "PickTreePopup"
    ![pickTreePopupBasic.png](picktreepopup/pickTreePopupBasic.png)
=== "Line2D"
    ![line2d.png](line2d/line2d.png)
=== "StatsBlock"
    ![img_stat.png](statblocks/img_stat.png)
=== "Steps"
    ![steps.png](steps/steps.png)
=== "Tree"
    ![tree.png](tree/tree.png)

*   [Виджет AdditionalInfo](/ru/widget/type/additionalinfo/additionalinfo) — компонент только для просмотра данных. Виджет всегда располагается **справа**.
*   [Виджет AdditionalList](/ru/widget/type/additionallist/additionallist) выводит общую информацию по множеству записей. Виджет всегда располагается **справа**.
*   [Виджет AssocListPopup](/ru/widget/type/assoclistpopup/assoclistpopup) — всплывающий компонент для выбора нескольких значений.
*   [Виджет AssocTreePopup](/ru/widget/type/assoctreepopup/assoctreepopup) — всплывающий компонент для выбора нескольких значений из иерархического дерева с ленивой загрузкой.
*   [Виджет Column2D](/ru/widget/type/column2d/column2d) строит столбчатую диаграмму: столбец на категорию по оси X, число по оси Y. Пользователь может переключить её в таблицу.
*   [Виджет CardCarouselList](/ru/widget/type/cardcarousellist/cardcarousellist) показывает записи в виде карточек файлов в горизонтальной ленте с предпросмотром, названием и описанием.
*   [Виджет CardList](/ru/widget/type/cardlist/cardlist) показывает записи в виде карточек файлов рядами со страницами, с предпросмотром, названием и описанием.
*   [Виджет EmptyWidget](/ru/widget/type/emptywidget/emptywidget) — компонент для отображения текста.
*   [Виджет FilePreview](/ru/widget/type/filepreview/filepreview) — компонент для просмотра файлов. Он всегда занимает 50% основной области экрана и остаётся закреплённым сверху при прокрутке.
*   [Виджет Form](/ru/widget/type/form/form) — компонент для просмотра и редактирования данных.
*   [Виджет FormPopup](/ru/widget/type/formpopup/formpopup) — компонент для дополнительных проверок полей во всплывающем окне и возможности добавлять информацию внутри него.
*   [Виджет GroupingHierarchy](/ru/widget/type/groupinghierarchy/groupinghierarchy) выводит общую информацию по множеству записей и позволяет группировать строки по одному или нескольким заданным полям.
*   [Виджет HeaderWidget](/ru/widget/type/headerwidget/headerwidget) — компонент для отображения заголовка.
*   [Виджет Info](/ru/widget/type/info/info) — компонент только для просмотра данных.
*   [Виджет List](/ru/widget/type/list/list) выводит общую информацию по множеству записей и представляет её в удобном для пользователя виде.
*   [Виджет Line2D](/ru/widget/type/line2d/line2d) строит линейный график по записям бизнес-компонента: одна точка на запись, одна линия на группу.
*   [Виджет PickListPopup](/ru/widget/type/picklistpopup/picklistpopup) — компонент, позволяющий пользователю выбрать значение из всплывающего списка сущностей.
*   [Виджет PickTreePopup](/ru/widget/type/picktreepopup/picktreepopup) — компонент, позволяющий пользователю выбрать значение из всплывающего дерева сущностей.
*   [Виджет StatsBlock](/ru/widget/type/statblocks/statblocks) предназначен для отображения агрегированных данных в наглядном виде.
*   [Steps](/ru/widget/type/steps/steps) используется для определения последовательных действий или этапов бизнес-процесса в приложении и управления ими. Он позволяет разработчикам и пользователям разбивать сложное поведение на небольшие управляемые шаги, улучшая читаемость и сопровождаемость.
*   [Виджет Tree](/ru/widget/type/tree/tree) представляет иерархические записи в виде раскрываемого дерева, позволяя просматривать родительские и дочерние строки в одной таблице.
 
## Структура .widget.json { #structure-widgetjson }

```json
{
  "name": "MyExampleForm",
  "title": "Title Form",
  "type": "Form",
  "bc": "myexample",
  "showCondition":{},
  "fields": [],
  "options": {}
}
```

* **"name"**

Описание: уникальный идентификатор в пределах проекта.

Тип: String (обязательно).

Примечание: это значение должно быть уникальным в пределах проекта

* **"title"**

Описание: заголовок виджета

Тип: String (необязательно).

* **"type"**

Для этого виджета значение должно быть "Form",

* **"bc"**

Описание: [Бизнес-компонент](/ru/environment/businesscomponent/businesscomponent/)

Тип: String (обязательно).

*  **"showCondition"**

Описание: динамическое определение доступности или видимости виджета. Подробнее см. [showCondition](/ru/widget/type/property/showcondition/showcondition)

Тип: String (необязательно).

* **"fields"**

Описание: настройка полей

Тип: String (обязательно).

* **"options"**

Описание: задаёт структуру виджета с помощью строк и колонок.

Тип: String (обязательно).
 