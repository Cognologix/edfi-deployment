#######################################################################
# This script will build the Ed-Fi Admin App docker image
#######################################################################

IMAGE_TAG=$1
DOCKER_REPOSITIRY=$2
cd ./edfi-admin-app

docker build -t edfi-admin-app:$IMAGE_TAG -f Dockerfile .

docker tag edfi-admin-app:$IMAGE_TAG $DOCKER_REPOSITIRY/edfi-admin-app:$IMAGE_TAG

docker push $DOCKER_REPOSITIRY/edfi-admin-app:$IMAGE_TAG

cd ../
