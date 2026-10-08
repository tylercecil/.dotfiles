function editor_default_emacs() {
    EMACS_DEFAULT="emacs_launcher.sh"
    export EDITOR="$EMACS_DEFAULT"
    export ALTERNATE_EDITOR="vim"
    alias enw="$EMACS_DEFAULT -nw"
    function en() {
        $EMACS_DEFAULT -c $@ & disown
    }
}

function editor_default_nvim() {
    export EDITOR="nvim"
    export ALTERNATE_EDITOR="vim"
}

function editor_default_kak() {
    KAK_MAIN_SESSION="main"
    function kak-main() {
      if kak -l | grep -q "$KAK_MAIN_SESSION"; then
        kak -c $KAK_MAIN_SESSION $@
      else
        kak -s $KAK_MAIN_SESSION $@
      fi
    }
    export EDITOR="kak-main"
    export ALTERNATE_EDITOR="vim"
}

function e() {
    $EDITOR $@
}

# Change this line to update the default editor.
# Can also be changed on the fly.
editor_default_nvim
