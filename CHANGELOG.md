# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-05-28

### Added
- Initial release of the `julia_envs` CLI manager.
- Support for listing named environments and their packages.
- Support for adding packages and editing environment descriptions directly in `Project.toml`.
- Support for automatically creating a named environment by parsing imported packages inside a `.jl` script.
- Support for matching `.jl` scripts to satisfying environments.
- Support for matching and running scripts (`mrun`) inside a satisfying environment.
- Support for running scripts and REPL sessions inside specific environments.
- Support for safe environment deletion (`rm`) with terminal prompts.
- Support for searching the General Julia package registry in a warning-free local scope.
- Integration of ANSI color escape codes for improved terminal visual output formatting.
