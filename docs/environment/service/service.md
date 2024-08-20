# Service

!!! warning line end "Work in progress" 

## Basics
### VersionAwareResponseService

[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/InputBasic){:target="_blank"} ·

VersionAwareResponseService is utilized for directly outputting data from a table, 
where the number of output rows matches the number of records in the table. 
This service does not perform any complex data aggregation. 
However, if you need to output data from a view, any necessary data transformations can be handled within the view itself.
??? Example 
      ```java
      --8<--
      {{ external_links.github_raw_doc }}/fields/input/basic/InputBasicService.java
      --8<--
      ```
#### doUpdateEntity
!!! tips
      This method should not perform any actions with side effects, as it is invoked multiple times by the kernel.
      Any calls to external services that modify data or perform actions should be handled in the button invoker.

### AnySourceVersionAwareResponseService
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·

AnySourceVersionAwareResponseService enables data display from any source: external data sources and aggregated data from databases.
For directly outputting data from the database, it is recommended to use VersionAwareResponseService.

??? Example  

     ```java
     --8<--
     {{ external_links.github_raw_doc }}/feature/microservice/existingmicroservices/MyExample3800Service.java
     --8<--
     ```

#### doUpdateEntity
!!! tips
      This method should not perform any actions with side effects, as it is invoked multiple times by the kernel. You are limited to adding actions only to the current transaction.
      Any calls to external services that modify data or perform actions should be handled in the button invoker.
