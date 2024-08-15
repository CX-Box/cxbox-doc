# v2.0.3

* [cxbox/demo 2.0.3 git](https://github.com/CX-Box/cxbox-demo/tree/v.2.0.3), [release notes](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.3)

* [cxbox/core 4.0.0-M5 git](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M5), [release notes](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M5), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent)

* [cxbox-ui/core 2.0.0 git](https://github.com/CX-Box/cxbox-ui/tree/2.0.0), [release notes](https://github.com/CX-Box/cxbox-ui/releases/tag/2.0.0), [npm](https://www.npmjs.com/package/@cxbox-ui/core)


## **Key updates August 2024** 
### <a id="CXBOXCORE">CXBOX 4.0.0-M5</a>  ([Core](https://github.com/CX-Box/cxbox))
#### Dependencies have been changed
* bumped org.springframework.boot/spring-boot-starter-parent to 3.2.5 from 3.2.4
* removed org.apache.commons/commons-text dependency
* removed de.odysseus.juel/* dependencies
* removed commons-io/commons-io dependency
* removed org.glassfish/javax.el dependency
* removed java.security.AccessController class usage
* removed jenkins ci pipeline file (GitHub ci is used instead)
* removed liquibase-maven-plugin dependency
* removed com.google.auto.service/auto-service dependency
* bumped jacoco-maven-plugin to 0.8.11 from 0.8.14
* removed com.sun.xml.bind/jaxb-impl dependency
* removed com.sun.xml.bind/jaxb-core dependency
* removed maven-gpg-plugin dependency and release profile from cxbox-starter-parent (they will no loner be visible in customer projects, so confusion is reduced)
* fixed dependency-review-config file folder
* removed com.google/guava dependency
* removed commons-collections4 dependency
* change commons-lang3 dependency version to be managed by spring-boot

Only 2 dependencies versions are now explicitly set in cxbox core
```xml
    <hibernate-commons-annotations.version>6.0.6.Final</hibernate-commons-annotations.version>
    <javapoet.version>1.13.0</javapoet.version>
``` 
All other dependencies versions are now managed by
```xml
<parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>3.2.5</version>
</parent>
```
so for all dependencies (except javapoet and hibernate-commons-annotations):

* core level: security issues can now be easily solved with just bumping spring-boot version in core now
* project level: dependencies versions can be overriden on project level just like in usual spring-boot app ([see](https://docs.spring.io/spring-pulsar/reference/appendix/override-boot-dependencies.html))

#### Other Changes
see [cxbox changelog](https://github.com/CX-Box/cxbox/releases/tag/cxbox-4.0.0-M5)


### CXBOX ([Demo](https://github.com/CX-Box/cxbox-demo))
#### Front. Dependencies have been changed
* axios:   1.6.0
* rc-select: 14.11.0
* @types/lodash.debounce: 4.0.9

#### New version core
New version core  CXBOX 4.0.0-M5

#### Add SIEM integration example
![siem.gif](v2.0.3/siem.gif)

Added an example demonstrating how to log `CrudmaAction` along with the associated data.
####  Fixed errors for showCondition.
![showcond.gif](v2.0.3/showcond.gif)

Resolved an error that occurred when two widgets were present on the screen in one BC with showCondition, where one widget was hidden and the other was visible
#### Fixed errors encountered during drilldown transitions.
1)  Fixed an error that occurred after switching between tabs when navigating to a screen via a link from another screen, where both the source and destination links had different BC.

![drilldown_err_1.gif](v2.0.3/drilldown_err_1.gif)

2) Resolved an error that occurred when navigating between screens via a link, where the source and target screens contained multiple widget sets based on different BCs.

![drilldown_err_2.gif](v2.0.3/drilldown_err_2.gif)

#### Added the ability to switch to a hidden view within tabs.
![drilldown_err_2.gif](v2.0.3/hidden_view.gif)

Added the ability to switch to a hidden view within tabs.

#### Other Changes
see [cxbox-demo changelog](https://github.com/CX-Box/cxbox-demo/releases/tag/v.2.0.3)
 