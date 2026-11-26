# Code samples for the documentation

The documentation includes code from [cxbox-code-samples](https://github.com/CX-Box/cxbox-code-samples)
(`src/main/java/org/demo/documentation`). Sample files have numbers in names (e.g. `MyEntity1233`) that must not
be shown in the docs, and `import`/`package` lines are hidden too.

`scripts/prepare-snippets.sh <code-samples-checkout> [output-dir]` does this cleanup (digits after letters,
`import`/`package` lines) and puts the result into `demo/documentation` (ignored by git). It fails if the samples
are missing or suspiciously few, so a broken checkout is never deployed.

Only the `documentation` folder is fetched (sparse checkout), so the download size does not depend on the rest of the
samples repository.

## CI (`.github/workflows/build_main.yml`)

Runs on push to `main`/`master`. To build with samples from another branch, run the workflow manually
(`workflow_dispatch`) and set `samples_ref`.

## Local run (Docker)

`docker compose up` runs `cxboxdoc.sh`: sparse clone of the samples, `prepare-snippets.sh`, `mkdocs serve`.

**Parallel development process.** When developing samples and documentation concurrently:
1) Push the samples branch to GitHub.
2) Set `GITHUB_BRANCH=feature/CXBOX-234` in `docker-compose.yml` (it is also used for links to GitHub).
