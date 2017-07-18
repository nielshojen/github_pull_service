#!/bin/bash

source git_pull_settings.sh

USEDBRANCH=$(git status | grep 'On branch' | awk -F ' branch ' '{ print $2 }')
STATUS=$(git status | grep 'Your branch is up-to-date' | wc -l | xargs)

if [ "$USEDBRANCH" = "$BRANCH" ] && [ "$STATUS" = "1" ]; then
  exit 0
 else
  exit 1
fi
