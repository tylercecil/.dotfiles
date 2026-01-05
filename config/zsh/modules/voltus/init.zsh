export VOLTUS=$HOME/src/voltus
export PATH=$PATH:$VOLTUS/bin

function db() {
	dbname=scheduler
	environment=dev
	while getopts "e:d:h" opt; do
		case ${opt} in
			e) environment=${OPTARG} ;;
			d) dbname=${OPTARG} ;;
			h|?) printf "Usage: %s: [-e env] [-d db_name]\n" $0 ;;
		esac
	done

	echo -e "\e[1mdb_name:\e[0m" ${dbname} "\t" "\e[1menv:\e[0m" ${environment}
	case ${dbname} in
		s|sched|scheduler)
			dbname='schedulerdb'
			;;
		va|vaf|voltapp|voltapp_postgres)
			dbname="voltapp"
			;;
		mm|marketmirror)
			dbname='static-readwrite-marketmirror'
	esac

	case ${dbname} in
		static-readwrite-marketmirror)
			PGDATABASE=postgres thor db -e ${environment} exec -c direct -n ${dbname} pgcli
			;;
		*) printf "Unknown db_name %s\n" ${dbname}
			thor -e ${environment} db --name ${dbname} exec pgcli
			;;
	esac
}

alias dbprod='db -e prod'
alias dbdev='db -e dev'


eval "$(direnv hook zsh)"

# The following block was requested by our on boarding process. I'm... Actually
# pretty sure I could remove most of it, but just going to leave it for the time
# being.
# if [[ "${PYENV_ROOT:-""}" == "" ]]; then
#   export PYENV_ROOT=$HOME/.pyenv
#   export PATH=$PYENV_ROOT/bin:$PATH
#   eval "$(pyenv init --path)"
#   eval "$(pyenv init -)"
#   eval "$(pyenv virtualenv-init -)"
# fi
# 
# # src: https://unix.stackexchange.com/a/217629
# pathmunge() {
#   if [ -d "$1" ]; then
#     if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)"; then
#       if [ "$2" = "after" ]; then
#         PATH="$PATH:$1"
#       else
#         PATH="$1:$PATH"
#       fi
#     fi
#   fi
# }
# 
# eval $(go env | grep GOPATH)
# mkdir -p "$GOPATH/bin"
# 
# binPaths=(
#   "$GOPATH/bin"
# )
# 
# for dir in "${binPaths[@]}"; do
#   pathmunge "$dir"
# done
# 
# 
