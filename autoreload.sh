#!/bin/bash

REPO_PATH="/Users/eric/Documents/ericchang.me"
SITE_PATH="$REPO_PATH/_site"

echo "Starting autoreloading..."

# Launch brwoser sync to watch the /_site generated files directory.
browser-sync start --server "$SITE_PATH" --files "$SITE_PATH/*" & \
# Use fwatch to rebuild site every time a change is detected.
# --incremental flag doesn't seem to always rebuild index.html, for some reason.
fswatch -o \
~/Documents/ericchang.me/_config.yml \
~/Documents/ericchang.me/_posts \
~/Documents/ericchang.me/_includes | xargs -n1 bundle exec jekyll build
