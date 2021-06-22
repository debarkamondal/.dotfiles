neofetch
starship init fish | source

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
alias gt='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
