# FileStorage

Add FileStorage
=== "minio"

    **Step1** Add config file.
    ```java
    @Configuration
    public class PlatformFileMinioConfig {
        @Bean
        public MinioClient minioClient(
                @Value("${minio.access.name}") String accessKey,
                @Value("${minio.access.secret}") String accessSecret,
                @Value("${minio.url}") String minioUrl) {
            return MinioClient.builder()
                    .endpoint(minioUrl)
                    .credentials(accessKey, accessSecret)
                    .build();
        }    
    }
    ```

    **Step2** Add Controller  for file storage.
    ```java
    public class PlatformMinioFileController {
    public static final String FILENAME_FIELD = "filename";
    public static final	int FIVE_MIB = 5242880;
    private final MinioClient minioClient;
    private final String defaultBucketName;
    
        public PlatformDemoMinioFileController(
                MinioClient minioClient,
                @Value("${minio.bucket.name}") String defaultBucketName
        ) {
            this.minioClient = minioClient;
            this.defaultBucketName = defaultBucketName;
        }
    
        @SneakyThrows
        @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
        public PlatformResponseDTO<FileUploadDto> upload(MultipartFile file, String source) {
            String contentType = file.getContentType();
            String name = file.getOriginalFilename();
            ObjectWriteResponse objectWriteResponse = minioClient.putObject(PutObjectArgs
                    .builder()
                    .bucket(defaultBucketName)
                    .object(UUID.randomUUID().toString())
                    .contentType(contentType)
                    .userMetadata(Collections.singletonMap(FILENAME_FIELD, name))
                    .stream(file.getInputStream(), -1, FIVE_MIB)
                    .build()
            );
            String id = objectWriteResponse.object();
            return new PlatformResponseDTO<FileUploadDto>()
                    .setData(new FileUploadDto(id, name, contentType));
        }
    
        @SneakyThrows
        @GetMapping
        public ResponseEntity<StreamingResponseBody> download(String id, String source, boolean preview) {
            GetObjectResponse getObjectResponse = minioClient.getObject(GetObjectArgs
                    .builder()
                    .bucket(defaultBucketName)
                    .object(id)
                    .build()
            );
            StatObjectResponse statObjectResponse = minioClient.statObject(StatObjectArgs
                    .builder()
                    .bucket(defaultBucketName)
                    .object(id)
                    .build()
            );
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + statObjectResponse.userMetadata().get(FILENAME_FIELD) + "\"")
                    .contentLength(statObjectResponse.size()) //
                    .body(outputStream -> IOUtils.copy(getObjectResponse, outputStream, FIVE_MIB));
        }
    
        @SneakyThrows
        @DeleteMapping
        public PlatformResponseDTO<Void> remove(String id, String source) {
            minioClient.removeObject(RemoveObjectArgs
                    .builder()
                    .bucket(defaultBucketName)
                    .object(id)
                    .build()
            );
            return new PlatformResponseDTO<>();
        }
    
    }
    ```
    **Step3** Disable platformFileController 

    ```java
    public class DisableControllerBFPP implements BeanFactoryPostProcessor {
    
        @Override
        public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
            BeanDefinitionRegistry beanDefinitionRegistry = (BeanDefinitionRegistry) beanFactory;
            beanDefinitionRegistry.removeBeanDefinition("platformFileController");
        }
    
    }
    ```