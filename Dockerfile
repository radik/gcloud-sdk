ARG GCLOUD_SDK_IMAGE=google/cloud-sdk:alpine
FROM ${GCLOUD_SDK_IMAGE}

# Install components
RUN gcloud components install kubectl