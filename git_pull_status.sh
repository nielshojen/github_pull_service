#!/bin/bash

source git_pull_settings.sh

if [ ! -d "$PULLDIR" ]; then
  echo "Not pulled yet"
  STATUS="2"
else
  USEDBRANCH=$(git -C $PULLDIR status | grep 'On branch' | awk -F ' branch ' '{ print $2 }')
  STATUS=$(git -C $PULLDIR status | grep 'Your branch is up-to-date' | wc -l | xargs)
  if [ ! "$USEDBRANCH" = "$BRANCH" ] && [ ! "$STATUS" = "1" ]; then
    echo "Already up-to-date"
    #exit 1
  fi
fi
