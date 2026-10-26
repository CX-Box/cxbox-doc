Стандартные элементы репозитория:

* [Entity](/environment/entity/entity)
* [DTO](/environment/dto/dto)
* [Сервис (Service)](/ru/environment/service/service)
* [MetaBuilder](/environment/meta/metabuilder)
* [Контроллер (Controller)](/ru/environment/controller/controller)

<!-- 
Визуальные элементы
* widget
* view
* screen

## Основы { #basics }
 
??? Example "Пример"
    === "Источник данных"
    
        [:material-play-circle: Живой пример]({{ external_links.code_samples }}/ui/#/screen/InputBasic){:target="_blank"} ·
        
        - **Шаг 1.1** Создайте **Entity**
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/input/basic/InputBasic.java
            --8<--
            ```
    
        - **Шаг 1.2** Создайте **DTO**, наследующий **DataResponseDTO**
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/input/basic/InputBasicDTO.java
            --8<--
            ```
        - **Шаг 1.3** Создайте **Meta**, наследующий **FieldMetaBuilder**
        
            подробнее см. [Meta builder](/ru/environment/meta/metabuilder)
            
            ```java
            --8<--
            {{ external_links.github_raw_doc }}/fields/input/basic/InputBasicMeta.java
            --8<--
            ```
        - **Шаг 1.4** Создайте **Service**, реализующий **VersionAwareResponseService**
        
             ```java
             --8<--
             {{ external_links.github_raw_doc }}/fields/input/basic/InputBasicService.java
             --8<--
             ```
        - **Шаг 1.5** Создайте **PlatformController**, реализующий **EnumBcIdentifier**
        
             ```java
             --8<--
             {{ external_links.github_raw_doc }}/fields/input/basic/CxboxInputBasicController.java
             --8<--
             ```
    - **Шаг 2** Создайте визуальные элементы
        - **Шаг 2.1** Создайте **widget.json**
            подробнее см. [Widget](widget/type/widget)
        - **Шаг 2.2** Создайте **view.json**
            подробнее см. [Widget](navigation/view/view)
        - **Шаг 2.3** Добавьте виджет в соответствующий **view**
            подробнее см. [Widget](navigation/view/view)
        - **Шаг 2.4** Создайте **screen.json**
            подробнее см. [Screen](screen/screen)
        - **Шаг 2.5** Добавьте view в соответствующий **screen**
            подробнее см. [Screen](screen/screen)
--->