#!/usr/bin/env bash
#author     :Dominik Maszczyk
#date       :2019-08-14
#email      :Skitionek@gmail.com
#==============================================================================
if [ "${TRAVIS_EVENT_TYPE}" = "cron" ]; then
  npm audit fix && npm run update:packages
fi