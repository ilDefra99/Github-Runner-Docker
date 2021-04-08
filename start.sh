#!/bin/bash

REPO_URL=$URL
GITHUB_TOKEN=$TOKEN

cd /home/docker/actions-runner

./config.sh --url ${REPO_URL} --token  ${GITHUB_TOKEN}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${GITHUB_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!