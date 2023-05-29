# Hidden
`Hidden` is invisible technical component that allows to send field value to frontend
## Basics
### How does it look?

=== "List widget"
    ![img_list.png](img_list.png)
=== "Info widget"
    ![img_info.png](img_info.png)
=== "Form widget"
    ![img_form.png](img_form.png)


### How to add?
??? Example
    **Step1** Add field **LocalDateTime** to corresponding **DataResponseDTO**.

    ```java
    public class DateTimeDTO extends DataResponseDTO {
        @SearchParameter(name = "customField", provider = DateTimeValueProvider.class)   
        private LocalDateTime customField;
    
        public DateTimeDTO(DateTimeEntity entity) {
            this.customField = entity.getCustomField();
        }
    }
    ```
    **Step2** Add field **LocalDateTime** to corresponding **BaseEntity**.

    ```java
    public class DateTimeEntity extends BaseEntity {
    
        private LocalDateTime customField;
    
    }
    ```
    === "List widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "DateTimeList",
          "title": "List title",
          "type": "List",
          "bc": "myBcDateTime",
          "fields": [
            {
              "title": "custom Field",
              "key": "customField",
              "type": "dateTime"
            }
          ],
          "options": {
            "actionGroups": {
            }
          }
        }
        ```
    === "Info widget"
        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "DateTimeInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myBcDateTime",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "dateTime"
            }
          ],
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customField",
                      "span": 12
                    }
                  ]
                }
              ]
            }
          }
        }
        ```

    === "Form widget"

        **Step3** Add to **_.widget.json_**.

        ```json
        {
          "name": "DateTimeForm",
          "title": "Form title",
          "type": "Form",
          "bc": "myBcDateTime",
          "fields": [
            {
              "label": "custom Field",
              "key": "customField",
              "type": "dateTime"
            }
          ],
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customField",
                      "span": 12
                    }
                  ]
                }
              ]
            }
          }
        }
        ```
## Placeholder
_not applicable_

## Color
_not applicable_

## Readonly/Editable
_not applicable_

## Filtration
_not applicable_

## Drilldown
_not applicable_

## Validation
_not applicable_

## Sorting
_not applicable_

## Required
_not applicable_