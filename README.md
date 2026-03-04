# init-build

[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/DavitTec/init-build?style=for-the-badge&logo=github)](https://github.com/DavitTec/init-build/tag)
[![GitHub open issues](https://img.shields.io/github/issues-raw/DavitTec/init-build?style=for-the-badge&label=Open%20Issues)](https://github.com/DavitTec/init-build/issues)
[![GitHub top language](https://img.shields.io/github/languages/top/DavitTec/init-build?style=for-the-badge)](https://github.com/DavitTec/init-build)
[![GitHub license](https://img.shields.io/github/license/DavitTec/init-build?style=for-the-badge)](https://github.com/DavitTec/init-build)

---

## Description

Modular, state-aware project bootstrap framework.

## Purpose

`init-build` is a deterministic project initializer that:

- Creates structured directory layout
- Configures pnpm and dependencies
- Sets up Git and versioning
- Registers phase lifecycle state
- Supports snapshot and logging
- Provides sandbox test harness

Designed to be reusable across multiple projects.

---

## Features

- Phase-based build pipeline
- JSON lifecycle state tracking
- Idempotent execution
- Negative/positive test harness
- Helper system (optional)
- Strict separation of config/state

---

## Usage (Standalone)

```bash
# create folder where you want this Package
git clone https://github.com/DavitTec/init-build.git .bootstrap
cp .bootstrap/.env_example .env
```

Update your environment settings

correct `.env`

```bash
vim  ".env"

```

Run `init-build.sh`

```bash
bash .bootstrap/scripts/init-build.sh build

```

Remove bootstrap

```bash
rm -rf .bootstrap
```

---

## Commands

```bash
./scripts/init-build.sh build
./scripts/init-build.sh snapshot
./scripts/init-build.sh status
```

---

## Architecture

```bash
scripts/init-build/
  commands/
  phases/
  utils/
  state/
  config/
```

---

## Development Status

Helpers are currently disabled until upgraded for headless mode.

## Version

0.1.2
