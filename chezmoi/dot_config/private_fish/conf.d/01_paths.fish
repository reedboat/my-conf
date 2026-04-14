# conf.d/01_paths.fish — 通用 PATH 设置（来自 ~/.shell_shared/paths.sh）

# ~/.local/bin
fish_add_path --global --move $HOME/.local/bin

# ~/.ft
if test -d $HOME/.ft
    fish_add_path --global $HOME/.ft
end

# Go
if command -q go
    set -gx GOPATH $HOME/go
    fish_add_path --global $GOPATH/bin
end
