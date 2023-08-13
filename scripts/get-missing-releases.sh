#!/usr/bin/env bash

set -e

AXELOR_RELEASES=`curl --silent "https://api.github.com/repos/$AXELOR_REPO/releases"  | jq -r .[].tag_name | grep -E 'v6\..\..|v7\..\..|v8\..\..' | sort | tr '\n' ' '`
PMOSCODE_RELEASES=`curl --silent "https://hub.docker.com/v2/repositories/$PMOSCODE_DOCKER/tags?page_size=1024" | jq -r .results[].name | grep -E 'v6\..\..|v7\..\..|v8\..\..' | sort | tr '\n' ' '`

AXELOR_RELEASES_ARRAY=("${AXELOR_RELEASES}")
PMOSCODE_RELEASES_ARRAY=("${PMOSCODE_RELEASES}")

echo axelor versions: ${AXELOR_RELEASES_ARRAY}
echo pmoscode versions: ${PMOSCODE_RELEASES_ARRAY}

MISSING=$(echo ${PMOSCODE_RELEASES_ARRAY[@]} ${AXELOR_RELEASES_ARRAY[@]} | tr ' ' '\n' | sort | uniq -u)

echo " "
echo Umtagged versions: ${MISSING[@]}
echo " "

# Set the internal field separator to the tab character.
IFS=$',';

# Echo the array.
echo "axelorTag=${MISSING[*]}" >> $GITHUB_OUTPUT

#for value in ${MISSING}
#do
#    echo "Adding ${value} to GITHUB_OUTPUT"
#    echo "axelorTag=${value}" >> $GITHUB_OUTPUT
#done
