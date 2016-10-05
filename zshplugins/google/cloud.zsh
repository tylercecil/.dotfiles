alias gcloud='/google/data/ro/teams/cloud-sdk/gcloud'

# See https://g3doc.corp.google.com/cloud/cluster/tools/dev/g3doc/index.md?cl=head
# for more information
export COMPUTE_ENGINE_PROJECT_ID=bigclustertestdev0-devconsole

function blaze_stage_test {
  blaze test //cloud/cluster/testing:$1 --test_arg=--clustermanager=staging
}

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
  gcloud config set project $COMPUTE_ENGINE_PROJECT_ID
  gcloud config set api_endpoint_overrides/compute \
         http://localhost:3990/compute/v1/

  gcloud config configurations create --activate staging
  gcloud config set account tcecil@google.com
  # gcloud config set project google.com:your-staging-project
  gcloud config set api_endpoint_overrides/compute \
         https://www.googleapis.com/compute/staging_v1/

  gcloud config configurations create --activate prod
  gcloud config set account tcecil@google.com
  # gcloud config set project google.com:your-prod-project-name-here

  yes | gcloud config configurations delete aaa-tmp-config
}

alias gcon-dev="gcloud config configurations activate dev"
alias gcon-staging="gcloud config configurations activate staging"
alias gcon-prod="gcloud config configurations activate prod"
