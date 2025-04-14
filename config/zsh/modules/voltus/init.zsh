export VOLTUS=$HOME/src/voltus
export PATH=$PATH:$VOLTUS/bin

# I want to make this a more general function, but for now I've got two dumb
# ones...
alias dbprod='thor -e prod db --name schedulerdb exec pgcli'
alias dbdev='thor -e dev db --name schedulerdb exec pgcli'

# The following block was requested by our on boarding process. I'm... Actually
# pretty sure I could remove most of it, but just going to leave it for the time
# being.
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


