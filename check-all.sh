#!/bin/sh
set -e
yarn validate-format
yarn clean
yarn make-src
yarn make-tests
yarn test
