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

function shiftenv {
    export $1=$(echo ${!1} | cut -f 2- -d :)
}
alias unexport="export -n"

# Git
alias gk="gitk --all 2>&1 > /dev/null &"
alias gg="git gui &"

# grep, with paging
function mgrep {
    grep --color=always "$@" 2>&1 < /dev/null | less -FRSX
}
complete -F _longopt -o default mgrep

# LaTeX
alias ltx="latexmk -pdf"

# MATLAB
alias ml='matlab -singleCompThread -nodesktop'

# hub (https://github.com/defunkt/hub)
eval "$(hub alias -s)"

# Python 3 (3DG)
alias ipy=ipython
alias ipy3="python3 -m IPython.frontend.terminal.ipapp"
alias ipy3dg3=`cat <<-EOF
 ipython3 --term-title --InteractiveShellApp.exec_lines="[
  'import sys', 'sys.path.insert(0, \'\\${ROOT3DG}\')', 'del sys',
  'import dgpython as dg, numpy as np',
  'try: from dgpython.apps import *\nexcept: pass',
  'dg.report(\'--> Initializing 3DG, Version %s\' % getattr(dg, \'__version__\', \'unknown\'))',
 ]"
EOF`

alias p="ps fjx | less -FRSX"
