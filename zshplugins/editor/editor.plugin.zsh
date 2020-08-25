EMACS_DEFAULT="emacs_launcher.sh"
export ALTERNATE_EDITOR='vim'
export EDITOR="$EMACS_DEFAULT -nw"

# Emacs Launchers
alias e="$EMACS_DEFAULT"
alias enw="$EMACS_DEFAULT -nw"
function en() {
    $EMACS_DEFAULT -c $@ & disown
}
