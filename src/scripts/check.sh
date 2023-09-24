#!/bin/bash
if (npm run -s check-versions | grep -qF "$PACKAGE_NAME") ; then
    echo "package $PACKAGE_NAME found, executing the rest of the steps"
    npm run app:version
    echo "export $TAG_VARIABLE=$(npm run current-version -w=$FOLDER --silent)" >> "$BASH_ENV"
    source "$BASH_ENV"
else
    echo "package $PACKAGE_NAME not tagged. Stopping the job"
    circleci-agent step halt
fi