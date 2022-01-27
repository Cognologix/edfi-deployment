#######################################################################
# This script will build the Ed-Fi Admin App docker image
#######################################################################

IMAGE_TAG=$1
PROJECT_ID=$2
cd ./edfi-admin-app

docker build -t edfi-admin-app:$IMAGE_TAG -f Dockerfile .

docker tag edfi-admin-app:$IMAGE_TAG $PROJECT_ID/edfi-admin-app:$IMAGE_TAG

docker push $PROJECT_ID/edfi-admin-app:$IMAGE_TAG

cd ../
