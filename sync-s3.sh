#!/usr/bin/env bash

ROOT="$(git rev-parse --show-toplevel)"

if ! which aws
then
  echo "In order to run $0 you must 1st install AWS command line tools."
  echo "See: http://docs.aws.amazon.com/cli/latest/userguide/installing.html"
  echo
  echo "You'll also need to configure credentials for the pantsbuild IAM user."
  exit 1
fi

cd "${ROOT}"

aws s3 sync --exclude ".git/*" --acl public-read . s3://node-preinstalled-modules.pantsbuild.org
