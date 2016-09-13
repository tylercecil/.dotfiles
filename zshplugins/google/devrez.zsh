function devrez {
  local com=$1
  shift
  # blaze run //net/fabric/testing/e2e/utils/devrez:devrez_andromeda -- \
  blaze run //net/fabric/testing/e2e/utils:devrez_andromeda -- \
        --command=$com $@
}
