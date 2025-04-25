#! /bin/bash
echo "Starting home server setup"

echo "Exposing environment varibles"
set -a
source .env
set +a

echo "Creating folder for config"
mkdir -p $SONARR_CONFIG $RADARR_CONFIG $PROWLARR_CONFIG $BAZARR_CONFIG $JELLYFIN_CONFIG $JELLYSEERR_CONFIG $DASHY_CONFIG

export IP_ADDR=$(echo $(hostname -I 2>/dev/null || hostname -i 2>/dev/null) | cut -d " " -f 1)
echo "IP addr is $IP_ADDR"

if [[ ! -z $1 ]]; then
    echo  "Starting service $1"
    docker compose up --build -d 
else
    echo "Starting services"
    docker compose up  --build -d 
fi
echo "Done!"

