# Role loading (Views and Actions)
This article explains how CXBOX determines:

- which **views** a user can open
- which **actions** are visible/available in widgets
 
## Role loading Views
### Basic
Views visible for user can depend on user roles.

In CXBOX there are 3 permission layers that are often managed separately:

- **View access**: who can open a view (screen navigation item).
- **Widget actions**: which buttons/actions are visible for a role in a widget.
- **Ограничение доступности на уровне сервиса**


Allowed View-Role pairs are always taken from table **responsibilities**(internal_role, responsibilites, ...)

!!! warning
    But one must always avoid loading this pairs by hand.

CXBOX can load these permissions from:

- **Meta JSON files** (`*.view.json`, `*.widget.json`)
- **Vanilla migrated via CSV/Liquibase** (managed via Administration UI)

### настройка выгрузки респонсибилити в интерфейе
создание экрана с респами

### Meta JSON files

Always prefer  when possible due to better plugin support and faster development speed.

В данном режиме загрузка  респосибилити происходит автоматически собирая данные из 
  *view.json->rollesAllowed tags

#### Examples

Требуется вывести экран для роли CXbox пользователь с вью

How does it look?

How to add?
    Step 1 выствить параметр в application.yml

    сxbox.meta.view-allowed-roles-enabled = true

    Step 2 in file .view.json add tag  `rolesAllowed`
    ```{
      "name": "myexamplelist",
      "title": "My example List",
      "url": "/screen/myexample/view/myexamplelist",
      "template": "DashboardView",
      "widgets": [
        {
          "widgetName": "SecondLevelMenu",
          "position": 0,
          "gridWidth": 24
        },
        {
          "widgetName": "MyExampleList",
          "position": 20,
          "gridWidth": 12
        }
      ],
      "rolesAllowed": [
        "CXBOX_USER"
      ]
    }```
    Step 3 Refresh Meta or Start application
    Step 4 Go to  table responsibility - watch 
    id,internal_role_cd,responsibilities,resp_type
    1100441,CXBOX_USER,myexample82list,VIEW



### Vanilla migrated via CSV/Liquibase

2) auto load from standartized RESPONSIBILITIES.csv with liquibase(viewAllowedRolesEnabled = false (default)

Start project

Production support
* Recommendations:
*  Always prefer viewAllowedRolesEnabled = true when possible due to better plugin support and faster development speed.
* Use viewAllowedRolesEnabled = false only when responsibilities table edit through admin UI is required in your project.
* During local development still to use viewAllowedRolesEnabled = true,
* then export the RESPONSIBILITIES.csv using /view/responsibilitiesAdmin (Export button)
* and set viewAllowedRolesEnabled = false before commit

Security: restrict access to screens and actions based on responsibilities.
Separation of duties: different user groups see only what they need.
   
 
CXBOX can load these permissions from:

- **Meta JSON files** (`*.view.json`, `*.widget.json`)
- **Vanilla migrated via CSV/Liquibase** (managed via Administration UI)

## Pre-setup (roles in your project)

Before you configure permission loading, make sure your project has a clear role model:

- **Authentication provider**: Basic auth / Keycloak / custom.
- **Role names**: stable role codes (e.g. `CXBOX_USER`, `ADMIN`, etc.).
- **Role assignment**: how roles are attached to a user at login.

If you use Keycloak, start here: [Keycloak Authorization](/features/element/authorization/keycloak/keycloakauthorization/)

## View access loading

### JSON mode (`rolesAllowed` in `*.view.json`)

When `cxbox.meta.view-allowed-roles-enabled=true`, CXBOX takes allowed roles from view meta:

- Each `*.view.json` may contain `rolesAllowed: [ ... ]`
- Access is defined in code repository and deployed together with the application

Good for simple setups and when you prefer permissions as code.

### DB/UI mode (Responsibilities)

When `cxbox.meta.view-allowed-roles-enabled=false`, CXBOX takes view permissions from DB (Responsibilities).

In `cxbox-demo` this is represented by entity `Responsibilities` of type `VIEW`, where:

- `INTERNAL_ROLE_CD` is a role code (for example, from `InternalRole` dictionary)
- `RESPONSIBILITIES` is a view name

Administration UI typically provides:

- assigning views to roles
- exporting responsibilities to `RESPONSIBILITIES.csv`
- clearing meta cache after changes

## Widget actions loading

### JSON mode (`actionGroups` in `*.widget.json`)

When `cxbox.meta.widget-action-groups-enabled=true`, action visibility is loaded from widget meta:

- `*.widget.json -> actionGroups -> include/exclude`

### DB/UI mode (Responsibilities Action)

When `cxbox.meta.widget-action-groups-enabled=false`, action visibility is loaded from DB
(commonly a table like `responsibilities_action`) and can be managed through UI and migrations.

This mode is recommended when you need:

- environment-to-environment migration of permissions
- runtime updates without rebuilding meta JSON files

## Basic loading during release (recommended workflow)

This section describes a typical release workflow to make role loading predictable for users and DevOps.

### Option A: Permissions as code (JSON-driven)

Use when you want permissions to be shipped with meta JSON:

```yaml
cxbox:
  meta:
    view-allowed-roles-enabled: true
    widget-action-groups-enabled: true
    widget-action-groups-compact: true
```

Release steps:

1. Update `rolesAllowed` in `*.view.json` and `actionGroups` in `*.widget.json`.
2. Deploy the new application build.
3. Restart the application (meta reload as per your setup).

### Option B: Permissions via DB/UI (Responsibilities-driven)

Use when you want permissions to be migrated and adjusted via UI:

```yaml
cxbox:
  meta:
    view-allowed-roles-enabled: false
    widget-action-groups-enabled: false
    widget-action-groups-compact: true
```

Release steps:

1. Prepare migration content (CSV/Liquibase) for Responsibilities tables.
2. Deploy and run DB migrations.
3. Restart the application (or clear meta cache from Administration UI if applicable).
4. Validate: login as a user with each role and confirm navigation + actions are correct.

### Option C: Transitional mode (migrate actions from JSON first)

Use when you are moving action permissions from JSON to DB:

```yaml
cxbox:
  meta:
    view-allowed-roles-enabled: false
    widget-action-groups-enabled: true
    widget-action-groups-compact: true
```

Then switch `widget-action-groups-enabled` to `false` after you have prefilled/migrated action responsibilities.

## Configuration parameters reference

These parameters are defined in core in `MetaConfigurationProperties` (`cxbox.meta.*`):

- `cxbox.meta.view-allowed-roles-enabled` (default `false`)
- `cxbox.meta.widget-action-groups-enabled` (default `true`)
- `cxbox.meta.widget-action-groups-compact` (default `true`)

Detailed description: [Role-based meta settings](/features/element/authorization/rolebasedmetasettings/)