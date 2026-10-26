# 1.7.7

## Добавлено: *.screen.json — инспекция при "type" : "standard" { #added-screenjson-inspection-when-type-standard }

Добавлены инспекции для экранов, у которых в .screen.json явно задано `"type"="standard"`. Они проверяют уникальность каждого `viewName` и выявляют пустые массивы. Также улучшена генерация view (по нажатию на иконку `+`)

## Добавлено: *.widget.json — автодополнение и навигация для `actionKey` { #added-widgetjson-auto-completion-and-navigation-for-actionkey }

Предыдущие версии плагина обеспечивали навигацию для действий, указанных в `options->actionGroups` файла .widget.json.
В этом релизе такая же возможность добавлена для действий, указанных в теге `options->buttons->actionKey` файла .widget.json, который используется для настройки drag-and-drop файлов.

![actionKey.gif](../v2.0.7/actionKey.gif){width="800"}

## Добавлено: *.widget.json — инспекция расположения actionGroups. { #added-widgetjson-inspection-for-actiongroups-location }

Добавлена инспекция тега `actionGroups` в .widget.json, проверяющая, что он находится внутри `options`.

![actionGroupsLocation.gif](../v2.0.7/actionGroupsLocation.gif){width="800"}

## Новое: поддержка IntelliJ 2024.3+ { #new-intellij-20243-support }
Поддержка IntelliJ 2024.3+
## Новое: автодополнение, навигация по Ctrl-клику и инспекция для @SearchParameter { #new-autocomplete-ctrl-click-navigation-and-inspection-for-searchparameter }
Автодополнение, навигация по Ctrl-клику и инспекция для параметра name аннотации @SearchParameter, содержащего путь к полю сущности Hibernate. Инспекция подсвечивает 2 простых, но полезных случая: ссылки на несуществующие поля (самая частая ошибка) и незавершённый путь (выражение не заканчивается полем Hibernate с @Column)

* Автодополнение:
  ![autocomplete.gif](../v2.0.9/autocomplete.gif)

* Навигация по Ctrl-клику
  ![navigation.gif](../v2.0.9/navigation.gif)

* Инспекция
  ![inspection.gif](../v2.0.9/inspection.gif)

* Рефакторинг
  ![refactor.gif](../v2.0.9/refactor.gif)

## Новое. Действия в .widget.json { #new-actions-in-widgetjson }
Автодополнение, навигация по Ctrl-клику и инспекция для действий в .widget.json -> options -> actionGroups -> include. Теперь доступно без скачивания исходников через Maven!

### Иконка «плюс» и генерация кода { #plus-icon-and-code-generation }
Теперь можно сгенерировать шаблонный Java-код для нового действия и сразу перейти к нему!
![actions.gif](../v2.0.9/actions.gif)

### **Действия — поддержка `string` в .widget.json:** { #actions-string-in-widgetjson-support }

#### Навигация по Ctrl-клику { #ctrl-click-navigation }
Service  -> .widget.json, .widget.json -> Service:
![navigation_action.gif](../v2.0.9/navigation_action.gif)

#### Автодополнение { #autocomplete }
![autocomplete_action.gif](../v2.0.9/autocomplete_action.gif)

#### Инспекция { #inspection }
![inspection_action.gif](../v2.0.9/inspection_action.gif)

#### Рефакторинг { #refactoring }
![refactoring_action_string.gif](../v2.0.9/refactoring_action_string.gif)

### **Действия — поддержка `Enum` в .widget.json:** { #actions-enum-in-widgetjson-support }

#### Навигация по Ctrl-клику. { #ctrl-click-navigation_1 }
Service  -> .widget.json, .widget.json -> Service:
![navigation_action_enum.gif](../v2.0.9/navigation_action_enum.gif)

#### Автодополнение { #autocomplete_1 }
![autocomplete_action_enum.gif](../v2.0.9/autocomplete_action_enum.gif)

#### Инспекция { #inspection_1 }
![inspection_action_enum.gif](../v2.0.9/inspection_action_enum.gif)

#### Рефакторинг { #refactoring_1 }
![refactoring_action_enum.gif](../v2.0.9/refactoring_action_enum.gif)

### Действия — поддержка `java constant` в .widget.json: { #actions-java-constant-in-widgetjson-support }

#### Навигация по Ctrl-клику { #ctrl-click-navigation_2 }
Только .widget.json -> Service :
![navigation_action_java_const.gif](../v2.0.9/navigation_action_java_const.gif)

#### Автодополнение { #autocomplete_2 }
![autocomplete_java_const.gif](../v2.0.9/autocomplete_java_const.gif)

#### Инспекция { #inspection_2 }
![inspection_java_const.gif](../v2.0.9/inspection_java_const.gif)

## Новое. Инспекция viewName { #new-inspection-viewname }
Инспекция, проверяющая уникальность viewName в пределах экрана
![unique_view.png](../v2.0.9/unique_view.png)

Инспекция, проверяющая уникальность viewName в пределах экрана (корректность .screen.json -> navigation), когда задано type = standard (в остальных случаях эти проверки пропускаются для обратной совместимости с кастомизациями проектов). Проверяется:
## Новое. Инспекция popupBcName в widget.json -> fields { #new-inspection-that-checks-popupbcname-in-widgetjson-fields }
![picklist.png](../v2.0.9/picklist.png)

Инспекция, проверяющая, что popupBcName в widget.json -> fields является дочерним для bc виджета-владельца. Проверка выполняется только для полей с типом picklist
## Новое. Инспекция actionGroups в widget.json { #new-inspection-that-checks-actiongroups-in-widgetjson }
![action_group.png](../v2.0.9/action_group.png)

Инспекция, проверяющая расположение actionGroups в widget.json (например, что он находится в теге options)
