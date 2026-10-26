# CardCarouselList

Виджет `CardCarouselList` показывает записи в виде карточек файлов в одной горизонтальной ленте. Каждая карточка показывает предпросмотр файла записи, название, описание и статус.
Пользователь прокручивает ленту стрелками, выбирает карточку кликом, а также открывает, редактирует и удаляет файлы прямо на карточках.

!!! info "CardList и CardCarouselList"
    [CardList](/ru/widget/type/cardlist/cardlist) и [CardCarouselList](/ru/widget/type/cardcarousellist/cardcarousellist) показывают одинаковые карточки и настраиваются одинаково. Оба загружают по одной странице записей: по умолчанию 5, задаётся [лимитом записей на странице](/ru/widget/type/property/defaultlimitpage/defaultlimitpage).

    * **CardList**: любое количество записей. Кнопки страниц под карточками открывают следующие страницы.
    * **CardCarouselList**: только записи первой страницы. Стрелки прокручивают карточки этой страницы, следующей страницы нет. Чтобы показать все записи, задайте лимит страницы равным их количеству, до 20: вся страница загружается сразу.

## Основы { #basics }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5060){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/base){:target="_blank"}

### Как это выглядит? { #how-does-it-look }
![cardcarousellist.png](cardcarousellist.png)

Виджету нужно одно поле типа [fileUpload](/ru/widget/fields/field/fileUpload/fileUpload/). Карточка показывает этот файл.
Без других настроек название карточки — имя файла. В примере название и описание берутся из полей, см. [Параметры карточки](#cardoptions).

* Одна карточка — одна запись бизнес-компонента.
* Стрелки прокручивают ленту на количество видимых карточек. После последней карточки лента снова начинается с первой.
* Клик по карточке делает её текущей записью.

###  <a id="Howtoaddbacis">Как добавить?</a>
??? Example "Пример"
    **Шаг 1** Создайте файл **_.widget.json_** с type = **"CardCarouselList"**.
    Добавьте поле с типом `fileUpload` и поля для названия и описания. Задайте их в `options.card`. Подробнее см. [Поля](#fields)
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/MyExample5060CardCarouselList.widget.json
    --8<--
    ```

    **Шаг 2** Добавьте виджет в соответствующий **_.view.json_**.

    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/myexample5060carousel.view.json
    --8<--
    ```

## Основные визуальные части { #main-visual-parts }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5060){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/base){:target="_blank"}

![parts.png](parts.png)

* `preview` — файл поля fileUpload. см. [Предпросмотр](#preview)
* `status` — значение первого поля **dictionary**, в середине карточки. см. [Статус](#status)
* `title` — имя файла или поле из `titleFieldKey`. см. [Параметры карточки](#cardoptions)
* `description` — поле из `descriptionFieldKey`, под названием. см. [Параметры карточки](#cardoptions)
* `actions` — действия записи в виде иконок. Отображаются при наведении мыши на карточку. см. [Действия](#actions)
* `arrows` — прокручивают ленту к предыдущим или следующим карточкам.
* `read widget` — файл выбранной карточки, крупно, над лентой. см. [Read widget](#read)

## <a id="Title">Заголовок</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5061){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/title){:target="_blank"}

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
        {{ external_links.github_raw_doc }}/widgets/cardcarousellist/title/MyExample5061CardCarouselList.widget.json
        --8<--
        ```
        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5061/view/myexample5061title){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/title){:target="_blank"}

    === "Пустой постоянный заголовок"
        **Шаг 1** Удалите параметр **title** из **_.widget.json_**.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/cardcarousellist/title/MyExample5061EmptyTitle.widget.json
        --8<--
        ```
        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5061/view/myexample5061emptytitle){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/title){:target="_blank"}

### Цвет заголовка { #title-color }
`Title Color` позволяет задать цвет заголовка. Он может быть постоянным или вычисляемым.
Заголовок показывает значения полей текущей записи, то есть выбранной карточки.

**Постоянный цвет**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5062/view/myexample5062colorconst){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/colortitle){:target="_blank"}

*Постоянный цвет* — фиксированный цвет, который не меняется. Он остаётся одинаковым независимо от каких-либо факторов в приложении.

**Вычисляемый цвет**

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5062/view/myexample5062color){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/colortitle){:target="_blank"}

*Вычисляемый цвет* можно использовать для динамического изменения цвета заголовка. Он меняется в зависимости от бизнес-логики или данных приложения.

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
        {{ external_links.github_raw_doc }}/widgets/cardcarousellist/colortitle/MyExample5062DTO.java:colorDTO
        --8<--
        ```

        **Шаг 2** Добавьте **"bgColorKey"** :  `собственное поле для цвета` в .widget.json.

        Добавьте в `title` поле с `${customField}`

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/cardcarousellist/colortitle/MyExample5062CardCarouselList.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5062/view/myexample5062color){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/colortitle){:target="_blank"}

    === "Постоянный цвет"

        Добавьте **"bgColor"** :  `цвет HEX` в .widget.json.

        Добавьте в `title` поле с `${customField}`

        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/cardcarousellist/colortitle/MyExample5062ColorConst.widget.json
        --8<--
        ```

        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5062/view/myexample5062colorconst){:target="_blank"} ·
        [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/colortitle){:target="_blank"}

## <a id="bc">Бизнес-компонент</a>
Указывает бизнес-компонент (BC), к которому относится эта форма.
Бизнес-компонент представляет определённую часть системы, отвечающую за конкретную бизнес-логику или данные.

подробнее см. [Бизнес-компонент](/ru/environment/businesscomponent/businesscomponent/)

## <a id="Showcondition">Условие отображения</a>

* `без условия отображения — рекомендуется`: виджет виден всегда

  [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5060){:target="_blank"} ·
  [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/base){:target="_blank"}

* `условие отображения по текущей сущности`: **не рекомендуется**. Условие вычисляется по выбранной карточке, поэтому виджет может скрыть сам себя, когда пользователь выбирает другую карточку.

* `условие отображения по родительской сущности`: условие может содержать логическое выражение, зависящее от родительской сущности. Обновление полей родителя вызывает пересчёт условия только при сохранении или если поле force active и отображается на том же view

  [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5063){:target="_blank"} ·
  [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/showcondition){:target="_blank"}

!!! tips "Совет"
    По возможности рекомендуется не использовать `Show condition`, так как широкое применение этой возможности усложняет поддержку приложения.

#### <a id="howdoesitlook">Как это выглядит?</a>
=== "без условия отображения"
    ![cardcarousellist.png](cardcarousellist.png)
=== "условие отображения по родительской сущности"
    ![show_cond.gif](show_cond.gif)

#### <a id="howtoadd">Как добавить?</a>
??? Example "Пример"

    === "без условия отображения"
        см. [Основы](#Howtoaddbacis)

    === "условие отображения по родительской сущности"
        **Шаг 1** Добавьте **showCondition** в **_.widget.json_**. Подробнее см. [showCondition](/ru/widget/type/property/showcondition/showcondition)
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/cardcarousellist/showcondition/MyExample5064CardCarouselList.widget.json
        --8<--
        ```

## <a id="fields">Поля</a>
Настройка полей. Массив fields определяет поля, используемые карточками.

```json
{
    "title": "Document",
    "key": "document",
    "type": "fileUpload",
    "fileIdKey": "documentId",
    "preview": {
        "enabled": true,
        "mode": "inline"
    }
}
```

* **"title"**

  Описание: заголовок поля.

  Тип: String (необязательно).

* **"key"**

    Описание: имя поля в соответствующем DataResponseDTO.

    Тип: String (обязательно).

* **"type"**

  Описание: [Типы полей](/ru/widget/fields/fieldtypes/)

  Тип: String (обязательно).

Виджет использует только эти поля:

| Поле | Где отображается |
|---|---|
| **fileUpload** | предпросмотр карточки; первое поле fileUpload или поле из `valueFieldKey` |
| любое поле из `titleFieldKey` | название карточки |
| любое поле из `descriptionFieldKey` | описание карточки |
| первое поле **dictionary** | статус карточки |

Остальные поля на карточке не отображаются. Их можно использовать в форме создания и редактирования.

### Как добавить? { #how-to-add_2 }
??? Example "Пример"
    Добавьте поле в **_.widget.json_**.

      ```json
         --8<--
         {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/MyExample5060CardCarouselList.widget.json
         --8<--
      ```

## <a id="Fieldslayout">Компоновка (options layout)</a>
_неприменимо_

## <a id="actions">Действия</a>
`Actions` отображают доступные действия в виде отдельных кнопок, подробнее см. [Действия](/ru/features/element/actions/actions).

Действия записи отображаются на карточке в виде иконок. Действия виджета (например, **Add**) отображаются над лентой.

!!! info
    На карточке отображаются все действия записи из сервиса, в том числе **Save** и **Cancel**.
    Оставьте только нужные с помощью **actionGroups**: `"actionGroups": {"include": ["create", "delete"]}`.

### Создание { #create }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5060){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/base){:target="_blank"}

Кнопка `Create` позволяет создать новую карточку нажатием кнопки `Add`. Открывается всплывающее окно файла с формой под ним: пользователь загружает файл, заполняет поля и сохраняет запись.

* `Inline`: **неприменимо**: у пустой карточки нет места для загрузки файла.
* `With widget`: **Add** открывает всплывающее окно с пустым предпросмотром файла и формой из `options.create`. **Save** создаёт запись, **Cancel** удаляет новую карточку.
* `With view`: **неприменимо**

!!! warning "Внимание"
    Форма должна иметь тип **Form**. **FormPopup** во всплывающем окне не отображается.

#### Как это выглядит? { #how-does-it-look_3 }
![create.gif](create.gif)

#### Как добавить? { #how-to-add_3 }
??? Example "Пример"
    **Шаг 1** Добавьте действие create в соответствующий **VersionAwareResponseService**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/MyExample5060Service.java:getActions
    --8<--
    ```

    **Шаг 2** Создайте виджет Form для всплывающего окна.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/MyExample5060Form.widget.json
    --8<--
    ```

    **Шаг 3** Добавьте **options.create** и **options.edit** с `"style": "popup"` в виджет CardCarouselList.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/MyExample5060CardCarouselList.widget.json
    --8<--
    ```

    **Шаг 4** Добавьте оба виджета в **_.view.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/myexample5060carousel.view.json
    --8<--
    ```

### Редактирование { #edit }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5060){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/base){:target="_blank"}

При наличии `options.edit` у карточки есть иконка **edit**. Она открывает всплывающее окно с файлом и формой под ним. **Save** сохраняет запись и закрывает окно.
Стрелки внизу всплывающего окна переходят к предыдущей или следующей карточке.

Без `options.edit` у карточки есть иконка **глаза**. Она открывает файл во всплывающем окне для просмотра.

#### Как это выглядит? { #how-does-it-look_4 }
=== "С options.edit"
    ![edit.gif](edit.gif)
=== "Без options.edit"
    ![view.gif](view.gif)

#### Как добавить? { #how-to-add_4 }
??? Example "Пример"
    см. [Создание](#create), **Шаг 2** – **Шаг 4**.

### Удаление { #delete }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5060){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/base){:target="_blank"}

Иконка **delete** сразу удаляет запись, как в [List](/ru/widget/type/list/list/).

#### Как это выглядит? { #how-does-it-look_5 }
![delete.gif](delete.gif)

#### Как добавить? { #how-to-add_5 }
??? Example "Пример"
    Добавьте действие delete в соответствующий **VersionAwareResponseService**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/MyExample5060Service.java:getActions
    --8<--
    ```

## Дополнительные свойства { #additional-properties }
### <a id="cardoptions">Параметры карточки</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5060){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/base){:target="_blank"}

`options.card` задаёт, какие поля отображаются на карточке. Все ключи необязательны.

| Ключ | Что задаёт | По умолчанию |
|---|---|---|
| `valueFieldKey` | поле fileUpload карточки | первое поле fileUpload |
| `titleFieldKey` | поле для названия | имя файла |
| `descriptionFieldKey` | поле для описания | без описания |

При наличии описания название и описание обрезаются до одной строки. Без описания длинное название переносится на следующие строки.

#### Как добавить? { #how-to-add_6 }
??? Example "Пример"
    Добавьте **options.card** в **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/MyExample5060CardCarouselList.widget.json
    --8<--
    ```

### <a id="cardsize">Размер карточки</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5060){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/base){:target="_blank"}

Размер карточки задаётся на поле fileUpload карточки:

* `width`: ширина карточки в пикселях. По умолчанию: 300.
* `minRows`: высота карточки в строках по 40 пикселей. По умолчанию карточка квадратная.

Лента показывает столько карточек, сколько помещается по ширине виджета.

### <a id="preview">Предпросмотр</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5060){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/base){:target="_blank"}

Карточка показывает предпросмотр файла, когда у `preview` поля fileUpload задано `"enabled": true`: изображение или первая страница PDF. Остальные файлы отображаются иконкой их типа.

* Поддерживается только `"mode": "inline"`. Другие режимы тоже работают как inline и выдают предупреждение в консоль браузера.
* Без `preview` или с `"enabled": false` карточка показывает только иконку типа файла.

#### Как добавить? { #how-to-add_7 }
??? Example "Пример"
    Добавьте **preview** с `"enabled": true` и `"mode": "inline"` к полю fileUpload в **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/base/MyExample5060CardCarouselList.widget.json
    --8<--
    ```

### <a id="status">Статус</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5065){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/status){:target="_blank"}

`Status` показывает значение поля dictionary в середине карточки, поверх предпросмотра. Цвет статуса задаётся так же, как [цвет заголовка](#Title): постоянный `bgColor` или вычисляемый `bgColorKey` поля dictionary.

!!! info
    Виджет берёт первое поле с типом `dictionary`. Параметра для выбора другого поля dictionary нет.

#### Как это выглядит? { #how-does-it-look_6 }
![status.png](status.png)

#### Как добавить? { #how-to-add_8 }
??? Example "Пример"
    **Шаг 1** Добавьте поле dictionary и поле для его цвета в соответствующий **DataResponseDTO**.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/status/MyExample5065DTO.java:statusDTO
    --8<--
    ```

    **Шаг 2** Добавьте поле dictionary с **"bgColorKey"** в **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/status/MyExample5065CardCarouselList.widget.json
    --8<--
    ```

### <a id="drilldown">DrillDown</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5066){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/drilldown){:target="_blank"}

`DrillDown` позволяет перейти в другое представление с карточки карусели.

* У названия карточки появляется иконка ссылки. Клик по названию открывает целевое представление.
* Клик по другим частям карточки (предпросмотр, описание, пустое место) только выбирает карточку и не открывает ссылку.
* Целевое представление вычисляется для каждой карточки, поэтому каждая карточка может открывать свою запись или своё представление. В примере название открывает форму записи карточки.

#### Как это выглядит? { #how-does-it-look_7 }
![drilldown.gif](drilldown.gif)

#### Как добавить? { #how-to-add_9 }
??? Example "Пример"
    `Шаг 1` Добавьте **"drillDown": true** к полю fileUpload карточки в **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/drilldown/MyExample5066CardCarouselList.widget.json
    --8<--
    ```

    `Шаг 2` Добавьте **fields.setDrilldown** для того же поля fileUpload в соответствующий **FieldMetaBuilder**. Ссылка строится для записи каждой карточки.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/drilldown/MyExample5066Meta.java:drilldown
    --8<--
    ```

    [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5066){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/drilldown){:target="_blank"}

### <a id="read">Read widget</a>
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5067){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/read){:target="_blank"}

`Read widget` показывает файл выбранной карточки крупно над лентой. Стрелки на крупном просмотре выбирают предыдущую или следующую карточку. У изображения есть кнопки поворота, масштабирования, сброса и открытия на весь экран.

* Read widget — это виджет Info или Form с тем же полем fileUpload. Отображается только предпросмотр файла, остальные поля виджета не отображаются.
* `options.layout` read widget задаёт размер и место предпросмотра: `span` поля fileUpload — его ширина, `minRows` поля — его высота. Чтобы разместить предпросмотр по центру, поставьте колонку fileUpload между двумя колонками других полей: read widget показывает только файл, поэтому эти колонки остаются пустыми.

#### Как это выглядит? { #how-does-it-look_8 }
![read.gif](read.gif)

#### Как добавить? { #how-to-add_10 }
??? Example "Пример"
    **Шаг 1** Создайте виджет Info с полем fileUpload.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/read/MyExample5067Read.widget.json
    --8<--
    ```

    **Шаг 2** Добавьте **options.read.widget** в виджет CardCarouselList.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/read/MyExample5067CardCarouselList.widget.json
    --8<--
    ```

    **Шаг 3** Добавьте оба виджета в **_.view.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/read/myexample5067carousel.view.json
    --8<--
    ```

### Фильтрация { #filtration }
_неприменимо_

#### Полнотекстовый поиск (FullTextSearch) { #fulltextsearch }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample5068){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/cardcarousellist/fulltextsearch){:target="_blank"}

`FullTextSearch` — когда пользователь вводит текст в поле поиска виджета, виджет показывает карточки, соответствующие запросу. Сервис фильтрует записи, как в List.

##### Как это выглядит? { #how-does-it-look_9 }
![fulltextsearch.gif](fulltextsearch.gif)

см. [FullTextSearch](/ru/widget/type/property/filtration/filtration/#by-fulltextsearch)

##### Как добавить? { #how-to-add_11 }
??? Example "Пример"
    **Шаг 1** Добавьте **fullTextSearch** в **options** файла **_.widget.json_**.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/fulltextsearch/MyExample5068CardCarouselList.widget.json
    --8<--
    ```

    **Шаг 2** Добавьте спецификацию поиска в репозиторий.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/fulltextsearch/MyEntity5068Repository.java:getFullTextSearchSpecification
    --8<--
    ```

    **Шаг 3** Примените её в **getSpecification** сервиса.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/cardcarousellist/fulltextsearch/MyExample5068Service.java:getSpecification
    --8<--
    ```

### Пагинация { #pagination }
**неприменимо**: лента показывает только первую страницу бизнес-компонента. Лимит страницы по умолчанию — 5 записей.

Чтобы показать больше карточек, задайте лимит страницы бизнес-компонента. см. [Лимит записей на странице](/ru/widget/type/property/defaultlimitpage/defaultlimitpage)

### Экспорт в Excel { #export-to-excel }
_неприменимо_

### Множественная загрузка файлов { #multi-upload-files }
[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample6100/view/myexample6100cardcarousellist){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/file){:target="_blank"}

Реализована множественная загрузка файлов. Для выбора файлов можно использовать специальную зону drag-and-drop или стандартную кнопку. Каждый загруженный файл становится новой карточкой.

подробнее см. [Множественная загрузка файлов](/ru/widget/type/property/multiupload/multiupload)

### Настройка отображаемых колонок { #customization-of-displayed-columns }
_неприменимо_

### Сортировка { #sorting }
_неприменимо_
