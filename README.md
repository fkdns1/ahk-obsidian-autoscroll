# Obsidian Auto Scroll

An AutoHotkey v2 reading helper for controlled auto-scroll behavior in Obsidian-focused workflows.

## Why this exists

Long note review sessions often need hands-off scrolling while still allowing quick manual interruption. This utility keeps the scope narrow: better reading ergonomics for Obsidian on Windows.

## Features

- Obsidian-scoped automation rather than global scroll interception
- Keyboard-driven scroll control for reading sessions
- Simple single-file deployment
- Public copy excludes vault paths and personal note structure

## Quick Start

1. Install AutoHotkey v2 on Windows.
2. Download `Obsidian_Scroll.ahk` from this repository.
3. Review the configuration notes below.
4. Run the script with AutoHotkey v2.

## Safety and Scope

This script targets Obsidian window behavior only. It does not read, parse, upload, or inspect vault contents.

## Configuration

Check the hotkeys in the script and adjust them if they conflict with your Obsidian shortcuts.

## Validation

The public copy is checked with AutoHotkey's validation mode:

`powershell
AutoHotkey64.exe /Validate /ErrorStdOut Obsidian_Scroll.ahk
`

See [docs/VALIDATION.md](docs/VALIDATION.md) for the current manual test checklist.

## Project Status

This is a sanitized public release of a personal Windows automation utility. The repository keeps the useful script, documentation, and project notes while excluding generated runner files, private settings, and machine-specific paths.

## Documentation

- [WORKLOG.md](WORKLOG.md) records the Codex-assisted iteration notes.
- [CHANGELOG.md](CHANGELOG.md) records public release history.
- [ROADMAP.md](ROADMAP.md) tracks planned improvements.
- [CONTRIBUTING.md](CONTRIBUTING.md) explains how to report issues or propose changes.
- [docs/DESIGN.md](docs/DESIGN.md) summarizes the design boundaries.