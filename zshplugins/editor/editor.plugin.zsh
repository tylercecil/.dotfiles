EMACS_DEFAULT="ema"
export ALTERNATE_EDITOR='vim'
export EDITOR="$EMACS_DEFAULT -nw"

alias e="$EMACS_DEFAULT"
alias en="$EMACS_DEFAULT -c & disown"
alias enw="$EMACS_DEFAULT -nw"
