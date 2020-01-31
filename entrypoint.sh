#!/bin/bash
set -eu

RESPONSE=$(curl -S -X POST -H "Content-Type: application/json" --data "{ \"commit\": \"${GITHUB_SHA}\", \"ref\": \"${GITHUB_REF}\", \"default_branch\": \"master\" }" ${WEBHOOK_URL})

if [[ ${RESPONSE} == "Okay" ]]; then
    echo "exit 0, ${RESPONSE}"
    exit 0
else
    echo "exit 1, ${RESPONSE}"
    exit 1
fi
