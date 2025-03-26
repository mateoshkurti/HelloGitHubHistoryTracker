#!/bin/bash

REPO_DIR="/Users/mateoshkurti/Documents/GIT/Personal/Git-Automate/green-graph"
QUOTE_FILE="$REPO_DIR/quotes.txt"
TARGET_FILE="$REPO_DIR/activity.txt"
LOG_FILE="$REPO_DIR/push_log.txt"

# Infinite loop for scheduled pushes
while true
do
    {
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting push cycle..."

        # Pick a random quote
        QUOTE=$(shuf -n 1 "$QUOTE_FILE")
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $QUOTE" >> "$TARGET_FILE"

        # Git commit and push
        cd "$REPO_DIR"
        git add .
        git commit -m "✨ auto update: $QUOTE"
        git push origin main

        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Successfully pushed."
    } >> "$LOG_FILE" 2>&1

    # Sleep for 16 hours and 43 minutes = 60180 seconds so that it looks random :P
    sleep 60180
done
