#!/bin/bash

prompt_if_running() {
  APPS=("")
  for APP in ${APPS[@]}; do
  	# Grab some app info
  	APPNOSPACE=$(echo -e "${APP}" | tr -d '[:space:]')
  	APPPATH=$(mdfind -onlyin /Applications/ "$APP.app")
  	APPID=$(mdls "$APPPATH" | grep kMDItemCF | awk -F "=" '{ print $2 }' | xargs)
    #Prompt if running
    launchctl asuser "$CONSOLEUID" /usr/local/bin/yo -t "$APP" -s "$GITREPOURL needs to be updated" -n "Please save your work" -i "/var/scripts/yo-icons/$APP.png" -z 'None' -d -b "Update Now" -B "touch /tmp/$APPNOSPACE"
  done
}

source git_pull_settings.sh
source git_pull_prereqs.sh
source git_pull_status.sh

if [ "$STATUS" = "2" ]; then
  echo "Cloning $GITREPOURL to $CLONEDIR"
  mkdir -p $CLONEDIR
  git -C $CLONEDIR clone $GITREPOURL
elif [ "$STATUS" = "1" ]; then
  echo "Pulling $GITREPOURL to $PULLDIR"
  prompt_if_running
  git -C $PULLDIR pull
fi

exit 0
