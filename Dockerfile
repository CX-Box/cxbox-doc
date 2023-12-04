FROM squidfunk/mkdocs-material:9.2.5
RUN apk update && apk add curl curl-dev bash
RUN curl "http://code-samples.cxbox.org/api/v1/githubcode/" >/docs/out2.zip
RUN unzip /docs/out2.zip -d /docs
RUN chmod -R 777  /docs
RUN pip install --no-cache-dir mkdocs-redirects
RUN pip install --no-cache-dir mkdocs-markdownextradata-plugin
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]