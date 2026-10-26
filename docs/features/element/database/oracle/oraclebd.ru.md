# Поддержка Oracle { #oracle-support }
## Как это выглядит? { #how-does-it-look }
![oracle.gif](oracle.gif)

## Как добавить? { #how-to-add }
Чтобы развернуть приложение на базе данных Oracle, необходимо:

* заменить `<artifactId>postgresql</artifactId>` на зависимость Oracle в POM.xml
    ```xml
    <dependency>
      <groupId>com.oracle.database.jdbc</groupId>
      <artifactId>ojdbc10</artifactId>
      <version>19.21.0.0</version>
    </dependency>
    ```

* Запустите окружение
    ```bash
    docker-compose -f docker-compose-oracle.yml up -d
    ```

* запустить приложение
    ```
    start run configuration in Application_oracle
    ```

* (Необязательно) либо запустить приложение удобным вам способом со следующими переменными окружения:
    ```
    DATABASE_DRIVER=oracle.jdbc.driver.OracleDriver;
    DATABASE_URL=jdbc:oracle:thin:@localhost:1523/XEPDB1;
    DATABASE_USER=app
    DATABASE_PASSWORD=app;
    ```