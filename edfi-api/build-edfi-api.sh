#######################################################################
# This script will build the Ed-Fi API docker image along with
# extension
#######################################################################

IMAGE_TAG=$1
DOCKER_REPOSITIRY=$2
cd ./edfi-api

docker build -t edfi-api:$IMAGE_TAG -f Dockerfile .

docker tag edfi-api:$IMAGE_TAG $DOCKER_REPOSITIRY/edfi-api:$IMAGE_TAG

docker push $DOCKER_REPOSITIRY/edfi-api:$IMAGE_TAG

cd ../
