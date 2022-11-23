#!/bin/sh
NODE_OPTIONS=--openssl-legacy-provider elm-app build
node generate-pdf.js
