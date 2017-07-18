#!/bin/bash

source git_pull_settings.sh
source git_pull_prereqs.sh
source git_pull_status.sh

if [ "$STATUS" = "2" ]; then
  git -C $PULLDIR clone
elif [ "$STATUS" = "0" ]; then
  git -C $PULLDIR pull
fi

exit 0
