
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

---

## 建议安装的工具

| 工具 | 说明 | Mac (Homebrew) | Linux (yum) |
|------|------|----------------|-------------|
| [atuin](https://atuin.sh) | 增强的 shell 历史搜索（支持同步） | `brew install atuin` | `yum install atuin` |
| [bat](https://github.com/sharkdp/bat) | `cat` 的增强版，支持语法高亮 | `brew install bat` | `yum install bat` |
| [bottom](https://github.com/ClementTsang/bottom) | 跨平台系统监控（类 htop） | `brew install bottom` | `yum install bottom` |
| [delta](https://github.com/dandavison/delta) | 更美观的 git diff 输出 | `brew install git-delta` | `yum install git-delta` |
| [dust](https://github.com/bootandy/dust) | `du` 的可视化替代 | `brew install dust` | `yum install dust` |
| [eza](https://github.com/eza-community/eza) | `ls` 的现代替代，支持颜色/图标/git | `brew install eza` | `yum install eza` |
| [fd](https://github.com/sharkdp/fd) | `find` 的快速替代 | `brew install fd` | `yum install fd-find` |
| [fzf](https://github.com/junegunn/fzf) | 模糊查找器，搭配其他工具极强大 | `brew install fzf` | `yum install fzf` |
| [glow](https://github.com/charmbracelet/glow) | 终端 Markdown 渲染/阅读器 | `brew install glow` | `yum install glow` |
| [hyperfine](https://github.com/sharkdp/hyperfine) | 命令行基准测试工具 | `brew install hyperfine` | `yum install hyperfine` |
| [jq](https://jqlang.github.io/jq) | 轻量级 JSON 命令行处理器 | `brew install jq` | `yum install jq` |
| [lazygit](https://github.com/jesseduffield/lazygit) | 终端 Git UI，交互式管理仓库 | `brew install lazygit` | `yum install lazygit` |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | `grep` 的超快替代 | `brew install ripgrep` | `yum install ripgrep` |
| [tldr](https://tldr.sh) | 简化的 man page，快速查看命令用法 | `brew install tldr` | `yum install tldr` |
| [yazi](https://github.com/sxyazi/yazi) | 基于 Rust 的超快终端文件管理器 | `brew install yazi` | `yum install yazi` |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | 更智能的 `cd`，按频率跳转目录 | `brew install zoxide` | `yum install zoxide` |
| [zellij](https://zellij.dev) | 现代终端复用器（tmux 替代） | `brew install zellij` | `yum install zellij` |

> 部分工具的配置文件已由 chezmoi 管理，见上方「管理的配置文件」表格。
> Linux yum 源中若未收录某些工具，可参考各项目官方文档通过其他方式安装（如 cargo install、预编译二进制等）。

### 一键安装

```bash
# Mac
brew install atuin bat bottom git-delta dust eza fd fzf glow hyperfine jq lazygit ripgrep tldr yazi zoxide zellij

# Linux (yum)
yum install atuin bat bottom git-delta dust eza fd-find fzf glow hyperfine jq lazygit ripgrep tldr yazi zoxide zellij
```
