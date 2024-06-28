set -a
source .env
set +a

mkdir -p $SONARR_HOME
mkdir -p $SONARR_CONFIG
mkdir -p $RADARR_HOME
mkdir -p $RADARR_CONFIG
mkdir -p $PROWLARR_CONFIG
mkdir -p $BAZARR_HOME
mkdir -p $BAZARR_CONFIG
mkdir -p $JELLYFIN_HOME
mkdir -p $JELLYFIN_CONFIG
mkdir -p $JELLYSEERR_CONFIG

docker compose up -d
