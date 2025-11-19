# Minio
**Step1** Add config file.

    ```java
    --8<--
    {{ external_links.github_raw }}/conf/cxbox/customization/file/MinioFileConfig.java
    --8<--
    ```

**Step2** Add Controller  for file storage.
    ```java
    --8<--
    {{ external_links.github_raw }}/conf/cxbox/customization/file/FileController.java
    --8<--
    ```
**Step3** Add FileService  for file storage.
    ```java
    --8<--
    {{ external_links.github_raw }}/conf/cxbox/customization/file/FileService.java
    --8<--
    ```

**Step4** Disable platformFileController (before)

```java
public class DisableControllerBFPP implements BeanFactoryPostProcessor {

    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        BeanDefinitionRegistry beanDefinitionRegistry = (BeanDefinitionRegistry) beanFactory;
        beanDefinitionRegistry.removeBeanDefinition("platformFileController");
    }

}
```