function used
    set -l n 10
    if test (count $argv) -gt 0
        set n $argv[1]
    end
    history | awk '{print $1,$2,$3}' | sort | uniq -c | sort -nr | head -n "$n"
end

function goto
    if test (count $argv) -eq 0
        return 1
    end

    if test -d "$argv[1]"
        cd "$argv[1]"
    else
        cd (dirname "$argv[1]")
    end
end
