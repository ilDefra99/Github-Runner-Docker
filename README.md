# Github-Runner
Github Runner for Self-Hosted Actions in Docker

Docker Hub: https://hub.docker.com/r/ildefra99/github-runner

## Setup Image
Run this command to pull the image from Docker Hub and start using Github-Runner

```
docker pull ildefra99/github-runner
```

Or simply use the latest stable version, run

```
docker run -d -it -e URL=<GITHUB_REPO_URL> -e TOKEN=<GITHUB_TOKEN> ildefra99/github-runner
```
No need to expose or publish the container on a specific door and it is not necessary to assign an address to the container in case it is under a reverse-proxy like NGINX or TRAEFIK

With that you can easily view the logs, stop, or re-start the container
```
docker logs -f <CONTAINER_ID>
docker stop <CONTAINER_ID>
docker start <CONTAINER_ID>
```
Running the stop or kill container command will automatically remove the runner from your github account and from the repo it was pointing to

## Environment Variables
To run the container requires 2 environment variables, available in the settings of the github repository on which it must be installed.
### URL
```
-e URL=<GITHUB_REPO_URL>
```
Url of the github repository on which it is to be installed (*example: https://github.com/ilDefra99/Github-Runner-Docker/*)
### TOKEN
```
-e TOKEN=<GITHUB_TOKEN>
```
Access tokens for github actions
You can find it in the github repository settings under "Actions" and "Self Hosted Runner".
### RUNNER_VERSION
```
-e RUNNER_VERSION=<RUNNER_VERSION>
```
Github runner version

## Docker Compose
You can use this image in a docker compose stack as in the following example
```
version: "3"
services:
  runner:
    image: ildefra99/github-runner
    environment:
      URL=<GITHUB_REPO_URL>
      TOKEN=<GITHUB_TOKEN>
      RUNNER_VERSION=<RUNNER_VERSION>
```
