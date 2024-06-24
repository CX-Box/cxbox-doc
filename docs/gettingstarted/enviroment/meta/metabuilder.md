# Meta builder

!!! warning line end "Work in progress"
Allows you to customize the properties
Overall, customizing properties in interfaces allows you to tailor the user experience and provide more functionality and flexibility in your application.

## Basics
 
??? Example  
    === "Inner"
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/InputBasic){:target="_blank"} ·

        - **Meta** extends **FieldMetaBuilder**
    
          ```java
          --8<--
          {{ external_links.github_raw }}/input/basic/InputBasicMeta.java
          --8<--
          ```
    === "AnySource"

        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·
    
        - **Meta** extends **AnySourceFieldMetaBuilder**
          ```java
          --8<--
          {{ external_links.github_raw }}/microservice/existingmicroservices/MyExample3800Meta.java
          --8<--
          ```

To customize properties in interfaces, you can use the following options:

* buildRowDependentMeta
* buildIndependentMeta

### buildRowDependentMeta
#### addConcreteValue 

 
####  setDictionaryTypeWithConcreteValuesFromList 
	 
	 * Fills the list of selectable values in the dropdown list with concrete dictionary values
	 *
	 * @param field widget field with type dictionary
	 * @param type dictionary type
	 * @param lovs list of dictionary codes (with type LOV)


#### setRequired 

#### setNotRequired 

#### setDisabled
ou can disable a property by setting it to a specific value that indicates it should not be used or displayed. For example, you can add a "disabled" attribute to a property in the interface definition.
####  setEnabled 

####  setDictionaryTypeWithAllValues 

####  setDictionaryTypeWithCustomValues 

####  setDictionaryTypeWithConcreteValues  

####   setConcreteValues 

####  setEnumValues  

####  setDrilldown 
You can create a link property that links to another property or resource. This can be useful for creating relationships between different parts of the interface or for allowing users to navigate to related information. For example, you can add a "link" attribute to a property in the interface definition and specify the URL of the related resource.
####   setDrilldowns 

####  setDictionaryValuesWithIcons 

####  setCurrentValue 

####  setPlaceholder( 


### buildIndependentMeta 
####  addConcreteFilterValue

	/**
	 * Adds a value to the existing list of filterable values
	 *
	 * @param field widget field with type dictionary
	 * @param dictDTO DTO with dictionary value
	 */

#### enableFilter 

####  setAllFilterValuesByLovType 

####   setConcreteFilterValues

####   setEnumFilterValues 
####  setForceActive 
#### setEphemeral
####  setHidden
####  setFilterValuesWithIcons 
#### setFileAccept 

