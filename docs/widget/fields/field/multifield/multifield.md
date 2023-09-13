# Multifield

`Multifield` is a logical block containing any number of other field types. All fields in a logical block are readonly.
The typical scenario involves using a common field type (e.g., input, date) for 'main' data and a hint field type for 'secondary' data

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/multifield/basic){:target="_blank"}
### How does it look?

Logical blocks can be shown in different styles

1) Style 'list' is displaying each entry on its own line

2) Style 'inline' is displaying all data on the same line

=== "List widget"
    ![img_list.png](img_list.png)
=== "Info widget"
    ![img_info.png](img_info.png)
=== "Form widget"
    ![img_form.png](img_form.png)

Block containing with field type hint. `see more` [hint](/widget/fields/field/hint/hint)
=== "List widget"
    ![img_list_hint.png](img_list_hint.png)
=== "Info widget"
    ![img_info_hint.png](img_info_hint.png)
=== "Form widget"
    ![img_form_hint.png](img_form_hint.png)


### How to add?

??? Example
    
    === "List widget"
        Add `fields` and `style` to **_.widget.json_**.
        ```json
        {
          "name": "MyExampleList",
          "title": "List title",
          "type": "List",
          "bc": "myExampleBc",
          "fields": [
            {
              "title": "Custom multifield Style 'List'",
              "key": "customFieldMulti",
              "type": "multifield",
              "style": "list",
              "fields": [
                {
                  "title": "Custom Field Multi",
                  "key": "customFieldMulti",
                  "type": "input"
                },
                {
                  "title": "New Custom Field Multi",
                  "key": "customFieldAdditionalMulti",
                  "type": "input"
                }
              ]
            },
            {
              "title": "Custom multifield Style 'Inline'",
              "key": "customFieldAdditionalMulti",
              "type": "multifield",
              "style": "inline",
              "fields": [
                {
                  "title": "Custom Field Multi",
                  "key": "customFieldMulti",
                  "type": "input"
                },
                {
                  "title": "New Custom Field Multi",
                  "key": "customFieldAdditionalMulti",
                  "type": "input"
                }
              ]
            },
            {
              "title": "Custom Field Additional",
              "key": "customFieldAdditional",
              "type": "input"
            },
            {
              "title": "Custom multifield hint",
              "key": "customFieldMultiHint",
              "type": "multifield",
              "style": "list",
              "fields": [
                {
                  "key": "customField",
                  "type": "input"
                },
                {
                  "title": "Information Field",
                  "key": "informationField",
                  "type": "hint",
                  "showLength": 100
                }
              ]
            }
          ]
        }
        ```        

    === "Info widget"
        Add `fields` and `style` to **_.widget.json_**.

        Multifield key use for to determine the order in which fields are displayed in the interface("options.layout").

        ```json
        {
          "name": "MyExampleInfo",
          "title": "Info title",
          "type": "Info",
          "bc": "myExampleBc",
          "fields": [
            {
              "label": "Custom multifield style 'List'",
              "key": "customFieldMultiField",
              "type": "multifield",
              "style": "list",
              "fields": [
                {
                  "label": "New Custom Field Multi",
                  "key": "customFieldAdditionalMulti",
                  "type": "input"
                },
                {
                  "label": "Custom Field Multi",
                  "key": "customFieldMulti",
                  "type": "input"
                }
              ]
            },
            {
              "label": "Custom multifield style 'Inline'",
              "key": "customFieldAdditionalMulti",
              "type": "multifield",
              "style": "inline",
              "fields": [
                {
                  "label": "New Custom Field Multi",
                  "key": "customFieldAdditionalMulti",
                  "type": "input"
                },
                {
                  "label": "Custom Field Multi",
                  "key": "customFieldMulti",
                  "type": "input"
                }
              ]
            },
            {
              "label": "Custom Field Additional",
              "key": "customFieldAdditional",
              "type": "input"
            },
            {
              "label": "Custom multifield hint",
              "key": "customFieldMultifieldHint",
              "type": "multifield",
              "style": "list",
              "fields": [
                {
                  "key": "customField",
                  "type": "input"
                },
                {
                  "key": "informationField",
                  "type": "hint",
                  "showLength": 100
                }
              ]
            }
          ],
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customFieldAdditionalMulti",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                    {
                      "fieldKey": "customFieldMultiField",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                    {
                      "fieldKey": "customFieldAdditional",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                    {
                      "fieldKey": "customFieldMultifieldHint",
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

        Add `fields` and `style` to **_.widget.json_**.

        Multifield key use for to determine the order in which fields are displayed in the interface("options.layout").

        ```json
        {
          "name": "MyExampleForm",
          "title": "Form title",
          "type": "Form",
          "bc": "myExampleBc",
          "fields": [
            {
              "label": "Custom multifield",
              "key": "customFieldMulti",
              "type": "multifield",
              "style": "list",
              "fields": [
                {
                  "label": "New Custom Field Multi",
                  "key": "customFieldAdditionalMulti",
                  "type": "input"
                },
                {
                  "label": "Custom Field Multi",
                  "key": "customFieldMulti",
                  "type": "input"
                }
              ]
            },
            {
              "label": "Custom multifield style 'Inline'",
              "key": "customFieldAdditionalMulti",
              "type": "multifield",
              "style": "inline",
              "fields": [
                {
                  "label": "New Custom Field Multi",
                  "key": "customFieldAdditionalMulti",
                  "type": "input"
                },
                {
                  "label": "Custom Field Multi",
                  "key": "customFieldMulti",
                  "type": "input"
                }
              ]
            },
            {
              "label": "Custom Field Additional",
              "key": "customFieldAdditional",
              "type": "input"
            },
            {
              "label": "Custom multifield hint",
              "key": "customFieldMultiHint",
              "type": "multifield",
              "style": "list",
              "fields": [
                {
                  "key": "customField",
                  "type": "input"
                },
                {
                  "key": "informationField",
                  "type": "hint",
                  "showLength": 100
                }
              ]
            }
          ],
          "options": {
            "layout": {
              "rows": [
                {
                  "cols": [
                    {
                      "fieldKey": "customFieldAdditionalMulti",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                    {
                      "fieldKey": "customFieldMulti",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                    {
                      "fieldKey": "customFieldAdditional",
                      "span": 12
                    }
                  ]
                },
                {
                  "cols": [
                    {
                      "fieldKey": "customFieldMultiHint",
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
All fields in a logical block are readonly.


## Filtering
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample360){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/multifield/filtration){:target="_blank"}

`Filtering` allows you to search data based on criteria. Search by =
### How does it look?
 
=== "List widget"
    ![img_filtr_list.png](img_filtr_list.png)
=== "Info widget"
    _not applicable_
=== "Form widget"
    _not applicable_

Filter not working with field type hint. `see more` [hint](/features/element/hint/hint)

### How to add?
??? Example
    === "List widget"

        **Step 1** Add **@SearchParameter** to corresponding **DataResponseDTO**. (Advanced customization [SearchParameter](/advancedCustomization/element/searchparameter/searchparameter))

        ```java
        public class MyExampleDTO extends DataResponseDTO {
        
            @SearchParameter(name = "customField", provider = BigDecimalValueProvider.class)
            private Long customField;
        
            public MyExampleDTO(MyEntity entity) {
                this.customField = entity.getCustomField();
            }
        }
        ```
        **Step 2**  Add **fields.enableFilter** to corresponding **FieldMetaBuilder**.

        ```java 
        public class MyExampleMeta extends FieldMetaBuilder<MyExampleDTO>  {
        
            public void buildIndependentMeta(FieldsMeta<MyExampleDTO> fields, InnerBcDescription bcDescription, Long parentId) {
                fields.enableFilter(MyExampleDTO_.customField);
            }
        
        }
        ```
        **Step 3**  Add field for block filter in parameter `key`. 

        For example, for filtering on field  "customFieldAdditionalMulti" -  "key" = "customFieldAdditionalMulti"
            ```json
            {
              "title": "Custom multifield",
              "key": "customFieldAdditionalMulti",
              "type": "multifield",
              "style": "list",
              "fields": [
                {
                  "title": "Custom Field Multi",
                  "key": "customFieldMulti",
                  "type": "input"
                },
                {
                  "title": "New Custom Field Multi",
                  "key": "customFieldAdditionalMulti",
                  "type": "input"
                }
              ]
            },
            ```
    === "Info widget"
        _not applicable_
    === "Form widget"
        _not applicable_


## Drilldown
_not applicable_

## Validation
_not applicable_

## Sorting
_not applicable_

## Required
_not applicable_