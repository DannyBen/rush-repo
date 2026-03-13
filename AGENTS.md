# AGENTS.md

## Scope
- These instructions apply to the entire repository.

## Repository Model
- This is a **Rush package repository** (consumed by the `rush` command), not the Rush CLI source code.
- Most installable packages are represented by a directory that contains:
  - `info`: short human-readable description.
  - `main`: install logic (bash).
  - `undo`: uninstall/rollback logic (bash).
- Shared bash helpers are loaded from `lib.sh`, which sources `_lib/*.sh`.

## Editing Guidelines
- Prefer small, focused changes to a specific package folder (`<package>/info`, `<package>/main`, `<package>/undo`).
- Keep scripts bash-compatible and consistent with existing style.
- Reuse `lib.sh` helpers (`package_install`, `package_uninstall`, distro helpers, etc.) when possible instead of duplicating logic.
- Preserve portability across supported Linux distros where feasible (Arch, Debian/Ubuntu, Fedora patterns exist in `_lib`).
- `_lib` is organized by domain (`core/`, `platform/`, `installers/`, `rush/`, `shell/`); keep helper files small and group tightly related install/uninstall pairs together.

## Validation
- Run `./test.sh` after meaningful script changes (shellcheck over `_lib` and package `main`/`undo` files).
- If touching only docs/metadata, skip tests only when clearly unnecessary.

## Agent Working Notes
- Do not assume all folders are packages; internal folders like `_lib`, `_archive`, and `my/` have special roles.
- Prefer reading a nearby existing package as a template before introducing a new one.
- For edits to system config files, prefer managed marker blocks so `undo` can remove only changes introduced by the package.
- Do not add backward-compatibility code unless explicitly requested by the user.
- **Occasionally update this `AGENTS.md` with new findings** (new conventions, pitfalls, validation steps, or workflow improvements) discovered while working in this repo.
