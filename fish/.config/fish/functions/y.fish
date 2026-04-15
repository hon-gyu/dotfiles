# ~/.config/fish/functions/y.fish
function y
    set tmp (mktemp -t yazi-cwd.XXXXXX)
    yazi $argv --cwd-file=$tmp
    set cwd (cat $tmp)
    test -n "$cwd" -a "$cwd" != "$PWD" && cd $cwd
    rm -f $tmp
end
