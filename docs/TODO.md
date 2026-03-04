# TODO – init-build (Framework)

Freeze scope. Keep this minimal.

## Phase A – Stabilisation

-  Tag current version v0.1.0
-  Add dual-mode documentation to README
-  Add bootstrap usage example
-  Add embedded usage example
-  Document PROJECT_ROOT vs FRAMEWORK_ROOT logic
-  Add `--version` command

## Phase B – Hardening

-  Validate `.env` required variables
-  Add `.env` schema check (minimal)
-  Improve error messages (centralised)
-  Add `init-build.sh doctor` command
-  Ensure idempotency (running twice does not break project)

## Phase C – Later (Do Not Do Now)

-  Convert to CLI tool
-  GitHub template repo
-  Multi-project bootstrap manager
-  Plugin system

Stop there.
