
function tssh
    if [ (count $argv) -lt 2 ]
        echo "wrong parameters"
        return 1
    end
    ssh -t $argv[1] tmux -CC new -ADs $argv[2]
end
