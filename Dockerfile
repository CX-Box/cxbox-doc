FROM squidfunk/mkdocs-material:9.2.5
RUN apk update && apk add curl curl-dev bash
RUN pip install --no-cache-dir mkdocs-redirects
RUN pip install --no-cache-dir mkdocs-markdownextradata-plugin
COPY cxboxdoc.sh /opt/cxboxdoc.sh
COPY cxboxdoc.sh /opt/cxboxdoc.sh
RUN chmod +x /opt/cxboxdoc.sh
ENTRYPOINT ["/opt/cxboxdoc.sh"]
