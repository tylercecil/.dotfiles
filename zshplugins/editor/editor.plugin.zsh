EMACS_DEFAULT="emacs_launcher.sh"
export EDITOR="nvim"
export ALTERNATE_EDITOR='vim'

# Emacs Launchers
alias e="$EMACS_DEFAULT"
alias enw="$EMACS_DEFAULT -nw"
function en() {
    $EMACS_DEFAULT -c $@ & disown
}
