#!/bin/sh

set -e

cd /usr/src/app

bundle exec rake typo_ci:analyse_github_action
