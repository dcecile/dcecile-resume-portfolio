#!/bin/sh
elm-format --validate src/ tests/
rm -rf elm-stuff/build-artifacts/0.18.0/dcecile/dcecile-resume-portfolio && elm-make src/Main.elm --warn --output /dev/null
cd tests && rm -rf elm-stuff/build-artifacts/0.18.0/user/project && elm-make Tests.elm --warn --output /dev/null
