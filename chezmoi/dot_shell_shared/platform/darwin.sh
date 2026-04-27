# shell_shared/platform/darwin.sh — macOS 特有配置

# ── Homebrew ──
eval "$(/opt/homebrew/bin/brew shellenv)"

# ── macOS 专用 PATH ──
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# ── Go (Homebrew) ──
export GOROOT=/opt/homebrew/opt/go/libexec
export PATH="$PATH:$GOROOT/bin"

# ── pnpm ──
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ── bun ──
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ── CodeBuddy ──
export PATH="$HOME/.codebuddy/bin:$PATH"
export ENABLE_LSP_TOOL=1

# ── background_agent_cli ──
export PATH="$HOME/background_agent_cli/bin:$PATH"

# ── GNU coreutils ──
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# ── CLICOLOR ──
export CLICOLOR=1

# ── macOS 特有别名 ──
alias cby='codebuddy -y'
alias cbr='codebuddy -r'
alias claude=codebuddy
alias cbc='codebuddy'
alias cbcy='codebuddy -y'
alias nskc='npx skills add -a codebuddy -g -y'
alias nskf='npx skills find'
alias pwtest='npx playwright test'
alias agb='agent-browser'

# ── Modern CLI replacements ──
if command -v bat &>/dev/null; then
  alias cat='bat --paging=never'
fi
if command -v eza &>/dev/null; then
  alias ls='eza --icons'
  alias ll='eza -l --icons --git'
  alias la='eza -la --icons --git'
  alias lt='eza -T --icons --level=2'
fi
if command -v fd &>/dev/null; then
  alias find='fd'
fi
if command -v dust &>/dev/null; then
  alias du='dust'
fi
if command -v duf &>/dev/null; then
  alias df='duf'
fi
if command -v procs &>/dev/null; then
  alias ps='procs'
fi
if command -v btm &>/dev/null; then
  alias top='btm'
fi
