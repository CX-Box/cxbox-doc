# Начало работы { #getting-started }
Это руководство знакомит с основами и помогает создать стандартные элементы, необходимые для быстрого старта проекта.
 
## Что понадобится { #what-you-need }
* Около 15 минут
 
## :octicons-download-16: Шаг 1  Клонируйте репозиторий { #step-1-clone-repository }

    git clone git@github.com:CX-Box/cxbox-demo.git

## :material-download-circle: Шаг 2  Скачайте плагин { #step-2-download-plugin }
[скачать плагин для IntelliJ](https://doc.cxbox.org/ru/plugin/plugininstalling)

## :material-check-underline: Шаг 3 Добавьте новое поле на существующий экран { #step-3-add-new-field-to-an-existing-screen }
Выберите источник данных:

* [Postgres](/gettingstarted/postgres/getstartedfordeveloperspostgres/)
* [Микросервисы](/ru/gettingstarted/microservice/getstartedfordevelopersmicroservice/)

## :material-play: Шаг 4 Разверните приложение { #step-4-to-deploy-an-application }

Для работы CXBOX нужна база данных; в этом примере используется PostgreSQL.

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

 
 
   