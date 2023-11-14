FROM squidfunk/mkdocs-material:9.2.5
VOLUME ["/documentation"]
WORKDIR /documentation
RUN apk update && apk add curl curl-dev bash
RUN curl "http://code-samples.cxbox.org/api/v1/githubcode/" >/documentation/githubcode.zip
RUN unzip /documentation/githubcode.zip -d /documentation/cleardocumentation
RUN chmod -R 777 /documentation/cleardocumentation
RUN pip install --no-cache-dir mkdocs-redirects
RUN pip install --no-cache-dir mkdocs-markdownextradata-plugin
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]