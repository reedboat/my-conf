
# my-conf
my configuration files

## chezmoi (dotfiles)

用 [chezmoi](https://chezmoi.io) 管理的 dotfiles，存放于 `chezmoi/` 子目录。

### 快速安装（新机器）

```bash
# 1. 安装 chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin

# 2. 克隆仓库
git clone https://github.com/reedboat/my-conf.git ~/workspace/my-conf

# 3. 写入 chezmoi 配置，指向 chezmoi 子目录
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml << 'EOF'
sourceDir = "~/workspace/my-conf/chezmoi"
EOF

# 4. 应用配置
~/.local/bin/chezmoi apply
```

### 管理的配置文件

| 文件 | 说明 |
|------|------|
| `~/.zshrc` / `~/.zprofile` | zsh 配置 |
| `~/.bashrc` / `~/.bash_profile` | bash 配置 |
| `~/.gitconfig` / `~/.gitignore_global` | git 全局配置 |
| `~/.config/nvim/init.vim` | neovim 配置 |
| `~/.config/fish/` | fish shell 配置 |
| `~/.config/atuin/` | atuin 历史搜索配置 |
| `~/.config/yazi/` | yazi 文件管理器配置 |
| `~/.config/zellij/` | zellij 终端复用器配置 |

### 日常使用

```bash
chezmoi diff          # 查看变更
chezmoi apply         # 应用配置到 HOME
chezmoi re-add ~/.zshrc  # 将 HOME 改动同步回 source
chezmoi edit ~/.zshrc    # 编辑 source 中的文件
```

详细说明见 [chezmoi/README.md](chezmoi/README.md)。

---

## vim

`vimconfig`: vim configs  
建立 link 后，执行 `PlugInstall` 命令

## tmux

见 `tmux/` 目录下的配置文件。
