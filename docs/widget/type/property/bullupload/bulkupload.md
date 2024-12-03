# Bulk upload
!!! warning line end "Work in progress"
 
## <a id="nextAndPreviousWithHasNext">nextAndPreviousWithHasNext</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3860){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/microservice/nextandpreviouswihhasnext){:target="_blank"}

### How does it look?
![nextAndPreviousWithHasNext.gif](nextAndPreviousWithHasNext.gif)

### How to add?
??? Example

    [:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3860){:target="_blank"} ·
    [:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/microservice/nextandpreviouswihhasnext){:target="_blank"}

    {
      "title": "Custom Field FileUpload",
      "key": "customFieldFile",
      "type": "fileUpload",
      "fileIdKey": "customFieldFileId",
      "preview": {
        "enabled": true,
        "mode": "popup"
      }
    },

                .associate(ast -> ast
                        .withCustomParameter(Map.of("subtype", "multiFileUpload"))
                        .text("Add Files")
                )

fields.setFileAccept(MyExample3129DTO_.customFieldFile, List.of(".png", ".pdf", ".jpg", ".jpeg"));