# SearchOperation for filtering

Each field type requires a distinct filtering operation sent by the frontend.

It's crucial to consider this when dealing with microservices. 

Here are the standard field types with their respective filtering methods.

|                   Type                   | Filtration                           |  
|:----------------------------------------:|--------------------------------------|
|                 `input`                  | .contains                            |                    
|                  `date`                  | .greaterOrEqualThan .lessOrEqualThan |            
|                `dateTime`                | .greaterOrEqualThan .lessOrEqualThan |           
|          `dateTimeWithSeconds`           | .greaterOrEqualThan .lessOrEqualThan |                          
|                 `number`                 | .equals                              |         
|                `percent`                 | .equals                              |           
|                 `hidden`                 | -                                    |           
|                  `text`                  | .contains                            |           
|                 `radio`                  | .equalsOneOf                         |            
|                `checkbox`                | .specified=true/false                |         
|                 `money`                  | .equals                              |           
|               `dictionary`               | .equalsOneOf                         |     
|               `fileUpload`               | .contains                            |          
|                `pickList`                | .contains                            |          
|             `inlinePickList`             | .contains                            |            
|                  `hint`                  | -                                    |         
|               `multifield`               | .equals                              | 
|            `multivalueHover`             | .equalsOneOf                         |            
|               `multivalue`               | .equalsOneOf                         |                
|             `multipleSelect`             | .equalsOneOf                         | 
|           `suggestionPickList`           | .contains                            |
