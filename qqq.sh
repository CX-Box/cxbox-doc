#!/bin/bash
echo 'someshit'
cp -r /opt/documentation /docs/documentation
cp  /opt/mkdocs.yml /docs/mkdocs.yml
cd /docs
mkdocs serve --dev-addr=0.0.0.0:8000