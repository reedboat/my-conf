if test "$platform" = 'osx'
    if test -x /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    end

    for path in /opt/homebrew/opt/sqlite/bin /opt/homebrew/opt/mysql-client/bin
        if test -d "$path"
            if not contains -- "$path" $PATH
                set -gx PATH "$path" $PATH
            end
        end
    end

    set -gx GOROOT /opt/homebrew/opt/go/libexec
    if test -d "$GOROOT/bin"
        if not contains -- "$GOROOT/bin" $PATH
            set -gx PATH $PATH "$GOROOT/bin"
        end
    end

    set -gx PNPM_HOME "$HOME/Library/pnpm"
    if test -d "$PNPM_HOME"
        if not contains -- "$PNPM_HOME" $PATH
            set -gx PATH "$PNPM_HOME" $PATH
        end
    end

    set -gx BUN_INSTALL "$HOME/.bun"
    if test -d "$BUN_INSTALL/bin"
        if not contains -- "$BUN_INSTALL/bin" $PATH
            set -gx PATH "$BUN_INSTALL/bin" $PATH
        end
    end

    if not contains -- "$HOME/.codebuddy/bin" $PATH
        set -gx PATH "$HOME/.codebuddy/bin" $PATH
    end
    set -gx ENABLE_LSP_TOOL 1

    if not contains -- "$HOME/background_agent_cli/bin" $PATH
        set -gx PATH "$HOME/background_agent_cli/bin" $PATH
    end

    if test -d /usr/local/opt/coreutils/libexec/gnubin
        if not contains -- /usr/local/opt/coreutils/libexec/gnubin $PATH
            set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
        end
    end

    set -gx CLICOLOR 1

    if type -q codebuddy
        alias cby 'codebuddy -y'
        alias cbr 'codebuddy -r'
        alias claude 'codebuddy'
    end

    if type -q npx
        alias nskc 'npx skills add -a codebuddy -g -y'
        alias nskf 'npx skills find'
        alias pwtest 'npx playwright test'
    end

    if type -q agent-browser
        alias agb 'agent-browser'
    end

    if type -q bat
        alias cat 'bat --paging=never'
    end

    if type -q eza
        alias ls 'eza --icons'
        alias ll 'eza -l --icons --git'
        alias la 'eza -la --icons --git'
        alias lt 'eza -T --icons --level=2'
    end

    if type -q fd
        alias find 'fd'
    end

    if type -q dust
        alias du 'dust'
    end

    if type -q duf
        alias df 'duf'
    end

    if type -q procs
        alias ps 'procs'
    end

    if type -q btm
        alias top 'btm'
    end

    if type -q zoxide
        zoxide init fish | source
    end
end
