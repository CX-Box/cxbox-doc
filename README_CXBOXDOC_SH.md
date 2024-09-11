# Download file.zip with code_samples 
Причины:
* Performance Improvement: Due to the slowdown caused by frequent access to .md files as the number of documents and links increased, it was decided to load the supply directly into the documentation container.
* Code Example API: An API has been created in the sample repository to transform code by removing numbers (e.g., myEntity1233 to myEntity) for cleaner example output.

To access and download the latest code samples from the main branch, use the following command:
`curl "http://code-samples.cxbox.org/api/v1/githubcode/" >/docs/out.zip`

**Parallel Development Process**
When developing samples and documentation concurrently:
1) Push the branch to the Git server.
2) Update the cxboxdoc.sh file to include the branch name as `githubcode/feature/CXBOX-234` after `githubcode/`.
 
`curl "http://code-samples.cxbox.org/api/v1/githubcode/feature/CXBOX-234" >/docs/out.zip`
