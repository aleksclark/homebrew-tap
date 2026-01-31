# Homebrew Tap for Crush Modules

Unofficial Homebrew formulas for [crush-modules](https://github.com/aleksclark/crush-modules).

## Installation

```bash
brew tap aleksclark/tap
brew install crush-extended
# or
brew install xcrush
```

## Available Packages

### crush-extended

⚠️  **UNOFFICIAL, UNTESTED BUILD** ⚠️

Crush AI assistant with additional community plugins.

This is NOT an official Charm Labs release. This extended build includes
experimental plugins that have not been reviewed or tested by Charm Labs.
Use at your own risk.

**Included plugins:**
- otlp: OpenTelemetry tracing
- agent-status: Status file reporting  
- periodic-prompts: Scheduled prompt execution

For the official Crush release, visit: https://github.com/charmbracelet/crush

### xcrush

⚠️  **UNOFFICIAL TOOL** ⚠️

Build tool for creating custom Crush distributions with plugins.

This is NOT an official Charm Labs tool. Use at your own risk.

## Conflicts

Note: `crush-extended` conflicts with the official `crush` package. You cannot
have both installed simultaneously.

## Support

These are unofficial builds. For issues with the extended version or plugins,
please open an issue at: https://github.com/aleksclark/crush-modules/issues

For issues with official Crush, visit: https://github.com/charmbracelet/crush/issues
