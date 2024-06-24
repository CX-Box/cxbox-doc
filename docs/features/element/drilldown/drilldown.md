# DrillDown
DrillDown functionality is used when we need to navigate from one place to another.

DrillDown works as follows: 

The following transition formats are possible:
 
1) [Simple transition](#Simpletransition) to a view without focusing on specific data

2) The most popular option.Transition to viewing by transmitting the [ID record](#ByIDrecord).

3) Advanced drillDown. переход на вью с получением  данных

3.1) передать фильтра по доп полям (визуально видимый)

3.2) передать фильтра по доп полям (визуально видимый) сразу на несколько сущностей

## Basics
The operation mechanism of drilldown works as follows:

* In code. Add **fields.setDrilldown** to corresponding **FieldMetaBuilder**.
   
`field` - field with drilldown

`drillDownType` - [DrillDown Types](/features/element/drilldown/drilldowntype)

`drillDown` - link 

??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/drilldowntypes/MyExample3613Meta.java:buildRowDependentMetaINNER
    --8<--
    ```
   
* REST.Backend. A link is generated within this property and sent to the frontend as metadata  `../api/v1/row-meta/..`

   ![drilldown_field.png](drilldown_field.png)

* REST.Frontend. The front end then generates a GET \data request with parameters based on specific rules. See more [Transition formats](#Transitionformats)

    ![drilldown.gif](drilldown.gif)

## <a id="Transitionformats">Transition formats</a>
### <a id="Simpletransition">Simple transition</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3611){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/drilldown/simple){:target="_blank"}

Simple transition to a view without focusing on specific data.

The link is formulated as follows:  `/screen/nameScreen/view/nameView`

Example request: `/screen/myexample3611/view/myexample3611list`

#### How does it look?
![drilldown.gif](drilldown.gif)

#### How to add?
??? Example
    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/simple/MyExample3611Meta.java:buildRowDependentMeta
    --8<--
    ```


### <a id="ByIDrecord">By ID record</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3610){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/drilldown/drilldownviewid){:target="_blank"}

The most popular option.Transition to viewing by transmitting the ID record.
Retrieve data on this entity and all its dependent entities without filtering.

Example request:
`/screen/client/view/bc/id`

#### How does it look?
![drilldownid.gif](drilldownid.gif)

#### How to add?
??? Example

    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/simple/MyExample3611Meta.java:buildRowDependentMeta
    --8<--
    ```
### <a id=" AdvanceddrillDown"> Advanced drillDown one bc</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3612){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/drilldown/advancedoneview){:target="_blank"}

Example request:
`/screen/client/view/bc/id`

#### How does it look?
![drilldownid.gif](drilldownid.gif)


#### How to add?
??? Example
    The link consists of two parts:
    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/advancedoneview/MyExample3612Meta.java:url
    --8<--
    ```

    `Step 1`  Create a link to the required widget. 
    The link is formulated as follows:  `/screen/nameScreen/view/nameView/nameBC`    
    
    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/advancedoneview/MyExample3612Meta.java:urlBC
    --8<--
    ```
    `Step 2`  Create a link with filter.
 
    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/advancedoneview/MyExample3612Meta.java:urlFilter
    --8<--
    ```

### <a id=" AdvanceddrillDown"> Advanced drillDown bc</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3612){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/drilldown/advancedoneview){:target="_blank"}

Example request:
`/screen/client/view/bc/id`
Example request:
`/screen/client/view/bc/id`

#### How does it look?
![drilldownid.gif](drilldownid.gif)

#### How to add?
??? Example

    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/simple/MyExample3611Meta.java:buildRowDependentMeta
    --8<--
    ```
#### How to add?
??? Example
    The link consists of two parts:
    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/advancedoneview/MyExample3612Meta.java:url
    --8<--
    ```

    `Step 1`  Create a link to the required widget. 
    The link is formulated as follows:  `/screen/nameScreen/view/nameView/nameBC`    
    
    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/advancedoneview/MyExample3612Meta.java:urlBC
    --8<--
    ```
    `Step 2`  Create a link with filter.
 
    ```java
    --8<--
    {{ external_links.github_raw }}/feature/drilldown/advancedoneview/MyExample3612Meta.java:urlFilter
    --8<--
    ```

 

3) advanced drillDown
   3.1) передать фильтра по доп полям (визуально видимый)

3.1.1) делаем запрос набив фильтр визуально и забираем запрос на бк из f12

http://demo.cxbox.org/api/v1/count/client/client?status.equalsOneOf=%5B%22New%22%5D&importance.equalsOneOf=%5B%22Low%22%5D

3.1.2) выделяем часть для дриллдауна - все после bc "client":
status.equalsOneOf=%5B%22New%22%5D&importance.equalsOneOf=%5B%22Low%22%5D

3.1.3)
clientFilter = UrlEncode("status.equalsOneOf=%5B%22New%22%5D&importance.equalsOneOf=%5B%22Low%22%5D")
"""/screen/client/clientlist?filters={
"client" : """ + clientFilter + ""
})"""


TODO>>провверить будет ли симпатичнее если urlEncode({
"client" : """ + clientFilter + ""
})""") сделаем


3.2) передать фильтра по доп полям (визуально видимый) сразу на несколько сущностей

clientFilter = UrlEncode("status.equalsOneOf=%5B%22New%22%5D&importance.equalsOneOf=%5B%22Low%22%5D")
b2 =  UrlEncode(..)

"""/screen/client/clientlist?filters={
"client" : """ + clientFilter + "",
"b2" : """ + b2Filter + "",
})"""


P.S.

в filter для bc можно указывать фильтры по полям, pdq, fulltextsearch


p.S.2
4) "совсем странные случаи"
   4.1) ?filters по родители и ребенку
   по идее должно работать для parentChild, но визуально это таблица под таблицей (иначе нет смысла накидывать фильтры), что бывает редко

4.2) по родителю по id, а по ребенку filters -- ДОЛЖНО РАБОТАТЬ ПРОВЕРИТЬ!

по родителю
screen/meeting/view/meetingview/meeting/1100012

по ребенку
+ ?filters =
 
`DrillDown link` is an element that lets the user navigate to another view by tapping it.
  
 