#!/bin/sh
set -ex
dockerd-entrypoint.sh &
sleep 1
docker run --rm -v $(pwd):/data -w /data hashicorp/terraform fmt --diff --check
docker run -ti --rm -v $(pwd):/data -w /data --entrypoint=/bin/sh wata727/tflint -c "tflint *.tf"
docker run --rm -v $(pwd):/data -w /data quay.io/ukhomeofficedigital/tf-testrunner python -m unittest tests/*_test.py
