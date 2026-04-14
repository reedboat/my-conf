# shell_shared/functions.sh — 通用函数（两边都能用）

# history 统计最常用命令
used() {
  local n="${1:-10}"
  history | awk '{print $2,$3,$4}' | sort | uniq -c | sort -nr | head -n "$n"
}

# cd 到文件所在目录
goto() {
  [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")"
}

# expect 自动输入密码执行命令（仅 expect 存在时定义）
if command -v expect &>/dev/null; then
  run_cmd_with_password() {
    expect -c "\
      set timeout 90
      set env(TERM)
      spawn $1
      expect \"password:\"
      send $2\r
      expect eof
    "
  }

  interact_cmd_with_password() {
    expect -c "\
      set timeout 90
      set env(TERM)
      spawn $1
      expect \"password:\"
      send $2\r
      interact
    "
  }
fi

# yazi shell wrapper（仅 yazi 存在时定义）
if command -v yazi &>/dev/null; then
  y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
  }
fi
