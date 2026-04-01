# Role-based meta settings

These settings control where view and action permissions are loaded from: JSON meta files or database tables managed through administration UI.

Source in core: `MetaConfigurationProperties` (`cxbox.meta.*`).

## Parameters

### `cxbox.meta.view-allowed-roles-enabled`

Default: `false`

- `true` - view permissions are read from `*.view.json` (`rolesAllowed`).
- `false` - view permissions are read from DB (responsibilities) and can be managed in UI.

Use `false` for production role model with data migration between environments.

### `cxbox.meta.widget-action-groups-enabled`

Default: `true`

- `true` - action visibility is taken from `*.widget.json` (`actionGroups`).
- `false` - action visibility is taken from DB (`responsibilities_action`) and can be managed in UI.

Migration note:
- with `true`, application can prefill `responsibilities_action` from `widget.json -> actionGroups -> include`;
- `exclude` is not migrated automatically and should be migrated manually.

### `cxbox.meta.widget-action-groups-compact`

Default: `true`

Works when `widget-action-groups-enabled: true` during migration prefill.

- `true` - compact fill mode (`*` means all roles/all views), fewer rows.
- `false` - full fill mode, separate row per role and view.

## Recommended combinations

### 1) Legacy JSON mode

```yaml
cxbox:
  meta:
    view-allowed-roles-enabled: true
    widget-action-groups-enabled: true
    widget-action-groups-compact: true
```

Use when permissions are fully managed in `view.json` and `widget.json`.

### 2) DB/UI role model mode (recommended)

```yaml
cxbox:
  meta:
    view-allowed-roles-enabled: false
    widget-action-groups-enabled: false
    widget-action-groups-compact: true
```

Use when permissions are managed through Administration UI and migrated via CSV/Liquibase.

### 3) Transitional migration mode

```yaml
cxbox:
  meta:
    view-allowed-roles-enabled: false
    widget-action-groups-enabled: true
    widget-action-groups-compact: true
```

Use to prefill action responsibilities from JSON first, then switch `widget-action-groups-enabled` to `false`.

## Example from `cxbox-demo`

```yaml
cxbox:
  meta:
    view-allowed-roles-enabled: false
    widget-action-groups-enabled: true
    widget-action-groups-compact: true
```

This configuration means:
- view permissions are already DB-driven;
- action permissions are still JSON-driven;
- compact migration format is enabled for action responsibilities prefill.
