# Frontend - Backend Interaction 

CXBox provides a standardized and unified API mechanism for frontend–backend communication.
Developers don’t need to design or maintain custom APIs — all data operations (read, update, delete, metadata retrieval, and custom actions) are handled by built-in endpoints.
This approach simplifies development, improves consistency, and reduces integration errors.

The platform includes a universal interaction mechanism that works equally well for forms, tables, and other widgets. This means that when you change the widget type, the underlying logic remains correct - everything continues to function without requiring additional API configuration.

In this article, we'll examine how this mechanism is structured and explore the fundamental API methods that make it work.


This page provides an understanding of the correspondence between UI elements and REST calls.

A backend call can be routed to either any source or version and is processed as follows: 

* VersionAwareResponseService
* [AnySourceVersionAwareResponseService](/features/element/microservices/microservices_users_action)

---

## API Structure

Interaction between the frontend and backend in CXBox is built on four types of APIs:

* [/data](#data)
* [/row-meta/](#rowmeta)
* [/custom-action](#customaction)
* [/count](#count)

The API is structured as follows:

* [independent entities](#independentbcs):  `.../screen/bc` or `.../screen/bc/id` 
* [for dependent parent-child relationships](#parentchild):  `.../screen/parent_bc/id/child_bc` or `screen/parent_bc/id/child_bc/id`
 
Example:

![meta.png](callapi/meta.png)

### <a id="data">/data</a>

| Method  | Endpoint             | Description                   |
|:--------|:---------------------|:-------------------------------|
| GET     | /api/v1/data/        | Get list of records            |
| GET     | /api/v1/data/id      | Get specific record data       |
| PUT     | /api/v1/data/id      | Update record                  |
| DELETE  | /api/v1/data/id      | Delete record                  |

---
### <a id="rowmeta">/row-meta</a>

Metadata describes which fields are enabled, which buttons are visible, and so on.

| Method | Endpoint              | Description                            |
|:-------|:----------------------|:---------------------------------------|
| GET    | /api/v1/row-meta      | Get general metadata                   |
| GET    | /api/v1/row-meta/id   | Get metadata for a specific record     |
| GET    | /api/v1/row-meta-new  | Get metadata for creating new record   |

---

### <a id="customaction">/custom-action</a>

| Method | Endpoint                | Description                  |
|:-------|:------------------------|:------------------------------|
| POST   | /api/v1/custom-action   | Trigger a custom action       |

---

### <a id="count">/count</a>

| Method | Endpoint         | Description                |
|:-------|:-----------------|:----------------------------|
| GET    | /api/v1/count    | Get total record count      |

---

## <a id="coreprinciple">CXBOX Core Principle</a>

All widgets work under the same logic.(except for [FormPopup](#formpopup))
This ensures that switching from one widget type to another does not disrupt the API functionality.
 
## Examples
### <a id="independentbcs"> Data Loading: independent BCs</a> 
Let’s consider a screen with a single List widget.

1. Open the Developer Tools → Network tab.
2. Load the screen containing the list. 

![3api.png](callapi/3api.png)

We can see that three API calls are executed.

```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/data/screen/bc
    Frontend->>Backend: GET /api/v1/row-meta/screen/bc/id
    Frontend->>Backend: GET /api/v1/count/screen/bc
```

#### <a id="databc">GET /api/v1/data </a>

**How does it look?**

![data1.png](callapi/data1.png)

<a id="datadescription">**Description**</a>

This request retrieves the data to be displayed on the screen.
It respects pagination parameters (page, limit), as well as filtering and sorting conditions.

![data2.png](callapi/data2.png)

The diagram above shows how the API response directly maps to the UI elements displayed in the list.
 
#### <a id="metabc">GET /api/v1/row-meta </a>
**How does it look?**

![meta1.png](callapi/meta1.png)

<a id="metadescription">**Description**</a>
When the list screen opens, CXBox automatically places the cursor on the first record — you can see this as the highlighted first row.

The metadata response defines the state of the user interface controls, such as active buttons and editable fields, for the first record.

(This call is made for only a single record to ensure proper operation in accordance with the [CXBox Core Principle](#coreprinciple).
We fetch metadata for a single record rather than all records for performance reasons.
Parent-child relationships often involve complex logic, and calculating metadata for a large number of records could lead to slow UI response times.)

![meta2.png](callapi/meta2.png)

The diagram illustrates how fields correspond to their properties received from the backend.

* When the backend sends a field state with the parameter `disabled: true`, the frontend displays the field as read-only (not editable).
* When the parameter is `disabled: false`, the frontend displays the field as editable.

This principle applies to all properties provided by this API — each property received from the backend directly determines how the field is displayed and behaves on the client side.

#### <a id="countbc">GET /api/v1/count </a>
**How does it look?**

![count1.png](callapi/count1.png)

<a id="countdescription">**Description**</a>

The count method returns the total number of records.
The call depends on the Pagination parameter — see  [Pagination](/widget/type/property/pagination/pagination).
The frontend uses this value to display information about the total number of available records.
 
![count2.png](callapi/count2.png)

For example:
“Showing 5 out of 10 records.”

---
### <a id="parentchild"> Data Loading: dependent parent-child BCs</a>
Let’s consider a screen with a single List widget.

1. Open the Developer Tools → Network tab.
2. Load the screen containing parent–child BCs.

![parentchild.png](callapi/parentchild.png)

When the screen loads, you can see that several API calls are executed:

```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/data/screen/parent_bc
    Frontend->>Backend: GET /api/v1/row-meta/screen/parent_bc/parent_bc_id
    Frontend->>Backend: GET /api/v1/count/screen/parent_bc
    Frontend->>Backend: GET /api/v1/data/screen/parent_bc/parent_bc_id/child_bc
    Frontend->>Backend: GET /api/v1/row-meta/screen/parent_bc/parent_bc_id/child_bc/child_bc_id
    Frontend->>Backend: GET /api/v1/count/screen/parent_bc/parent_bc_id/child_bc
```

**Parent Widget**

For the parent widget, everything described above applies —
standard [data](#databc), [row-meta](#metabc), and [count](#countbc) requests are executed.

**Child Widget**

For the child widget, everything works the same way, except for the following differences:

* The requests include parent/child prefixes, reflecting the BC hierarchy.
* Data for the child entity is calculated only for the first automatically selected record.

![parentchilddata.png](callapi/parentchilddata.png)

**General Principles**

For all widget types, the system always performs API requests (/data, /row-meta, /count),
including fields that use popup widgets.

`Exceptions`: [FormPopup](#formpopup), [notifications](/features/element/notifications/email/email), filePreview, and [customization of displayed columns](/widget/type/list/list/#customization-of-displayed-columns) calls — these behave differently.

!!! info
    It is also important to consider how the **parent → child** calls are executed.
    Each entity is loaded through its own request, so a parent–child pair results in **6 separate calls**.    
    This matters especially when dependent data is stored in the same microservice. In such cases, the same microservice will be called **twice** during page loading — once for the parent entity and once for the child.
 

#### GET /api/v1/data 
**How does it look?**

![parentchilddata.png](callapi/parentchilddata.png)

**Description**
see  [description](#datadescription)

#### GET /api/v1/row-meta
**How does it look?**

![parentchildrowmeta.png](callapi/parentchildrowmeta.png)

**Description**

see  [description](#metadescription)

#### GET /api/v1/count
**How does it look?**

![parentchildcount.png](callapi/parentchildcount.png)

**Description**
see  [description](#countdescription)

---

### Edit (Force Active)
 
When editing data, any changes are not sent to the backend until the user clicks the “Save” button.
However, some fields can be marked as force-active.
For such fields, every time their value changes, a request is automatically sent to the backend, and the updated values of dependent fields are returned to the frontend.
This is useful when the value of one field depends on another.

```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/screen/bc/id
```

#### POST /api/v1/row-meta
**How does it look?**

![fa3.png](callapi/fa3.png)

<a id="fadescription">**Description**</a>

Let’s look at an example where the country field is marked as force-active.
When the user changes the value of this field, the region and street fields should be automatically updated.

1. All fields are initially empty

![fa1.png](callapi/fa1.png)

2. Fill in the "Country" field
   The user selects a value in the Country field.
   After the value is selected, a meta request (/api/v1/row-meta) is triggered.

![fa2.png](callapi/fa2.png)

3. Dependent fields are updated
   On the backend, the region and street fields are automatically filled based on the selected country,
   and the updated values are returned to the frontend.
 
=== "country"
    ![facountry.png](callapi/facountry.png)
=== "region"
    ![faregion.png](callapi/faregion.png)
=== "street"
    ![fastreet.png](callapi/fastreet.png)

---

### <a id="formpopup">FormPopup </a>
All widget types follow the described logic above [Independent BCs](#independentbcs),[dependent parent-child BCs](#parentchild), except for FormPopup.

The reason for this exception is that when a [FormPopup](/widget/type/formpopup) is opened,
it doesn’t just display existing data — it triggers a process similar to
changing the active field and then updating its dependent fields.

This means that when the popup is opened, we must fetch the latest row meta
to ensure that recalculated and up-to-date fields are displayed. Like ForceActive but with button.

```mermaid
sequenceDiagram
    Frontend->>Backend: POST /api/v1/row-meta/screen/bc/id
```

#### POST /api/v1/row-meta
**How does it look?**

![formpopup.png](callapi/formpopup.png)

**Description**

see  [description](#fadescription)
 
---


### <a id="standartactionapi">Standart action </a>

#### Save

```mermaid
sequenceDiagram 
    Frontend->>Backend: PUT /api/v1/data/screen/bc/id
    Frontend->>Backend: GET /api/v1/row-meta/screen/bc/id 
```

![saveactionallcall.png](callapi/saveactionallcall.png)
 
##### PUT /api/v1/data
**How does it look?**

![saveactionalput.png](callapi/saveactionalput.png)

**Description**

see  [description](#fadescription)

##### POST /api/v1/row-meta
**How does it look?**

![saveactionalmeta.png](callapi/saveactionalmeta.png)

**Description**

see  [description](#fadescription)

<!-- 
вот и кнопки пришли 2 скопа на таблице и на бк
при нажатии кнопочки отправляют сл запрос, могут обновляться данные после нажатия


описываем пост экшены(просто словами - тема др статьи)
-->

---

### <a id="customactionapi">Custom-action </a>
Clicking the custom button triggers 3 calls:

```mermaid
sequenceDiagram
    Frontend->>Backend: GET /api/v1/custom-action
    Frontend->>Backend: GET /api/v1/data
    Frontend->>Backend: GET /api/v1/row-meta
```
 
#### GET /api/v1/custom-action
**How does it look?**
![custombutton.png](callapi/custombutton.png)

![custombuttonu4.png](callapi/custombuttonu4.png)

#### GET /api/v1/data
**How does it look?**

![dataaction.png](callapi/dataaction.png)

**Description**
see  [description](#datadescription)

#### GET /api/v1/row-meta
**How does it look?**

![metaaction.png](callapi/metaaction.png)

**Description**

see  [description](#metadescription)
 
 
 
