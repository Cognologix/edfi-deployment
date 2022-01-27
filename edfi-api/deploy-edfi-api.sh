####################################################
# This script will deploy an Ed-Fi API docker image
####################################################

IMAGE_TAG=$1;
PGHOST=$2;
PGUSER=$3;
PGPASSWORD=$4;

docker run -d --name edfi-api -p 8081:80 --env DBHOST=$PGHOST --env DBUSERNAME=$PGUSER --env DBPASSWORD=$PGPASSWORD edfi-api:$IMAGE_TAG
