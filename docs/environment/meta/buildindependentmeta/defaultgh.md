# defaultGroupingHierarchy()
 
`defaultGroupingHierarchy()` -  This method sets default hierarchy for "GroupingHierarchy" widget, that will always be shown (even, when widget has no data from backend).  

**Methods for Levels 1-4**
For levels 1 through 4, the methods ensure compatibility between the reference books (enums/dictionaries) and the list of fields DTO.
These methods validate that each level’s field corresponds to a defined reference book.

**Method for Creating Hierarchies ≥ 5 Levels**
For hierarchies with 5 or more levels, the method does not perform compatibility checks.
Exercise caution, as mismatched fields may lead to unexpected behavior

The grouping is determined by the fields DTO specified in the method call fields.defaultGroupingHierarchy(...).

The order of the fields listed is critical as it determines the sequence of grouping, starting from the topmost level (leftmost field)
down to the deepest level (rightmost field).

Suppose you have four levels of hierarchy, defined as:

* `Level 1`: CustomFieldDictionaryEnum
* `Level 2`: CustomFieldDictionaryLevelTwoEnum
* `Level 3`: CustomFieldDictionaryLevelThreeEnum
* `Level 4`: CustomFieldDictionaryLevelFourEnum


 ![level 4.png](level%204.png)

You can configure this hierarchy in the method call:

```
fields.defaultGroupingHierarchy(
    MyExampleDTO_.customFieldDictionary,
    MyExampleDTO_.customFieldDictionaryLevelTwo,
    MyExampleDTO_.customFieldDictionaryLevelThree,
    MyExampleDTO_.customFieldDictionaryLevelFour,
```

* field1 – FIRST field listed in .widget. json -> "options" -> "groupingHierarchy" -> "fields" 
* field2 – SECOND field listed in .widget. json -> "options" -> "groupingHierarchy" -> "fields"
* field3 – THIRD field listed in .widget. json -> "options" -> "groupingHierarchy" -> "fields" 
* field4 – FOURTH field listed in .widget. json -> "options" -> "groupingHierarchy" -> "fields"

This ensures the hierarchy progresses sequentially from Level 1 to Level 4.

**Structure**:

    Level 1 (CustomFieldDictionaryEnum):
    
        Level 2 (CustomFieldDictionaryLevelTwoEnum):
    
            Level 3 (CustomFieldDictionaryLevelThreeEnum):
    
                Level 4 (CustomFieldDictionaryLevelFourEnum).


Lambdas (lvl -> lvl.add(...)) allow customization for each grouping level.They specify enumeration values for the particular level. .

## Examples
### Level 1

#### How does it look?
 ![level 1.png](level%201.png)

#### How to add?

`Step 1`  Add field DTO

`Step 2`  Add levels

```
     fields.defaultGroupingHierarchy(
        MyExampleDTO_.customFieldDictionary,
            lvl -> lvl
                .add(CustomFieldDictionaryEnum.LEVEL_1_HIGH)
                .add(CustomFieldDictionaryEnum.LEVEL_1_MIDDLE)
    );

```

Example Hierarchy Structure:

    Level 1 (High):
    Level 1 (Middle).

### Level 2

#### How does it look?
![level 2.png](level%202.png)

#### How to add?

`Step 1`  Add list of fields DTO

`Step 2`  Add levels 
```
    fields.defaultGroupingHierarchy(
                    MyExampleDTO_.customFieldDictionary,
                    MyExampleDTO_.customFieldDictionaryLevelTwo,
                    lvl -> lvl
                            .add(
                                    CustomFieldDictionaryEnum.LEVEL_1_HIGH,
                                    lvl2 -> lvl2
                                            .add(CustomFieldDictionaryLevelTwoEnum.LEVEL_2_MIDDLE)
                                            .add(CustomFieldDictionaryLevelTwoEnum.LEVEL_2_HIGH)
                            )
                            .add(
                                    CustomFieldDictionaryEnum.LEVEL_1_MIDDLE
                            )
            );
        }
```

Example Hierarchy Structure:

    Level 1 (High):
        Level 2 (High):
        Level 2 (Middle).
    Level 1 (Middle).

### Level 3

#### How does it look?
![level 3.png](level%203.png)

#### How to add?

`Step 1`  Add list of fields DTO

`Step 2`  Add levels

```
	fields.defaultGroupingHierarchy(
				MyExampleDTO_.customFieldDictionary,
				MyExampleDTO_.customFieldDictionaryLevelTwo,
				MyExampleDTO_.customFieldDictionaryLevelThree,
				lvl -> lvl
						.add(
								CustomFieldDictionaryEnum.LEVEL_1_HIGH,
								lvl2 -> lvl2
										.add(
												CustomFieldDictionaryLevelTwoEnum.LEVEL_2_MIDDLE,
												lvl3 -> lvl3
														.add(CustomFieldDictionaryLevelThreeEnum.LEVEL_3_MIDDLE)
										)
						)
						.add(
								CustomFieldDictionaryEnum.LEVEL_1_MIDDLE,
								lvl2 -> lvl2
										.add(
												CustomFieldDictionaryLevelTwoEnum.LEVEL_2_MIDDLE,
												lvl3 -> lvl3
														.add(CustomFieldDictionaryLevelThreeEnum.LEVEL_3_MIDDLE)
										)
						)
		);

```

Example Hierarchy Structure:

    Level 1 (High):
        Level 2 (Middle):
            Level 3 (Middle).
    Level 1 (Middle):
        Level 2 (Middle):
            Level 3 (Middle).


### Level 4
#### How does it look?
![level 4.png](level%204.png)

#### How to add?

`Step 1`  Add list of fields DTO

`Step 2`  Add levels

```
  fields.defaultGroupingHierarchy(
                MyExampleDTO_.customFieldDictionary,
                MyExampleDTO_.customFieldDictionaryLevelTwo,
                MyExampleDTO_.customFieldDictionaryLevelThree,
                MyExampleDTO_.customFieldDictionaryLevelFour,
                lvl -> lvl
                        .add(
                                CustomFieldDictionaryEnum.LEVEL_1_HIGH,
                                lvl2 -> lvl2
                                        .add(
                                                CustomFieldDictionaryLevelTwoEnum.LEVEL_2_MIDDLE,
                                                lvl3 -> lvl3
                                                        .add(
                                                                CustomFieldDictionaryLevelThreeEnum.LEVEL_3_MIDDLE,
                                                                lvl4 -> lvl4.add(CustomFieldDictionaryLevelFourEnum.LEVEL_4_HIGH)
														)
                                        )
                        )
                        .add(
                                CustomFieldDictionaryEnum.LEVEL_1_MIDDLE,
                                lvl2 -> lvl2
                                        .add(
                                                CustomFieldDictionaryLevelTwoEnum.LEVEL_2_MIDDLE,
                                                lvl3 -> lvl3
                                                        .add(CustomFieldDictionaryLevelThreeEnum.LEVEL_3_MIDDLE)
                                        )
                        )
        );
```

Example Hierarchy Structure:

    Level 1 (High):
        Level 2 (Middle):
            Level 3 (Middle):
                Level 4 (High).
    Level 1 (Middle).
        Level 2 (Middle):
            Level 3 (Middle).

### Level 5
#### How does it look?
![level 5.png](level%205.png)

#### How to add?

`Step 1`  Add list of fields DTO

`Step 2`  Add levels

```
        fields.defaultGroupingHierarchy(
                List.of(
                        MyExampleDTO_.customFieldDictionary,
                        MyExampleDTO_.customFieldDictionaryLevelTwo,
                        MyExampleDTO_.customFieldDictionaryLevelThree,
                        MyExampleDTO_.customFieldDictionaryLevelFour,
                        MyExampleDTO_.customFieldDictionaryLevelFive
                ),
                new Hierarchy<Object, Hierarchy<Object, Hierarchy<Object, Hierarchy<Object, Hierarchy<Object, ?>>>>>()
                        .add(
                                CustomFieldDictionaryEnum.LEVEL_1_HIGH,
                                lvl2 -> lvl2.add(
                                        CustomFieldDictionaryLevelTwoEnum.LEVEL_2_MIDDLE,
                                        lvl3 -> lvl3.add(
                                                CustomFieldDictionaryLevelThreeEnum.LEVEL_3_MIDDLE,
                                                lvl4 -> lvl4.add(
                                                        CustomFieldDictionaryLevelFourEnum.LEVEL_4_MIDDLE,
                                                        lvl5 -> lvl5.add(
                                                                CustomFieldDictionaryLevelFiveEnum.LEVEL_5_HIGH)))
                                )
                        )
                        .add(
                                CustomFieldDictionaryEnum.LEVEL_1_MIDDLE,
                                lvl2 -> lvl2.add(
                                        CustomFieldDictionaryLevelTwoEnum.LEVEL_2_MIDDLE,
                                        lvl3 -> lvl3.add(CustomFieldDictionaryLevelThreeEnum.LEVEL_3_MIDDLE)
                                )
                        )
        );
```

Example Hierarchy Structure:

    Level 1 (High):
        Level 2 (Middle):
            Level 3 (Middle):
                Level 4 (Middle):
                    Level 5 (High).
    Level 1 (Middle).
        Level 2 (Middle):
            Level 3 (Middle).
