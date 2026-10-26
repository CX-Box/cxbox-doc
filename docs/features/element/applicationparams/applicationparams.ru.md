# Параметры приложения { #application-params }
 
!!! warning line end "В разработке"

## cxbox
### widget
#### fields
##### filter-by-range-enabled-default
Этот параметр позволяет выбрать режим отображения фильтрации для следующих типов данных:

* [Number](/widget/fields/field/number/number/#filtering)
* [Money](/widget/fields/field/money/money/#filtering)
* [Percent](/widget/fields/field/percent/percent/#filtering)
* [Date](/widget/fields/field/date/date/#filtering)
* [DateTime](/widget/fields/field/dateTime/dateTime/#filtering)
* [DateTimeWithSeconds](/widget/fields/field/dateTimeWithSeconds/dateTimeWithSeconds/#filtering)

Доступные варианты фильтрации:

1. **Диапазон** – фильтрация по минимальному и максимальному значениям (например, с/по дату, сумму или число).
2. **Конкретное значение** – фильтрация по одному выбранному значению (например, точной дате, сумме или числу).

Выбор зависит от того, нужно ли искать в пределах диапазона или по точному значению.

По умолчанию фильтрация выполняется **по диапазону**.
Чтобы отключить её, укажите `cxbox.widget.fields.filter-by-range-enabled-default: false` в meta.
