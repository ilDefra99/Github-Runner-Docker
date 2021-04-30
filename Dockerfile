FROM debian:stable-slim

RUN apt-get update -y && apt-get upgrade -y && useradd -m docker
RUN apt-get install -y curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev nodejs npm zip unzip sudo
RUN npm install --global yarn
COPY start.sh start.sh
RUN chmod +x start.sh
USER docker
ENTRYPOINT ["./start.sh"]
