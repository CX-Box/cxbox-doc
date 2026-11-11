# SIEM: security event logging
(since [release 2.0.3](https://doc.cxbox.org/new/version203/))

CXBOX Demo writes security events to the application log, so that a SIEM system (Security Information and Event Management) can collect them.
Every event is one line that starts with `SIEM event.`: who did what, with which business component (BC), from which session and IP address, and with what data.

Events are only written to the log. They are not saved to the database, there are no tables, Liquibase changes or screens for them.
The SIEM agent (or the log collector of your infrastructure) reads the log and sends the events to SIEM.

## How does it look?
![siem.gif](../../../new/v2.0.3/siem.gif)

Examples of log lines:

=== "Login"
    ```
    INFO o.d.c.c.extension.siem.SecurityLogger : SIEM event. Operation: login, endpoint (resource): /login, user: DEMO (CXBOX_USER,BUSINESS_ADMIN), session: F2DBA42C1BAED2599339101D5FA3280F, ipAddress: 0:0:0:0:0:0:0:1, data: 1100057
    ```

=== "Invoke"
    ```
    INFO o.d.c.c.extension.siem.SecurityLogger : SIEM event. Operation: INVOKE.sendEmailNextDay, endpoint (resource): meeting (1100062), user: DEMO (CXBOX_USER,BUSINESS_ADMIN), session: F2DBA42C1BAED2599339101D5FA3280F, ipAddress: 0:0:0:0:0:0:0:1, data: null
    ```

=== "Change of responsibilities (WARN)"
    ```
    WARN o.d.c.c.extension.siem.SecurityLogger : SIEM event. Operation: UPDATE, endpoint (resource): responsibilities (1100342), user: DEMO (CXBOX_USER,BUSINESS_ADMIN), session: F2DBA42C1BAED2599339101D5FA3280F, ipAddress: 0:0:0:0:0:0:0:1, data: {"id":"1100342","vstamp":1,"internalRoleCD":"BUSINESS_ADMIN","view":"meetingview", ...}
    ```

## How to add?
??? Example
    Step 1. Copy the package [org.demo.conf.cxbox.extension.siem](https://github.com/CX-Box/cxbox-demo/tree/main/src/main/java/org/demo/conf/cxbox/extension/siem) from CXBOX Demo to your project: `SecurityLogger`, `SiemCrudmaEventListener`, `SiemLoginEventListener`.

    Step 2. Change `SIEM_CONFIG_LOG_LEVEL_WARN` in `SiemCrudmaEventListener`: specify the BC of your project which changes should be logged with `WARN` level.

    Step 3. To log login, publish `LoginEvent` after login, as it is done in `LoginServiceImpl` of CXBOX Demo:
    ```java
    try {
        // ... build LoggedUser
        return result;
    } catch (Exception ex) {
        exception = ex;
        throw ex;
    } finally {
        eventPublisher.publishEvent(new LoginEvent<>(this, result, exception));
    }
    ```

    Step 4. Configure your log collector to send to SIEM the lines of the logger `SecurityLogger` (they start with `SIEM event.`).

    !!! warning
        With `SIEM_CONFIG_LOG_DATA_ID_ONLY = false` the log contains the full data of the records, including personal data. Use `true`, if the log must not contain it.

## Event format

```
SIEM event. Operation: <operation>, endpoint (resource): <endpoint>, user: <user> (<roles>), session: <session>, ipAddress: <ip>, data: <data>
```

| Part | What is written |
|------|-----------------|
| `Operation` | CRUD-MA action type (`FIND`, `GET`, `UPDATE`, `CREATE`, `DELETE`, `ASSOCIATE`, `INVOKE`, ...). For `INVOKE` the action name is added after a dot: `INVOKE.sendEmailNextDay`. For login - `login` |
| `endpoint (resource)` | BC name and, if there is one, the record id in brackets: `meeting (1100062)`. For login - `/login` |
| `user` | Login of the authenticated user (`SecurityContextHolder`) and, in brackets, the active roles of the session separated by commas |
| `session` | Session id (`SessionService.getSessionId()`). The same value is copied by the error popup |
| `ipAddress` | The `X-Forwarded-For` header, if it is a valid IPv4 address. Otherwise the remote address of the request |
| `data` | The data returned by the action as JSON (see [What data is written](#what-data-is-written)). For login - the user id. For an error with `ERROR` level - the error message |

## What data is written

The data is taken from the result of the CRUD-MA action:

| Result of the action | Full data | Only IDs (`SIEM_CONFIG_LOG_DATA_ID_ONLY = true`) |
|----------------------|-----------|---------------------------------------------------|
| `ResultPage` (list of records) | list of records | list of record ids |
| `ActionResultDTO` (invoke, update, create, delete) | the record | the record id |
| `DataResponseDTO` (one record) | the record | the record id |
| `MetaDTO` (row meta) | row meta | value of the `id` field |
| `AssociateResultDTO` | associated records | ids of associated records |
| `Long` (count) | the number | `null` |

## Log level

| Situation | Level |
|-----------|-------|
| Action without errors | `INFO` |
| BC + action pair from `SIEM_CONFIG_LOG_LEVEL_WARN` (by default - changes on the responsibility screens) | `WARN` |
| Action ended with a business error (`BusinessException`) | level from `logging.global-handler.business-exception.log-level`, `ERROR` if it is not set |
| Action ended with any other error | `ERROR`, `data` contains the error message |

```yaml
logging:
  global-handler:
    business-exception:
      log-level: debug
```

## Settings
The settings are constants in `SiemCrudmaEventListener`.

* Log only the record ids instead of the full data:
```java
public static final boolean SIEM_CONFIG_LOG_DATA_ID_ONLY = false;
```

* Which CRUD-MA actions to log (`PREVIEW`, `COUNT` and `META` are not logged by default):
```java
public static final Map<CrudmaActionType, Boolean> SIEM_CONFIG_LOG_CRUDMA_ACTION_TYPES = Map.of(
        CrudmaActionType.INVOKE, true,
        CrudmaActionType.FIND, true,
        CrudmaActionType.GET, true,
        CrudmaActionType.UPDATE, true,
        CrudmaActionType.PREVIEW, false,
        CrudmaActionType.DELETE, true,
        CrudmaActionType.COUNT, false,
        CrudmaActionType.ASSOCIATE, true,
        CrudmaActionType.META, false,
        CrudmaActionType.CREATE, true
);
```

* Which BC + CRUD-MA action pairs to log with `WARN` level (by default - all changing actions on the administration screens `responsibilities` and `responsibilitiesAction`):
```java
public static final Map<EnumBcIdentifier, List<CrudmaActionType>> SIEM_CONFIG_LOG_LEVEL_WARN = Map.of(
        CxboxRestController.responsibilities,
        Arrays.stream(CrudmaActionType.values()).filter(e -> !e.isReadOnly()).toList(),
        CxboxRestController.responsibilitiesAction,
        Arrays.stream(CrudmaActionType.values()).filter(e -> !e.isReadOnly()).toList()
);
```

## How does it work?

The core publishes a Spring event `CrudmaEvent` for every CRUD-MA action: it contains the action (type, name, BC), the result and the error, if there was one.
The demo has three classes in the package `org.demo.conf.cxbox.extension.siem`:

* `SecurityLogger` - builds the `SIEM event.` line and writes it with the needed level, gets the IP address of the user, chooses the level for an error.
* `SiemCrudmaEventListener` - listens to `CrudmaEvent`, applies the [settings](#settings) and logs the action.
* `SiemLoginEventListener` - listens to `LoginEvent`, which `LoginServiceImpl` publishes after login (successful or not), and logs the login.


 