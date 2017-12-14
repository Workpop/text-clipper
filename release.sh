#!/usr/bin/env bash

# Exit if any command fails
set -e

# Compile to ES5 with Babel
npm run build

# Run Standard Version
npm run tag-release

# Push to Master
git push --follow-tags origin master;

# Assemble module, move over important files
cp package.json dist/package.json
cp .npmignore dist/.npmignore

cd dist

# publish module
npm publish
