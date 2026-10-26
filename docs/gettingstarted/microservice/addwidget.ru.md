# Создание и добавление нового виджета в соответствующий **view.json** { #create-and-add-new-widget-to-corresponding-viewjson }
[подробнее о виджетах](/ru/navigation/widget/widget/)

**Шаг 1** Создайте **widget.json**

```json
 {
  "name": "MyExample4001Form",
  "title": "Form title",
  "type": "Form",
  "bc": "myExampleBc4001",
  "fields": [
  ]
}
```

**Шаг 2** Добавьте виджет в соответствующий **view.json**


```json
--8<--
    {{ external_links.github_raw_doc }}/getstarted/microservice/example/myexample4001form.view.json
--8<--
```
