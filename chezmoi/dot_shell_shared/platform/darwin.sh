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
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

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
alias nskc='npx skills add -a codebuddy -g -y'
alias nskf='npx skills find'
alias pwtest='npx playwright test'
alias agb='agent-browser'

# ── zoxide ──
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init ${SHELL##*/} --cmd j)"
fi

# ── Starship prompt ──
if command -v starship &>/dev/null; then
  eval "$(starship init ${SHELL##*/})"
fi
