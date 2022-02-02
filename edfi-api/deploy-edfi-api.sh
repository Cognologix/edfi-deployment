####################################################
# This script will deploy an Ed-Fi API docker image
####################################################

IMAGE_TAG=$1;
DOCKER_REPOSITIRY=$2
PGHOST=$3;
PGUSER=$4;
PGPASSWORD=$5;

docker run -d --name edfi-api -p 8081:80 --env DBHOST=$PGHOST --env DBUSERNAME=$PGUSER --env DBPASSWORD=$PGPASSWORD $DOCKER_REPOSITIRY/edfi-api:$IMAGE_TAG
