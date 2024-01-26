#!/bin/bash
echo 'curl'
curl "http://code-samples.cxbox.org/api/v1/githubcode/" >/docs/out.zip
echo 'unzip'
unzip /docs/out.zip
echo 'chmod'
chmod -R 777 /docs/
echo 'serve'
mkdocs serve --dev-addr=0.0.0.0:8000
