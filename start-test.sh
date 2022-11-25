#!/bin/sh
chokidar src tests --command "clear && pnpm run test" --ignore tests/elm-stuff --initial
