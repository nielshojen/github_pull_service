#!/bin/bash

source git_pull_settings.sh
source git_pull_prereqs.sh
source git_pull_status.sh

if [ "$STATUS" = "255" ]; then
  echo "Cloning $GITREPOURL to $CLONEDIR"
  mkdir -p $CLONEDIR
  git -C $CLONEDIR clone $GITREPOURL
elif [ "$STATUS" -gt "0" ]; then
  echo "Pulling $GITREPOURL to $PULLDIR"
  git -C $PULLDIR pull
fi

exit 0
