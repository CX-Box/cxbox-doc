# Поддержка Postgres { #postgres-support }
Это база данных по умолчанию

## Как добавить? { #how-to-add }
Чтобы развернуть приложение на базе данных Postgres, необходимо:

* установить зависимости и собрать бэкенд и фронтенд
    ```
    mvn clean install -PUI
    ```
* Запустите окружение
    ```
    docker-compose up -d    
    ```
* запустить приложение
    ```
    press green button in Application.java
    ```
