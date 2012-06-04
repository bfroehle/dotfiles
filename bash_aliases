# VNC
alias ipadres="xrandr -s 1024x700"
alias lores="xrandr -s 1280x800"
alias hires="xrandr -s 1600x1000"
alias superhires="xrandr -s 2440x1240"
alias wideres="xrandr -s 3200x1000"
alias 1080p="xrandr -s 1920x1080"
alias mbres="xrandr -s 1280x800"

function killvnc {
    vncserver -kill :$1
    rm -f /tmp/.X$1-lock
    rm -f /tmp/.X11-unix/X$1
}

# Git
alias gk="gitk --all 2>&1 > /dev/null &"
alias gg="git gui &"
