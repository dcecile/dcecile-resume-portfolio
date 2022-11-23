#!/bin/sh
set -e
pnpm run validate-format
pnpm run clean
pnpm run make-src
pnpm run make-tests
pnpm run test
