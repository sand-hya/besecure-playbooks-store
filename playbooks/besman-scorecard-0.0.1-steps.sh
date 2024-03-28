#!/bin/bash

    echo "Running $ASSESSMENT_TOOL_NAME"
    cd "$BESMAN_TOOL_PATH" || return 1
    
    curl -o scorecard.tar.gz https://github.com/ossf/scorecard/releases/download/v4.13.1/scorecard_4.13.1_linux_amd64.tar.gz
    tar -xzf scorecard.tar.gz
    ./scorecard-linux-amd64 --repo=https://github.com/Be-Secure/$BESMAN_ARTIFACT_NAME --format=json --output=$BESMAN_ARTIFACT_NAME-$BESMAN_ARTIFACT_VERSION-scorecard.json
    if [[ "$?" != "0" ]] 
    then
        export SCORECARD_RESULT=1
    else
        export SCORECARD_RESULT=0
    fi 