# Работа с DAO { #work-with-dao }

<!-- 
## Действия пользователя { #user-actions }

* [Открытие экрана](#openlistscreen)
* [CRUD-операции](#crudoperations)
* [Клик ...](#click)
* [Force Active](#forceactive)
* [открытие Assoc](#openPopup)
* [открытие Popup](#openPopup)
* [открытие Form Popup](#openformpopup)
* пагинация =  [Открытие экрана со списком](#openlistscreen) со следующей страницей
* пользовательское действие (Post api/v1/custom-action)
* обновление экрана = [Открытие экрана со списком](#openlistscreen)
* родитель-потомок
* условие отображения
-->

GET

count (только для пагинации: default, nextAndPreviousWithCount)

| Операция              | `/row-meta`      | `/row-meta-new` | `/row-meta/id` | `/data/` |`/count` |
|-----------------------|------------------|-----------------|----------------|--------------|-------------|
| Открытие экрана       | ✅<br/>без записей | ❌             | ✅            | ✅           | ✅          |
| Создание              | ❌                | ✅             | ❌             | ❌          | ❌          |
| Сохранение            | ❌                | ❌             | ✅             | ❌          | ❌          |
| Удаление              | ✅<br/>без записей | ❌             | ✅             | ✅          | ❌          |
| Клик ..               | ✅                | ❌             | ❌             | ❌          | ❌          |
| Открытие Assoc,<br/>Popup | ✅                | ❌             | ❌             | ✅          | ✅          |
| Открытие Form Popup   | ❌                | ❌             | ❌             | ❌          | ❌          |
| Force Active          | ❌                | ❌             | ❌             | ❌          | ❌          |

Прочее

    
| Операция              | POST <br/>`/row-meta/id` | PUT <br/>`/data/id` | DELETE <br/>`/data/id` |
|-----------------------|---------------------|---------------|------------------|
| Открытие экрана       | ❌                  | ❌            | ❌            |
| Создание              | ❌                  | ❌            | ❌            |
| Сохранение            | ❌                  | ✅            | ❌            |
| Удаление              | ❌                  | ❌            | ✅            |
| Клик ..               | ❌                  | ❌            | ❌            |
| Открытие Assoc,<br/>Popup | ❌                  | ❌            | ❌            |
| Открытие Form Popup   | ✅                  | ❌            | ❌            |
| Force Active          | ✅                  | ❌            | ❌            |




### <a id="openlistscreen">Открытие экрана</a>

[:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·


`/row-meta/id`

Для списка берётся `id` первой записи, потому что курсор на бэкенде устанавливается на первую запись и для неё доступны операции, требующие rowMeta.

`/row-meta/`

Если записей нет, метод вызывается без ID.

`/count/`

Вызывается только в режимах пагинации nextAndPreviousWithCount или Default
 

```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/data/ 
    Frontend->>Backend: GET /api/v1/row-meta (only if no records)
    Frontend->>Backend: GET /api/v1/row-meta/id
    Frontend->>Backend: GET /api/v1/count (Only for pagination: default, nextAndPreviousWithCount)
```


#### API -> DAO

![open_screen_backend.png](api/open_screen_backend.png)


### <a id="crudoperations">CRUD-операции</a>

#### Создание { #create }
**Действия пользователя:** Create

**Процесс:**
```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/row-meta-new 
```

**Используемые методы:**

- `getId()` (с использованием FirstLevelCache)
- `setId()` (с использованием FirstLevelCache)

**Рекомендация:** используйте стандартный механизм CXBOX для хранения записей и вызова внешних систем.

##### API -> DAO
![createactiondev.png](api/createactiondev.png)

#### Сохранение (Save) { #save }
**Действия пользователя:** Save

**Процесс:**
```mermaid
sequenceDiagram
    Frontend->>Backend: PUT /api/v1/data/id
    Frontend->>Backend: GET /api/v1/row-meta/id
``` 

**Используемые методы:**

Frontend->>Backend: PUT /api/v1/data/id

- `getId()` (с использованием FirstLevelCache)
- `setId()` (с использованием FirstLevelCache)
- `getId()` (с использованием FirstLevelCache)
- `create()` 
- `update()` 

Frontend->>Backend: GET /api/v1/row-meta/id

- `getByIdIgnoringFirstLevelCache()`

##### API -> DAO

=== "сохранение после создания"
    ![saveaftercreateactiondev.png](api/saveaftercreateactiondev.png)
=== "сохранение"
    ![saveactiondev.png](api/saveactiondev.png)

#### Удаление { #delete }

**Действия пользователя:** Delete

**Процесс:**
```mermaid
sequenceDiagram
    Frontend->>Backend: DELETE /api/v1/data/id
    Frontend->>Backend: GET /api/v1/data/
    Frontend->>Backend: GET /api/v1/row-meta (only if no records)
    Frontend->>Backend: GET /api/v1/row-meta/id
```

**Используемые методы:**

Frontend->>Backend: DELETE /api/v1/data/id

- `delete()`
- `getList()`
- `getByIdIgnoringFirstLevelCache()`

##### API -> DAO
![deleteactiondev.png](api/deleteactiondev.png)


<!-- 
### <a id="click">Клик ...</a>
![click.png](api/click.png)

**Действия пользователя:** нажатие "…"

**Процесс:**
```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/row-meta/id
```

#### API -> DAO

### <a id="forceactive">Force Activate</a>

**Процесс:**
```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/id
```

### <a id="openformpopup">Открытие FormPopup</a>

**Процесс:**
```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/id
```

### <a id="openPopup">Открытие Popup, Assoc</a>
![openpopup.png](api/openpopup.png)

**Процесс:**
```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/id
```

 

 

| Эндпоинт           | Открытие экрана  | create | save | delete           | click .. | open Assoc,<br/> popup |
|--------------------|------------------|--------|------|------------------|----------|----------------------|
| GET `/count`       | ✅                |       |      |                  |          |✅                  |
| GET `/row-meta`    | ✅<br/>без записей |       |      | ✅<br/>без записей |   ✅    |✅                  |
| GET `/row-meta-new`|                  | ✅     |      |                  |          |                      |
| GET `/row-meta/id` | ✅                |       | ✅   | ✅               |          |                      |
| GET `/data/`       | ✅                |       |      | ✅               |          |✅                     |
| PUT `/data/id`     |                  |        | ✅   |                  |          |                      |
| DELETE `/data/id`  |                  |        |      | ✅               |          |                      |



Все

| Операция              | GET<br/> `/row-meta` | GET <br/>`/row-meta-new` | GET <br/>`/row-meta/id` | POST <br/>`/row-meta/id` | GET <br/>`/data/` | PUT <br/>`/data/id` | DELETE <br/>`/data/id` | GET <br/>`/count` |
|-----------------------|-------------------|--------------------------|-------------------|--------------------|--------------|---------------|------------------|--------------|
| Открытие экрана       | ✅<br/>без записей  | ❌                 |✅                |                    | ✅           |               |                  | ✅           |
| Создание              | ❌                 | ✅                 |                   |                    |              |               |                  |              |
| Сохранение            | ❌                 | ❌                 | ✅                |                    |              | ✅            |                  |              |
| Удаление              | ✅<br/>без записей  | ❌                 | ✅                |                    | ✅           |               | ✅               |              |
| Клик ..               | ❌                 | ❌                 | ✅                 |                    |              |               |                  |              |
| Открытие Assoc,<br/>Popup | ✅ <br/>без записей | ❌                 | ✅                 |                    | ✅           |               |                  | ✅           |
| Открытие Form Popup   | ❌                 | ❌                 |                   | ✅                  |              |               |                  |              |
| Force Active          | ❌                 | ❌                 |                   | ✅                 |              |               |                  |              |

-->