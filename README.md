[![Docker Repository on Quay](https://quay.io/repository/ukhomeofficedigital/dq-tf-testsuite/status "Docker Repository on Quay")](https://quay.io/repository/ukhomeofficedigital/dq-tf-testsuite)

# DQ Terraform Test Suite

The point of this image is just to be a short hand so all our Terraform modules repositories don't need to have the same boiler plate stuff in and we can centralise rules and test steps in one place rather than many.

## Usage

Add this to a .drone.yml in the root of the repo:
```yaml
pipeline:

  testsuite:
    image: quay.io/ukhomeofficedigital/dq-tf-testsuite:latest
    privileged: true
    commands: run
```
Trust the repo in the drone ui

To run locally with drone exec you'll need to add `--repo.trusted` so:

```bash
drone5 exec --repo.trusted
```

## What does it test
Right now its relatively simple and will only test the following things in order (see [run.sh](run.sh) for details):
1. [terraform fmt](https://www.terraform.io/docs/commands/fmt.html)
2. [tflint](https://github.com/wata727/tflint)
3. [tf-testrunner](https://github.com/ukhomeoffice/tf-testrunner)
