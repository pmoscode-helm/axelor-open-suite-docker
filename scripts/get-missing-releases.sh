#!/usr/bin/env bash

set -e

PREDEFINED_VERSIONS=$1

if [[ ! -z "$PREDEFINED_VERSIONS" ]]; then
  RELEASES=(${PREDEFINED_VERSIONS})
  echo predefined releases to build: ${RELEASES[@]}

  JSON="[$(echo ${RELEASES[@]} | sed 's/ /,/g')]"
  echo "axelorTag=$( echo "$JSON" )" >> $GITHUB_OUTPUT

  #VAL="$( echo "$JSON" )"
  #echo $VAL | jq
else
  AXELOR_RELEASES=`curl --silent "https://api.github.com/repos/$AXELOR_REPO/releases"  | jq .[].tag_name | grep -E 'v7\..\..|v8\..\..' | sort | tr '\n' ' '`
  PMOSCODE_RELEASES=`curl --silent "https://hub.docker.com/v2/repositories/$PMOSCODE_DOCKER/tags?page_size=1024" | jq .results[].name | grep -E 'v7\..\..|v8\..\..' | sort | tr '\n' ' '`

  AXELOR_RELEASES_ARRAY=(${AXELOR_RELEASES})
  PMOSCODE_RELEASES_ARRAY=(${PMOSCODE_RELEASES})

  echo axelor versions: ${AXELOR_RELEASES_ARRAY[@]}
  echo pmoscode versions: ${PMOSCODE_RELEASES_ARRAY[@]}

  for version in "${PMOSCODE_RELEASES_ARRAY[@]}"; do
    AXELOR_RELEASES_ARRAY=("${AXELOR_RELEASES_ARRAY[@]/$version}")
    echo "Remove already existing version $version"
  done

  echo " "
  echo Umtagged versions: ${AXELOR_RELEASES_ARRAY[@]}
  echo " "

  JSON="[$(echo ${AXELOR_RELEASES_ARRAY[@]} | sed 's/ /,/g')]"

  echo "axelorTag=$( echo "$JSON" )" >> $GITHUB_OUTPUT

  #VAL="$( echo "$JSON" )"
  #echo $VAL | jq
fi
