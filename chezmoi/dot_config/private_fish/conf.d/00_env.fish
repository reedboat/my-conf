set -gx PAGER less
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx GIT_PAGER less
set -gx VOLTA_HOME "$HOME/.volta"
set -gx VOLTA_FEATURE_PNPM 1
set -gx DOCKER_HOST "unix://$HOME/.colima/docker.sock"
set -gx TESTCONTAINERS_HOST_OVERRIDE 127.0.0.1
set -gx TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
set -gx TESTCONTAINERS_RYUK_DISABLED true
set -gx yazi_config_home "$HOME/.config/yazi"
set -gx CODEBUDDY_INTERNET_ENVIRONMENT ioa

if type -q nvim
    set -gx EDITOR nvim
    set -gx SVN_EDITOR nvim
else
    set -gx EDITOR vim
    set -gx SVN_EDITOR vim
end

set -gx platform unknown
switch (uname)
case Linux
    set -gx platform linux
case FreeBSD
    set -gx platform freebsd
case Darwin
    set -gx platform osx
end
