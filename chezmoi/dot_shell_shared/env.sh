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
