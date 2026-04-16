if not contains -- "$HOME/.local/bin" $PATH
    set -gx PATH "$HOME/.local/bin" $PATH
end

if set -q VOLTA_HOME
    if not contains -- "$VOLTA_HOME/bin" $PATH
        set -gx PATH "$VOLTA_HOME/bin" $PATH
    end
end

if test -d "$HOME/.ft"
    if not contains -- "$HOME/.ft" $PATH
        set -gx PATH $PATH "$HOME/.ft"
    end
end

if type -q go
    set -gx GOPATH "$HOME/go"
    if not contains -- "$GOPATH/bin" $PATH
        set -gx PATH $PATH "$GOPATH/bin"
    end
end
