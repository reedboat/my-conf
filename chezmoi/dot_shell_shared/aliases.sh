# shell_shared/aliases.sh — 通用别名（两边都能用）

# ── 目录导航 ──
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .4="cd ../../../.."

# ── ls / eza ──
if command -v eza &>/dev/null; then
  alias ls='eza --group-directories-first'
  alias ll='eza -l --group-directories-first --git'
  alias la='eza -la --group-directories-first --git'
  alias lt='eza --tree --level=2 --group-directories-first'
  alias lt3='eza --tree --level=3 --group-directories-first'
else
  alias ll='ls -al'
fi

# ── 编辑器：nvim 存在时覆盖 ──
alias v='vim'
if command -v nvim &>/dev/null; then
  alias vi='nvim'
  alias vim='nvim'
fi

# ── Python（仅存在时生效）──
if command -v python &>/dev/null; then
  alias py='python'
fi
if command -v ipython &>/dev/null; then
  alias ipy='ipython'
fi

# ── lazygit（仅存在时生效）──
if command -v lazygit &>/dev/null; then
  alias lg='lazygit'
  alias g='lazygit'
fi

# ── screen / tmux / zellij ──
alias sl='screen -ls'
alias sr='screen -D -R'
if command -v zellij &>/dev/null; then
  alias t='zellij'
elif command -v tmux &>/dev/null; then
  alias t="tmux"
fi
if command -v tmux &>/dev/null; then
  alias ta="tmux attach -t"
  alias tad="tmux attach -d -t"
  alias tdc="tmux devcvm"
  alias ts="tmux new-session -s"
  alias tl="tmux list-sessions"
  alias tk="tmux kill-session -t"
  alias tka="tmux kill-server"
fi

# ── 编码转换 ──
alias iconvgu='iconv -f gbk -t utf-8'
alias iconvug='iconv -f utf-8 -t gbk'

# ── 常用工具 ──
alias t100='tail -n 100'
alias pong='ping -c 5 '
alias mkdir="mkdir -pv"
alias df="df -h"
alias bc='bc -l'

# ── 仅 Linux 有 free 命令 ──
if command -v free &>/dev/null; then
  alias free='free -m'
fi

# ── git ──
alias ga='git add '
alias gau='git add -u'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gs='git status'
alias gss='git status -s'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gd='git diff'
alias grh='git reset HEAD'
alias gco='git checkout --'
alias gdc='git diff --cached'
alias gfetch='git fetch'
alias gar='git archive --format=\"tar.gz\" -o'

# ── git-svn（仅存在 git svn 时）──
if git svn &>/dev/null 2>&1; then
  alias gsr='git svn rebase'
  alias gsd='git svn dcommit'
  alias gsl='git svn log|less'
fi

# ── cheatsheet（仅文件存在时）──
if [ -f ~/cheatsheet.md ]; then
  alias cs='vim ~/cheatsheet.md'
fi

# ── SSH ──
alias scvm='ssh cvm'

# ── chezmoi ──
if command -v chezmoi &>/dev/null; then
  alias cz='chezmoi'
  alias cza='chezmoi add'
  alias cze='chezmoi edit'
  alias czd='chezmoi diff'
  alias czap='chezmoi apply'
  alias czcd='cd $(chezmoi source-path)'
fi

# ── atuin ──
if command -v atuin &>/dev/null; then
  alias ats='atuin search'
  alias atsync='atuin sync'
fi

# ── bat ──
if command -v bat &>/dev/null; then
  alias cat='bat --paging=never'
  alias less='bat --paging=always'
fi

# ── ripgrep ──
if command -v rg &>/dev/null; then
  alias grep='rg'
fi

# ── fd ──
if command -v fd &>/dev/null; then
  alias find='fd'
fi

# ── dust ──
if command -v dust &>/dev/null; then
  alias du='dust'
fi

# ── bottom ──
if command -v btm &>/dev/null; then
  alias top='btm'
  alias htop='btm'
fi

# ── zoxide ──
if command -v zoxide &>/dev/null; then
  alias cd='z'
  alias cdi='zi'   # interactive selection
fi

# ── glow ──
if command -v glow &>/dev/null; then
  alias md='glow'
fi

# ── delta (git pager) ──
# configured via ~/.gitconfig, no alias needed

# ── tldr ──
if command -v tldr &>/dev/null; then
  alias help='tldr'
fi

# ── yazi ──
if command -v yazi &>/dev/null; then
  alias y='yazi'
fi

# ── hyperfine ──
if command -v hyperfine &>/dev/null; then
  alias bench='hyperfine'
fi
