FROM squidfunk/mkdocs-material:9.2.5
RUN apk update && apk add curl curl-dev bash
RUN pip install --no-cache-dir mkdocs-redirects
RUN pip install --no-cache-dir mkdocs-markdownextradata-plugin
COPY mkdocs.sh /opt/mkdocs.sh
ADD mkdocs.yml /opt/mkdocs.yml
RUN chmod +x /opt/mkdocs.sh
ENTRYPOINT ["/opt/mkdocs.sh"]