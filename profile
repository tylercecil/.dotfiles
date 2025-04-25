if [ -n "$ZSH_VERSION" ]; then
    if [ -f "$HOME/.zshrc" ]; then
      "$HOME/.zshrc"
    fi
fi

PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
