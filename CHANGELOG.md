# Changelog

All notable changes to this project will be documented in this file.

## [1.1.0] - 2024-12-12

### Features

- Upgrade Python to 3.13.1

### Bug Fixes

- Resolve issues with native module builds
- Correct shebangs for compatibility

### Refactor

- Remove `idlelib`, `turtle`, and `tkinter` modules

### Documentation

- *(readme)* Add pip usage instructions

### Miscellaneous Tasks

- Rename directory `python/stdlib` to `python/common`
- *(license)* Add copyright notice
## [1.0.0] - 2024-11-15

### Features

- Add support for ARM (32-bit)
- Use `tar.xz` for Python file compression

### Bug Fixes

- Correct typo in license filename
- Export `XDG_CACHE_HOME`

### Refactor

- Create symlinks in `customize.sh`
- Install Python in `/data/local/pydroid`

### Miscellaneous Tasks

- Add `.gitignore`

### Build

- Add `build.py` for module building
