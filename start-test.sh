#!/bin/sh
yarn chokidar src tests --command "clear && yarn test" --ignore tests/elm-stuff --initial
