#  Basic Authorization

## How does it look?
![basic_auth.gif](basic_auth.gif)

### How to add?

To deploy an application to an basic authorization you need:
### Frontend configuration

* Build frontend with script from `ui/package.json` (instead of `build` script, that builds with keycloak sso enabled)
    ```
    build-noKeycloak
    ```
 
* start frontend with script from `ui/package.json` (instead of `start` script, that builds with keycloak sso enabled)
    ```
    start-noKeycloak
    ```

* start environment

### Backend configuration
* Add user that will be available for basic auth in

    `src/main/resources/db/data/CXBOX-USERS.csv`

* Add other roles in  
  
    `src/main/resources/db/data/CXBOX-USER_ROLE.csv`

### Login process
Type login/password (vanilla/vanilla is available by default)