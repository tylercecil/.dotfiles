#!/usr/bin/env zsh

source ~/.zgen/zgen.zsh

if ! zgen saved; then
    PLUGS=$HOME/.dotfiles/zshplugins   # plugin directory
    OPLUG="$ZGEN_OH_MY_ZSH_REPO "

    zgen oh-my-zsh
    zgen loadall <<EOF
        # Some general plugins
        $ZGEN_OH_MY_ZSH_REPO plugins/web-search
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-completions
        $PLUGS/colorcat
        $PLUGS/defaults
        $PLUGS/util
        $PLUGS/z

        # Language specific plugins
        $ZGEN_OH_MY_ZSH_REPO plugins/stack
        $PLUGS/go
        $PLUGS/ocaml
        $PLUGS/python
        $PLUGS/tex

        # Development plugins
        $PLUGS/emacs
        $PLUGS/git
        # $PLUGS/google

        # OS Related Plugins
        $PLUGS/update
        $PLUGS/yaourt
        $PLUGS/theme
EOF

    zgen save
fi

# Set the path
export PATH=~/.local/bin:~/.bin:/usr/local/bin:$PATH:/usr/local/sbin:/usr/bin/core_perl
