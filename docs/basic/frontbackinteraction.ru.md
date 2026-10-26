# Взаимодействие фронтенда и бэкенда { #frontend-backend-interaction }

CXBox предоставляет стандартизированный и унифицированный механизм API для взаимодействия фронтенда и бэкенда.
Разработчикам не нужно проектировать и поддерживать собственные API — все операции с данными (чтение, обновление, удаление, получение метаданных и пользовательские действия) обрабатываются встроенными эндпоинтами.
Такой подход упрощает разработку, повышает согласованность и снижает количество ошибок интеграции.

Платформа включает универсальный механизм взаимодействия, который одинаково хорошо работает для форм, таблиц и других виджетов. Это означает, что при смене типа виджета базовая логика остаётся корректной — всё продолжает работать без дополнительной настройки API.

В этой статье мы рассмотрим, как устроен этот механизм, и изучим основные методы API, на которых он основан.


На этой странице описано соответствие между элементами интерфейса и REST-вызовами.

Вызов бэкенда может быть направлен либо в любой источник (any source), либо в версию (version) и обрабатывается следующим образом:

* VersionAwareResponseService
* [AnySourceVersionAwareResponseService](/features/element/microservices/microservices_users_action)

---

## Структура API { #api-structure }

Взаимодействие фронтенда и бэкенда в CXBox построено на четырёх типах API:

* [/data](#data)
* [/row-meta/](#rowmeta)
* [/custom-action](#customaction)
* [/count](#count)

API устроено следующим образом:

* [независимые сущности](#independentbcs):  `.../screen/bc` или `.../screen/bc/id`
* [зависимые связи родитель-потомок](#parentchild):  `.../screen/parent_bc/id/child_bc` или `screen/parent_bc/id/child_bc/id`
 
Пример:

![meta.png](callapi/meta.png)

### <a id="data">/data</a>

| Метод  | Эндпоинт             | Описание                      |
|:--------|:---------------------|:-------------------------------|
| GET     | /api/v1/data/        | Получить список записей        |
| GET     | /api/v1/data/id      | Получить данные конкретной записи |
| PUT     | /api/v1/data/id      | Обновить запись                |
| DELETE  | /api/v1/data/id      | Удалить запись                 |

---
### <a id="rowmeta">/row-meta</a>

Метаданные описывают, какие поля доступны для редактирования, какие кнопки видны и т. д.

| Метод | Эндпоинт              | Описание                               |
|:-------|:----------------------|:---------------------------------------|
| GET    | /api/v1/row-meta      | Получить общие метаданные              |
| GET    | /api/v1/row-meta/id   | Получить метаданные конкретной записи  |
| GET    | /api/v1/row-meta-new  | Получить метаданные для создания новой записи |

---

### <a id="customaction">/custom-action</a>

| Метод | Эндпоинт                | Описание                     |
|:-------|:------------------------|:------------------------------|
| POST   | /api/v1/custom-action   | Выполнить пользовательское действие |

---

### <a id="count">/count</a>

| Метод | Эндпоинт         | Описание                   |
|:-------|:-----------------|:----------------------------|
| GET    | /api/v1/count    | Получить общее количество записей |

---

## <a id="coreprinciple">Основной принцип CXBOX</a>

Все виджеты работают по одной и той же логике (за исключением [FormPopup](#formpopup)).
Это гарантирует, что переключение с одного типа виджета на другой не нарушает работу API.
 
## Примеры { #examples }
### <a id="independentbcs"> Загрузка данных: независимые BC</a>
Рассмотрим экран с одним виджетом List.

1. Откройте Developer Tools → вкладку Network.
2. Загрузите экран со списком.

![3api.png](callapi/3api.png)

Видно, что выполняются три вызова API.

```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/data/screen/bc
    Frontend->>Backend: GET /api/v1/row-meta/screen/bc/id
    Frontend->>Backend: GET /api/v1/count/screen/bc
```

#### <a id="databc">GET /api/v1/data </a>

**Как это выглядит?**

![data1.png](callapi/data1.png)

<a id="datadescription">**Описание**</a>

Этот запрос получает данные для отображения на экране.
Он учитывает параметры пагинации (page, limit), а также условия фильтрации и сортировки.

![data2.png](callapi/data2.png)

На схеме выше показано, как ответ API напрямую соотносится с элементами интерфейса, отображаемыми в списке.
 
#### <a id="metabc">GET /api/v1/row-meta </a>
**Как это выглядит?**

![meta1.png](callapi/meta1.png)

<a id="metadescription">**Описание**</a>
При открытии экрана со списком CXBox автоматически устанавливает курсор на первую запись — это видно по выделенной первой строке.

Ответ с метаданными определяет состояние элементов управления интерфейса, например активные кнопки и редактируемые поля, для первой записи.

(Этот вызов выполняется только для одной записи, чтобы обеспечить корректную работу в соответствии с [основным принципом CXBox](#coreprinciple).
Метаданные запрашиваются для одной записи, а не для всех, из соображений производительности.
Связи родитель-потомок часто содержат сложную логику, и вычисление метаданных для большого количества записей могло бы замедлить отклик интерфейса.)

![meta2.png](callapi/meta2.png)

На схеме показано, как поля соотносятся со своими свойствами, полученными с бэкенда.

* Когда бэкенд передаёт состояние поля с параметром `disabled: true`, фронтенд отображает поле только для чтения (без возможности редактирования).
* Когда параметр равен `disabled: false`, фронтенд отображает поле как редактируемое.

Этот принцип применяется ко всем свойствам, предоставляемым этим API, — каждое свойство, полученное с бэкенда, напрямую определяет, как поле отображается и ведёт себя на клиенте.

#### <a id="countbc">GET /api/v1/count </a>
**Как это выглядит?**

![count1.png](callapi/count1.png)

<a id="countdescription">**Описание**</a>

Метод count возвращает общее количество записей.
Вызов зависит от параметра Pagination — см. [Пагинация](/ru/widget/type/property/pagination/pagination).
Фронтенд использует это значение для отображения информации об общем количестве доступных записей.
 
![count2.png](callapi/count2.png)

Например:
«Показано 5 из 10 записей».

---
### <a id="parentchild"> Загрузка данных: зависимые BC родитель-потомок</a>
Рассмотрим экран с одним виджетом List.

1. Откройте Developer Tools → вкладку Network.
2. Загрузите экран, содержащий BC родитель–потомок.

![parentchild.png](callapi/parentchild.png)

При загрузке экрана видно, что выполняется несколько вызовов API:

```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/data/screen/parent_bc
    Frontend->>Backend: GET /api/v1/row-meta/screen/parent_bc/parent_bc_id
    Frontend->>Backend: GET /api/v1/count/screen/parent_bc
    Frontend->>Backend: GET /api/v1/data/screen/parent_bc/parent_bc_id/child_bc
    Frontend->>Backend: GET /api/v1/row-meta/screen/parent_bc/parent_bc_id/child_bc/child_bc_id
    Frontend->>Backend: GET /api/v1/count/screen/parent_bc/parent_bc_id/child_bc
```

**Родительский виджет**

Для родительского виджета применимо всё, что описано выше, —
выполняются стандартные запросы [data](#databc), [row-meta](#metabc) и [count](#countbc).

**Дочерний виджет**

Для дочернего виджета всё работает так же, за исключением следующих отличий:

* Запросы содержат префиксы родителя/потомка, отражающие иерархию BC.
* Данные дочерней сущности вычисляются только для первой автоматически выбранной записи.

![parentchilddata.png](callapi/parentchilddata.png)

**Общие принципы**

Для всех типов виджетов система всегда выполняет запросы API (/data, /row-meta, /count),
включая поля, использующие popup-виджеты.

`Исключения`: [FormPopup](#formpopup), [уведомления](/ru/features/element/notifications/email/email), filePreview и вызовы [настройки отображаемых колонок](/ru/widget/type/list/list/#customization-of-displayed-columns) — они работают иначе.

!!! info
    Также важно учитывать, как выполняются вызовы **родитель → потомок**.
    Каждая сущность загружается собственным запросом, поэтому пара родитель–потомок даёт **6 отдельных вызовов**.
    Это особенно важно, когда зависимые данные хранятся в одном и том же микросервисе. В таком случае при загрузке страницы один и тот же микросервис будет вызван **дважды** — один раз для родительской сущности и один раз для дочерней.
 

#### GET /api/v1/data 
**Как это выглядит?**

![parentchilddata.png](callapi/parentchilddata.png)

**Описание**
см. [описание](#datadescription)

#### GET /api/v1/row-meta
**Как это выглядит?**

![parentchildrowmeta.png](callapi/parentchildrowmeta.png)

**Описание**

см. [описание](#metadescription)

#### GET /api/v1/count
**Как это выглядит?**

![parentchildcount.png](callapi/parentchildcount.png)

**Описание**
см. [описание](#countdescription)

---

### Редактирование (Force Active) { #edit-force-active }
 
При редактировании данных изменения не отправляются на бэкенд, пока пользователь не нажмёт кнопку «Save».
Однако некоторые поля можно пометить как force-active.
Для таких полей при каждом изменении значения на бэкенд автоматически отправляется запрос, и на фронтенд возвращаются обновлённые значения зависимых полей.
Это полезно, когда значение одного поля зависит от другого.

```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/screen/bc/id
```

#### POST /api/v1/row-meta
**Как это выглядит?**

![fa3.png](callapi/fa3.png)

<a id="fadescription">**Описание**</a>

Рассмотрим пример, в котором поле country помечено как force-active.
Когда пользователь меняет значение этого поля, поля region и street должны обновиться автоматически.

1. Изначально все поля пустые

![fa1.png](callapi/fa1.png)

2. Заполните поле "Country"
   Пользователь выбирает значение в поле Country.
   После выбора значения выполняется запрос метаданных (/api/v1/row-meta).

![fa2.png](callapi/fa2.png)

3. Зависимые поля обновляются
   На бэкенде поля region и street автоматически заполняются на основе выбранной страны,
   и обновлённые значения возвращаются на фронтенд.
 
=== "country"
    ![facountry.png](callapi/facountry.png)
=== "region"
    ![faregion.png](callapi/faregion.png)
=== "street"
    ![fastreet.png](callapi/fastreet.png)

---

### <a id="formpopup">FormPopup </a>
Все типы виджетов следуют описанной выше логике [независимых BC](#independentbcs), [зависимых BC родитель-потомок](#parentchild), за исключением FormPopup.

Причина этого исключения в том, что при открытии [FormPopup](/ru/widget/type/formpopup/formpopup)
он не просто отображает существующие данные — он запускает процесс, аналогичный
изменению активного поля с последующим обновлением зависимых полей.

Это означает, что при открытии popup необходимо получить актуальные row meta,
чтобы отобразить пересчитанные и актуальные поля. Похоже на ForceActive, но с кнопкой.

```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/screen/bc/id
```

#### POST /api/v1/row-meta
**Как это выглядит?**

![formpopup.png](callapi/formpopup.png)

**Описание**

см. [описание](#fadescription)
 
---


### <a id="standartactionapi">Стандартное действие </a>

#### Сохранение (Save) { #save }

```mermaid
sequenceDiagram 
    Frontend->>Backend: PUT /api/v1/data/screen/bc/id
    Frontend->>Backend: GET /api/v1/row-meta/screen/bc/id 
```

![saveactionallcall.png](callapi/saveactionallcall.png)
 
##### PUT /api/v1/data
**Как это выглядит?**

![saveactionalput.png](callapi/saveactionalput.png)

**Описание**

см. [описание](#fadescription)

##### POST /api/v1/row-meta
**Как это выглядит?**

![saveactionalmeta.png](callapi/saveactionalmeta.png)

**Описание**

см. [описание](#fadescription)

<!-- 
вот и кнопки пришли 2 скопа на таблице и на бк
при нажатии кнопочки отправляют сл запрос, могут обновляться данные после нажатия


описываем пост экшены(просто словами - тема др статьи)
-->

---

### <a id="customactionapi">Пользовательское действие (Custom-action) </a>
Нажатие пользовательской кнопки инициирует 3 вызова:

```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/custom-action
    Frontend->>Backend: GET /api/v1/data
    Frontend->>Backend: GET /api/v1/row-meta
```
 
#### GET /api/v1/custom-action
**Как это выглядит?**
![custombutton.png](callapi/custombutton.png)

![custombuttonu4.png](callapi/custombuttonu4.png)

#### GET /api/v1/data
**Как это выглядит?**

![dataaction.png](callapi/dataaction.png)

**Описание**
см. [описание](#datadescription)

#### GET /api/v1/row-meta
**Как это выглядит?**

![metaaction.png](callapi/metaaction.png)

**Описание**

см. [описание](#metadescription)
 
 
 
