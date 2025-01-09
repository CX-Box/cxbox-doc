# FullTextSearch 
[:material-play-circle: Live Sample]({{ external_links.code_samples }}/ui/#/screen/myexample3614){:target="_blank"}
[:fontawesome-brands-github: GitHub]({{ external_links.github_ui }}/{{ external_links.github_branch }}/src/main/java/org/demo/documentation/property/filtration/fulltextsearch){:target="_blank"}

When the user types in the full text search input area, then widget filters the rows that match the search query
(search criteria is configurable and will usually check if at least one column has corresponding value). 
This feature makes it easier for users to quickly find the information they are looking for within a List widget.

## Basic
It only works for the widget `List` type. [List widget](/widget/type/list/list)

### How does it look?
![fulltextsearch.gif](fulltextsearch.gif)

### How to add?
??? Example

    `Step 1` Add extension file FullTextSearchExt.java
    ```java
    import java.util.Optional;
    import jakarta.persistence.criteria.CriteriaBuilder;
    import jakarta.persistence.criteria.Path;
    import jakarta.persistence.criteria.Predicate;
    import lombok.NonNull;
    import lombok.experimental.UtilityClass;
    import org.apache.commons.lang3.StringUtils;
    import org.cxbox.core.crudma.bc.BusinessComponent;
    
    @UtilityClass
    public class FullTextSearchExt {
    
        @NonNull
        public static Optional<String> getFullTextSearchFilterParam(BusinessComponent bc) {
            return Optional.ofNullable(bc.getParameters().getParameter("_fullTextSearch"));
        }
    
        public static Predicate likeIgnoreCase(String value, CriteriaBuilder cb, Path<String> path) {
            return cb.like(cb.lower(path), StringUtils.lowerCase("%" + value + "%"));
        }
    
    }
    ```
  
    `Step 2` Add **specifications** for fulltextsearch fields to corresponding **JpaRepository**. 
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/property/filtration/fulltextsearch/MyEntity3614Repository.java
    --8<--
    ```

    `Step 4` Add **getSpecification** to corresponding **VersionAwareResponseService**. 
    ```java
    --8<--
    {{ external_links.github_raw_doc }}/property/filtration/fulltextsearch/MyExample3614Service.java:getSpecification
    --8<--
    ```

    `Step 5` Add **fullTextSearch** to corresponding **.widget.json**. 

    `enabled` true/false  

    `placeholder` - description for  fullTextSearch
        
    ```json
    --8<--
    {{ external_links.github_raw_doc }}/property/filtration/fulltextsearch/MyExample3614List.widget.json
    --8<--
    ```