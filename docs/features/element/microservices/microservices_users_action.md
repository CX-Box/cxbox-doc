# Work with DAO

<!-- 
## User Actions

* [Opening Screen](#openlistscreen)
* [CRUD Operations](#crudoperations)
* [Click ...](#click)
* [Force Active](#forceactive)
* [open Assoc](#openPopup)
* [open Popup](#openPopup)
* [open Form Popup](#openformpopup)
* pagination =  [Opening List Screen](#openlistscreen) with Nextpage
* custom Action (Post api/v1/custom-action)
* refresh screen = [Opening List Screen](#openlistscreen)
* parent child
* show condition
-->

GET

count (Only for pagination: default, nextAndPreviousWithCount)

| Operation             | `/row-meta`      | `/row-meta-new` | `/row-meta/id` | `/data/` |`/count` |
|-----------------------|------------------|-----------------|----------------|--------------|-------------|
| Open Screen           | ✅<br/>no records | ❌             | ✅            | ✅           | ✅          |
| Create                | ❌                | ✅             | ❌             | ❌          | ❌          |
| Save                  | ❌                | ❌             | ✅             | ❌          | ❌          |
| Delete                | ✅<br/>no records | ❌             | ✅             | ✅          | ❌          |
| Click ..              | ✅                | ❌             | ❌             | ❌          | ❌          |
| Open Assoc,<br/>Popup | ✅                | ❌             | ❌             | ✅          | ✅          |
| Open Form Popup       | ❌                | ❌             | ❌             | ❌          | ❌          |
| Force Active          | ❌                | ❌             | ❌             | ❌          | ❌          |

Other

    
| Operation             | POST <br/>`/row-meta/id` | PUT <br/>`/data/id` | DELETE <br/>`/data/id` |
|-----------------------|---------------------|---------------|------------------|
| Open Screen           | ❌                  | ❌            | ❌            |
| Create                | ❌                  | ❌            | ❌            |
| Save                  | ❌                  | ✅            | ❌            |
| Delete                | ❌                  | ❌            | ✅            |
| Click ..              | ❌                  | ❌            | ❌            |
| Open Assoc,<br/>Popup | ❌                  | ❌            | ❌            |
| Open Form Popup       | ✅                  | ❌            | ❌            |
| Force Active          | ✅                  | ❌            | ❌            |




### <a id="openlistscreen">Opening Screen</a>

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·


`/row-meta/id`

For the list, the `id` of the first record is taken because the cursor is set on the first record in the backend, and operations are available for it, which require rowMeta.

`/row-meta/`

If there are no records, the method is called without an ID.

`/count/`

Only invoked when Pagination modes are: nextAndPreviousWithCount or Default
 

```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/data/ 
    Frontend->>Backend: GET /api/v1/row-meta (only if no records)
    Frontend->>Backend: GET /api/v1/row-meta/id
    Frontend->>Backend: GET /api/v1/count (Only for pagination: default, nextAndPreviousWithCount)
```


#### API -> DAO

![open_screen_backend.png](api/open_screen_backend.png)


### <a id="crudoperations">CRUD Operations</a>

#### Create
**User actions:** Create

**Process:**
```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/row-meta-new 
```

**Used methods:**

- `getId()` (using FirstLevelCache)
- `setId()` (using FirstLevelCache)

**Recommendation:** Use standard CXBOX mechanism for record storage and calling external systems.

##### API -> DAO
![createactiondev.png](api/createactiondev.png)

#### Save
**User actions:** Save 

**Process:**
```mermaid
sequenceDiagram
    Frontend->>Backend: PUT /api/v1/data/id
    Frontend->>Backend: GET /api/v1/row-meta/id
``` 

**Used methods:**

Frontend->>Backend: PUT /api/v1/data/id

- `getId()` (using FirstLevelCache)
- `setId()` (using FirstLevelCache)
- `getId()` (using FirstLevelCache)
- `create()` 
- `update()` 

Frontend->>Backend: GET /api/v1/row-meta/id

- `getByIdIgnoringFirstLevelCache()`

##### API -> DAO

=== "save after create"
    ![saveaftercreateactiondev.png](api/saveaftercreateactiondev.png)
=== "save"
    ![saveactiondev.png](api/saveactiondev.png)

#### Delete 

**User actions:** Delete

**Process:**
```mermaid
sequenceDiagram
    Frontend->>Backend: DELETE /api/v1/data/id
    Frontend->>Backend: GET /api/v1/data/
    Frontend->>Backend: GET /api/v1/row-meta (only if no records)
    Frontend->>Backend: GET /api/v1/row-meta/id
```

**Used methods:**

Frontend->>Backend: DELETE /api/v1/data/id

- `delete()`
- `getList()`
- `getByIdIgnoringFirstLevelCache()`

##### API -> DAO
![deleteactiondev.png](api/deleteactiondev.png)


<!-- 
### <a id="click">Click ...</a>
![click.png](api/click.png)

**User actions:** Clicking "…"

**Process:**
```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/row-meta/id
```

#### API -> DAO

### <a id="forceactive">Force Activate</a>

**Process:**
```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/id
```

### <a id="openformpopup">Open FormPopup</a>

**Process:**
```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/id
```

### <a id="openPopup">Open Popup, Assoc</a>
![openpopup.png](api/openpopup.png)

**Process:**
```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/id
```

 

 

| Endpoint           | Open Screen      | create | save | delete           | click .. | open Assoc,<br/> popup |
|--------------------|------------------|--------|------|------------------|----------|----------------------|
| GET `/count`       | ✅                |       |      |                  |          |✅                  |
| GET `/row-meta`    | ✅<br/>no records |       |      | ✅<br/>no records |   ✅    |✅                  |
| GET `/row-meta-new`|                  | ✅     |      |                  |          |                      |
| GET `/row-meta/id` | ✅                |       | ✅   | ✅               |          |                      |
| GET `/data/`       | ✅                |       |      | ✅               |          |✅                     |
| PUT `/data/id`     |                  |        | ✅   |                  |          |                      |
| DELETE `/data/id`  |                  |        |      | ✅               |          |                      |



All

| Operation             | GET<br/> `/row-meta` | GET <br/>`/row-meta-new` | GET <br/>`/row-meta/id` | POST <br/>`/row-meta/id` | GET <br/>`/data/` | PUT <br/>`/data/id` | DELETE <br/>`/data/id` | GET <br/>`/count` |
|-----------------------|-------------------|--------------------------|-------------------|--------------------|--------------|---------------|------------------|--------------|
| Open Screen           | ✅<br/>no records  | ❌                 |✅                |                    | ✅           |               |                  | ✅           |
| Create                | ❌                 | ✅                 |                   |                    |              |               |                  |              |
| Save                  | ❌                 | ❌                 | ✅                |                    |              | ✅            |                  |              |
| Delete                | ✅<br/>no records  | ❌                 | ✅                |                    | ✅           |               | ✅               |              |
| Click ..              | ❌                 | ❌                 | ✅                 |                    |              |               |                  |              |
| Open Assoc,<br/>Popup | ✅ <br/>no records | ❌                 | ✅                 |                    | ✅           |               |                  | ✅           |
| Open Form Popup       | ❌                 | ❌                 |                   | ✅                  |              |               |                  |              |
| Force Active          | ❌                 | ❌                 |                   | ✅                 |              |               |                  |              |

-->