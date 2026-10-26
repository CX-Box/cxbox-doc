# Поля { #fields }
!!! warning line end "В разработке"

## Какие свойства? { #how-properties }
В cxbox есть стандартные типы

|     Тип       | input | text | date | dateTime | dateTimeWithSeconds |
|:-------------:|-------|------|------|----------|---------------------|
| `Placeholder` | +     | +    | +    | +        | +                   |
|    `Color`    | +     | +    | +    | +        | +                   |
|   `RO/Edit`   | +     | +    | +    | +        | +                   |
|   `Filter`    | +     | +    | +    | +        | +                   |
|  `Drilldown`  | +     | +    | +    | +        | +                   |
| `Validation`  | +     | +    | +    | +        | +                   |
|    `Sort`     | +     | +    | +    | +        | +                   |
|  `Required`   | +     | +    | +    | +        | +                   |
                                                                                         
                                                                                  
|     Тип       | number | percent | money | radio | checkbox | hidden |
|:-------------:|--------|---------|-------|-------|----------|--------|     
| `Placeholder` | +      | +       | +     | -     | -        | -      |        
|    `Color`    | +      | +       | +     | +     | +        | -      |        
|   `RO/Edit`   | +      | +       | +     | +     | +        | -      |        
|   `Filter`    | +      | +       | +     | +     | +        | -      |        
|  `Drilldown`  | +      | +       | +     | +     | -        | -      |        
| `Validation`  | +      | +       | +     | +     | +        | -      |        
|    `Sort`     | +      | +       | +     | +     | +        | -      |        
|  `Required`   | +      | +       | +     | +     | +        | -      |        
                                                                               
                                                                                   
|     Тип       | dictionary | fileUpload | pickList | inlinePickList | suggestionPickList |
|:-------------:|------------|------------|----------|----------------|--------------------|
| `Placeholder` | +          | +          | +        | +              | +                  |  
|    `Color`    | +          | -          | +        | +              | +                  |  
|   `RO/Edit`   | +          | +          | +        | +              | +                  |  
|   `Filter`    | +          | +          | +        | +              | +                  |  
|  `Drilldown`  | +          | -          | +        | +              | +                  |  
| `Validation`  | +          | +          | +        | +              | +                  |  
|    `Sort`     | +          | +          | +        | +              | +                  |  
|  `Required`   | +          | +          | +        | +              | +                  |  
                                                                         

|     Тип       | hint | multifield | multivalueHover | multivalue | multipleSelect |
|:-------------:|------|------------|-----------------|------------|----------------|    
| `Placeholder` | -    | -          | -               | +          | +              |    
|    `Color`    | +    | -          | +               | +          | -              |    
|   `RO/Edit`   | -    | -          | -               | +          | +              |    
|   `Filter`    | +    | +          | +               | +          | +              |    
|  `Drilldown`  | +    | -          | -               | +          | -              |    
| `Validation`  | -    | -          | -               | +          | +              |    
|    `Sort`     | -    | -          | -               | -          | +              |    
|  `Required`   | -    | -          | -               | +          | +              |    
                                                                           

|     Тип       | pickTree | multivalueTree | richText |
|:-------------:|----------|----------------|----------|
| `Placeholder` | +        | +              | +        |
|    `Color`    | +        | +              | -        |
|   `RO/Edit`   | +        | +              | +        |
|   `Filter`    | +        | +              | +        |
|  `Drilldown`  | +        | +              | -        |
| `Validation`  | +        | +              | +        |
|    `Sort`     | +        | -              | +        |
|  `Required`   | +        | +              | +        |

   
 


## Как добавить блок полей? { #how-to-add-block-fields }
??? Example "Пример"

    **Шаг 1** Добавьте блок "fields": [ ]: в json
    
    label — заголовок поля (необязательно)
    key — имя поля в DTO (обязательно)
    type — см. стандартные типы (обязательно)

    ```json
    "fields": [  
        {
            "label": "Custom Field",
            "key": "customField",
            "type": "input"
        }
    ]
    ```
 