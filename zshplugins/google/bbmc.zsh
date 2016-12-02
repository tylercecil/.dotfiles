# bbmc.zsh
#
# Things I find useful for my tests with porting BBMC into staging. This also
# provides tools that are generally useful for working with gcloud if you find
# yourself constantly bringing up or removing VMs.
#
# In general many variables here will be set for staging, but they can be changed.

# See https://g3doc.corp.google.com/cloud/cluster/tools/dev/g3doc/index.md?cl=head
# for more information
export PROD_PROJECT=google.com:bbmc-testing-prod
export STAG_PROJECT=bct-staging-functional
export STAG_IMAGE_PROJECT=bct-staging-images
export DEV_PROJECT=bigclustertestdev0-devconsole

# Just a default zone in staging. Arbitrary.
export STAG_ZONE=us-central1-ir1
export PROD_ZONE=us-east1-a

# Small gcloud aliases
alias gcloud='/google/data/ro/teams/cloud-sdk/gcloud'
alias gcon-dev="gcloud config configurations activate dev"
alias gcon-staging="gcloud config configurations activate staging"
alias gcon-prod="gcloud config configurations activate prod"
alias gcomp="gcloud compute"

# Don't actually run this function, I just put this here for my own personal
# documentation, so I can refer people to how I configured gcloud.
# This was taken from
# https://g3doc.corp.google.com/cloud/cluster/tools/dev/g3doc/interacting.md?cl=head#using-gcloud-configurations
function _init_gcloud_configs {
  # First, clear all existing configs. In order to do this, I am going to make
  # an empty config. This is just for stupid automation reasons.
  gcloud config configurations create --activate aaa-tmp-config

  IFS=$'\n'
  for line in `gcloud config configurations list | tail -n +3`; do
    local config=`echo $line | cut -f 1 -d ' '`
    gcloud config configurations delete $config
  done

  # Rebuild the three default configs
  gcloud config configurations create --activate dev
  gcloud config set project $DEV_PROJECT
  gcloud config set api_endpoint_overrides/compute \
         http://localhost:3990/compute/v1/

  gcloud config configurations create --activate staging
  gcloud config set account tcecil@google.com
  gcloud config set project $STAG_PROJECT
  gcloud config set api_endpoint_overrides/compute \
         https://www.googleapis.com/compute/staging_v1/
  gcloud config set compute/zone $STAG_ZONE

  gcloud config configurations create --activate prod
  gcloud config set account tcecil@google.com
  gcloud config set project $PROD_PROJECT
  gcloud config set compute/zone $PROD_ZONE

  yes | gcloud config configurations delete aaa-tmp-config
}

# Runs staging tests
function blaze_stage_test {
  blaze test //cloud/cluster/testing:$1 --test_arg=--clustermanager=staging
}

# I always build the same kind of VM
alias lsvm='gcloud compute instances list | ag tcecil'
alias rmvm='gcloud compute instances delete '
alias rmvmall='rmvm `lsvm | cut -d " " -f 1` '
alias sshvm='export TERM=xterm; gcloud compute ssh '
alias gcon-cur='gcloud config configurations list | ag "True" | cut -d " " -f 1'

function getserial {
  gcloud compute instances get-serial-port-output $1 --port=2
}

function mkvm {
  local service=''
  local cfg=~/src/my-cloud-config.yaml
  if [[ $1 == '-c' ]]; then
    cfg=$2
    shift 2
  fi
  cfg="--metadata-from-file=user-data=$cfg"
  if [[ $1 == '-nc' ]]; then
    cfg=""
    shift
  fi
  # Get the image string. For staging this is odd
  local imageflags=''
  if [[ `gcon-cur` == 'prod' ]]; then
    imageflags=("--image-family=gci-stable" "--image-project=google-containers")
    # service='--scopes=529441494482-compute@developer.gserviceaccount.com=https://www.googleapis.com/auth/cloud-platform'
    service='--scopes=default=cloud-platform,storage-full,logging-write'
  elif [[ `gcon-cur` == 'staging' ]]; then
    local image=$(gcloud compute images list --project $STAG_IMAGE_PROJECT  \
      --no-standard-images | ag gci | tail -n 1 | cut -d ' ' -f 1)
    imageflags=("--image-project=$STAG_IMAGE_PROJECT" "--image=$image")
    service='--scopes=default=cloud-platform,storage-full,logging-write'
  fi

  echo "Building $# VMs with the following configuration: $cfg"
  echo "Using imageflags: $imageflags"
  set -x
  gcloud compute instances create $@ ${imageflags[@]} $cfg $service
  set +x
}

function bbmcpush {
  local tag=${1:-default}
  blaze run --define BBMC_TESTING_TAG=$tag                      \
        --define BBMC_TESTING_REPOSITORY=tcecil-bbmc-image/prober \
        //net/fabric/monitoring/bbmc/testing:bbmc_testing_push
}

# Need to use rt config api, so... that's long to type :p
alias grt='gcloud alpha deployment-manager runtime-configs'
