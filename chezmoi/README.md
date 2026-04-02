# dotfiles (chezmoi)

用 [chezmoi](https://chezmoi.io) 管理的 dotfiles，存放于 `my-conf/chezmoi/` 目录。

## 管理的文件

| 文件 | 说明 |
|------|------|
| `~/.zshrc` | zsh 配置 |
| `~/.zprofile` | zsh 登录配置 |
| `~/.bashrc` | bash 配置 |
| `~/.bash_profile` | bash 登录配置 |
| `~/.bash_aliases` | shell 别名 |
| `~/.gitconfig` | git 全局配置 |
| `~/.gitignore_global` | git 全局忽略 |
| `~/.config/nvim/init.vim` | neovim 配置 |
| `~/.ssh/config` | SSH 配置（age 加密） |

## 快速安装（新机器）

```bash
# 1. 安装 chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin

# 2. 安装 age
# macOS: brew install age
# 或手动下载: https://github.com/FiloSottile/age/releases

# 3. 克隆仓库
git clone https://github.com/reedboat/my-conf.git ~/workspace/my-conf

# 4. 写入 chezmoi 配置
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml << 'EOF'
sourceDir  = "~/workspace/my-conf/chezmoi"
encryption = "age"

[age]
  identity  = "~/.config/chezmoi/key.txt"
  recipient = "age1kzwv0zfzleufl4fg5a3wz4arlsl5cgk4uwl9gkyzhwzg26rhea8s79ha2e"

[git]
  autoAdd    = true
  autoCommit = false
  autoPush   = false

[data]
  email = ""
  name  = ""
EOF

# 5. 恢复 age 私钥（从安全位置复制）
# cp /path/to/key.txt ~/.config/chezmoi/key.txt
# chmod 600 ~/.config/chezmoi/key.txt

# 6. 应用配置
~/.local/bin/chezmoi apply
```

## 日常使用

```bash
# 查看哪些文件有变化
chezmoi status

# 查看 diff
chezmoi diff

# 将 HOME 目录的改动同步回 source
chezmoi re-add ~/.zshrc

# 编辑 source 中的文件
chezmoi edit ~/.zshrc

# 应用 source 到 HOME
chezmoi apply

# 加密新的敏感文件（加密后放入 private_dot_ssh/ 等目录）
age -r "age1kzwv0zfzleufl4fg5a3wz4arlsl5cgk4uwl9gkyzhwzg26rhea8s79ha2e" \
    -o chezmoi/private_dot_ssh/encrypted_newfile.age \
    ~/.ssh/newfile
```

## 加密说明

敏感文件（如 `~/.ssh/config`）使用 [age](https://github.com/FiloSottile/age) 加密存储。

- 公钥：`age1kzwv0zfzleufl4fg5a3wz4arlsl5cgk4uwl9gkyzhwzg26rhea8s79ha2e`（可公开）
- 私钥：`~/.config/chezmoi/key.txt`（**不提交到 git，需单独备份**）

## 目录结构

```
chezmoi/
├── .chezmoiignore          # 忽略规则
├── dot_zshrc               # -> ~/.zshrc
├── dot_zprofile            # -> ~/.zprofile
├── dot_bashrc              # -> ~/.bashrc
├── dot_bash_profile        # -> ~/.bash_profile
├── dot_bash_aliases        # -> ~/.bash_aliases
├── dot_gitconfig           # -> ~/.gitconfig
├── dot_gitignore_global    # -> ~/.gitignore_global
├── dot_config/
│   └── nvim/
│       └── init.vim        # -> ~/.config/nvim/init.vim
└── private_dot_ssh/
    └── encrypted_config.age  # -> ~/.ssh/config（age 加密）
```
