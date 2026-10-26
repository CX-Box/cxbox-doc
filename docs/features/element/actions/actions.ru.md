# Действия (Actions) { #actions }
`Actions` отображают доступные действия в виде отдельных кнопок

!!! warning line end "В разработке"
 
* [text](#text) — (может быть пустой строкой) статический
* icon — (необязательно) статический
* условие доступности (необязательно)
* preAction — (необязательно) CONFIRMATION,INFORMATION,ERROR,CUSTOM
* invoker — (обязательно). Может изменять данные. Дополнительно может возвращать
* postAction — (необязательно) REFRESH_BC, DOWNLOAD_FILE, DOWNLOAD_FILE_BY_URL, OPEN_PICK_LIST, DRILL_DOWN, DELAYED_REFRESH_BC, SHOW_MESSAGE, POST_DELETE
* результаты валидации полей
* бизнес-исключения и другие исключения
* scope — (обязательно) bc, record

## <a id="text">Текст</a>
 
!!! tips "Совет"
    Рекомендуем всегда задавать text строкой.
    Если text не указан, по умолчанию используется локализованный текст. Подробнее см. [Локализация](/ru/features/locale/locale)
<!--

### Как это выглядит? { #how-does-it-look }
=== "text"
    === "пустой"
    === "заполненный"
=== "icon"
    === "только иконка"
    === "иконка и текст"
=== "availability"
    === "false"
    === "true"
=== "preAction"
    === "CONFIRMATION"
    === "INFORMATION"
    === "ERROR"
=== "postAction"
    === "DRILL_DOWN"
    === "DOWNLOAD_FILE"
    === "SHOW_MESSAGE"
    === "REFRESH_BC"
    === "...Устаревшие"
        === "DOWNLOAD_FILE_BY_URL"
        === "OPEN_PICK_LIST"
        === "DELAYED_REFRESH_BC"
        === "POST_DELETE"
=== "scope bc"
    === "bc"
    === "record"

### Как это выглядит? { #how-does-it-look_1 }
=== "actions"
##### Как добавить? { #how-to-add }
??? Example "Пример"

### Стандартные действия { #standard-actions }
#### create
##### Как это выглядит? { #how-does-it-look_2 }
=== "Виджет Form"
##### Как добавить? { #how-to-add_1 }
??? Example "Пример"

#### cancel-create
##### Как это выглядит? { #how-does-it-look_3 }
=== "Виджет Form"
##### Как добавить? { #how-to-add_2 }
??? Example "Пример"

#### save
##### Как это выглядит? { #how-does-it-look_4 }
=== "Виджет Form"
##### Как добавить? { #how-to-add_3 }
??? Example "Пример"

#### delete
##### Как это выглядит? { #how-does-it-look_5 }
=== "Виджет Form"
##### Как добавить? { #how-to-add_4 }
??? Example "Пример"

#### copy
##### Как это выглядит? { #how-does-it-look_6 }
=== "Виджет Form"
##### Как добавить? { #how-to-add_5 }
??? Example "Пример"
-->

<!--
#### <a id="Actionsgroups">Группы действий</a>
`Actions groups` объединяют часть доступных действий в одну кнопку с выпадающим списком


##### Как это выглядит? { #how-does-it-look_7 }
=== "Виджет Form"
##### Как добавить? { #how-to-add_6 }
??? Example "Пример"
-->

