# shell_shared/env.sh — 通用环境变量 + 平台检测

export PAGER='less'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# ── 编辑器：优先 nvim，回退 vim ──
if command -v nvim &>/dev/null; then
  export EDITOR='nvim'
  export SVN_EDITOR='nvim'
else
  export EDITOR='vim'
  export SVN_EDITOR='vim'
fi

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
