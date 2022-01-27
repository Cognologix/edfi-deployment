#######################################################################
# This script will build the Ed-Fi API docker image along with
# extension
#######################################################################

IMAGE_TAG=$1
PROJECT_ID=$2
cd ./edfi-api

docker build -t edfi-api:$IMAGE_TAG -f Dockerfile .

docker tag edfi-api:$IMAGE_TAG $PROJECT_ID/edfi-api:$IMAGE_TAG

docker push $PROJECT_ID/edfi-api:$IMAGE_TAG

cd ../
