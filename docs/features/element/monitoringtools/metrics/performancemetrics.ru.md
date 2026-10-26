# Метрики производительности { #perfomance-metrics }
cxbox/core 3.0.5

cxbox-ui/core 1.37.1

[:material-play-circle: Живой пример]({{ external_links.demo }}/actuator/metrics){:target="_blank"} 

## Как это выглядит? { #how-does-it-look }
![metrics.png](metrics.png) 

## Метрики { #metrics }
Метрики бывают двух типов:

* Стандартные
* Пользовательские


### Стандартные метрики { #standard-metrics }

Описание стандартных метрик см. в [spring-boot metrics]( https://docs.spring.io/spring-boot/docs/2.0.x/reference/html/production-ready-metrics.html#production-ready-metrics-meter)

#### Как добавить? { #how-to-add }
??? Example "Пример"
    Шаг 1. Добавьте новую зависимость в pom.xml.
    ```xml
    <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
    </dependency>
    ```
    Шаг 2. Добавьте разрешение в SecurityConfig.java
    ```java
    .antMatchers("/actuator/metrics/**").permitAll()
    ```
    Шаг 3. Добавьте новые параметры окружения в application.yml
    ```
        management:
            endpoint:
                metrics:
                    enabled: true
        endpoints:
            enabled-by-default: true
            web:
                exposure:
                    include: 'metrics'
    ```
 
 
### Пользовательские метрики { #custom-metrics }
Можно посмотреть количество запросов в разных разрезах.


[:material-play-circle: Живой пример]({{ external_links.demo }}/actuator/metrics/platform-requests){:target="_blank"} Статистика всех запросов к UI

[:material-play-circle: Живой пример]({{ external_links.demo }}/actuator/metrics/platform-requests?tag=screen:client&tag=user:JOHN%20SNOW){:target="_blank"} Статистика всех запросов к экрану clients и пользователю

Пример запроса:

`../actuator/metrics/platform-requests?tag=<section name>:<section value>`
 
`{{ external_links.demo }}/actuator/metrics/platform-requests?tag=screen:client` Все запросы к экрану clients

Можно фильтровать сразу по нескольким разрезам.

`{{ external_links.demo }}/actuator/metrics/platform-requests?tag=screen:client&tag=user:JOHN%20SNOW` Все запросы пользователя к экрану clients
 
####  Как это выглядит? { #how-does-it-look_1 }
=== "Статистика всех запросов к UI"
    Пользовательские метрики приложения: подсчёт вызовов UI tesler.
    ![metrics_all_custom.png](metrics_all_custom.png)

=== "Статистика всех запросов пользователя к экрану clients"
    Пользовательские метрики приложения: подсчёт вызовов экрана clients.
    ![metrics_custom_client.gif](metrics_custom_client.gif) 

#### Как добавить? { #how-to-add_1 }
??? Example "Пример"
    Шаг 1. Добавьте новую зависимость в pom.xml.
    ```xml
    <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
    </dependency>
    ```
    Шаг 2. Добавьте разрешение в SecurityConfig.java
    ```java
    .antMatchers("/actuator/metrics/**").permitAll()
    ```
    Шаг 3. Добавьте новые параметры окружения в application.yml
    ```
        management:
            endpoint:
                metrics:
                    enabled: true
        endpoints:
            enabled-by-default: true
            web:
                exposure:
                    include: 'metrics'
    ```
    Шаг 4. Добавьте описание пользовательских метрик: screen, bc, crudmaAction, error, user.

    Имя пользовательских метрик начинается с: "platform-requests"
    
    ```java
    package org.demo.conf.cxbox.metrics;
    
    import io.micrometer.core.instrument.Counter;
    import io.micrometer.core.instrument.MeterRegistry;
    import java.util.Optional;
    import java.util.stream.Stream;
    import org.cxbox.core.crudma.CrudmaActionHolder.CrudmaAction;
    import org.cxbox.core.crudma.CrudmaEvent;
    import org.cxbox.core.crudma.bc.BusinessComponent;
    import org.demo.conf.security.cxboxkeycloak.CxboxKeycloakAccount;
    import org.springframework.context.ApplicationListener;
    import org.springframework.security.core.Authentication;
    import org.springframework.security.core.context.SecurityContext;
    import org.springframework.security.core.context.SecurityContextHolder;
    import org.springframework.stereotype.Component;
    
    @Component
    public class CrudmaEventListener implements ApplicationListener<CrudmaEvent> {
    
        public static final String UNDEFINED = "undefined";
    
        private final MeterRegistry registry;
    
        public CrudmaEventListener(MeterRegistry registry) {
            this.registry = registry;
            registry.counter("platform-requests");
        }
    
        @Override
        public final void onApplicationEvent(final CrudmaEvent event) {
            final CrudmaAction crudmaAction = event.getCrudmaAction();
            final BusinessComponent bc = crudmaAction.getBc();
            Counter counter = registry.counter(
                    "platform-requests",
                    "screen", Optional.ofNullable(bc.getHierarchy().getScreenName()).orElse(UNDEFINED),
                    "bc", Optional.ofNullable(bc.getName()).orElse(UNDEFINED),
                    "crudmaAction", Optional.ofNullable(crudmaAction.getName()).orElse(UNDEFINED),
                    "user", Optional.ofNullable(getUserLogin()).orElse(UNDEFINED),
                    "error", event.getException() == null ? "false" : "true"
            );
            counter.increment();
        }
    
        public static String getUserLogin() {
            return Stream.of(SecurityContextHolder.getContext())
                    .map(SecurityContext::getAuthentication)
                    .map(Authentication::getDetails)
                    .filter(CxboxKeycloakAccount.class::isInstance)
                    .map(CxboxKeycloakAccount.class::cast)
                    .findFirst()
                    .map(CxboxKeycloakAccount::getUsername)
                    .orElse(null);
        }
    
    }
    ```
 