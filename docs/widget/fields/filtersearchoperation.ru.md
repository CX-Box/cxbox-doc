# SearchOperation для фильтрации { #searchoperation-for-filtering }

Каждому типу поля нужна своя операция фильтрации, которую отправляет фронтенд.

Это крайне важно учитывать при работе с микросервисами.

Ниже приведены стандартные типы полей и соответствующие им способы фильтрации.

|                   Тип                    | Фильтрация                                  |
|:----------------------------------------:|---------------------------------------------|
|                 `input`                  | .contains                                   |                    
|                  `date`                  | .greaterOrEqualThan .lessOrEqualThan        |            
|                `dateTime`                | .greaterOrEqualThan .lessOrEqualThan        |           
|          `dateTimeWithSeconds`           | .greaterOrEqualThan .lessOrEqualThan        |                          
|                 `number`                 | .equals/.greaterOrEqualThan .lessOrEqualThan|         
|                `percent`                 | .equals/.greaterOrEqualThan .lessOrEqualThan|           
|                 `hidden`                 | -                                           |           
|                  `text`                  | .contains                                   |           
|                 `radio`                  | .equalsOneOf                                |            
|                `checkbox`                | .specified=true/false                       |         
|                 `money`                  | .equals/.greaterOrEqualThan .lessOrEqualThan|           
|               `dictionary`               | .equalsOneOf                                |     
|               `fileUpload`               | .contains                                   |          
|                `pickList`                | .contains                                   |          
|             `inlinePickList`             | .contains                                   |            
|                `pickTree`                | .contains                                   |          
|                  `hint`                  | .contains                                   |         
|               `multifield`               | .equals                                     | 
|            `multivalueHover`             | .equalsOneOf                                |            
|               `multivalue`               | .equalsOneOf                                |                
|             `multivalueTree`             | .equalsOneOf                                |                
|             `multipleSelect`             | .equalsOneOf                                | 
|           `suggestionPickList`           | .contains                                   |
|                `richText`                | .contains                                   |
