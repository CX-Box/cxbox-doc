# Default limit page
The page limit can be configured in two ways: 

* [at the business component level](#bc-default-page-limit)
* [at the application level](#app-default-page-limit)
 
Application level - cxbox:meta:bc-default-page-limit: 5
 
## <a id="bc-default-page-limit">At the business component level</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3860){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/microservice/nextandpreviouswihhasnext){:target="_blank"}

### How does it look?
![nextAndPreviousWithHasNext.gif](nextAndPreviousWithHasNext.gif)

### How to add?
??? Example

   Add  BC_PROPERTIES TABLE
    Add 
   BC
   FILTER - "Фильтр(JSON)"
   PAGE_LIMIT      - Лимит страницы по умолчанию  
   REPORT_PERIOD - Интервал даты по умолчанию
   SORT Сортировка по умолчани
   DIM_FILTER_SPEC
   BC_READ_ONLY_FLG_FIELD =Поле с ДТО, при значении поля true блокирует запись"
  

## <a id="app-default-page-limit">At the application level</a>
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3860){:target="_blank"} ·
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/feature/microservice/nextandpreviouswihhasnext){:target="_blank"}

### How does it look?
![nextAndPreviousWithHasNext.gif](nextAndPreviousWithHasNext.gif)

### How to add?
??? Example

    Add `bc-default-page-limit` in application.yml  

     cxbox:
        meta:
            bc-default-page-limit: 5
 