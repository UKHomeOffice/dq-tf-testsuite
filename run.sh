#!/bin/sh
set -ex
dockerd-entrypoint.sh &
sleep 1
docker run --rm -v $(pwd):/data -w /data hashicorp/terraform fmt --diff --check
docker run --rm -v $(pwd):/data -w /data wata727/tflint tflint /data
docker run --rm -v $(pwd):/data -w /data quay.io/ukhomeofficedigital/tf-testrunner python -m unittest tests/*_test.py