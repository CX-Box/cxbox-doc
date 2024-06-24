# DrillDown
DrillDown functionality is used when we need to navigate from one place to another.

DrillDown works as follows: 

 * create a link in the field and pass it to the front end in the metadata. 
 * 
The front end then generates a GET \data request with parameters based on specific rules.




The following transition formats are possible:
 
1) Simple transition to a view without focusing on specific data

   Example request:
   `/screen/client/view`

2) the most popular option.Transition to viewing by transmitting the ID record.
Retrieve data on this entity and all its dependent entities without filtering.

   Example request:
   `/screen/client/view/bc/id` -   `http://demo.cxbox.org/api/v1/data/client/client/1100006`
3) advanced drillDown. переход на вью с получением  данных 
   3.1) передать фильтра по доп полям (визуально видимый)

    3.2) передать фильтра по доп полям (визуально видимый) сразу на несколько сущностей


 


Переходы возможны следующих 
"drillDown": "/screen/myexample4210/view/myexample4210list/myExampleBc4208?

filters={\"myExampleBc4208\":\"customFieldStatus.equalsOneOf=[\\\"New\\\"]\"}"
дриллдаун счтобы сделать были на этой вью перешли на другую с конкретным id
скрин вью (мин размер дриллдауна, если данные есть то есть)
если хочешь данные были конкретные, а не первые попавшиеся - ты хочешь указать id берется бк с формы и берешь id
через слыши


 

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

!!! warning line end "Work in progress"
<!-- 
`DrillDown link` is an element that lets the user navigate to another view by tapping it.
  

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/NumberBasic){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/money/basic){:target="_blank"}
### DrillDown Types
 
=== "INNER"
    Transition inside the application. 

    Add DrillDownType.INNER
=== "RELATIVE"
    Transition by a relative link while keeping the protocol, host, port.

    Add DrillDownType.RELATIVE
=== "дописать"


### Path making for DrillDown

=== "List widget"
    "/screen/**Name screen**/view/**Name view**/**Name bc**"

=== "Info widget"
    "/screen/**Name screen**/view/**Name view**/**Name bc**/" + **id**

=== "Form widget"
    "/screen/**Name screen**/view/**Name view**/**Name bc**/" + **id**
 -->
 