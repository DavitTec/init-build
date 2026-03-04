# init-build

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
cp .bootstrap/.env.example .env
```

Update your environment settings

correct `.env`

```bash
vim  ".env"

```

Run `init-build.sh `

```bash
bash .bootstrap/scripts/init-build.sh build
rm -rf .bootstrap
```

Remove bootstrap

```bash
rm -rf .bootstrap
```

---

## Commands

```
./scripts/init-build.sh build
./scripts/init-build.sh snapshot
./scripts/init-build.sh status
```

---

## Architecture

```
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

0.1.1
