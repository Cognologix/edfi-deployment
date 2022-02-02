#######################################################################
# This script will deploy the Ed-Fi Admin App docker image
#######################################################################

IMAGE_TAG=$1;
DOCKER_REPOSITIRY=$2;
PGHOST=$3;
PGUSER=$4;
PGPASSWORD=$5;
ENCRYPTION_KEY=$6;
API_URL=$7;

docker run -d --name edfi-admin-app -p 8091:80 --env DBHOST=$PGHOST --env DBUSERNAME=$PGUSER --env DBPASSWORD=$PGPASSWORD --env ENCRYPTION_KEY=$ENCRYPTION_KEY --env API_URL=$API_URL $DOCKER_REPOSITIRY/edfi-admin-app:$IMAGE_TAG
