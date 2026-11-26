#!/bin/sh
# Local run of the documentation: takes code snippets from CX-Box/cxbox-code-samples
# (branch from GITHUB_BRANCH, default main), cleans them and starts mkdocs.
set -e
SAMPLES_REF="${GITHUB_BRANCH:-main}"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Step1. sparse clone of code samples ($SAMPLES_REF)"
git clone --quiet --depth 1 --filter=blob:none --sparse --branch "$SAMPLES_REF" \
  https://github.com/CX-Box/cxbox-code-samples.git "$TMP_DIR/code-samples"
git -C "$TMP_DIR/code-samples" sparse-checkout set --cone src/main/java/org/demo/documentation
echo 'Step2. prepare snippets'
bash /docs/scripts/prepare-snippets.sh "$TMP_DIR/code-samples" /docs/demo
echo 'Step3. files permission'
chmod -R 777 /docs/demo
echo 'Step4. Start Application'
mkdocs serve --dev-addr=0.0.0.0:8000
