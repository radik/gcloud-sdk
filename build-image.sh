#!/bin/bash

GCLOUD_SDK_VERSION=$1

if [[ -z ${GCLOUD_SDK_VERSION} ]]; then
  echo 'Usage: ./build-image.sh <GCLOUD_SDK_VERSION> [DOCKER_HUB_USER]'
  exit 1
fi

DOCKER_HUB_USER=$2
DOCKER_HUB_USER_DEFAULT=radik

if [[ -z ${DOCKER_HUB_USER} ]]; then
  echo 'Usage: ./build-image.sh <GCLOUD_SDK_VERSION> [DOCKER_HUB_USER]'
  echo "Setting DOCKER_HUB_USER as ${DOCKER_HUB_USER_DEFAULT}"
  DOCKER_HUB_USER=${DOCKER_HUB_USER_DEFAULT}
fi


IMAGE_NAME="${DOCKER_HUB_USER}/gcloud-sdk:${GCLOUD_SDK_VERSION}"

docker build  --build-arg GCLOUD_SDK_IMAGE=google/cloud-sdk:${GCLOUD_SDK_VERSION}-alpine -t ${IMAGE_NAME} .