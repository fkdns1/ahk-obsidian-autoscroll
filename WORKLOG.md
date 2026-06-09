# Worklog

This script is a focused AutoHotkey v2 module for Obsidian.

Development notes:

- scoped hotkeys to `Obsidian.exe`
- middle-click starts a slow vertical autoscroll mode
- cursor distance from the start point controls scroll rate
- left click, right click, middle click, or Esc stops autoscroll
- tuning variables are kept near the top for practical adjustment

Generated runner scripts and private runtime configuration were excluded from this repository.

## 2026-06-09 - Public repository hardening pass

- Expanded README into a project-oriented overview with setup, validation, and privacy notes.
- Added CHANGELOG, ROADMAP, CONTRIBUTING, design notes, validation checklist, and issue templates.
- Kept the public copy free of generated runners, local settings, backups, and machine-specific paths.

## 2026-06-09 - Subagent review follow-up

- Maintenance reviewer and open-source readiness reviewer both flagged a README template substitution bug in the Quick Start section.
- Fixed the script filename reference and normalized the MIT license text for GitHub license detection.
- Kept the change limited to user-facing documentation and license metadata; no runtime behavior changed.
