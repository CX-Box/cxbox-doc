FROM squidfunk/mkdocs-material:9.2.5
RUN apk update && apk add curl curl-dev bash
RUN pip install --no-cache-dir mkdocs-redirects
RUN pip install --no-cache-dir mkdocs-markdownextradata-plugin
RUN pip install --no-cache-dir mkdocs-mermaid2-plugin
RUN pip install --no-cache-dir mkdocs-static-i18n==1.2.3
COPY cxboxdoc.sh /opt/cxboxdoc.sh
RUN chmod +x /opt/cxboxdoc.sh
ENTRYPOINT ["sh", "/opt/cxboxdoc.sh"]