#  Базовая авторизация { #basic-authorization }

## Как это выглядит? { #how-does-it-look }
![basic_auth.gif](basic_auth.gif)

### Как добавить? { #how-to-add }

Чтобы развернуть приложение с базовой авторизацией, необходимо:
### Настройка фронтенда { #frontend-configuration }

* Соберите фронтенд скриптом из `ui/package.json` (вместо скрипта `build`, который собирает с включённым Keycloak SSO)
    ```
    build-noKeycloak
    ```
 
* Запустите фронтенд скриптом из `ui/package.json` (вместо скрипта `start`, который собирает с включённым Keycloak SSO)
    ```
    start-noKeycloak
    ```

* Запустите окружение

### Настройка бэкенда { #backend-configuration }
* Добавьте пользователя, который будет доступен для базовой авторизации, в

    `src/main/resources/db/data/CXBOX-USERS.csv`

* Добавьте остальные роли в
  
    `src/main/resources/db/data/CXBOX-USER_ROLE.csv`

* Добавьте параметр в application.yml
 
  ```
   app:
      auth-basic:
        enabled: true
  ```
### Процесс входа { #login-process }
Введите логин/пароль (по умолчанию доступен vanilla/vanilla)