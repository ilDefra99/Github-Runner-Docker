#!/bin/bash

REPO_URL=$URL
GITHUB_TOKEN=$TOKEN
RUNNER_VERSION=$RUNNER_VERSION

cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
sudo chown -R docker /home/docker && /home/docker/actions-runner/bin/installdependencies.sh
cd /home/docker/actions-runner

./config.sh --url ${REPO_URL} --token  ${GITHUB_TOKEN}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${GITHUB_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!