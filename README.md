# fCC AI Marketplace

A public marketplace of AI-powered plugins, skills, and agents for freeCodeCamp.

## Introduction

The fCC AI Marketplace is a public collection of AI-powered tooling for freeCodeCamp staff and maintainers. It provides modular plugins, skills, and agents that work with Claude Code as the primary platform, and with 30+ other AI coding tools via the [Agent Skills](https://agentskills.io) standard.

## Installation

### Quick Install (All Tools)

Install portable skills to your preferred AI coding tool:

```sh
npx skills add freeCodeCamp/fCC-AI-Marketplace
```

To install a single skill:

```sh
npx skills add freeCodeCamp/fCC-AI-Marketplace --skill command-line-chic
```

### Claude Code Full Plugin

For the complete experience including hooks, MCP servers, and agents:

```sh
claude --plugin-dir ./plugins/<plugin-name>
```

## Catalog: Plugins

| Plugin                                            | Description                                                                               | Skills                     | Status |
| ------------------------------------------------- | ----------------------------------------------------------------------------------------- | -------------------------- | ------ |
| [spanish-curriculum](plugins/spanish-curriculum/) | Professional Spanish curriculum pipeline — Carmen, Marcos, Curriculum. CEFR levels A1-C2. | carmen, marcos, curriculum | Active |

## Catalog: Skills

| Skill                                                | Description                                                                                           | Status    |
| ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | --------- |
| [hello-world](skills/hello-world/)                   | Reference skill demonstrating every SKILL.md section and pattern. Use as a template and test fixture. | Reference |
| [command-line-chic](skills/command-line-chic/)       | freeCodeCamp's "Command-line Chic" UI design system and aesthetic guidelines.                         | Active    |
| [sync-issue-templates](skills/sync-issue-templates/) | Sync GitHub issue templates from an org's .github repo into the current repository.                   | Active    |

## Catalog: Agents

| Agent                                | Description                                                | Status    |
| ------------------------------------ | ---------------------------------------------------------- | --------- |
| [hello-world](agents/hello-world.md) | Reference agent demonstrating the agent definition format. | Reference |

## Supported Tools

Skills follow the [Agent Skills](https://agentskills.io) standard and are portable across 30+ tools. Full plugins (hooks, MCP servers, agents) are Claude Code-specific.

| Tool                                 | Skills | Full Plugins |
| ------------------------------------ | ------ | ------------ |
| Claude Code                          | Yes    | Yes          |
| Codex CLI                            | Yes    | No           |
| OpenCode                             | Yes    | No           |
| VS Code / GitHub Copilot             | Yes    | No           |
| Cursor                               | Yes    | No           |
| Gemini CLI                           | Yes    | No           |
| [and others](https://agentskills.io) | Yes    | No           |

## Contributing

See [Contributing Guidelines](CONTRIBUTING.md).

## License

Copyright (c) freeCodeCamp. This project is licensed under the [BSD 3-Clause License](https://opensource.org/licenses/BSD-3-Clause).
