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

# alias claude='aws-sso exec --profile gen-ai-models:gen-ai-inference claude'

eval "$(direnv hook zsh)"
