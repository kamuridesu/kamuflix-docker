#! /bin/bash
echo "Starting home server setup"

echo "Exposing environment varibles"
set -a
source .env
set +a

echo "Creating folder for config"
mkdir -p $SONARR_CONFIG $RADARR_CONFIG $PROWLARR_CONFIG $BAZARR_CONFIG $JELLYFIN_CONFIG $JELLYSEERR_CONFIG $DASHY_CONFIG

export IP_ADDR=$(ip route get 1.1.1.1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
echo "IP addr is $IP_ADDR"

if [[ ! -z $1 ]]; then
    echo  "Starting service $1"
    docker compose up "$1" --build -d --remove-orphans
else
    echo "Starting services"
    docker compose up  --build -d --remove-orphans 
fi
echo "Done!"

