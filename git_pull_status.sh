#!/bin/bash

source git_pull_settings.sh

if [ ! -d "$PULLDIR/.git" ]; then
  echo "Not cloned yet"
  STATUS="2"
else
  git -C $PULLDIR remote update
  UPSTREAM=${1:-'@{u}'}
  LOCAL=$(git -C $PULLDIR rev-parse @)
  REMOTE=$(git -C $PULLDIR rev-parse "$UPSTREAM")
  BASE=$(git -C $PULLDIR merge-base @ "$UPSTREAM")
  if [ $LOCAL = $REMOTE ]; then
    echo "Already Up-to-date"
    STATUS="0"
  elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    STATUS="1"
  fi
fi
