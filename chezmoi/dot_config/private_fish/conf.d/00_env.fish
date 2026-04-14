# conf.d/00_env.fish — 通用环境变量（来自 ~/.shell_shared/env.sh）

set -gx PAGER less
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# 编辑器：优先 nvim，回退 vim
if command -q nvim
    set -gx EDITOR nvim
    set -gx SVN_EDITOR nvim
else
    set -gx EDITOR vim
    set -gx SVN_EDITOR vim
end
