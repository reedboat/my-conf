# shell_shared/platform/linux.sh — Linux CVM 特有配置

# ── Linux 专用环境变量 ──
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib
export HOSTSHORT=$(hostname)

# ── Linux 专用 PATH ──
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/.composer/vendor/bin:~/bin:~/local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# ── markrc ──
[ -f ~/.markrc ] && source ~/.markrc

# ── Linux 特有别名 ──
# （目前无，后续在此添加）
