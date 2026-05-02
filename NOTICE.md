# Notice

This repository is a Vivian / club-friendly adaptation of the `video-transcript` skill from:

- Upstream: https://github.com/Backtthefuture/huangshu/tree/main/skills/video-transcript
- Original repository: https://github.com/Backtthefuture/huangshu

The upstream README states MIT License. This adapted version keeps attribution to the original project and adds local safety / Codex / Obsidian usage notes.

## Local changes in this adaptation

- Supports Codex skill path: `~/.codex/skills/video-transcript`
- Keeps Claude Code compatibility: `~/.claude/skills/video-transcript`
- Restores default HTTPS/TLS certificate verification; does not disable certificate validation
- Adds `.env.example`; real `.env` is ignored by Git
- Recommends saving transcripts to `Clippings/video-transcripts/` inside an Obsidian vault
- Adds club-oriented README and setup instructions
