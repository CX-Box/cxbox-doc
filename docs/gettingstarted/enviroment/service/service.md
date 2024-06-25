# Service

!!! warning line end "Work in progress" 

## Basics
### VersionAwareResponseService
VersionAwareResponseService is utilized for directly outputting data from a table, 
where the number of output rows matches the number of records in the table. 
This service does not perform any complex data aggregation. 
However, if you need to output data from a view, any necessary data transformations can be handled within the view itself.
??? Example  
        [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/InputBasic){:target="_blank"} ·

      ```java
      --8<--
      {{ external_links.github_raw_doc }}/input/basic/InputBasicMeta.java
      --8<--
      ```
}

### AnySourceVersionAwareResponseService
AnySourceVersionAwareResponseService enables data display from any source: external data sources and aggregated data from databases.
For directly outputting data from the database, it is recommended to use VersionAwareResponseService.

??? Example  
    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3800){:target="_blank"} ·

    - **Step1** Create **Service**  extends **AnySourceVersionAwareResponseService**
      ```java
      --8<--
      {{ external_links.github_raw_doc }}/microservice/MyExample3800DTO.java
      --8<--
      ```
