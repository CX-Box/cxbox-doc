#!/usr/bin/env bash
# Prepares code snippets for MkDocs from a checkout of CX-Box/cxbox-code-samples.
#
# Usage: scripts/prepare-snippets.sh <code-samples-checkout> [output-dir]
#   <code-samples-checkout>  directory with (at least) src/main/java/org/demo/documentation
#   [output-dir]             default: demo  (docs reference <output-dir>/documentation via github_raw_doc)
#
# What it does (same rules as the former code-samples endpoint /api/v1/githubcode):
#   - removes `import ...` and `package ...` lines
#   - removes digits that follow a letter (MyEntity1233 -> MyEntity)
# Fails if the samples are missing, so a broken checkout never gets deployed.
set -euo pipefail
export LC_ALL=C.UTF-8

SAMPLES_DIR="${1:?usage: $0 <code-samples-checkout> [output-dir]}"
OUT_DIR="${2:-demo}"
MIN_FILES="${MIN_FILES:-1000}"   # sanity threshold, there are ~12000 files now

SRC="$SAMPLES_DIR/src/main/java/org/demo/documentation"
[ -d "$SRC" ] || { echo "ERROR: $SRC not found" >&2; exit 1; }

rm -rf "$OUT_DIR/documentation"
mkdir -p "$OUT_DIR"
cp -R "$SRC" "$OUT_DIR/documentation"

COUNT=$(find "$OUT_DIR/documentation" -type f | wc -l)
if [ "$COUNT" -lt "$MIN_FILES" ]; then
  echo "ERROR: only $COUNT files in $OUT_DIR/documentation (expected >= $MIN_FILES)" >&2
  exit 1
fi

OTHER=$(find "$OUT_DIR/documentation" -type f ! -name '*.java' ! -name '*.json' | head -5)
if [ -n "$OTHER" ]; then
  echo "WARNING: files other than *.java/*.json are NOT cleaned:" >&2
  echo "$OTHER" >&2
fi

find "$OUT_DIR/documentation" -type f \( -name '*.java' -o -name '*.json' \) -exec sed -i -E \
  -e '/^[[:space:]]*(import|package) /d' \
  -e 's/([[:alpha:]])[0-9]+/\1/g' {} +

echo "Prepared $COUNT snippet files in $OUT_DIR/documentation"
