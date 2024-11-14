#!/bin/bash
echo 'Step1. delete out.zip'
rm /docs/out.zip
echo 'Step2. delete folder documentation'
rm -rf /docs/documentation
echo 'Step3. download data'
curl "http://code-samples.cxbox.org/api/v1/githubcode/feature/CXBOX-656" >/docs/out.zip
echo 'Step4. unzip data'
unzip /docs/out.zip
echo 'Step5 delete out.zip'
rm /docs/out.zip
echo 'Step6. files permission'
chmod -R 777 /docs/
echo 'Step7. Start Application'
mkdocs serve --dev-addr=0.0.0.0:8000
