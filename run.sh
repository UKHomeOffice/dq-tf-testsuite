#!/bin/sh
set -ex
dockerd-entrypoint.sh &
sleep 1
docker run --rm -v $(pwd):/data -w /data hashicorp/terraform fmt --diff --check
docker run --rm -v $(pwd):/data -w /data --entrypoint=/bin/sh wata727/tflint -c "tflint *.tf"
docker run --rm -v $(pwd):/data -w /data -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY quay