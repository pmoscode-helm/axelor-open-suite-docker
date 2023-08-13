#!/usr/bin/env bash

VERSION_REQUEST=$1

if [[ ! -z "$VERSION_REQUEST" ]]; then
  VERSION_REQUEST=tags/$VERSION_REQUEST
else
  VERSION_REQUEST=latest
fi

echo "#### Getting release file information for '$VERSION_REQUEST' ####"

VERSION=$(curl --silent "https://api.github.com/repos/$AXELOR_REPO/releases/$VERSION_REQUEST" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

echo "--> Version '$VERSION' found!"

if [[ -z "$VERSION" ]]; then
  echo "--> Invalid version!"
  exit 1
fi

echo "#### Download WAR-file from $AXELOR_REPO ####"

cd released_war_file

wget -O axelor.war https://github.com/$AXELOR_REPO/releases/download/$VERSION/axelor-erp-$VERSION.war -q --show-progress
touch $VERSION.version

