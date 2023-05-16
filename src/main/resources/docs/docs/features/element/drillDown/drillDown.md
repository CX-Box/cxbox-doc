# DrillDown

`DrillDown link` is an element that lets the user navigate to another view by tapping it.

## Basics
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
