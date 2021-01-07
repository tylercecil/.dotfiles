function editor_default_emacs() {
    EMACS_DEFAULT="emacs_launcher.sh"
    EDITOR="$EMACS_DEFAULT"
    ALTERNATE_EDITOR="vim"
    alias enw="$EMACS_DEFAULT -nw"
    function en() {
        $EMACS_DEFAULT -c $@ & disown
    }
}

function editor_default_nvim() {
    EDITOR="nvim"
    ALTERNATE_EDITOR="vim"
}

function editor_default_kak() {
    EDITOR="kak"
    ALTERNATE_EDITOR="vim"
}

function e() {
    $EDITOR $@
}

# Change this line to update the default editor.
# Can also be changed on the fly.
editor_default_nvim
