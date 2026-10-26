# Column2D

Виджет `Column2D` строит столбчатую диаграмму: один столбец на категорию по оси X, число по оси Y.
Если записи сгруппированы по полю, для каждой категории отображается несколько столбцов. Пользователь может переключить диаграмму в таблицу.

## Основы { #basics }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4252){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/base){:target="_blank"}
### Как это выглядит? { #how-does-it-look }
![column2d.png](column2d.png)

Каждая запись бизнес-компонента — один столбец диаграммы. Виджет берёт столбец из двух полей:

* `xValueFieldKey`: поле с категорией по оси X (клиент, месяц, продукт).
* `yValueFieldKey`: числовое поле с высотой столбца по оси Y.

`title` этих полей отображается как название оси. Записи без значения Y пропускаются.
Бэкенд возвращает записи в порядке оси X: диаграмма их не сортирует.

Параметры `options.chart2D`:

| Параметр                | Обязательный | Описание                                                                                                                   |
|-------------------------|----------|--------------------------------------------------------------------------------------------------------------------------------|
| `xValueFieldKey`        | да       | Ключ поля для оси X.                                                                                                           |
| `yValueFieldKey`        | да       | Ключ поля для оси Y. Должен быть числового типа (`number`, `money`, `percent`).                                                |
| `groupFieldKey`         | нет      | Ключ поля, разделяющего столбцы категории. Один столбец на значение, значения отображаются в легенде. См. [Группы](#groups).   |
| `stack`                 | нет      | `true` ставит столбцы категории один на другой. См. [Стек](#stack).                                                            |
| `yMin`, `yMax`, `yStep` | нет      | Масштаб и шаг оси Y. См. [Масштаб и шаг осей](#axis).                                                                          |
| `xMin`, `xMax`, `xStep` | нет      | Масштаб и шаг оси X. Только для числового поля X. См. [Масштаб и шаг осей](#axis).                                             |
| `descriptionFieldKey`   | нет      | Ключи полей, отображаемых в подсказке вместо значения X. См. [Подсказка](#tooltip).                                            |

###  <a id="Howtoaddbacis">Как добавить?</a>
??? Example "Пример"
    **Шаг 1** Создайте **DataResponseDTO** с полями столбца: значением X и значением Y.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/base/MyExample4252DTO.java
    --8<--
    ```

    **Шаг 2** Создайте **DAO**, наследующий AbstractAnySourceBaseDAO<> и реализующий AnySourceBaseDAO.
    DAO возвращает одну запись на столбец, отсортированную по оси X, с уникальным `id`.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/base/MyExample4252Dao.java:getStats
    --8<--
    ```
    В примере суммы вычисляются базой данных:
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/data/MyEntity4252Repository.java:clientSums
    --8<--
    ```

    **Шаг 3** Создайте **Meta**, наследующий AnySourceFieldMetaBuilder.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/base/MyExample4252Meta.java
    --8<--
    ```

    **Шаг 4** Создайте **Service**, наследующий AnySourceVersionAwareResponseService.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/base/MyExample4252Service.java
    --8<--
    ```

    **Шаг 5** Создайте файл **_.widget.json_** с type = **"Column2D"**.
    Добавьте поля столбца и **options.chart2D** с `xValueFieldKey` и `yValueFieldKey`.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/base/MyExample4252Column2D.widget.json
    --8<--
    ```

    **Шаг 6** Добавьте виджет в соответствующий **_.view.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/base/myexample4252column2d.view.json
    --8<--
    ```

    **Шаг 7** Задайте лимит страницы бизнес-компонента равным количеству столбцов, например 1000.
    Лимит по умолчанию — 5. Если у бизнес-компонента больше записей, чем лимит, виджет показывает только таблицу.
    См. [Лимит страницы](#pagelimit).

    Добавьте бизнес-компонент в таблицу **BC_PROPERTIES**:
    ```csv
    BC;PAGE_LIMIT;MASS_PAGE_LIMIT;SORT;FILTER;ID
    myExampleBc4252;1000;NULL;NULL;'""';
    ```

## <a id="Title">Заголовок</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4253){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/title){:target="_blank"}

### Базовый заголовок { #title-basic }
`Title` для виджета (необязательно)

Типы:

* `постоянный заголовок`: показывает постоянный текст.
* `пустой постоянный заголовок`: если нужно визуально связать виджеты, расположив их один под другим

#### Как это выглядит? { #how-does-it-look_1 }
=== "Постоянный заголовок"
    ![consttitle.png](consttitle.png)
=== "Пустой постоянный заголовок"
    ![emptytitle.png](emptytitle.png)

#### Как добавить? { #how-to-add }
??? Example "Пример"
    === "Постоянный заголовок"
        **Шаг 1** Добавьте название в **title** в **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/column2d/title/MyExample4253Column2D.widget.json
        --8<--
        ```
    === "Пустой постоянный заголовок"
        **Шаг 1** Удалите параметр **title** из **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/column2d/title/MyExample4253Column2DEmptyTitle.widget.json
        --8<--
        ```

### Цвет заголовка { #title-color }
_неприменимо_

## <a id="bc">Бизнес-компонент</a>
Указывает бизнес-компонент (BC), к которому относится этот виджет.
Бизнес-компонент представляет определённую часть системы, отвечающую за конкретную бизнес-логику или данные.

Диаграмма берёт данные из бизнес-компонента **AnySource**: DAO строит столбцы (например, сумму по клиенту)
и возвращает их в порядке оси X. Одна запись — один столбец, поэтому `id` записи должен быть уникальным.

подробнее см. [Бизнес-компонент](/ru/environment/businesscomponent/businesscomponent/)

## <a id="Showcondition">Условие отображения</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4276){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/showcondition){:target="_blank"}

* `без условия отображения — рекомендуется`: виджет виден всегда
* `условие отображения по текущей сущности`: диаграмма отображается, когда поле текущей записи другого бизнес-компонента на view имеет заданное значение

!!! tips "Совет"
    По возможности рекомендуется не использовать `Show condition`, так как широкое применение этой возможности усложняет поддержку приложения.

#### <a id="howdoesitlook">Как это выглядит?</a>
=== "без условия отображения"
    ![column2d.png](column2d.png)
=== "условие отображения по текущей сущности"
    ![show_cond_current.gif](show_cond_current.gif)

#### <a id="howtoadd">Как добавить?</a>
??? Example "Пример"

    === "без условия отображения"
        см. [Основы](#Howtoaddbacis)

    === "условие отображения по текущей сущности"
        **Шаг 1** Добавьте поле условия в **DataResponseDTO** другого бизнес-компонента.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/column2d/showcondition/MyExample4276FormDTO.java:customFieldShowCond
        --8<--
        ```
        **Шаг 2** Добавьте **showCondition** в **_.widget.json_**. Подробнее см. [showCondition](/ru/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/column2d/showcondition/MyExample4276Column2D.widget.json
        --8<--
        ```

## <a id="fields">Поля</a>
Настройка полей. Массив fields определяет поля столбца. Диаграмма использует поля, указанные в `options.chart2D`;
остальные поля отображаются в [табличном режиме](#tablemode) и в подсказке.

```json
{
    "title": "Client",
    "key": "clientName",
    "type": "input"
}
```

* **"title"**

  Описание: заголовок поля. Для полей X и Y это название оси. Пустой заголовок скрывает название оси.

  Тип: String (необязательно).

* **"key"**

    Описание: имя поля в соответствующем DataResponseDTO.

    Тип: String (обязательно).

* **"type"**

  Описание: [Типы полей](/ru/widget/fields/fieldtypes/). Поле Y должно быть числовым.

  Тип: String (обязательно).

Поле с типом `hidden` не отображается в табличном режиме. Используйте его для значений, нужных только фильтру drilldown.

### Как добавить? { #how-to-add_1 }
??? Example "Пример"
    Добавьте поле в **_.widget.json_**.

      ```json
         --8<--
         {{ external_links.github_raw_doc }}/widgets/column2d/base/MyExample4252Column2D.widget.json
         --8<--
      ```

## <a id="Fieldslayout">Компоновка (options layout)</a>
**options.layout** — в этом типе не используется.

## Действия { #actions }
_неприменимо_

### Дополнительные свойства { #additional-properties }

#### <a id="tooltip">Подсказка</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4256){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/tooltip){:target="_blank"}

Подсказка появляется при наведении мыши на столбец. По умолчанию она показывает значение X и значение каждого столбца категории.
`descriptionFieldKey` заменяет её значениями перечисленных полей записи через запятую.

###### Как это выглядит? { #how-does-it-look_2 }
![tooltip.png](tooltip.png)

###### Как добавить? { #how-to-add_2 }
??? Example "Пример"
    **Шаг 1** Заполните поле описания в DAO.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/tooltip/MyExample4256Dao.java:getStats
    --8<--
    ```
    **Шаг 2** Добавьте поле описания в **fields**, а **descriptionFieldKey** — в **options.chart2D** в **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/tooltip/MyExample4256Column2D.widget.json
    --8<--
    ```

#### <a id="color">Цвет</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4257){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/color){:target="_blank"}

Цвет столбцов задаётся на поле X:

* `bgColorKey`: ключ поля с цветом записи. Цвет задаётся для группы: все столбцы группы получают цвет её первой записи.
  Без `groupFieldKey` все столбцы одного цвета.
* `bgColor`: один постоянный цвет для всех столбцов.

Без них виджет использует палитру по умолчанию.

###### Как это выглядит? { #how-does-it-look_3 }
=== "Вычисляемый цвет"
    ![colorcalculated.png](colorcalculated.png)
=== "Постоянный цвет"
    ![colorconst.png](colorconst.png)

###### Как добавить? { #how-to-add_3 }
??? Example "Пример"
    === "Вычисляемый цвет"
        **Шаг 1** Добавьте поле цвета в **DataResponseDTO** и заполните его в DAO.
        ```java
        --8<--
        {{ external_links.github_raw_doc }}/widgets/column2d/color/MyExample4257Dao.java:getStats
        --8<--
        ```
        **Шаг 2** Добавьте **bgColorKey** к полю X в **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/column2d/color/MyExample4257Column2D.widget.json
        --8<--
        ```
    === "Постоянный цвет"
        **Шаг 1** Добавьте **bgColor** к полю X в **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/column2d/color/MyExample4257Column2DColorConst.widget.json
        --8<--
        ```

#### <a id="drilldown">Drilldown</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4258){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/drilldown){:target="_blank"}

Клик по столбцу открывает view с записями, стоящими за столбцом. Drilldown задаётся на поле X:
`drillDown: true` в виджете, а целевое представление с фильтром — в Meta записи.
При наличии `groupFieldKey` столбец знает свою группу, поэтому фильтр может включать значение группы.

В табличном режиме значение X — ссылка с тем же drilldown.

###### Как это выглядит? { #how-does-it-look_4 }
![drilldown.gif](drilldown.gif)

###### Как добавить? { #how-to-add_4 }
??? Example "Пример"
    **Шаг 1** Добавьте **drillDown** к полю X в **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/drilldown/MyExample4258Column2D.widget.json
    --8<--
    ```
    **Шаг 2** Задайте целевое представление и фильтр в **buildRowDependentMeta** класса **Meta**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/drilldown/MyExample4258Meta.java:buildRowDependentMeta
    --8<--
    ```
    **Шаг 3** Добавьте целевой виджет **List** и его view. У фильтруемых полей в DTO есть **@SearchParameter**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/drilldown/MyExample4258SaleDTO.java
    --8<--
    ```

    подробнее см. [DrillDown](/ru/advancedCustomization/element/drillDown/drillDown)

#### <a id="tablemode">Табличный режим</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4252){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/base){:target="_blank"}

Иконка настроек виджета открывает меню `Mode` с вариантами `Chart` и `Table`. В табличном режиме виджет показывает записи
в виде таблицы с колонкой для каждого поля виджета (поля с типом `hidden` не отображаются).

###### Как это выглядит? { #how-does-it-look_5 }
![tablemode.png](tablemode.png)

###### Как добавить? { #how-to-add_5 }
Табличный режим доступен всегда, ничего добавлять не нужно.

#### <a id="groups">Группы</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4254/view/myexample4254column2d){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/group){:target="_blank"}

`groupFieldKey` разделяет столбцы категории: один столбец на значение поля, рядом друг с другом. Значения отображаются в легенде.
Клик по значению легенды скрывает или показывает его столбцы.

Без `groupFieldKey` у диаграммы один столбец на категорию, а легенда показывает заголовок поля Y.

###### Как это выглядит? { #how-does-it-look_6 }
![group.png](group.png)

###### Как добавить? { #how-to-add_6 }
??? Example "Пример"
    **Шаг 1** Добавьте **groupFieldKey** в **options.chart2D** в **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/group/MyExample4254Column2D.widget.json
    --8<--
    ```
    **Шаг 2** DAO возвращает одну запись на значение X и группу.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/data/MyEntity4252Repository.java:clientProductSums
    --8<--
    ```

#### <a id="stack">Стек</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4254/view/myexample4254column2dstack){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/group){:target="_blank"}

`stack: true` ставит столбцы категории один на другой: высота колонки — сумма значений групп.
Используйте вместе с `groupFieldKey`.

###### Как это выглядит? { #how-does-it-look_7 }
![stack.png](stack.png)

###### Как добавить? { #how-to-add_7 }
??? Example "Пример"
    **Шаг 1** Добавьте **stack** в **options.chart2D** в **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/group/MyExample4254Column2DStack.widget.json
    --8<--
    ```

#### <a id="axis">Масштаб и шаг осей</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4255){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/axes){:target="_blank"}

`yMin`, `yMax` задают диапазон оси Y, `yStep` — расстояние между подписями оси.
Без них диапазон берётся из данных.

`xMin`, `xMax`, `xStep` делают то же для оси X и работают, только когда поле X числового типа.
Для текстового поля X они игнорируются, и виджет выводит сообщение в консоль браузера.

###### Как это выглядит? { #how-does-it-look_8 }
![axes.png](axes.png)

###### Как добавить? { #how-to-add_8 }
??? Example "Пример"
    **Шаг 1** Добавьте **yMin**, **yMax**, **yStep** в **options.chart2D** в **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/axes/MyExample4255Column2D.widget.json
    --8<--
    ```

#### DualAxes2D
Виджет `Column2D` можно объединить с виджетом `Line2D` в одной области с помощью виджета `DualAxes2D`:
диаграммы используют общую ось X и могут иметь отдельные оси Y.

#### Настройка отображаемых колонок { #customization-of-displayed-columns }
в этом релизе **недоступно**.

#### Фильтрация { #filtration }
##### Основы { #basic }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4268){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/filtration){:target="_blank"}

Работает только в [табличном режиме](#tablemode): фильтры колонок отображаются для полей с `enableFilter` в Meta,
как в виджете List. В режиме диаграммы фильтров нет. Виджет отправляет фильтр на бэкенд, и AnySource DAO
диаграммы применяет его сам. После возврата в режим диаграммы она строится только по отфильтрованным записям. Режим диаграммы не показывает, что фильтр применён: фильтр сбрасывается в табличном режиме.
подробнее см. [Фильтрация](/ru/widget/type/property/filtration/filtration/)

###### Как это выглядит? { #how-does-it-look_9 }
![filtration_column2d.gif](../property/filtration/filtration_column2d.gif)

###### Как добавить? { #how-to-add_9 }
??? Example "Пример"
    Когда данные диаграммы поступают из AnySource DAO, DAO применяет фильтр сам.

    `Шаг 1` Добавьте **@SearchParameter** в соответствующий **DataResponseDTO**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/property/filtration/filtergroup/MyExample3616DTO.java
    --8<--
    ```

    `Шаг 2` Добавьте **fields.enableFilter** в соответствующий **FieldMetaBuilder**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/property/filtration/filtergroup/MyExample3616Meta.java:buildIndependentMeta
    --8<--
    ```

    `Шаг 3` Примените фильтр в **getList** AnySource DAO.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/filtration/MyExample4268Dao.java:getList
    --8<--
    ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4268){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/filtration){:target="_blank"}

##### FullTextSearch
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4269){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/fulltextsearch){:target="_blank"}

Работает только в [табличном режиме](#tablemode) при наличии `options.fullTextSearch` в **_.widget.json_**: поле поиска отображается над
таблицей. Виджет отправляет текст поиска на бэкенд, и AnySource DAO диаграммы применяет его сам. После возврата в режим диаграммы она строится только по отфильтрованным записям. Режим диаграммы не показывает, что фильтр применён: фильтр сбрасывается в табличном режиме.
см. [FullTextSearch](/ru/widget/type/property/filtration/filtration/#by-fulltextsearch)

###### Как это выглядит? { #how-does-it-look_10 }
![fulltextsearch_column2d.gif](../property/filtration/fulltextsearch_column2d.gif)

###### Как добавить? { #how-to-add_10 }
??? Example "Пример"
    Когда данные диаграммы поступают из AnySource DAO, DAO применяет поиск сам.

    `Шаг 1` Добавьте файл расширения FullTextSearchExt.java
    ```java
    import java.util.Optional;
    import jakarta.persistence.criteria.CriteriaBuilder;
    import jakarta.persistence.criteria.Path;
    import jakarta.persistence.criteria.Predicate;
    import lombok.NonNull;
    import lombok.experimental.UtilityClass;
    import org.apache.commons.lang3.StringUtils;
    import org.cxbox.core.crudma.bc.BusinessComponent;

    @UtilityClass
    public class FullTextSearchExt {

        @NonNull
        public static Optional<String> getFullTextSearchFilterParam(BusinessComponent bc) {
            return Optional.ofNullable(bc.getParameters().getParameter("_fullTextSearch"));
        }

        public static Predicate likeIgnoreCase(String value, CriteriaBuilder cb, Path<String> path) {
            return cb.like(cb.lower(path), StringUtils.lowerCase("%" + value + "%"));
        }

    }
    ```

    `Шаг 2` Примените текст поиска в **getList** AnySource DAO.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/fulltextsearch/MyExample4269Dao.java:getList
    --8<--
    ```

    `Шаг 3` Добавьте **fullTextSearch** в соответствующий **.widget.json**.

    `enabled` true/false

    `placeholder` — описание для fullTextSearch

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/fulltextsearch/MyExample4269Column2D.widget.json
    --8<--
    ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4269){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/fulltextsearch){:target="_blank"}
##### Персональная группа фильтров { #personal-filter-group }
в этом релизе **недоступно**: в меню настроек диаграммы есть только пункты `Mode`, поэтому пункта `Save filters` нет.
##### Группа фильтров { #filter-group }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4270){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/filtergroup){:target="_blank"}

Работает только в [табличном режиме](#tablemode): группы фильтров бизнес-компонента отображаются над таблицей, как в виджете List.
Виджет отправляет фильтр выбранной группы на бэкенд, и AnySource DAO диаграммы применяет его сам. После возврата в режим диаграммы она строится только по отфильтрованным записям. Режим диаграммы не показывает, что фильтр применён: фильтр сбрасывается в табличном режиме.
см. [Группа фильтров](/ru/widget/type/property/filtration/filtration/#by-filter-group)

###### Как это выглядит? { #how-does-it-look_11 }
![filter_group_save_column2d.gif](../property/filtration/filter_group_save_column2d.gif)

###### Как добавить? { #how-to-add_11 }
??? Example "Пример"
    Когда данные диаграммы поступают из AnySource DAO, DAO сам применяет фильтр группы.

    !!! tips "Совет"
        Чтобы получить условия для колонки `filters`, выполните следующие шаги:

        * Добавьте функцию фильтрации для полей
        * Заполните нужные фильтры в интерфейсе.
        * Откройте панель разработчика.
        * Найдите нужный запрос.
        * Используйте часть этого запроса с фильтром как значение `filters`

        ![how_add_search_spec.gif](../property/filtration/how_add_search_spec.gif)

    **Шаг 1** Добавьте бизнес-компонент в таблицу **BC_FILTER_GROUPS**

    ```csv
    name;bc;filters;ID
    Sum from 4000;myExampleBc4270;sum.greaterOrEqualThan=4000;
    Sum under 4000;myExampleBc4270;sum.lessThan=4000;
    ```

    **Шаг 2** Примените фильтр в **getList** AnySource DAO.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/filtergroup/MyExample4270Dao.java:getList
    --8<--
    ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4270){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/filtergroup){:target="_blank"}

#### Пагинация { #pagination }
_неприменимо_: диаграмма показывает одну страницу, см. [Лимит страницы](#pagelimit).

#### Экспорт в Excel { #export-to-excel }
в этом релизе **недоступно**.

#### Множественная загрузка файлов { #multi-upload-files }
_неприменимо_

#### Сортировка { #sorting }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4271){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/sorting){:target="_blank"}

Работает только в [табличном режиме](#tablemode) для полей с `enableSort` в Meta. Виджет отправляет сортировку на бэкенд,
и AnySource DAO диаграммы применяет её сам. После возврата в режим диаграммы записи отображаются в отсортированном порядке.
подробнее см. [Сортировка](/ru/widget/type/property/sorting/sorting)

#### <a id="pagelimit">Лимит страницы</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4259){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/limit){:target="_blank"}

Диаграмма строится только по первой странице бизнес-компонента. Если у бизнес-компонента больше записей, чем лимит страницы,
диаграмма не строится: виджет открывается в табличном режиме, режим `Chart` недоступен, а иконка предупреждения объясняет причину.

Задайте лимит страницы бизнес-компонента равным количеству столбцов, см. [Лимит записей на странице](/ru/widget/type/property/defaultlimitpage/defaultlimitpage).

###### Как это выглядит? { #how-does-it-look_12 }
![limit.png](limit.png)

###### Как добавить? { #how-to-add_12 }
??? Example "Пример"
    **Шаг 1** Задайте лимит страницы в таблице **BC_PROPERTIES**. В примере он равен 3 для 5 столбцов.
    ```csv
    BC;PAGE_LIMIT;MASS_PAGE_LIMIT;SORT;FILTER;ID
    myExampleBc4259;3;NULL;NULL;'""';
    ```
    **Шаг 2** DAO возвращает страницу, запрошенную виджетом.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/column2d/limit/MyExample4259Dao.java:getList
    --8<--
    ```

#### <a id="nodata">Нет данных</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample4260){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/column2d/nodata){:target="_blank"}

Когда бизнес-компонент не возвращает записей, виджет показывает `No Data` вместо диаграммы.

###### Как это выглядит? { #how-does-it-look_13 }
![nodata.png](nodata.png)

#### <a id="parentchild">Родитель-потомок</a>
В режиме диаграммы в этом релизе **недоступно**: клик по столбцу не выбирает запись, дочерние виджеты не меняются.
В [табличном режиме](#tablemode) клик по строке выбирает запись, и дочерние виджеты показывают данные этой записи.
