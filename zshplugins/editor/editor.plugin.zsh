EMACS_DEFAULT="emacs_launcher.sh"
export EDITOR="nvim"
export ALTERNATE_EDITOR='vim'

# Emacs Launchers
# alias e="$EMACS_DEFAULT"
# alias e="nvim"
# alias enw="$EMACS_DEFAULT -nw"
# function en() {
#     $EMACS_DEFAULT -c $@ & disown

function kak_main() {
    local kak_ses=main-session
    kak -s $kak_ses $@ 2> /dev/null || kak -c $kak_ses $@
}

alias e=kak
