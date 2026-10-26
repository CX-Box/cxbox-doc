# Добавление нового поля в соответствующий **widget.json** { #add-new-field-to-corresponding-widgetjson }

## **Шаг 1** Добавьте поле **String** в соответствующий **DataResponseDTO** { #step1-add-string-field-to-corresponding-dataresponsedto }

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/example/MyExample4001DTO.java
    --8<--
    ```
 

## **Шаг 2**  Добавьте поле в соответствующий **AnySourceFieldMetaBuilder** { #step2-add-field-to-corresponding-anysourcefieldmetabuilder }

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/example/MyExample4001Meta.java
    --8<--
    ```
## **Шаг 3**  Добавьте поле в соответствующий **AnySourceVersionAwareResponseService** { #step3-add-field-to-corresponding-anysourceversionawareresponseservice }

??? Example "Пример"
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/example/MyExample4001Service.java
    --8<--
    ```

## **Шаг 4** Добавьте поле **Input** в виджет формы { #step4-add-input-field-to-form-widget }

![stp1.png](../postgres/stp1.png)

## **Шаг 5**  Добавьте поле в layout { #step5-add-field-to-layout }

![stp3.png](../postgres/stp3.png)
 