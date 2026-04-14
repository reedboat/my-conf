# shell_shared/paths.sh — 通用 PATH 设置

# ~/.local/bin（chezmoi 等）
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# ~/.ft
if [[ -d "$HOME/.ft" ]]; then
  export PATH="$PATH:$HOME/.ft"
fi

# Go
if command -v go &>/dev/null; then
  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOPATH/bin"
fi
