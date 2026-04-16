alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias .4 'cd ../../../..'
alias ll 'ls -al'
alias v 'vim'
alias sl 'screen -ls'
alias sr 'screen -D -R'
alias iconvgu 'iconv -f gbk -t utf-8'
alias iconvug 'iconv -f utf-8 -t gbk'
alias t100 'tail -n 100'
alias pong 'ping -c 5'
alias mkdir 'mkdir -pv'
alias df 'df -h'
alias bc 'bc -l'
alias scvm 'ssh cvm'
alias ga 'git add'
alias gau 'git add -u'
alias gc 'git commit -m'
alias gca 'git commit --amend'
alias gs 'git status'
alias gss 'git status -s'
alias gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gd 'git diff'
alias gdc 'git diff --cached'
alias grh 'git reset HEAD'
alias gco 'git checkout --'
alias gfetch 'git fetch'
alias gar 'git archive --format=\"tar.gz\" -o'

if type -q nvim
    alias vi 'nvim'
    alias vim 'nvim'
end

if type -q python
    alias py 'python'
end

if type -q ipython
    alias ipy 'ipython'
end

if type -q lazygit
    alias lg 'lazygit'
    alias g 'lazygit'
end

if type -q tmux
    alias t 'tmux'
    alias ta 'tmux attach -t'
    alias tad 'tmux attach -d -t'
    alias tdc 'tmux devcvm'
    alias ts 'tmux new-session -s'
    alias tl 'tmux list-sessions'
    alias tk 'tmux kill-session -t'
    alias tka 'tmux kill-server'
end

if type -q free
    alias free 'free -m'
end

if test -f ~/cheatsheet.md
    alias cs 'vim ~/cheatsheet.md'
end

if type -q atuin
    alias ats 'atuin search'
    alias atsync 'atuin sync'
end
