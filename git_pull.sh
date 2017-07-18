#!/bin/bash

source git_pull_settings.sh
source git_pull_prereqs.sh
source git_pull_status.sh

if [ ! "$STATUS" = "1" ]; then
  git -C $PULLDIR pull
fi

exit 0
