# shell_shared/env.sh — 通用环境变量 + 平台检测

export PAGER='less'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export GIT_PAGER='less'
export VOLTA_HOME="$HOME/.volta"
export VOLTA_FEATURE_PNPM=1
export DOCKER_HOST="unix://${HOME}/.colima/docker.sock"
export TESTCONTAINERS_HOST_OVERRIDE=127.0.0.1
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export TESTCONTAINERS_RYUK_DISABLED=true
export yazi_config_home="$HOME/.config/yazi"
export CODEBUDDY_INTERNET_ENVIRONMENT=ioa

# ── 编辑器：优先 nvim，回退 vim ──
if command -v nvim &>/dev/null; then
  export EDITOR='nvim'
  export SVN_EDITOR='nvim'
else
  export EDITOR='vim'
  export SVN_EDITOR='vim'
fi

# ── fzf ──
if command -v fd &>/dev/null; then
  export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
fi
_fzf_preview='bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || echo {}'
export FZF_DEFAULT_OPTS="
  --height 60%
  --layout=reverse
  --border=rounded
  --info=inline
  --multi
  --marker='*'
  --bind 'ctrl-/:toggle-preview'
  --preview '$_fzf_preview'
  --preview-window=right,50%,wrap
  --color=fg:#c0c0c0,bg:#1e1e2e,hl:#bd93f9
  --color=fg+:#f8f8f2,bg+:#282a36,hl+:#ff79c6
  --color=info:#6272a4,prompt:#50fa7b,pointer:#ff79c6
  --color=marker:#50fa7b,spinner:#8be9fd,header:#6272a4
"
export FZF_CTRL_T_OPTS="--preview '$_fzf_preview' --preview-window=right,50%,wrap"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always {} 2>/dev/null || ls {}'"
unset _fzf_preview

# ── 平台检测（后续文件可引用 $platform）──
platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
  platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='osx'
fi
