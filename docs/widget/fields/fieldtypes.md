# Fields
!!! warning line end "Work in progress"

## How properties?
In cxbox add standard types

|     Type      | input | text | date | dateTime | dateTimeWithSeconds |
|:-------------:|-------|------|------|----------|---------------------|
| `Placeholder` | +     | +    | +    | +        | +                   |
|    `Color`    | +     | +    | +    | +        | +                   |
|   `RO/Edit`   | +     | +    | +    | +        | +                   |
|   `Filter`    | +     | +    | +    | +        | +                   |
|  `Drilldown`  | +     | +    | +    | +        | +                   |
| `Validation`  | +     | +    | +    | +        | +                   |
|    `Sort`     | +     | +    | +    | +        | +                   |
|  `Required`   | +     | +    | +    | +        | +                   |
                                                                                         
                                                                                  
|     Type      | number | percent | money | radio | checkbox | hidden |      
|:-------------:|--------|---------|-------|-------|----------|--------|     
| `Placeholder` | +      | +       | +     | -     | -        | -      |        
|    `Color`    | +      | +       | +     | +     | +        | -      |        
|   `RO/Edit`   | +      | +       | +     | +     | +        | -      |        
|   `Filter`    | +      | +       | +     | +     | +        | -      |        
|  `Drilldown`  | +      | +       | +     | +     | -        | -      |        
| `Validation`  | +      | +       | +     | +     | +        | -      |        
|    `Sort`     | +      | +       | +     | +     | +        | -      |        
|  `Required`   | +      | +       | +     | +     | +        | -      |        
                                                                               
                                                                                   
|     Type      | dictionary | fileUpload | pickList | inlinePickList |           
|:-------------:|------------|------------|----------|----------------|
| `Placeholder` | +          | +          | +        | +              |  
|    `Color`    | +          | -          | +        | +              |  
|   `RO/Edit`   | +          | +          | +        | +              |  
|   `Filter`    | +          | +          | +        | +              |  
|  `Drilldown`  | +          | -          | +        | +              |  
| `Validation`  | +          | +          | +        | +              |  
|    `Sort`     | +          | +          | +        | +              |  
|  `Required`   | +          | +          | +        | +              |  
                                                                         

|     Type      | hint | multifield | multivalueHover | multivalue | multipleSelect |    
|:-------------:|------|------------|-----------------|------------|----------------|    
| `Placeholder` | -    | -          | -               | +          | +              |    
|    `Color`    | -    | -          | +               | +          | -              |    
|   `RO/Edit`   | -    | -          | -               | +          | +              |    
|   `Filter`    | -    | +          | +               | +          | +              |    
|  `Drilldown`  | -    | -          | -               | +          | -              |    
| `Validation`  | -    | -          | -               | +          | +              |    
|    `Sort`     | -    | -          | -               | -          | +              |    
|  `Required`   | -    | -          | -               | +          | +              |    
                                                                           
   
 
## How to add block fields?
??? Example

    **Step1** Add Block   "fields": [ ]: in json
    
    label - title field (optional)
    key - name field in DTO (required)
    type -  see standard types (required)

    ```json
    "fields": [  
        {
            "label": "Custom Field",
            "key": "customField",
            "type": "input"
        }
    ]
    ```
 