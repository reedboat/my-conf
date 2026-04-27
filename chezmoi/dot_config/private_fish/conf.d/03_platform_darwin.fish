# conf.d/03_platform_darwin.fish — macOS 特有配置（来自 ~/.shell_shared/platform/darwin.sh）

if test (uname) != Darwin
    exit
end

# ── Homebrew ──
eval (/opt/homebrew/bin/brew shellenv)

# ── macOS 专用 PATH ──
fish_add_path --global /opt/homebrew/opt/sqlite/bin
fish_add_path --global /opt/homebrew/opt/mysql-client/bin

# ── Go (Homebrew) ──
set -gx GOROOT /opt/homebrew/opt/go/libexec
fish_add_path --global $GOROOT/bin

# ── pnpm ──
set -gx PNPM_HOME $HOME/Library/pnpm
fish_add_path --global $PNPM_HOME

# ── bun ──
set -gx BUN_INSTALL $HOME/.bun
fish_add_path --global $BUN_INSTALL/bin

# ── CodeBuddy ──
fish_add_path --global $HOME/.codebuddy/bin
set -gx ENABLE_LSP_TOOL 1

# ── background_agent_cli ──
fish_add_path --global $HOME/background_agent_cli/bin

# ── GNU coreutils ──
fish_add_path --global /usr/local/opt/coreutils/libexec/gnubin

# ── CLICOLOR ──
set -gx CLICOLOR 1

# ── macOS 特有别名 ──
alias cby 'codebuddy -y'
alias cbr 'codebuddy -r'
alias claude codebuddy
alias cbc 'codebuddy'
alias cbcy 'codebuddy -y'
alias nskc 'npx skills add -a codebuddy -g -y'
alias nskf 'npx skills find'
alias pwtest 'npx playwright test'
alias agb agent-browser

# ── zoxide（覆盖 z 插件，用 j 命令）──
if command -q zoxide
    zoxide init fish --cmd j | source
end

# ── Starship prompt（优先级高于 tide，二选一时注释掉另一个）──
# if command -q starship
#     starship init fish | source
# end
