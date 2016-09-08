#!/usr/bin/env zsh

# Setup Antigen
source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
PLUGS=$HOME/.dotfiles/zshplugins   # plugin directory

# Antigen Theme
if [[ -n ${INSIDE_EMACS} ]]; then
    antigen theme imajes
else
    antigen theme $PLUGS theme
    # Considering bira and gnzsh and jonathan. May roll my own.
fi

# Antigen Bundles
antigen bundles <<EOF
        # Some general plugins
        web-search
        zsh-users/zsh-syntax-highlighting
        $PLUGS/colorcat
        $PLUGS/defaults
        $PLUGS/util
        $PLUGS/z

        # Language specific plugins
        stack
        $PLUGS/go
        $PLUGS/ocaml
        $PLUGS/python
        $PLUGS/tex

        # Development plugins
        $PLUGS/emacs
        $PLUGS/git

        # OS Related Plugins
        $PLUGS/update
        $PLUGS/yaourt
EOF

# Set the path
export PATH=~/.local/bin:~/.bin:/usr/local/bin:$PATH:/usr/local/sbin:/usr/bin/core_perl

# Apply Antigen
antigen apply
