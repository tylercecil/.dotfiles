# I always build the same kind of VM
alias findvm='gcloud compute instances list | ag tcecil'
alias rmvm='gcloud compute instances delete tcecil-test'
alias sshvm='export TERM=xterm; gcloud compute ssh tcecil-test'

function mkvm {
  local cfg=${1:-~/workspace/bbmc/google3/net/fabric/monitoring/bbmc/tools/my-cloud-config.yaml}
  gcloud compute instances create tcecil-test                               \
         --image-project bct-staging-images --image gci-stable-53-8530-85-0 \
         --metadata-from-file user-data=$cfg
}

function bbmcpush {
  local tag=${1:-default}
  blaze build --define BBMC_TESTING_TAG=$tag                      \
        --define BBMC_TESTING_REPOSITORY=tcecil-bbmc-image/prober \
        //net/fabric/monitoring/bbmc/testing:bbmc_testing_push
}
