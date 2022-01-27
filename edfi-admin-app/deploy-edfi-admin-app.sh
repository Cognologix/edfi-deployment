#######################################################################
# This script will deploy the Ed-Fi Admin App docker image
#######################################################################

IMAGE_TAG=$1;
PGHOST=$2;
PGUSER=$3;
PGPASSWORD=$4;
ENCRYPTION_KEY=$5;
API_URL=$6;

docker run -d --name edfi-admin-app -p 8091:80 --env DBHOST=$PGHOST --env DBUSERNAME=$PGUSER --env DBPASSWORD=$PGPASSWORD --env ENCRYPTION_KEY=$ENCRYPTION_KEY --env API_URL=$API_URL edfi-admin-app:$IMAGE_TAG
