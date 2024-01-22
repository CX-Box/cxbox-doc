#!/bin/bash
echo 'filesh'
cp  /opt/mkdocs.yml /docs/mkdocs.yml
mkdocs serve --dev-addr=0.0.0.0:8000