# Meta builder

!!! warning line end "Work in progress"
 
## Basics
### FieldMetaBuilder
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/InputBasic){:target="_blank"} ·

??? Example  
 
    **Meta** extends **FieldMetaBuilder**

      ```java
      --8<--
      {{ external_links.github_raw_doc }}/input/basic/InputBasicMeta.java
      --8<--
      ```
### AnySourceFieldMetaBuilder

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·

??? Example  

    **Meta** extends **AnySourceFieldMetaBuilder**

     ```java
     --8<--
     {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyExample3800Meta.java
     --8<--
     ```
To customize properties in interfaces, you can use the following options:

* buildRowDependentMeta

* buildIndependentMeta

<!--


Overall, customizing properties in interfaces allows you to tailor the user experience and provide more functionality and flexibility in your application.

### buildRowDependentMeta

RowDependentFieldsMeta


	/**
	 * Adds a value to an existing list of selectable values
	 *
	 * @param field widget field with type dictionary
	 * @param dictDTO DTO with dictionary value
	 */


