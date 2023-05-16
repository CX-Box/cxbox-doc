FROM squidfunk/mkdocs-material:8.5.10
RUN pip install --no-cache-dir \
  mkdocs-redirects
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]