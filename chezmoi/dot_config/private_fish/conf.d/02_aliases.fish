# conf.d/02_aliases.fish — 通用别名（来自 ~/.shell_shared/aliases.sh）

# ── 目录导航 ──
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias .4 'cd ../../../..'

# ── ls ──
alias ll 'ls -al'

# ── 编辑器：nvim 存在时覆盖 ──
alias v vim
if command -q nvim
    alias vi nvim
    alias vim nvim
end

# ── Python ──
if command -q python
    alias py python
end
if command -q ipython
    alias ipy ipython
end

# ── screen / tmux ──
alias sl 'screen -ls'
alias sr 'screen -D -R'
if command -q tmux
    alias ta 'tmux attach'
end

# ── 编码转换 ──
alias iconvgu 'iconv -f gbk -t utf-8'
alias iconvug 'iconv -f utf-8 -t gbk'

# ── 常用工具 ──
alias t100 'tail -n 100'
alias pong 'ping -c 5'
alias mkdir 'mkdir -pv'
alias df 'df -h'
alias bc 'bc -l'

if command -q free
    alias free 'free -m'
end

# ── git ──
alias ga 'git add'
alias gau 'git add -u'
alias gc 'git commit -m'
alias gca 'git commit --amend'
alias gs 'git status'
alias gss 'git status -s'
alias gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gd 'git diff'
alias grh 'git reset HEAD'
alias gco 'git checkout --'
alias gdc 'git diff --cached'
alias gfetch 'git fetch'

# ── cheatsheet ──
if test -f ~/cheatsheet.md
    alias cs 'vim ~/cheatsheet.md'
end

# ── chezmoi ──
if command -q chezmoi
    alias cz chezmoi
    alias cza 'chezmoi add'
    alias cze 'chezmoi edit'
    alias czd 'chezmoi diff'
    alias czap 'chezmoi apply'
    alias czcd 'cd (chezmoi source-path)'
end

# ── atuin ──
if command -q atuin
    alias ats 'atuin search'
    alias atsync 'atuin sync'
end
