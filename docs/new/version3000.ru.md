# 3.0.0

* [cxbox/demo 3.0.0 git](https://github.com/CX-Box/cxbox-demo/tree/v.3.0.0), [примечания к релизу](https://github.com/CX-Box/cxbox-demo/releases/tag/v.3.0.0)

* ~~[cxbox/core 5.0.0 git](https://github.com/CX-Box/cxbox/tree/cxbox-5.0.0), [примечания к релизу](https://github.com/CX-Box/cxbox/releases/tag/cxbox-5.0.0), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/5.0.0)~~ , [cxbox/core 5.0.1 git](https://github.com/CX-Box/cxbox/tree/cxbox-5.0.1), [примечания к релизу](https://github.com/CX-Box/cxbox/releases/tag/cxbox-5.0.1), [maven](https://central.sonatype.com/artifact/org.cxbox/cxbox-starter-parent/5.0.1)

## **Ключевые обновления июля 2026** { #key-updates-july-2026 }

## CXBOX 5.0.1 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-5.0.1))
 
## Критические изменения. CXBOX 5.0.1 ([Core](https://github.com/CX-Box/cxbox/tree/cxbox-5.0.1)) { #breaking-changes-cxbox-501-core }
 
### Добавлено. Платформа обновлена до Spring Boot 4.0.7 { #added-upgrades-the-platform-to-spring-boot-407 }
<!-- CXBOX-1319 -->

В этом релизе платформа обновлена до:

* Spring Boot 4.0.7
* Hibernate 7.2.19


**Так как Spring Boot 3.5 будет получать открытые обновления только до [30 июня 2026](https://endoflife.date/spring-boot),
мы обновляем проект до Spring Boot 4.0.7 и Hibernate ORM 7.2.19, чтобы обеспечить дальнейшую поддержку и доступ к новым возможностям и улучшениям**
 
**Настоятельно рекомендуем выполнять обновление в следующей последовательности** подробнее см. [Руководство по миграции на Spring Boot 4.0](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-4.0-Migration-Guide)

1) Шаг 1. Обновитесь до [CXBOX 4.0.0-M25](https://github.com/CX-Box/cxbox/tree/cxbox-4.0.0-M25) [Руководство по миграции CXBOX](/ru/new/migrationguide3515/)
 
2) Шаг 2. Обновитесь до CXBOX 5.0.1
 
| Старая версия          | Новая версия          | Руководство по миграции                                                                                                                                                                                                                                         |
|------------------------|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Spring Boot 3.5.15** | **Spring Boot 4.0.7** | [Руководство по миграции на Spring Boot 4.0](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-4.0-Migration-Guide)                                                                                                                               |
| **Hibernate 6.6.53**   | **Hibernate  7.2.19** | [Руководство по миграции на Hibernate 7.0](https://docs.hibernate.org/orm/7.0/migration-guide/), [Руководство по миграции на Hibernate 7.1](https://docs.hibernate.org/orm/7.1/migration-guide/), [Руководство по миграции на Hibernate 7.2](https://docs.hibernate.org/orm/7.2/migration-guide/) |
| **4.0.0-M26**          | **5.0.1**             | [Руководство по миграции CXBOX](/ru/new/migrationguide407/)                                                                                                                                                                                                        |

 