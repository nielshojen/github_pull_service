#!/bin/bash

source git_pull_settings.sh

if [ ! -d "$PULLDIR/.git" ]; then
  echo "Not pulled yet"
  STATUS="255"
else
  USEDBRANCH=$(git -C $PULLDIR status | grep 'On branch' | awk -F ' branch ' '{ print $2 }')
  STATUS=$(git -C $PULLDIR pull --dry-run | wc -l | xargs)
  if [ "$USEDBRANCH" = "$BRANCH" ] && [ ! $STATUS ]; then
    echo "Already up-to-date - $STATUS"
    #exit 1
  fi
fi
