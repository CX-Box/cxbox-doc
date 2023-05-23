FROM squidfunk/mkdocs-material:9.1.14
RUN pip install --no-cache-dir \
  mkdocs-redirects
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]