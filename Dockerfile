FROM squidfunk/mkdocs-material:9.2.5
RUN apk update && apk add curl curl-dev bash
RUN curl "http://code-samples.cxbox.org/api/v1/githubcode/" >/opt/out2.zip
RUN unzip /opt/out2.zip -d /opt
RUN chmod -R 777  /opt
RUN pip install --no-cache-dir mkdocs-redirects
RUN pip install --no-cache-dir mkdocs-markdownextradata-plugin
COPY qqq.sh /opt/qqq.sh
ADD mkdocs.yml /opt/mkdocs.yml
RUN chmod +x /opt/qqq.sh
#ENTRYPOINT ["mkdocs"]
#CMD ["serve", "--dev-addr=0.0.0.0:8000"]
ENTRYPOINT ["/opt/qqq.sh"]