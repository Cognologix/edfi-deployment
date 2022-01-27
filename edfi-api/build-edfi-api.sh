#######################################################################
# This script will build the Ed-Fi API docker image along with
# extension
#######################################################################

IMAGE_TAG=$1
cd ./edfi-api

docker build -t edfi-api:$IMAGE_TAG -f Dockerfile .

cd ../
