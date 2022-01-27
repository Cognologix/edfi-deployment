#######################################################################
# This script will build the Ed-Fi Admin App docker image
#######################################################################

IMAGE_TAG=$1
cd ./edfi-admin-app

docker build -t edfi-admin-app:$IMAGE_TAG -f Dockerfile .

cd ../
