# See https://g3doc.corp.google.com/net/fabric/testing/e2e/g3doc/launch.md

function _join_by { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }

function _andromeda_sandbox {
  local andromeda_gcl=net/fabric/testing/e2e/testbeds/sandbox/andromeda_sandbox.gcl
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    return 127
  fi

  local root=`git rev-parse --show-toplevel`
  echo $root/'google3'/$andromeda_gcl
}

function _canary_flags {
  echo ovs_mpm_version=canary host_agent_mpm_version=canary\
       ofe_mpm_version=canary vmc_mpm_version=canary
}

function _name {
  local suffix
  if $1; then
    suffix=_testing
  else
    suffix=_$1
  fi
  echo 'name='${USER}${suffix}
}

function _testbed {
  local suffix
  if $1; then
    suffix=-testbed
  else
    suffix=-$1
  fi
  echo 'testbed='${USER}${suffix}
}

function sandromeda {
  while [[ $# -gt 1 ]]; do
    key=$1

    case $key in
      -c|--command)
        local com=$2
        shift
        ;;
      -o|--options)
        local pops=$2
        shift
        ;;
    esac
    shift
  done

  local ops=$(_join_by , $(_canary_flags) $(_name) $(_testbed) $pops)
  local c="sandman $(_andromeda_sandbox) --vars=$ops $com"

  echo "Constructed:\n" $c
  echo "Continue?"
  read a
  if echo $a | grep -iq "^y"; then
      eval $c
  fi
}
