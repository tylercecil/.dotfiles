export VOLTUS=$HOME/src/voltus
export PATH=$PATH:$VOLTUS/bin

if [[ "${PYENV_ROOT:-""}" == "" ]]; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# src: https://unix.stackexchange.com/a/217629
pathmunge() {
  if [ -d "$1" ]; then
    if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)"; then
      if [ "$2" = "after" ]; then
        PATH="$PATH:$1"
      else
        PATH="$1:$PATH"
      fi
    fi
  fi
}

eval $(go env | grep GOPATH)
mkdir -p "$GOPATH/bin"

binPaths=(
  "$GOPATH/bin"
)

for dir in "${binPaths[@]}"; do
  pathmunge "$dir"
done
