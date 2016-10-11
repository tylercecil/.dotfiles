# I always build the same kind of VM
alias findvm='gcloud compute instances list | ag tcecil'
alias rmvm='gcloud compute instances delete '
alias rmvmall='rmvm `findvm | cut -d " " -f 1` '
alias sshvm='export TERM=xterm; gcloud compute ssh '

function getserial {
  gcloud compute instances get-serial-port-output $1 --port=2 --zone='us-central1-ir1'
}

function mkvm {
  local cfg=~/workspace/bbmc/google3/net/fabric/monitoring/bbmc/tools/my-cloud-config.yaml
  if [[ $1 == '-c' ]]; then
    cfg=$2
    shift 2
  fi
  cfg="--metadata-from-file=user-data=$cfg"
  local image=$(gcloud compute images list --project bct-staging-images  --no-standard-images \
                  | ag gci | tail -n 1 | cut -d ' ' -f 1)

  echo "Building $# VMs with the following configuration: $cfg"
  echo "Using image $image"

  for vm in $*; do
    gcloud compute instances create $vm \
           --image-project bct-staging-images --image $image $cfg
  done
}

function bbmcpush {
  local tag=${1:-default}
  blaze build --define BBMC_TESTING_TAG=$tag                      \
        --define BBMC_TESTING_REPOSITORY=tcecil-bbmc-image/prober \
        //net/fabric/monitoring/bbmc/testing:bbmc_testing_push
}
