# RelationGraph

`RelationGraph` visualizes relationships between nodes in a graph: nodes are connected with edges and can display labels, values, and drilldown behavior.

## Basics
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample6150){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/widgets/relationGraph){:target="_blank"}

### How does it look?
The widget renders nodes and edges based on the provided `fields` and `options.relationGraph` configuration (see the example below).

###  <a id="Howtoaddbacis">How to add?</a>
??? Example
    **Step 1** Create a `*.widget.json` file with `type = "RelationGraph"`.

    The widget `fields[].key` must match properties in your `DataResponseDTO`.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/relationGraph/myexample6150RelationGraph.widget.json
    --8<--
    ```

    **Step 2** Add the widget to the corresponding `*.view.json`.
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/widgets/relationGraph/myexample6150.view.json
    --8<--
    ```

    **Step 3** Configure the backend metadata in your `FieldMetaBuilder` (enable fields and drilldown).
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/relationGraph/Myexample6150MetaBuilder.java
    --8<--
    ```

    **Step 4** Provide CRUD actions (if you want action buttons) via your `VersionAwareResponseService#getActions()`.
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/widgets/relationGraph/Myexample6150Service.java
    --8<--
    ```

## <a id="Title">Title</a>
`Title` for widget (optional).

There are types of:
* `constant title`: shows constant text.
* `constant title empty`: remove the `title` parameter to hide it (useful when you want a tighter layout).

#### How to add?
??? Example
    **Constant title**
        Add `"title"` to `*.widget.json`.
        ```json
        --8<--
        {{ external_links.github_raw_doc }}/widgets/relationGraph/myexample6150RelationGraph.widget.json
        --8<--
        ```

    **Constant title empty**
        Remove the `title` parameter from `*.widget.json`.

## <a id="bc">Business component</a>
This specifies the business component (BC) to which this RelationGraph belongs.

see more  [Business component](/environment/businesscomponent/businesscomponent/)

## <a id="Showcondition">Show condition</a>
see more [showCondition](/widget/type/property/showcondition/showcondition)

* `no show condition - recommended`: widget always visible
* `show condition by current entity`: condition can include boolean expression depending on current entity fields

!!! tips
    It is recommended not to use `Show condition` when possible, because wide usage of this feature makes application hard to support.

## <a id="fields">Fields</a>
Fields configuration. The `fields` array defines the values used to build nodes and edges.

Each field item contains:
* `title` (optional): label in the UI
* `key` (required): name of the corresponding property in your `DataResponseDTO`
* `type` (required): field type (e.g. `input`, `dictionary`)

RelationGraph-specific optional properties:
* `bgColorKey`: key of a field whose value is used as a background color for the corresponding node/edge.
* `drilldown`: when `true`, clicking the value triggers drilldown (must also be configured in your `FieldMetaBuilder`).

### Main fields in the example
The example widget uses these keys:
* `id`: internal row id (comes from the DTO’s `id`)
* `sourceNodeId`: source node id (root can be represented with `null`)
* `targetNodeId`: target node id (also used as a node color via `targetNodeBgColorKey`)
* `targetNodeType`: node type (`dictionary`)
* `targetNodeName`: node label/description key (configured in `options.relationGraph.nodes.descriptionFieldKeys`)
* `targetNodeDescription`: node description
* `edgeDescription`: edge label part (configured in `options.relationGraph.edges.labelFieldKeys`)
* `edgeValue`: edge value label part + drilldown (configured in `options.relationGraph.edges.labelFieldKeys` and enabled in `FieldMetaBuilder`)

## Data requirements (root node, node types)
How `RelationGraph` builds the graph depends on the data returned by your BC:

* To let the frontend declare the root node, the dataset must contain at least one “root row” where `sourceNodeId = null`.
* `targetNodeType` should match your dictionary/enum values (the example uses `TargetNodeTypeEnum`, e.g. `"main"`).

Example test data loader (root row):
```java
--8<--
{{ external_links.github_raw_doc }}/widgets/relationGraph/MyEntity6150TestDataLoadService.java
--8<--
```

Example enum:
```java
--8<--
{{ external_links.github_raw_doc }}/widgets/relationGraph/enums/TargetNodeTypeEnum.java
--8<--
```

## <a id="options">Options</a>
`options` defines widget rendering configuration.

### options.relationGraph
Example structure:
```json
{
  "options": {
    "relationGraph": {
      "mode": "TB",
      "dragNode": true,
      "nodes": {
        "descriptionFieldKeys": ["targetNodeName"]
      },
      "edges": {
        "labelFieldKeys": ["edgeDescription", "edgeValue"],
        "type": "polyline"
      }
    }
  }
}
```

Supported properties (as shown in the example):
* `mode`: graph layout direction. Example: `TB` (top-to-bottom)
* `dragNode`: enables drag-and-drop positioning of nodes
* `nodes.descriptionFieldKeys`: which DTO field keys are used to build node description/label
* `edges.labelFieldKeys`: which DTO field keys are used to build edge labels (shown along the connection)
* `edges.type`: edge rendering type. Example: `polyline`

### options.actionGroups
`options.actionGroups.include` controls which backend actions are visible as UI action buttons.

For example, the widget may declare an empty list:
```json
"actionGroups": {
  "include": []
}
```

The actions themselves are provided by your `VersionAwareResponseService` implementation (for example, `Create`, `Delete`, `Save`).

## Actions
`Actions` are shown as UI buttons depending on what your BC returns from `VersionAwareResponseService#getActions()`.

In the `RelationGraph` example, the service declares:
* `Create`
* `Delete`
* `Save`

If you use `options.actionGroups.include`, make sure its names match the action identifiers used by the backend.

