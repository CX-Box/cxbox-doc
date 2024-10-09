#### Structure showCondition

```json
"showCondition": {
    "bcName": "myexample",
    "key": "myExampleBcShowCondition",
    "sequence": "1",
    "params": {
        "fieldKey": "customFieldShowCondition",
        "value": true
    }
}
```
 
* **"bcName"**
 
Description: [BusinessComponent](/environment/businesscomponent/businesscomponent/) that condition described below applies to.

Type: String(required).

* **"key"**

Description: Identifier for the show condition(unique within the project)

Type: String(required).

* **"fieldKey"**

Description: Name field with show condition.

Type: String(required).


* **"value"**

Description: Value of the field  for the show condition to be met.

Type: String(required).
 