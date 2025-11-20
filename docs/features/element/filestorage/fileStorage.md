# FileStorage

**FileStorage** is a mechanism that allows the system to upload, store, retrieve, and manage files.

Business Examples:

* users upload documents or images into the system;
* the application generates files (reports, exports, templates);
* external systems send files that must be stored;
* workflow steps require attaching or retrieving documents;
* files need to be stored in different storages depending on business rules.

You can provide a source parameter during upload, which lets your business processes decide dynamically where a file should be stored storages depending on workflow rules.

This flexibility enables you to configure storage strategies that align with your domain logic without changing the user-facing behavior.

## How to add?
(since [release 2.0.9](https://doc.cxbox.org/new/version209/))

### extends AbstractCxboxFileController

`AbstractCxboxFileController` is a base controller that provides REST endpoints for uploading, downloading, and deleting files.
It delegates all file-handling operations to `CxboxFileService`.

This class implements `CxboxFileController` and should be extended by concrete controllers rather than used directly.

Extend this abstract class and annotate the subclass with @RestController and a request mapping:

```java 
@RestController
@RequestMapping("/api/files")
public class MyFileController extends AbstractCxboxFileController {
}
```
 

### implements CxboxFileService

`CxboxFileService` is an abstraction for file handling.
The service provides a unified interface for uploading, downloading, and deleting files, regardless of where the files are physically stored.

All operations work with a unique file identifier returned during upload.
Purpose of the Interface `CxboxFileService` acts as an extension point. Concrete implementations determine, where and how files are physically stored, how unique file IDs are generated,
which storage strategy is used.

This allows switching the storage backend without modifying the application's business logic.

Methods:

* `upload` - Uploads a file to the storage and returns a unique file identifier.
* `download` - Retrieves a file by its unique ID and returns it as a streaming response.
* `remove` - Deletes a previously uploaded file using its unique identifier.

!!! info
    If your business processes require uploading files to different storage locations, you can separate this logic by passing a `source` parameter.
    Based on this parameter, the system can decide which storage backend to use.

   
### Examples

* [minio](/features/element/filestorage/minio)
