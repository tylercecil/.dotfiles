if [ -n "$ZSH_VERSION" ]; then
    if [ -f "$HOME/.zshrc" ]; then
      "$HOME/.zshrc"
    fi
fi

PATH="$HOME/.local/bin:$HOME/bin:$PATH"
